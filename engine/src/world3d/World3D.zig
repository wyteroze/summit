// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Ui = @import("../ui/Ui.zig");
const Ecs = @import("../ecs/Ecs.zig");
const Assets = @import("../assets/Assets.zig");
const Audio = @import("../audio/Audio.zig");
const core = @import("../core/core.zig");
const math = @import("../core/math/math.zig");
const scripting = @import("../scripting/scripting.zig");
const render = @import("../render/render.zig");
const gpu = @import("../gpu/gpu.zig");
pub const types = @import("types.zig");

pub const ComponentIds = struct {
    scene: Ecs.ComponentId,
    mesh: Ecs.ComponentId,
    image: Ecs.ComponentId,
    position: Ecs.ComponentId,
    rotation: Ecs.ComponentId,
    scale: Ecs.ComponentId,
    script: Ecs.ComponentId,
    light: Ecs.ComponentId,
    name: Ecs.ComponentId,
    audio_listener: Ecs.ComponentId,
    speaker: Ecs.ComponentId,
    camera: Ecs.ComponentId,
};

const World3D = @This();
allocator: std.mem.Allocator,
world: *Ecs.World,
component_ids: ComponentIds,

pub fn init(allocator: std.mem.Allocator, ecs: *Ecs) !World3D {
    var world = try ecs.createWorld();

    const scene = try world.registerComponent(types.Scene, "Scene"); // For organizing collections of entities
    const mesh = try world.registerComponent(Assets.AssetHandle, "Mesh"); // For giving an entity a mesh appearance
    const image = try world.registerComponent(Assets.AssetHandle, "Image"); // For giving an entity an image appearance (or a texture, if it has a mesh)
    const position = try world.registerComponent(math.Vec3, "Position"); // For moving entities
    const rotation = try world.registerComponent(math.Vec3, "Rotation"); // For rotating entites (Euler)
    const scale = try world.registerComponent(math.Vec3, "Scale"); // For scaling entities
    const script = try world.registerComponent(scripting.Runtime.ScriptHandle, "Script"); // For giving entities behavior
    const light = try world.registerComponent(render.types.Light, "Light"); // For creating sources of illumination
    const name = try world.registerComponent([]const u8, "Name"); // For naming an entity (we don't use it, but lua does)
    const audio_listener = try world.registerComponent(Audio.types.AudioListener, "AudioListener");
    const speaker = try world.registerComponent(Audio.Speaker, "Speaker");
    const camera = try world.registerComponent(types.Camera, "Camera");

    return .{
        .allocator = allocator,
        .world = world,
        .component_ids = .{
            .scene = scene,
            .mesh = mesh,
            .image = image,
            .position = position,
            .rotation = rotation,
            .scale = scale,
            .script = script,
            .light = light,
            .name = name,
            .audio_listener = audio_listener,
            .speaker = speaker,
            .camera = camera,
        },
    };
}

pub fn deinit(_: *World3D) void {}

pub fn update(self: *World3D, dt: f32) void {
    self.world.update(dt);
    self.world.clearChanged();
}

// TODO: Some of these functions (or parts of them) do not fit here. Move them where they belong.

