// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
//! A container that holds and manages all entities, components, and systems under it.
//!
//! Operations are split into two types, checked and unchecked. Checked functions have extra validation and will error
//! if invalid arguments are given. Unchecked functions (suffixed with `Unchecked`) don't have validation and are faster, but,
//! when given invalid arguments, will panic on builds with runtime safety enabled. When disabled, they may silently corrupt memory.
//! As such, when handling unsanitized user input, unchecked functions should only be called when inputs are known to be valid.
//! Otherwise, checked functions should be used instead.
//!
//! Currently not thread-safe.

const std = @import("std");
const Ecs = @import("Ecs.zig");
const Entity = Ecs.Entity;
const ComponentId = Ecs.ComponentId;
const ComponentRegistry = Ecs.ComponentRegistry;
const SystemRegistry = Ecs.SystemRegistry;
const SparseSet = Ecs.SparseSet;
const EntityIterator = Ecs.EntityIterator;
const Query = Ecs.Query;
const signal = @import("../core/signal.zig");
const Hierarchy = @import("Hierarchy.zig");
const lua_components = Ecs.lua_components;

pub const ChangeAction = enum { add, update, remove };
pub const WriteMode = enum { add, set, upsert };
pub const ChangedComponent = struct {
    action: ChangeAction,
    entity: Entity,
    component: ComponentId,
};

const World = @This();
// The ID of this world, because multiple can exist at once.
// This is also stored in entities and components so their home world can be identified.
id: u8,
allocator: std.mem.Allocator,
components: ComponentRegistry,
storages: std.ArrayList(SparseSet),
systems: SystemRegistry,

generations: std.ArrayList(u24),
alive: std.ArrayList(bool),
free: std.ArrayList(u32),

hierarchy: Hierarchy,
changed_set: std.AutoHashMap(u64, void),
// This lives here instead of ComponentRegistry because it has no idea when components are modified.
changed_components: std.ArrayList(ChangedComponent),
user_data: ?*anyopaque = null,

pub fn init(id: u8, allocator: std.mem.Allocator) World {
    return .{
        .id = id,
        .allocator = allocator,
        .components = .init(id, allocator),
        .storages = .empty,
        .systems = .init(allocator),
        .generations = .empty,
        .alive = .empty,
        .free = .empty,
        .hierarchy = .init(allocator),
        .changed_set = .init(allocator),
        .changed_components = .empty,
    };
}

pub fn deinit(self: *World) void {
    self.systems.deinit();
    for (self.storages.items) |*s| s.deinit();
    self.hierarchy.deinit();
    self.changed_set.deinit();
    self.changed_components.deinit(self.allocator);
    self.storages.deinit(self.allocator);
    self.components.deinit();
    self.generations.deinit(self.allocator);
    self.alive.deinit(self.allocator);
    self.free.deinit(self.allocator);
}

// Components

pub fn registerComponent(self: *World, comptime T: type, name: []const u8) !ComponentId {
    const id = try self.components.register(T, name);
    try self.ensureStorageFor(id);

    return id;
}

pub fn registerLuaComponent(self: *World, name: []const u8) !ComponentId {
    const id = try self.components.registerRaw(
        name,
        lua_components.type_name,
        @sizeOf(lua_components.LuaValue),
        @alignOf(lua_components.LuaValue),
        lua_components.freeLuaValue,
    );
    try self.ensureStorageFor(id);

    return id;
}

fn ensureStorageFor(self: *World, id: ComponentId) !void {
    while (self.storages.items.len <= id.value) {
        if (self.storages.items.len >= std.math.maxInt(u24)) return error.StorageLimitReached;
        const temp_id: ComponentId = .{ .value = @intCast(self.storages.items.len), .world_id = self.id };
        try self.storages.append(self.allocator, .init(self.allocator, self.components.info(temp_id), temp_id));
    }
}

pub fn storageFor(self: *World, id: ComponentId) ?*SparseSet {
    if (id.world_id != self.id) return null;
    if (id.value >= self.storages.items.len) return null;
    return self.storageForUnchecked(id);
}

// Entities

