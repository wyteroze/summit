// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Ecs = @import("Ecs.zig");
const World = Ecs.World;
const Entity = Ecs.Entity;

pub const SystemInitFn = *const fn (world: *World, ctx: *anyopaque) void;
pub const SystemUpdateFn = *const fn (entity: Entity, dt: f32, ctx: *anyopaque) void;
pub const SystemDeinitFn = *const fn (ctx: *anyopaque) void;
pub const SystemEventFn = *const fn (entity: Entity, evt: Ecs.EventCallback, ctx: *anyopaque) void;
pub const SystemHandle = struct {
    registry: *SystemRegistry,
    id: u64,

    pub fn unregister(self: SystemHandle) !void {
        try self.registry.unregister(self);
    }
};

pub const SystemEntry = struct {
    ctx: *anyopaque,
    query: []const Ecs.ComponentId,
    init: ?SystemInitFn,
    update: ?SystemUpdateFn,
    deinit: ?SystemDeinitFn,
    event: ?SystemEventFn,
    event_mask: Ecs.EventCallback.Set,
};

const SystemRegistry = @This();
allocator: std.mem.Allocator,
systems: std.AutoHashMap(u64, SystemEntry),
// TODO: Reaching this limit is unlikely in the first place
// but we need some sort of reusable "resource table" concept
// instead of having to do stuff like this all across the codebase.
next_id: u64 = 0,

pub fn init(allocator: std.mem.Allocator) SystemRegistry {
    return .{ .allocator = allocator, .systems = .init(allocator) };
}

pub fn deinit(self: *SystemRegistry) void {
    var iter = self.systems.valueIterator();
    while (iter.next()) |s| {
        if (s.deinit) |d| d(s.ctx);
        self.allocator.free(s.query);
    }
    self.systems.deinit();
}

pub fn register(
    self: *SystemRegistry,
    world: *World,
    query: []const Ecs.ComponentId,
    init_fn: ?SystemInitFn,
    update_fn: ?SystemUpdateFn,
    deinit_fn: ?SystemDeinitFn,
    event: ?SystemEventFn,
    event_mask: Ecs.EventCallback.Set,
    ctx: *anyopaque,
) !SystemHandle {
    const id = self.next_id;
    self.next_id +%= 1;

    const query_dupe = try self.allocator.dupe(Ecs.ComponentId, query);
    try self.systems.put(id, .{
        .ctx = ctx,
        .query = query_dupe,
        .init = init_fn,
        .update = update_fn,
        .deinit = deinit_fn,
        .event = event,
        .event_mask = event_mask,
    });

    if (init_fn) |func| func(world, ctx);
    return .{ .registry = self, .id = id };
}

pub fn unregister(self: *SystemRegistry, handle: SystemHandle) !void {
    if (self.systems.fetchRemove(handle.id)) |entry| {
        const sys = &entry.value;
        if (sys.deinit) |d| d(sys.ctx);
        self.allocator.free(sys.query);
    } else return error.SystemNotRegistered;
}

pub fn runAll(self: *SystemRegistry, world: *World, dt: f32) void {
    var iter = self.systems.valueIterator();
    while (iter.next()) |s| if (s.update) |update| {
        // TODO: Cache queries instead of doing them every frame
        // Queries are validated by World before registering systems
        var q_iter = world.queryUnchecked(s.query).iterator();
        while (q_iter.next()) |e| update(e, dt, s.ctx);
    };
}

pub fn dispatchEvent(self: *SystemRegistry, world: *World, entity: Entity, evt: Ecs.EventCallback) void {
    const tag = std.meta.activeTag(evt);
    var iter = self.systems.valueIterator();
    while (iter.next()) |s| {
        const f = s.event orelse continue;
        if (!s.event_mask.contains(tag)) continue;
        if (!world.entityMatches(entity, s.query)) continue;

        f(entity, evt, s.ctx);
    }
}
