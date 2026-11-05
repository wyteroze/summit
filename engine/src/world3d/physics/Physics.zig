// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zphysics = @import("zphysics");
const math = @import("../../core/math/math.zig");
const Ecs = @import("../../ecs/Ecs.zig");
const World3D = @import("../World3D.zig");
const types = World3D.types;
const BroadphaseLayerInterface = @import("broadphase_layer_interface.zig").BroadphaseLayerInterface;
const ObjectVsBroadPhaseLayerFilter = @import("object_vs_broadphase_layer_filter.zig").ObjectVsBroadPhaseLayerFilter;
const ObjectLayerPairFilter = @import("object_layer_pair_filter.zig").ObjectLayerPairFilter;
const LayerMatrix = @import("LayerMatrix.zig");

const ShapeKey = struct {
    shape: types.Shape,
    size: [3]u32,
    density: u32,

    fn init(shape: types.Shape, size: math.Vec3, density: f32) ShapeKey {
        return .{
            .shape = shape,
            .size = .{ @bitCast(@abs(size.x)), @bitCast(@abs(size.y)), @bitCast(@abs(size.z)) },
            .density = @bitCast(density),
        };
    }
};

const Physics = @This();
allocator: std.mem.Allocator,
physics_system: *zphysics.PhysicsSystem,
matrix: *LayerMatrix,
broadphase_layer_interface: *BroadphaseLayerInterface,
object_vs_broadphase_layer_filter: *ObjectVsBroadPhaseLayerFilter,
object_layer_pair_filter: *ObjectLayerPairFilter,
shapes: std.AutoHashMap(ShapeKey, *zphysics.Shape),

pub fn init(io: std.Io, allocator: std.mem.Allocator) !Physics {
    try zphysics.init(allocator, io, .{});
    errdefer zphysics.deinit();

    const matrix = try allocator.create(LayerMatrix);
    errdefer allocator.destroy(matrix);
    matrix.* = .{};

    const broadphase_layer_interface = try allocator.create(BroadphaseLayerInterface);
    errdefer allocator.destroy(broadphase_layer_interface);
    broadphase_layer_interface.* = .init();

    const object_vs_broadphase_layer_filter = try allocator.create(ObjectVsBroadPhaseLayerFilter);
    errdefer allocator.destroy(object_vs_broadphase_layer_filter);
    object_vs_broadphase_layer_filter.* = .{};

    const object_layer_pair_filter = try allocator.create(ObjectLayerPairFilter);
    errdefer allocator.destroy(object_layer_pair_filter);
    object_layer_pair_filter.* = .{ .matrix = matrix };

    return .{
        .allocator = allocator,
        .physics_system = try .create(
            &broadphase_layer_interface.interface,
            &object_vs_broadphase_layer_filter.filter,
            &object_layer_pair_filter.interface,
            .{},
        ),
        .matrix = matrix,
        .broadphase_layer_interface = broadphase_layer_interface,
        .object_vs_broadphase_layer_filter = object_vs_broadphase_layer_filter,
        .object_layer_pair_filter = object_layer_pair_filter,
        .shapes = .init(allocator),
    };
}

pub fn deinit(self: *Physics) void {
    self.physics_system.destroy();
    var iter = self.shapes.valueIterator();
    while (iter.next()) |s| s.*.release();

    zphysics.deinit();
    self.shapes.deinit();
    self.allocator.destroy(self.broadphase_layer_interface);
    self.allocator.destroy(self.object_vs_broadphase_layer_filter);
    self.allocator.destroy(self.object_layer_pair_filter);
    self.allocator.destroy(self.matrix);
}