pub fn spawnEntity(self: *World) !Entity {
    if (self.free.pop()) |idx| {
        self.alive.items[idx] = true;

        const e: Entity = .{ .index = idx, .generation = self.generations.items[idx], .world_id = self.id };
        try self.hierarchy.changed.append(self.allocator, e);
        return e;
    }

    // Do this first so append can't error and make them out of sync.
    try self.alive.ensureUnusedCapacity(self.allocator, 1);
    try self.generations.ensureUnusedCapacity(self.allocator, 1);

    if (self.generations.items.len >= std.math.maxInt(u32)) return error.EntityLimitReached;
    const idx: u32 = @intCast(self.generations.items.len);
    try self.generations.append(self.allocator, 0);
    try self.alive.append(self.allocator, true);

    const e: Entity = .{ .index = idx, .generation = 0, .world_id = self.id };
    try self.hierarchy.changed.append(self.allocator, e);

    return e;
}

pub fn registerSystem(
    self: *World,
    sys_query: []const ComponentId,
    init_fn: ?SystemRegistry.SystemInitFn,
    update_fn: ?SystemRegistry.SystemUpdateFn,
    deinit_fn: ?SystemRegistry.SystemDeinitFn,
    event: ?SystemRegistry.SystemEventFn,
    event_mask: Ecs.EventCallback.Set,
    ctx: *anyopaque,
) !SystemRegistry.SystemHandle {
    for (sys_query) |id| _ = try self.checkComponent(id);
    return self.systems.register(self, sys_query, init_fn, update_fn, deinit_fn, event, event_mask, ctx);
}

pub fn unregisterSystem(self: *World, handle: SystemRegistry.SystemHandle) !void {
    try self.systems.unregister(handle);
}

pub fn update(self: *World, dt: f32) void {
    self.systems.runAll(self, dt);
}

fn ensureBelongsToMe(self: *World, entityOrComponent: anytype) !void {
    // This is exceptionally rare and should never happen, but these are user-controlled
    // and we need to be safe.
    const T = @TypeOf(entityOrComponent);
    if (entityOrComponent.world_id != self.id) {
        @branchHint(.cold);

        switch (T) {
            Entity => return error.EntityBelongsToOtherWorld,
            ComponentId => return error.ComponentBelongsToOtherWorld,
            else => @compileError("Invalid type passed to ensureBelongsToMe: " ++ @typeName(T)),
        }
    }
}

fn checkEntity(self: *World, e: Entity) !void {
    try self.ensureBelongsToMe(e);
    if (!self.isEntityAlive(e)) return error.DeadEntity;
}

fn checkComponent(self: *World, id: ComponentId) !*SparseSet {
    try self.ensureBelongsToMe(id);
    if (id.value >= self.storages.items.len) return error.UnknownComponent;
    return &self.storages.items[id.value];
}

fn storageForUnchecked(self: *World, id: ComponentId) *SparseSet {
    std.debug.assert(id.world_id == self.id);
    std.debug.assert(id.value < self.storages.items.len);
    return &self.storages.items[id.value];
}

pub fn markChanged(self: *World, entity: Entity) !void {
    std.debug.assert(entity.world_id == self.id);
    if (self.changed_set.contains(entity.toU64())) return;
    try self.changed_set.put(entity.toU64(), {});
    try self.hierarchy.changed.append(self.allocator, entity);
}

pub fn markComponentChanged(self: *World, entity: Entity, component: ComponentId, action: ChangeAction) !void {
    std.debug.assert(entity.world_id == self.id);
    std.debug.assert(component.world_id == self.id);
    try self.changed_components.append(self.allocator, .{ .entity = entity, .component = component, .action = action });
}

pub fn isEntityAlive(self: *World, entity: Entity) bool {
    if (entity.world_id != self.id) return false;
    if (entity.index >= self.alive.items.len) return false;
    return self.isEntityAliveUnchecked(entity);
}

/// Asserts entity belongs to this world and its index was issued by it.
pub fn isEntityAliveUnchecked(self: *World, entity: Entity) bool {
    std.debug.assert(entity.world_id == self.id);
    std.debug.assert(entity.index < self.alive.items.len);
    return self.alive.items[entity.index] and
        self.generations.items[entity.index] == entity.generation;
}

pub fn getParent(self: *World, e: Entity) !?Entity {
    try self.checkEntity(e);
    return self.getParentUnchecked(e);
}

pub fn getParentUnchecked(self: *World, e: Entity) ?Entity {
    std.debug.assert(self.isEntityAliveUnchecked(e));
    return self.hierarchy.getParent(e);
}

pub fn getChildren(self: *World, e: Entity) ![]const Entity {
    try self.checkEntity(e);
    return self.getChildrenUnchecked(e);
}