fn collectUiItems(
    ui: *Ui,
    entity: Ecs.Entity,
    items: *std.ArrayList(render.types.UiItem),
    alloc: std.mem.Allocator,
) void {
    const cids = ui.component_ids;
    if (!ui.world.hasComponentUnchecked(entity, cids.render_view)) {
        const pos: math.Vec2 = if (ui.world.getComponentUnchecked(entity, cids.computed_position, math.Vec2)) |p| p.* else .zero;
        const size: math.Vec2 = if (ui.world.getComponentUnchecked(entity, cids.computed_size, math.Vec2)) |p| p.* else .zero;
        const corners = if (ui.world.getComponentUnchecked(entity, cids.corner_radii, Ui.types.CornerRadii)) |c| c.* else null;
        const borders = if (ui.world.getComponentUnchecked(entity, cids.borders, Ui.types.Borders)) |b| b.* else null;
        const image = if (ui.world.getComponentUnchecked(entity, cids.image, Ui.types.Image)) |i| i.* else null;
        const color: core.Color = if (ui.world.getComponentUnchecked(entity, cids.color, core.Color)) |c|
            c.*
        else if (image != null)
            .fromRgbFloat(1.0, 1.0, 1.0, 1.0)
        else
            .fromRgbFloat(1.0, 1.0, 1.0, 0.0);

        const texture = if (image) |i| blk: {
            break :blk ((i.source orelse break :blk null).ensureGpuGet(.image, .{}) catch break :blk null).handle;
        } else null;
        const uv_pos: math.Vec2 = if (image) |i| i.crop.min else .zero;
        const uv_size: math.Vec2 = if (image) |i| i.crop.max.sub(i.crop.min) else .one;

        items.append(alloc, .{
            .quad = .{
                .pos = pos.arr(),
                .size = size.arr(),
                .color = color.srgbDecode(),
                .texture = texture,
                .uv_pos = uv_pos.arr(),
                .uv_size = uv_size.arr(),
                .corners = if (corners) |c| blk: {
                    const m = @min(size.x / 2, size.y / 2);
                    break :blk .{ @min(c.top_left, m), @min(c.top_right, m), @min(c.bottom_left, m), @min(c.bottom_right, m) };
                } else @splat(0),
                .borders = if (borders) |b| blk: {
                    // Max, should probably be in a better place.
                    const m = 100;
                    break :blk .{ @min(b.top, m), @min(b.bottom, m), @min(b.left, m), @min(b.right, m) };
                } else @splat(0),
                .border_color = if (borders) |b| b.color else .fromRgbFloat(0, 0, 0, 0),
            },
        }) catch @panic("Out of memory");

        if (ui.world.getComponentUnchecked(entity, cids.text, Ui.types.Text)) |txt| {
            if (ui.world.getComponentUnchecked(entity, cids.computed_text_layout, Ui.types.ComputedTextLayout)) |ct| {
                if (txt.font) |f| if (f.ensureGpuGet(.font, .{}) catch null) |atlas| {
                    for (ct.quads) |quad| {
                        items.append(alloc, .{ .quad = .{
                            .pos = quad.pos,
                            .size = quad.size,
                            .color = txt.color.srgbDecode(),
                            .uv_pos = quad.uv_pos,
                            .uv_size = quad.uv_size,
                            .sampler = atlas.sampler.handle,
                            .texture = atlas.texture.handle,
                            .is_text = true,
                        } }) catch @panic("Out of memory");
                    }
                };
            }
        }

        if (ui.world.getComponentUnchecked(entity, cids.painter, Ui.Painter)) |settings| {
            if (ui.painters.get(entity.toU64())) |st| {
                if (st.mesh.indices.items.len > 0) items.append(alloc, .{ .painter = .{
                    .origin = pos.arr(),
                    .size = size.arr(),
                    .vertices = st.mesh.vertices.items,
                    .indices = st.mesh.indices.items,
                    .clip = settings.clip,
                    .antialiased = settings.antialiased,
                } }) catch @panic("Out of memory");
            }
        }
    }

    for (ui.world.getChildrenUnchecked(entity)) |child| {
        collectUiItems(ui, child, items, alloc);
    }
}