/// Sync creation/destroys with physics.
pub fn reconcile(self: *Physics) !void {
    const w3d = self.getWorld();
    const cids = w3d.component_ids;
    const w = w3d.world;
    const body_interface = self.physics_system.getBodyInterfaceMut();

    // First take: create new bodies that haven't been registered with Jolt yet
    var iter = w.queryUnchecked(&.{cids.collider}).iterator();
    while (iter.next()) |e| {
        // We've already registered this body.
        if (w.hasComponentUnchecked(e, cids.physics_body)) continue;
        const collider = w.getComponentUnchecked(e, cids.collider, types.Collider).?.*;
        // TODO: Allow this since we size colliders to be the same size as the entity,
        // so putting a different-sized collider entity under another entity would be common.
        // const root_body = findRootRigidBody(w, &cids, e);
        const root_body = w.getComponentUnchecked(e, cids.rigid_body, types.RigidBody);

        const scale = vec3Or(w, e, cids.scale, .one);
        const shape = self.getShape(collider.shape, scale, collider.material.density) catch |err| {
            std.log.err("Failed to create shape: {t}", .{err});
            continue;
        };

        const pos = vec3Or(w, e, cids.position, .zero);
        const rot_euler = vec3Or(w, e, cids.rotation, .zero);
        const rot: math.Quat = .fromEuler(rot_euler);
        const moving = root_body != null;
        const dofs = if (root_body) |rb| blk: {
            var d = @backingInt(zphysics.AllowedDOFs.none);
            if (!rb.locked.position.x) d |= @backingInt(zphysics.AllowedDOFs.translation_x);
            if (!rb.locked.position.y) d |= @backingInt(zphysics.AllowedDOFs.translation_y);
            if (!rb.locked.position.z) d |= @backingInt(zphysics.AllowedDOFs.translation_z);
            if (!rb.locked.rotation.x) d |= @backingInt(zphysics.AllowedDOFs.rotation_x);
            if (!rb.locked.rotation.y) d |= @backingInt(zphysics.AllowedDOFs.rotation_y);
            if (!rb.locked.rotation.z) d |= @backingInt(zphysics.AllowedDOFs.rotation_z);
            break :blk d;
        } else @backingInt(zphysics.AllowedDOFs.all);

        const id = body_interface.createAndAddBody(.{
            .user_data = e.toU64(),
            .object_layer = LayerMatrix.objectLayer(0, moving),
            .position = .{ pos.x, pos.y, pos.z, 1.0 },
            .rotation = .{ rot.x, rot.y, rot.z, rot.w },
            .shape = shape,
            .motion_type = motionTypeToJoltType(if (root_body) |rb| rb.motion else null),
            .is_sensor = collider.sensor,
            .friction = collider.material.friction,
            .restitution = collider.material.restitution,
            .linear_damping = if (root_body) |rb| rb.linear_damping else 0.05,
            .angular_damping = if (root_body) |rb| rb.angular_damping else 0.05,
            .gravity_factor = if (root_body) |rb| rb.gravity_scale else 1.0,
            .mass_properties_override = if (root_body) |rb| .{ .mass = rb.mass orelse 0.0 } else .{},
            .allowed_DOFs = @fromBackingInt(dofs),
            .motion_quality = if (root_body != null and root_body.?.continuous) .linear_cast else .discrete,
        }, if (moving) .activate else .dont_activate) catch |err| {
            std.log.err("Failed to create body: {t}", .{err});
            continue;
        };

        try w.setUnchecked(e, cids.physics_body, types.PhysicsBody, .{ .id = @backingInt(id) });
        std.log.debug("Reconciled entity {d}", .{e.toU64()});
    }

    // Second take: update bodies that've been modified, but Jolt doesn't know yet.

}

fn getWorld(self: *Physics) *World3D {
    return @fieldParentPtr("physics", self);
}

/// Walks the entity's ancestors and returns the first RigidBody it finds, or null if not found.
fn findRootRigidBody(w: *Ecs.World, cids: *const World3D.ComponentIds, entity: Ecs.Entity) ?*types.RigidBody {
    var cur: ?Ecs.Entity = entity;
    while (cur) |e| : (cur = w.getParentUnchecked(e)) {
        const s = w.getComponentUnchecked(e, cids.rigid_body, types.RigidBody) orelse continue;
        return s;
    }

    return null;
}

fn getShape(self: *Physics, shape: types.Shape, size: math.Vec3, density: f32) !*zphysics.Shape {
    const key: ShapeKey = .init(shape, size, density);
    if (self.shapes.get(key)) |s| return s;

    const created = try createShape(shape, size, density);
    errdefer created.release();

    try self.shapes.put(key, created);
    return created;
}

fn createShape(shape: types.Shape, size: math.Vec3, density: f32) !*zphysics.Shape {
    const settings = switch (shape) {
        .box => (try zphysics.BoxShapeSettings.create(.{ size.x * 0.5, size.y * 0.5, size.z * 0.5 })).asConvexShapeSettings(),
        .sphere => (try zphysics.SphereShapeSettings.create(@max(size.x, size.y, size.z) * 0.5)).asConvexShapeSettings(),
        .capsule => blk: {
            const radius = @max(size.x, size.z) * 0.5;
            const half_height = size.y * 0.5 - radius;
            break :blk (try zphysics.CapsuleShapeSettings.create(half_height, radius)).asConvexShapeSettings();
        },
        .cylinder => (try zphysics.CylinderShapeSettings.create(size.y * 0.5, @max(size.x, size.z) * 0.5)).asConvexShapeSettings(),
    };
    defer settings.asShapeSettings().release();

    settings.setDensity(density);
    return settings.asShapeSettings().createShape();
}

fn vec3Or(w: *Ecs.World, e: Ecs.Entity, cid: Ecs.ComponentId, default: math.Vec3) math.Vec3 {
    return if (w.getComponentUnchecked(e, cid, math.Vec3)) |v| v.* else default;
}

/// Engine motion type to Jolt's MotionType
/// * null -> .static
/// * .dynamic -> .dynamic
/// * .kinematic -> .kinematic
fn motionTypeToJoltType(motion: ?types.MotionType) zphysics.MotionType {
    if (motion) |m| return switch (m) {
        .dynamic => .dynamic,
        .kinematic => .kinematic,
    };
    return .static;
}