pub fn getChildrenUnchecked(self: *World, e: Entity) []const Entity {
    std.debug.assert(self.isEntityAliveUnchecked(e));
    return self.hierarchy.getChildren(e);
}

pub fn setParent(self: *World, e: Entity, parent: ?Entity) !void {
    try self.checkEntity(e);
    if (parent) |p| try self.checkEntity(p);
    return self.setParentUnchecked(e, parent);
}

pub fn setParentUnchecked(self: *World, e: Entity, parent: ?Entity) !void {
    std.debug.assert(self.isEntityAliveUnchecked(e));
    if (parent) |p| std.debug.assert(self.isEntityAliveUnchecked(p));
    return self.hierarchy.setParent(e, parent);
}

pub fn changedEntities(self: *const World) []const Entity {
    return self.hierarchy.changed.items;
}

pub fn changedComponents(self: *const World) []const ChangedComponent {
    return self.changed_components.items;
}

pub fn clearChanged(self: *World) void {
    self.hierarchy.changed.clearRetainingCapacity();
    self.changed_set.clearRetainingCapacity();
    self.changed_components.clearRetainingCapacity();
}

// Components

pub fn writeRaw(self: *World, e: Entity, id: ComponentId, bytes: []const u8, mode: WriteMode) !void {
    try self.checkEntity(e);
    const storage = try self.checkComponent(id);
    if (bytes.len != storage.info.size) return error.ComponentSizeMismatch;
    return self.writeRawUnchecked(e, id, bytes, mode);
}

pub fn writeRawUnchecked(self: *World, e: Entity, id: ComponentId, bytes: []const u8, mode: WriteMode) !void {
    std.debug.assert(self.isEntityAliveUnchecked(e));
    const storage = self.storageForUnchecked(id);
    std.debug.assert(bytes.len == storage.info.size);

    const exists = storage.has(e);
    switch (mode) {
        .add => if (exists) return error.ComponentAlreadyExists,
        .set => if (!exists) return error.ComponentMissing,
        .upsert => {},
    }
    try self.markChanged(e);
    try self.markComponentChanged(e, id, switch (mode) {
        .add => .add,
        .set => .update,
        .upsert => if (exists) .update else .add,
    });
    try storage.insert(e, bytes);
}

pub fn set(self: *World, entity: Entity, id: ComponentId, comptime T: type, value: T) !void {
    return self.writeRaw(entity, id, std.mem.asBytes(&value), .upsert);
}

pub fn setUnchecked(self: *World, entity: Entity, id: ComponentId, comptime T: type, value: T) !void {
    return self.writeRawUnchecked(entity, id, std.mem.asBytes(&value), .upsert);
}

pub fn removeComponent(self: *World, entity: Entity, id: ComponentId) !void {
    try self.checkEntity(entity);
    _ = try self.checkComponent(id);
    self.removeComponentUnchecked(entity, id);
}

pub fn removeComponentUnchecked(self: *World, entity: Entity, id: ComponentId) void {
    std.debug.assert(self.isEntityAliveUnchecked(entity));
    self.storageForUnchecked(id).remove(entity);
    self.markComponentChanged(entity, id, .remove) catch {};
}

pub fn hasComponent(self: *World, entity: Entity, id: ComponentId) !bool {
    try self.ensureBelongsToMe(entity);
    const storage = try self.checkComponent(id);
    if (!self.isEntityAlive(entity)) return false;
    return storage.has(entity);
}

pub fn hasComponentUnchecked(self: *World, entity: Entity, id: ComponentId) bool {
    std.debug.assert(self.isEntityAliveUnchecked(entity));
    return self.storageForUnchecked(id).has(entity);
}

pub fn getComponent(self: *World, entity: Entity, id: ComponentId, comptime T: type) !?*T {
    try self.checkEntity(entity);
    const storage = try self.checkComponent(id);
    if (!storage.info.matchesType(T)) return error.ComponentMismatch;
    return self.getComponentUnchecked(entity, id, T);
}

pub fn getComponentUnchecked(self: *World, entity: Entity, id: ComponentId, comptime T: type) ?*T {
    const storage = self.storageForUnchecked(id);
    std.debug.assert(@sizeOf(T) == storage.info.size);
    std.debug.assert(self.isEntityAliveUnchecked(entity));
    const bytes = storage.get(entity) orelse return null;
    return @ptrCast(@alignCast(bytes.ptr));
}

