// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Ecs = @import("../ecs/Ecs.zig");
const Assets = @import("../assets/Assets.zig");
const math = @import("../core/math/math.zig");
const render = @import("../render/render.zig");
const gpu = @import("../gpu/gpu.zig");
const World3D = @import("World3D.zig");
const types = @import("types.zig");

pub const Defaults = struct {
    quad: Assets.types.GpuMesh,
    image: gpu.GpuDevice.GpuImage,
    sampler: gpu.GpuDevice.GpuSampler,
};

pub const CameraMatrices = struct {
    view: math.Mat4,
    proj: math.Mat4,
};

fn vec3Or(w: *Ecs.World, e: Ecs.Entity, cid: Ecs.ComponentId, default: math.Vec3) math.Vec3 {
    return if (w.getComponentUnchecked(e, cid, math.Vec3)) |v| v.* else default;
}

/// Collects all lights and converts them to `GpuLight`'s.
pub fn lights(self: *World3D, allocator: std.mem.Allocator) ![]gpu.types.GpuLight {
    const w = self.world;
    const cids = self.component_ids;

    var out: std.ArrayList(gpu.types.GpuLight) = .empty;

    var it = w.queryUnchecked(&.{cids.light}).iterator();
    while (it.next()) |entity| {
        const l = w.getComponentUnchecked(entity, cids.light, render.types.Light).?;
        const pos = vec3Or(w, entity, cids.position, .zero);
        const rot = vec3Or(w, entity, cids.rotation, .zero);

        const pos_or_dir = switch (l.kind) {
            .point => pos,
            .directional => blk: {
                const rot_mat = math.Quat.fromEuler(rot.toRadians()).toMat4();
                break :blk rot_mat.transformDirection(.new(0, 0, 1)).normalize();
            },
        };

        const rgb = l.color.srgbDecode();
        try out.append(allocator, .{
            .position_or_dir = pos_or_dir.arr(),
            .kind = @backingInt(l.kind),
            .color = .{ rgb.r, rgb.g, rgb.b },
            .intensity = l.intensity,
            .radius = switch (l.kind) {
                .point => |pp| pp.radius,
                .directional => 0,
            },
        });
    }

    return out.items;
}

/// Collects all visible objects and returns them as `RenderObject`'s.
pub fn objects(self: *World3D, allocator: std.mem.Allocator, defaults: Defaults) ![]render.types.RenderObject {
    const w = self.world;
    const cids = self.component_ids;

    var out: std.ArrayList(render.types.RenderObject) = .empty;

    // TODO: Make querying better. Quite limited right now
    var it = w.queryUnchecked(&.{ cids.mesh, cids.image }).iterator();
    while (it.next()) |entity| {
        const mesh = w.getComponentUnchecked(entity, cids.mesh, Assets.AssetHandle);
        const image = w.getComponentUnchecked(entity, cids.image, Assets.AssetHandle);
        // No visual appearance
        if (mesh == null and image == null) continue;

        // This is so that if you have an image with no mesh, it's like a 2d plane in 3d space.
        // Could probably be convenient for 2D games, idk
        const mesh_data = if (mesh) |m| m.ensureGpuGet(.mesh, .{}) catch continue else defaults.quad;
        // Mesh with no image = plain white
        const image_data = if (image) |i| i.ensureGpuGet(.image, .{}) catch continue else defaults.image;

        const rot = vec3Or(w, entity, cids.rotation, .zero);
        const pos = vec3Or(w, entity, cids.position, .zero);
        const scale = vec3Or(w, entity, cids.scale, .one);
        // Not visible (or invalid), don't waste resources rendering it.
        if (scale.x <= 0 or scale.y <= 0 or scale.z <= 0) continue;

        try out.append(allocator, .{
            .model = .fromTRS(pos, .fromEuler(rot.toRadians()), scale),
            .mesh = mesh_data,
            .material = .{
                .image = image_data,
                .sampler = defaults.sampler,
            },
        });
    }

    return out.items;
}

/// Returns view/proj matrices for the given camera entity, at the given pixel size.
/// Returns null if the entity doesn't have a Camera component.
pub fn camera(self: *World3D, entity: Ecs.Entity, px: [2]u32) ?CameraMatrices {
    const w = self.world;
    const cids = self.component_ids;

    const settings = w.getComponentUnchecked(entity, cids.camera, types.Camera) orelse return null;
    const pos = vec3Or(w, entity, cids.position, .zero);
    const rot = vec3Or(w, entity, cids.rotation, .zero);

    const aspect = @as(f32, @floatFromInt(px[0])) / @as(f32, @floatFromInt(px[1]));

    return .{
        .view = math.Mat4.fromTRS(pos, .fromEuler(rot.toRadians()), .one).invertRT(),
        .proj = .perspectiveReversedZInf(
            std.math.degreesToRadians(settings.fov),
            aspect,
            settings.near_plane,
        ),
    };
}

/// Returns the Scene component of an entity, if it has it.
pub fn scene(self: *World3D, entity: Ecs.Entity) ?*types.Scene {
    const s = self.world.getComponentUnchecked(entity, self.component_ids.scene, types.Scene) orelse return null;
    return s;
}
