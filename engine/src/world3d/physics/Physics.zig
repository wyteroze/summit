// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zphysics = @import("zphysics");
const core = @import("../../core/core.zig");
const math = @import("../../core/math/math.zig");
const Ecs = @import("../../ecs/Ecs.zig");
const World3D = @import("../World3D.zig");
const types = World3D.types;
const BroadphaseLayerInterface = @import("broadphase_layer_interface.zig").BroadphaseLayerInterface;
const ObjectVsBroadPhaseLayerFilter = @import("object_vs_broadphase_layer_filter.zig").ObjectVsBroadPhaseLayerFilter;
const ObjectLayerPairFilter = @import("object_layer_pair_filter.zig").ObjectLayerPairFilter;
const ContactListener = @import("contact_listener.zig").ContactListener;
const LayerMatrix = @import("LayerMatrix.zig");

const fixed_dt = 1.0 / 120.0;
const max_substeps = 2;

const default_ray_distance = 1000.0;
const ray_skip_epsilon = 0.001;

pub const ContactQueue = core.threading.MPMCQueue(RawContact, 4096);
pub const ContactKind = enum { began, ended };
pub const RawContact = struct {
    kind: ContactKind,
    a_id: u32,
    b_id: u32,
    sensor_side: enum { none, a, b } = .none,
    point: [3]f32 = .{ 0, 0, 0 },
    normal: [3]f32 = .{ 0, 0, 0 },
};

pub const Contact = struct {
    kind: ContactKind,
    sensor: bool,
    entity: Ecs.Entity,
    other: Ecs.Entity,
};

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

const Dirty = packed struct {
    transform: bool = false,
    shape: bool = false,
    collider: bool = false,
    rigid_body: bool = false,

    fn merge(a: Dirty, b: Dirty) Dirty {
        return @bitCast(@as(u4, @bitCast(a)) | @as(u4, @bitCast(b)));
    }
};

const BodyInfo = struct { entity: Ecs.Entity, sensor: bool };
const Pending = struct { entity: Ecs.Entity, dirty: Dirty = .{} };

pub const RaycastOptions = struct {
    max_distance: ?f32 = null,
    ignore: []const Ecs.Entity = &.{},
    include_sensors: bool = false,
};

pub const RaycastHit = struct {
    entity: Ecs.Entity,
    position: math.Vec3,
    normal: math.Vec3,
    distance: f32,
};

const Physics = @This();
allocator: std.mem.Allocator,
frame_allocator: std.heap.ArenaAllocator,
physics_system: *zphysics.PhysicsSystem,
matrix: *LayerMatrix,
broadphase_layer_interface: *BroadphaseLayerInterface,
object_vs_broadphase_layer_filter: *ObjectVsBroadPhaseLayerFilter,
object_layer_pair_filter: *ObjectLayerPairFilter,
contact_listener: *ContactListener,
queue: *ContactQueue,
contacts: std.ArrayList(Contact) = .empty,
bodies: std.AutoHashMap(u32, BodyInfo),
retired: std.ArrayList(u32) = .empty,
shapes: std.AutoHashMap(ShapeKey, *zphysics.Shape),
added_bodies: u32 = 0,
accumulator: f32 = 0,

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

    const queue = try allocator.create(ContactQueue);
    errdefer allocator.destroy(queue);
    queue.* = .init(io);

    const contact_listener = try allocator.create(ContactListener);
    errdefer allocator.destroy(contact_listener);
    contact_listener.* = .{ .queue = queue };

    const physics_system = try zphysics.PhysicsSystem.create(
        &broadphase_layer_interface.interface,
        &object_vs_broadphase_layer_filter.filter,
        &object_layer_pair_filter.interface,
        .{},
    );
    physics_system.setContactListener(contact_listener);

    return .{
        .allocator = allocator,
        .frame_allocator = .init(allocator),
        .physics_system = physics_system,
        .matrix = matrix,
        .broadphase_layer_interface = broadphase_layer_interface,
        .object_vs_broadphase_layer_filter = object_vs_broadphase_layer_filter,
        .object_layer_pair_filter = object_layer_pair_filter,
        .contact_listener = contact_listener,
        .queue = queue,
        .bodies = .init(allocator),
        .shapes = .init(allocator),
    };
}