pub fn getComponentRaw(self: *World, entity: Entity, id: ComponentId) !?[]u8 {
    try self.checkEntity(entity);
    _ = try self.checkComponent(id);
    return self.getComponentRawUnchecked(entity, id);
}

pub fn getComponentRawUnchecked(self: *World, entity: Entity, id: ComponentId) ?[]u8 {
    std.debug.assert(self.isEntityAliveUnchecked(entity));
    return self.storageForUnchecked(id).get(entity);
}

/// Caller owns the returned slice
pub fn getComponents(self: *World, entity: Entity) ![]ComponentId {
    try self.checkEntity(entity);
    return self.getComponentsUnchecked(entity);
}

pub fn getComponentsUnchecked(self: *World, entity: Entity) ![]ComponentId {
    std.debug.assert(self.isEntityAliveUnchecked(entity));
    var components: std.ArrayList(ComponentId) = .empty;
    errdefer components.deinit(self.allocator);

    for (self.storages.items, 0..) |*s, i| {
        if (s.has(entity)) {
            try components.append(self.allocator, .{ .value = @intCast(i), .world_id = self.id });
        }
    }
    return components.toOwnedSlice(self.allocator);
}

pub fn componentId(self: *World, name: []const u8) ?ComponentId {
    return self.components.id(name);
}

// Entities

pub fn destroyEntity(self: *World, entity: Entity) !void {
    try self.checkEntity(entity);
    self.destroyEntityUnchecked(entity);
}

pub fn destroyEntityUnchecked(self: *World, entity: Entity) void {
    std.debug.assert(self.isEntityAliveUnchecked(entity));

    while (self.hierarchy.popChild(entity)) |c| self.destroyEntityUnchecked(c);
    self.hierarchy.remove(entity);

    for (self.storages.items) |*s| {
        self.markComponentChanged(entity, s.component_id, .remove) catch {};
        s.remove(entity);
    }
    self.alive.items[entity.index] = false;
    self.generations.items[entity.index] +%= 1;
    self.free.append(self.allocator, entity.index) catch {};
}

pub fn entityIterator(self: *World) EntityIterator {
    return .{ .world = self };
}

// Queries

pub fn entityMatches(self: *World, e: Entity, required: []const ComponentId) bool {
    if (!self.isEntityAlive(e)) return false;
    for (required) |id| if (!self.hasComponentUnchecked(e, id)) return false;
    return true;
}

pub fn query(self: *World, required: []const ComponentId) !Query {
    for (required) |id| _ = try self.checkComponent(id);
    return self.queryUnchecked(required);
}

pub fn queryUnchecked(self: *World, required: []const ComponentId) Query {
    return .init(self, required);
}

pub fn format(
    _: *const @This(),
    writer: *std.Io.Writer,
) std.Io.Writer.Error!void {
    try writer.print("World", .{});
}

const bind = @import("../scripting/bind/bind.zig");
/// This is how Lua interfaces with worlds. It has a mostly stripped-down API surface
/// because it can't (and shouldn't) work on a level as low as we do. Engine consumers
/// should always use a `*World` directly, while Lua uses this `WorldHandle`.
pub const WorldHandle = struct {
    id: u8,
    ecs: *Ecs,

    pub fn isAlive(self: WorldHandle) bool {
        return self.ecs.isWorldAlive(self.id);
    }

    pub fn eql(self: WorldHandle, other: WorldHandle) bool {
        return self.id == other.id;
    }

    pub fn registerComponent(self: WorldHandle, name: []const u8) !void {
        const w = self.ecs.getWorld(self.id) catch return error.InvalidHandle;
        // Lua doesn't really have anything to do with component ids yet, just discard the result.
        _ = try w.registerLuaComponent(name);
    }

    pub fn spawnEntity(self: WorldHandle) !Entity {
        const w = self.ecs.getWorld(self.id) catch return error.InvalidHandle;
        return try w.spawnEntity();
    }

    // TODO: unregisterComponent()

    pub const sub_api = bind.handle(WorldHandle, .{
        .alive = bind.func("isAlive", WorldHandle.isAlive),
        .methods = &.{
            bind.func("registerComponent", WorldHandle.registerComponent),
            bind.func("spawnEntity", WorldHandle.spawnEntity),
        },
        .ops = .{
            .eq = .{ .member = bind.func("eql", WorldHandle.eql) },
        },
    });
};
