// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const bind = @import("../scripting/bind/bind.zig");
pub const ComponentId = @import("ComponentId.zig").ComponentId;
pub const ComponentRegistry = @import("ComponentRegistry.zig");
pub const SystemRegistry = @import("SystemRegistry.zig");
pub const Entity = @import("Entity.zig").Entity;
pub const Query = @import("Query.zig");
pub const SparseSet = @import("SparseSet.zig");
pub const World = @import("World.zig");
pub const Codec = @import("Codec.zig");
pub const lua_components = @import("lua_components.zig");
pub const lua_entity = @import("lua_entity.zig");

const u8_max = std.math.maxInt(u8);

const Ecs = @This();
allocator: std.mem.Allocator,
worlds: std.AutoHashMap(u8, *World),
// Only a max of 256 worlds can exist at once.
free: [u8_max]u8,
free_len: u8 = 255,

pub fn init(self: *Ecs, allocator: std.mem.Allocator) !void {
    self.* = .{
        .allocator = allocator,
        .worlds = .init(allocator),
        .free = undefined,
    };
    for (0..u8_max) |i| self.free[i] = @intCast(u8_max - 1 - i);
}

pub fn deinit(self: *Ecs) void {
    var iter = self.worlds.valueIterator();
    while (iter.next()) |w| {
        w.*.deinit();
        self.allocator.destroy(w.*);
    }
    self.worlds.deinit();
}

pub fn createWorld(self: *Ecs) !*World {
    if (self.free_len == 0) return error.TooManyWorlds;
    self.free_len -= 1;
    const id = self.free[self.free_len];

    const world = try self.allocator.create(World);
    world.* = .init(id, self.allocator);
    try self.worlds.put(id, world);

    return world;
}

pub fn destroyWorld(self: *Ecs, world: *World) !void {
    if (self.worlds.fetchRemove(world.id)) |kv| {
        kv.value.deinit();
        self.allocator.destroy(kv.value);

        // Should never be possible, but better to be safe than sorry I guess
        if (self.free_len >= 255) return;
        self.free_len += 1;
        self.free[self.free_len] = kv.value.id;
    } else return error.InvalidWorld;
}

pub fn getWorld(self: *Ecs, id: u8) !*World {
    return self.worlds.get(id) orelse return error.InvalidWorldId;
}

pub fn worldAsHandle(self: *Ecs, world: *World) World.WorldHandle {
    return .{ .ecs = self, .id = world.id };
}

pub fn isWorldAlive(self: *Ecs, id: u8) bool {
    return self.worlds.contains(id);
}

pub const api = bind.module("ecs", .{
    .kind = .{ .singleton = Ecs },
    .members = &.{
        lua_entity.sub_api,
        World.WorldHandle.sub_api,
    },
});