pub fn deinit(self: *Physics) void {
    self.physics_system.destroy();
    var iter = self.shapes.valueIterator();
    while (iter.next()) |s| s.*.release();

    zphysics.deinit();
    self.shapes.deinit();
    self.bodies.deinit();
    self.contacts.deinit(self.allocator);
    self.retired.deinit(self.allocator);
    self.allocator.destroy(self.broadphase_layer_interface);
    self.allocator.destroy(self.object_vs_broadphase_layer_filter);
    self.allocator.destroy(self.object_layer_pair_filter);
    self.allocator.destroy(self.contact_listener);
    self.allocator.destroy(self.queue);
    self.allocator.destroy(self.matrix);
    self.frame_allocator.deinit();
}

pub fn reconcile(self: *Physics, dt: f32) !void {
    const cids = self.getWorld().component_ids;
    const w = self.getWorld().world;
    self.contacts.clearRetainingCapacity();

    var pending: std.AutoHashMap(u64, Pending) = .init(self.frameAllocator());
    for (w.changedComponents()) |cc| {
        const d: Dirty = if (cc.component.eql(cids.position) or cc.component.eql(cids.rotation))
            .{ .transform = true }
        else if (cc.component.eql(cids.scale))
            .{ .shape = true }
        else if (cc.component.eql(cids.collider))
            .{ .collider = true }
        else if (cc.component.eql(cids.rigid_body))
            .{ .rigid_body = true }
        else
            continue;

        const gop = try pending.getOrPut(cc.entity.toU64());
        if (!gop.found_existing) gop.value_ptr.* = .{ .entity = cc.entity };
        gop.value_ptr.dirty = gop.value_ptr.dirty.merge(d);
    }

    var iter = pending.valueIterator();
    while (iter.next()) |p| {
        self.apply(p.*, dt) catch |err|
            std.log.err("Physics sync failed for entity {d}: {t}", .{ p.*.entity.toU64(), err });
    }

    if (self.added_bodies >= 64) {
        self.physics_system.optimizeBroadPhase();
        self.added_bodies = 0;
    }
}

pub fn step(self: *Physics, frame_dt: f32) void {
    self.accumulator = @min(self.accumulator + frame_dt, fixed_dt * max_substeps);
    while (self.accumulator >= fixed_dt) : (self.accumulator -= fixed_dt) {
        self.physics_system.update(fixed_dt, .{ .collision_steps = 1 }) catch |err| {
            std.log.err("Physics.step() failed: {t}", .{err});
            return;
        };
    }
}

pub fn pull(self: *Physics) !void {
    const w3d = self.getWorld();
    const cids = w3d.component_ids;
    const w = w3d.world;

    var active_ids: std.ArrayList(zphysics.BodyId) = .empty;
    defer active_ids.deinit(self.allocator);
    try self.physics_system.getActiveBodyIds(self.allocator, &active_ids);

    const lock_if = self.physics_system.getBodyLockInterfaceNoLock();
    while (self.queue.pop()) |rc| {
        const a = self.bodies.get(rc.a_id) orelse continue;
        const b = self.bodies.get(rc.b_id) orelse continue;

        const swap = !a.sensor and b.sensor;
        try self.contacts.append(self.allocator, .{
            .kind = rc.kind,
            .sensor = a.sensor or b.sensor,
            .entity = if (swap) b.entity else a.entity,
            .other = if (swap) a.entity else b.entity,
        });
    }

    for (self.retired.items) |id| _ = self.bodies.remove(id);
    self.retired.clearRetainingCapacity();

    for (active_ids.items) |id| {
        var lock: zphysics.BodyLockRead = .{};
        lock.lock(lock_if, id);
        defer lock.unlock();
        const body = lock.body orelse continue;

        const e: Ecs.Entity = .fromU64(body.user_data);
        if (!w.isEntityAlive(e)) continue;
        if (body.getMotionType() != .dynamic) continue;

        const pos: math.Vec3 = .new(body.position[0], body.position[1], body.position[2]);
        const rot: math.Quat = .fromArr(body.rotation);

        try w.setUnchecked(e, cids.position, math.Vec3, pos);
        try w.setUnchecked(e, cids.rotation, math.Quat, rot);
    }
}