pub fn submitToRenderer(self: *World3D, ui: *Ui, renderer: *render.Renderer) !void {
    const w = self.world;
    const cids = self.component_ids;
    const allocator = renderer.frame_allocator.allocator();

    var objects: std.ArrayList(render.types.RenderObject) = .empty;
    var lights: std.ArrayList(gpu.types.GpuLight) = .empty;
    var requests: std.ArrayList(render.types.RenderViewRequest) = .empty;

    const light_query = w.queryUnchecked(&.{cids.light});
    var light_iter = light_query.iterator();
    while (light_iter.next()) |entity| {
        const l = w.getComponentUnchecked(entity, cids.light, render.types.Light).?;
        const pos: math.Vec3 = if (w.getComponentUnchecked(entity, cids.position, math.Vec3)) |p| p.* else .zero;
        const rot: math.Vec3 = if (w.getComponentUnchecked(entity, cids.rotation, math.Vec3)) |r| r.* else .zero;

        const pos_or_dir = switch (l.kind) {
            .point => pos,
            .directional => blk: {
                const rot_mat = math.Quat.fromEuler(rot.toRadians()).toMat4();
                break :blk rot_mat.transformDirection(.new(0, 0, 1)).normalize();
            },
        };

        const rgb = l.color.srgbDecode();
        lights.append(allocator, .{
            .position_or_dir = pos_or_dir.arr(),
            .kind = @backingInt(l.kind),
            .color = .{ rgb.r, rgb.g, rgb.b },
            .intensity = l.intensity,
            .radius = switch (l.kind) {
                .point => |pp| pp.radius,
                .directional => 0,
            },
        }) catch @panic("Out of memory");
    }

    // TODO: Make querying better. Quite limited right now
    const query = w.queryUnchecked(&.{ cids.mesh, cids.image });

    var iter = query.iterator();
    while (iter.next()) |entity| {
        const mesh = w.getComponentUnchecked(entity, cids.mesh, Assets.AssetHandle);
        const image = w.getComponentUnchecked(entity, cids.image, Assets.AssetHandle);
        // No visual appearance
        if (mesh == null and image == null) continue;

        // This is so that if you have an image with no mesh, it's like a 2d plane in 3d space.
        // Could probably be convenient for 2D games, idk
        const mesh_data = if (mesh) |m| m.ensureGpuGet(.mesh, .{}) catch continue else renderer.default_quad;
        // Mesh with no image = plain white
        const image_data = if (image) |i| i.ensureGpuGet(.image, .{}) catch continue else renderer.default_image;

        const rot: math.Vec3 = if (w.getComponentUnchecked(entity, cids.rotation, math.Vec3)) |r| r.* else .zero;
        const pos: math.Vec3 = if (w.getComponentUnchecked(entity, cids.position, math.Vec3)) |p| p.* else .zero;
        const scale: math.Vec3 = if (w.getComponentUnchecked(entity, cids.scale, math.Vec3)) |scale| scale.* else .one;
        // Not visible (or invalid), don't waste resources rendering it.
        if (scale.x <= 0 or scale.y <= 0 or scale.z <= 0) continue;

        const model: math.Mat4 = .fromTRS(pos, .fromEuler(rot.toRadians()), scale);
        objects.append(allocator, .{
            .model = model,
            .mesh = mesh_data,
            .material = .{
                .image = image_data,
                .sampler = renderer.default_sampler,
            },
        }) catch @panic("Out of memory");
    }

    const ui_cids = ui.component_ids;
    var window_lists: std.array_hash_map.Auto(u64, struct { id: u64, entity: Ecs.Entity, items: std.ArrayList(render.types.UiItem) }) = .{};
    {
        var it = ui.world.queryUnchecked(&.{ui_cids.window}).iterator();
        while (it.next()) |e| {
            const win = ui.world.getComponentUnchecked(e, ui_cids.window, Ui.types.Window).?;
            window_lists.put(allocator, e.toU64(), .{ .id = win.id, .entity = e, .items = .empty }) catch @panic("Out of memory");
        }
    }

    // Collect RenderViews
    {
        const q = ui.world.queryUnchecked(&.{ui_cids.render_view});
        var it = q.iterator();

        while (it.next()) |entity| {
            const rv = ui.world.getComponentUnchecked(entity, ui_cids.render_view, Ui.types.RenderViewOptions).?;
            // We check with the game world, not the ui world.
            if (!w.isEntityAlive(rv.camera) or !w.isEntityAlive(rv.scene)) continue;

            const root = blk: {
                var r = entity;
                while (ui.world.getParentUnchecked(r)) |p| r = p;

                break :blk r;
            };
            const win = ui.world.getComponentUnchecked(root, ui_cids.window, Ui.types.Window) orelse continue;
            const list = window_lists.getPtr(root.toU64()) orelse continue;

            const position = ui.world.getComponentUnchecked(entity, ui_cids.computed_position, math.Vec2) orelse continue;
            const size = ui.world.getComponentUnchecked(entity, ui_cids.computed_size, math.Vec2) orelse continue;

            const px: [2]u32 = .{
                @max(1, @as(u32, @intFromFloat(@round(size.x * win.scale)))),
                @max(1, @as(u32, @intFromFloat(@round(size.y * win.scale)))),
            };

            const view = renderer.getView(entity.toU64()) orelse
                (renderer.createView(entity.toU64(), px, rv.camera) catch |e| {
                    std.log.err("Failed to create view: {s}", .{@errorName(e)});
                    continue;
                });

            view.resize(px) catch |e| {
                std.log.err("Failed to resize view: {s}", .{@errorName(e)});
                continue;
            };

            const scene = w.getComponentUnchecked(rv.scene, cids.scene, World3D.types.Scene) orelse continue;
            const cam_settings = w.getComponentUnchecked(rv.camera, cids.camera, World3D.types.Camera) orelse continue;
            const cam_pos: math.Vec3 = if (w.getComponentUnchecked(rv.camera, cids.position, math.Vec3)) |p| p.* else .zero;
            const cam_rot: math.Vec3 = if (w.getComponentUnchecked(rv.camera, cids.rotation, math.Vec3)) |r| r.* else .zero;

            const view_mat = math.Mat4.fromTRS(cam_pos, .fromEuler(cam_rot.toRadians()), .one).invertRT();
            const proj: math.Mat4 = .perspectiveReversedZInf(
                std.math.degreesToRadians(cam_settings.fov),
                @as(f32, @floatFromInt(px[0])) / @as(f32, @floatFromInt(px[1])),
                cam_settings.near_plane,
            );

            requests.append(allocator, .{
                .frame = .{ .view_matrix = view_mat, .proj_matrix = proj, .viewport_size = px },
                .scene = .{
                    .ambient = scene.environment.ambient,
                    .clear_color = scene.environment.clear_color,
                    .lights = lights.items,
                    .objects = objects.items,
                    .ui_items = &.{},
                },
                .render_view_id = entity.toU64(),
            }) catch @panic("Out of memory");

            list.items.append(allocator, .{ .quad = .{
                .pos = position.arr(),
                .size = size.arr(),
                .texture = view.target.handle,
                .sampler = renderer.default_sampler.handle,
                .uv_size = @splat(1),
                .color = .fromRgbFloat(1, 1, 1, 1),
            } }) catch @panic("Out of memory");
        }
    }

    var window_requests: std.ArrayList(render.types.RenderWindowRequest) = .empty;
    for (window_lists.values()) |*wl| {
        collectUiItems(ui, wl.entity, &wl.items, allocator);
        window_requests.append(allocator, .{ .window_id = wl.id, .ui_items = wl.items.items }) catch @panic("Out of memory");
    }

    renderer.render(requests.items, window_requests.items) catch |e| std.log.err("render() failed: {s}", .{@errorName(e)});
}

