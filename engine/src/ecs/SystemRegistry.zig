// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const ecs = @import("ecs.zig");
const World = ecs.World;
const Entity = ecs.Entity;

pub const SystemInitFn = *const fn (world: *World, ctx: *anyopaque) void;
pub const SystemUpdateFn = *const fn (entity: Entity, dt: f32, ctx: *anyopaque) void;
pub const SystemDeinitFn = *const fn (ctx: *anyopaque) void;
pub const SystemHandle = struct {
    registry: *SystemRegistry,
    id: u64,

    pub fn unregister(self: SystemHandle) void {
        self.registry.unregister(self);
    }
};

pub const SystemEntry = struct {
    ctx: *anyopaque,
    query: []const ecs.ComponentId,
    init: ?SystemInitFn,
    update: SystemUpdateFn,
    deinit: ?SystemDeinitFn,
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
    while (iter.next()) |s| if (s.deinit) |d| d(s.ctx);
    self.systems.deinit();
}

pub fn register(
    self: *SystemRegistry,
    world: *World,
    query: []const ecs.ComponentId,
    init_fn: ?SystemInitFn,
    update_fn: SystemUpdateFn,
    deinit_fn: ?SystemDeinitFn,
    ctx: *anyopaque,
) !SystemHandle {
    const id = self.next_id;
    self.next_id +%= 1;

    try self.systems.put(id, .{
        .ctx = ctx,
        .query = query,
        .init = init_fn,
        .update = update_fn,
        .deinit = deinit_fn,
    });

    if (init_fn) |func| func(world, ctx);
    return .{ .registry = self, .id = id };
}

pub fn unregister(self: *SystemRegistry, handle: SystemHandle) !void {
    if (self.systems.fetchRemove(handle.id)) |entry| {
        const sys = &entry.value;
        if (sys.deinit) |d| d(sys.ctx);
    } else return error.SystemNotRegistered;
}

pub fn runAll(self: *SystemRegistry, world: *World, dt: f32) void {
    var iter = self.systems.valueIterator();
    while (iter.next()) |s| {
        // TODO: Cache queries instead of doing them every frame
        var q_iter = world.query(s.query).iterator();
        while (q_iter.next()) |e| s.update(e, dt, s.ctx);
    }
}