pub fn raycast(self: *Physics, origin: math.Vec3, dir: math.Vec3, opts: RaycastOptions) ?RaycastHit {
    const w = self.getWorld().world;
    const dir_norm = dir.normalize();
    if (dir.eq(.zero)) return null;

    const max_dist = opts.max_distance orelse default_ray_distance;
    const query = self.physics_system.getNarrowPhaseQuery();
    const lock_if = self.physics_system.getBodyLockInterfaceNoLock();

    var traveled: f32 = 0;
    for (0..16) |_| {
        if (traveled >= max_dist) return null;

        const o = origin.add(dir_norm.scale(traveled));
        const d = dir_norm.scale(max_dist - traveled);
        const result = query.castRay(.{
            .origin = .{ o.x, o.y, o.z, 1 },
            .direction = .{ d.x, d.y, d.z, 0 },
        }, .{});
        if (!result.has_hit) return null;

        const hit_dist = traveled + result.hit.fraction * (max_dist - traveled);
        const hit_pos = origin.add(dir_norm.scale(hit_dist));

        var lock: zphysics.BodyLockRead = .{};
        lock.lock(lock_if, result.hit.body_id);
        defer lock.unlock();
        const body = lock.body orelse return null;

        const e: Ecs.Entity = .fromU64(body.user_data);
        const rejected = !w.isEntityAlive(e) or
            (!opts.include_sensors and body.isSensor()) or
            std.mem.findScalar(Ecs.Entity, opts.ignore, e) != null;

        if (rejected) {
            traveled = hit_dist + ray_skip_epsilon;
            continue;
        }

        const n = body.getWorldSpaceSurfaceNormal(result.hit.sub_shape_id, hit_pos.arr());
        return .{ .entity = e, .position = hit_pos, .normal = .new(n[0], n[1], n[2]), .distance = hit_dist };
    }
    return null;
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

fn quatOr(w: *Ecs.World, e: Ecs.Entity, cid: Ecs.ComponentId, default: math.Quat) math.Quat {
    return if (w.getComponentUnchecked(e, cid, math.Quat)) |v| v.* else default;
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

/// Engine motion type to Jolt's Shape.SubType, which are named identically.
/// * .box -> .box
/// * .sphere -> .sphere
/// * .capsule -> .capsule
/// * .cylinder -> .cylinder
fn shapeToJoltSubType(shape: types.Shape) zphysics.Shape.SubType {
    return switch (shape) {
        .box => .box,
        .sphere => .sphere,
        .capsule => .capsule,
        .cylinder => .cylinder,
    };
}

fn getEntityBodyId(w: *Ecs.World, cids: *const World3D.ComponentIds, entity: Ecs.Entity) ?zphysics.BodyId {
    return if (w.getComponentUnchecked(entity, cids.physics_body, types.PhysicsBody)) |pb|
        @fromBackingInt(pb.id)
    else
        null;
}

pub fn releaseBody(self: *Physics, id: u32) void {
    self.physics_system.getBodyInterfaceMut().removeAndDestroyBody(@fromBackingInt(id));
    self.retired.append(self.allocator, id) catch {};
}

fn destroyBody(self: *Physics, e: Ecs.Entity) void {
    const w3d = self.getWorld();
    // `PhysicsBody` has a deinit hook that calls `Physics.releaseBody()`
    w3d.world.removeComponentUnchecked(e, w3d.component_ids.physics_body);
}

fn createBody(self: *Physics, e: Ecs.Entity) !void {
    const w3d = self.getWorld();
    const cids = w3d.component_ids;
    const w = w3d.world;

    const collider = (w.getComponentUnchecked(e, cids.collider, types.Collider) orelse return).*;
    const rb: ?types.RigidBody = if (w.getComponentUnchecked(e, cids.rigid_body, types.RigidBody)) |p| p.* else null;
    const motion = joltMotion(collider, rb);
    const moving = motion != .static;

    const shape = try self.getShape(collider.shape, vec3Or(w, e, cids.scale, .one), collider.material.density);
    const pos = vec3Or(w, e, cids.position, .zero);
    const rot = quatOr(w, e, cids.rotation, .identity);

    var settings: zphysics.BodyCreationSettings = .{
        .user_data = e.toU64(),
        .object_layer = LayerMatrix.objectLayer(0, moving),
        .position = .{ pos.x, pos.y, pos.z, 1.0 },
        .rotation = .{ rot.x, rot.y, rot.z, rot.w },
        .shape = shape,
        .motion_type = motionTypeToJoltType(if (rb) |r| r.motion else null),
        .is_sensor = collider.sensor,
        .friction = collider.material.friction,
        .restitution = collider.material.restitution,
    };

    if (rb) |r| {
        settings.linear_damping = r.linear_damping;
        settings.angular_damping = r.angular_damping;
        settings.gravity_factor = r.gravity_scale;
        settings.allowed_DOFs = allowedDofs(r.locked);
        settings.motion_quality = if (r.continuous) .linear_cast else .discrete;
        if (r.mass) |m| {
            settings.override_mass_properties = .calc_inertia;
            settings.mass_properties_override.mass = m;
        }
    }

    const id = try self.physics_system.getBodyInterfaceMut()
        .createAndAddBody(settings, if (moving) .activate else .dont_activate);
    errdefer self.physics_system.getBodyInterfaceMut().removeAndDestroyBody(id);

    try self.bodies.put(@backingInt(id), .{ .entity = e, .sensor = collider.sensor });
    errdefer _ = self.bodies.remove(@backingInt(id));

    try w.setUnchecked(e, cids.physics_body, types.PhysicsBody, .{
        .physics = self,
        .id = @backingInt(id),
        .locked = if (rb) |r| r.locked else .{},
        .mass = if (rb) |r| r.mass else null,
    });

    self.added_bodies += 1;
}

fn allowedDofs(locked: types.LockedAxes) zphysics.AllowedDOFs {
    var d = @backingInt(zphysics.AllowedDOFs.none);
    if (!locked.position.x) d |= @backingInt(zphysics.AllowedDOFs.translation_x);
    if (!locked.position.y) d |= @backingInt(zphysics.AllowedDOFs.translation_y);
    if (!locked.position.z) d |= @backingInt(zphysics.AllowedDOFs.translation_z);
    if (!locked.rotation.x) d |= @backingInt(zphysics.AllowedDOFs.rotation_x);
    if (!locked.rotation.y) d |= @backingInt(zphysics.AllowedDOFs.rotation_y);
    if (!locked.rotation.z) d |= @backingInt(zphysics.AllowedDOFs.rotation_z);

    return @fromBackingInt(d);
}

fn getBodyInfo(self: *Physics, id: zphysics.BodyId) ?struct { zphysics.MotionType, *const zphysics.Shape } {
    var r_lock: zphysics.BodyLockRead = .{};
    r_lock.lock(self.physics_system.getBodyLockInterfaceNoLock(), id);
    defer r_lock.unlock();

    const body = r_lock.body orelse return null;
    return .{ body.getMotionType(), body.shape };
}

fn apply(self: *Physics, p: Pending, dt: f32) !void {
    const w3d = self.getWorld();
    const cids = w3d.component_ids;
    const w = w3d.world;
    const e = p.entity;
    const d = p.dirty;
    if (!w.isEntityAlive(e)) return;

    const has_collider = w.hasComponentUnchecked(e, cids.collider);
    const pb = w.getComponentUnchecked(e, cids.physics_body, types.PhysicsBody) orelse {
        if (has_collider and (d.collider or d.rigid_body)) try self.createBody(e);
        return;
    };
    if (!has_collider) return self.destroyBody(e);

    const body_id: zphysics.BodyId = @fromBackingInt(pb.id);
    const collider = w.getComponentUnchecked(e, cids.collider, types.Collider).?.*;
    const rb = if (w.getComponentUnchecked(e, cids.rigid_body, types.RigidBody)) |r| r.* else null;
    const jolt_motion = joltMotion(collider, rb);

    const motion, const shape = self.getBodyInfo(body_id) orelse return;
    const new_shape = if (d.shape or d.collider)
        try self.getShape(collider.shape, vec3Or(w, e, cids.scale, .one), collider.material.density)
    else
        null;
    const shape_changed = new_shape != null and new_shape.? != shape;

    const rebuild = (motion == .static) != (jolt_motion == .static) or
        (if (rb) |r| r.locked != pb.locked or r.mass != pb.mass or (shape_changed and r.mass != null) else false);
    if (rebuild) {
        self.destroyBody(e);
        return self.createBody(e);
    }

    const bi = self.physics_system.getBodyInterfaceMutNoLock();
    const activate: zphysics.Activation = if (jolt_motion == .static) .dont_activate else .activate;

    if (d.transform) {
        const pos = vec3Or(w, e, cids.position, .zero);
        const rot = quatOr(w, e, cids.rotation, .identity);

        if (motion == .kinematic) {
            {
                var lock: zphysics.BodyLockWrite = .{};
                lock.lock(self.physics_system.getBodyLockInterfaceNoLock(), body_id);
                defer lock.unlock();

                const body = lock.body orelse return;
                body.moveKinematic(pos.arr(), rot.toArr(), dt);
            }
            bi.activate(body_id);
        } else {
            bi.setPosition(body_id, pos.arr(), activate);
            bi.setRotation(body_id, rot.toArr(), activate);
        }
    }

    if (shape_changed) bi.setShape(body_id, new_shape.?, true, activate);
    if (d.rigid_body and jolt_motion != motion) bi.setMotionType(body_id, jolt_motion, activate);

    if (d.collider or d.rigid_body) {
        var lock: zphysics.BodyLockWrite = .{};
        lock.lock(self.physics_system.getBodyLockInterfaceNoLock(), body_id);
        defer lock.unlock();

        const body = lock.body orelse return;
        if (d.collider) {
            body.setFriction(collider.material.friction);
            body.setRestitution(collider.material.restitution);
            body.setIsSensor(collider.sensor);
        }
        if (d.rigid_body) if (rb) |r| {
            const mp = body.getMotionPropertiesMut();
            mp.setLinearDamping(r.linear_damping);
            mp.setAngularDamping(r.angular_damping);
            mp.setGravityFactor(r.gravity_scale);
        };
    }

    if (d.rigid_body) if (rb) |r| {
        var lock: zphysics.BodyLockWrite = .{};
        lock.lock(self.physics_system.getBodyLockInterfaceNoLock(), body_id);
        defer lock.unlock();

        const body = lock.body orelse return;
        body.getMotionPropertiesMut().motion_quality = if (r.continuous) .linear_cast else .discrete;
    };
}

fn joltMotion(collider: types.Collider, rb: ?types.RigidBody) zphysics.MotionType {
    if (rb) |r| return motionTypeToJoltType(r.motion);
    return if (collider.sensor) .kinematic else .static;
}

fn frameAllocator(self: *Physics) std.mem.Allocator {
    return self.frame_allocator.allocator();
}