pub fn submitToAudio(self: *World3D, audio: *Audio) void {
    const cids = self.component_ids;
    const w = self.world;

    const listener = blk: {
        var it = w.queryUnchecked(&.{cids.audio_listener}).iterator();
        break :blk if (it.next()) |e| e else null;
    };
    const listener_pos: math.Vec3 = if (listener) |l| if (w.getComponentUnchecked(l, cids.position, math.Vec3)) |p| p.* else .zero else .zero;
    const listener_rot: math.Vec3 = if (listener) |l| if (w.getComponentUnchecked(l, cids.rotation, math.Vec3)) |r| r.* else .zero else .zero;
    const right = math.Quat.fromEuler(listener_rot.toRadians()).toMat4().transformDirection(.new(1, 0, 0)).normalize();
    audio.setListener(.{ .position = listener_pos, .right = right });

    for (0..Audio.max_voices) |i| {
        const index: u16 = @intCast(i);
        const state = audio.slot_state[index];
        if (state != .active and state != .reserved) continue;

        const t = &audio.tracks[index];
        const owner = t.owner orelse continue;
        const id = audio.getHandle(index).id;

        if (!w.isEntityAlive(owner)) {
            audio.destroy(id);
            continue;
        }
        const speaker = w.getComponentUnchecked(owner, cids.speaker, Audio.Speaker) orelse {
            audio.destroy(id);
            continue;
        };

        if (state != .active) continue;
        audio.setParams(id, .{
            .position = if (w.getComponentUnchecked(owner, cids.position, math.Vec3)) |p| p.* else null,
            .volume = t.volume * speaker.volume,
            .pitch = t.pitch,
            .loops = t.loops,
            .min_distance = speaker.min_distance,
            .max_distance = speaker.max_distance,
            .attenuation = speaker.attenuation,
        });
    }
}
