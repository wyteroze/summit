// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zlua = @import("zlua");
const core = @import("../core/core.zig");
const signal = core.signal;
const World = @import("World.zig");
const ComponentId = @import("ComponentId.zig");

const Entity = @This();
world: *World,
index: u32,
generation: u32,

pub const invalid: Entity = .{ .world = undefined, .index = std.math.maxInt(u32), .generation = std.math.maxInt(u32) };

pub fn eql(a: Entity, b: Entity) bool {
    return a.index == b.index and a.generation == b.generation;
}

pub fn toU64(self: Entity) u64 {
    return (@as(u64, self.generation) << 32) | @as(u64, self.index);
}

pub fn fromU64(bits: u64) Entity {
    return .{ .world = undefined, .index = @truncate(bits), .generation = @truncate(bits >> 32) };
}

pub fn destroy(self: Entity) void {
    self.world.destroyEntity(self);
}

pub fn isAlive(self: Entity) bool {
    return self.world.isEntityAlive(self);
}

pub fn hasComponent(self: Entity, name: []const u8) bool {
    const comp_id = self.world.components.id(name) orelse return false;
    return self.world.hasComponent(self, comp_id);
}

pub fn removeComponent(self: Entity, name: []const u8) void {
    const comp_id = self.world.components.id(name) orelse return;
    self.world.removeComponent(self, comp_id);
}

/// Memory is owned by the caller!!!
pub fn getComponents(self: Entity) ![]ComponentId {
    return try self.world.getComponents(self);
}

pub fn getParent(self: Entity) ?Entity {
    return self.world.hierarchy.getParent(self);
}

pub fn setParent(self: Entity, parent: ?Entity) !void {
    try self.world.hierarchy.setParent(self, parent);
}

pub fn isAncestorOf(self: Entity, ancestor: Entity) bool {
    return self.world.hierarchy.isAncestorOf(self, ancestor);
}

pub fn getChildren(self: Entity) []const Entity {
    return self.world.hierarchy.getChildren(self);
}

pub fn getComponent(self: Entity, id: ComponentId, comptime T: type) ?*T {
    return self.world.getComponent(self, id, T);
}

pub fn getName(self: Entity) ?[]const u8 {
    const id = self.world.components.id("Name") orelse return null;
    const c = self.world.getComponent(self, id, []const u8) orelse return null;

    return c.*;
}

pub fn updated(self: Entity) !*World.UpdateSignal {
    return self.world.updatedSignal(self);
}

pub fn destroyed(self: Entity) !*World.DestroySignal {
    return self.world.destroyedSignal(self);
}

pub fn format(
    self: @This(),
    writer: *std.Io.Writer,
) std.Io.Writer.Error!void {
    try writer.print("Entity{{ index: {d}, generation: {d} }}", .{ self.index, self.generation });
}

const bind = @import("../scripting/bind/bind.zig");
const lua_components = @import("lua_components.zig");

pub const sub_api = bind.handle(Entity, .{
    .alive = bind.func("isAlive", Entity.isAlive),
    .methods = &.{
        bind.func("AddComponent", lua_components.addComponent),
        bind.func("SetComponent", lua_components.setComponent),
        bind.func("GetComponent", lua_components.getComponent),
        bind.func("HasComponent", Entity.hasComponent),
        bind.func("RemoveComponent", Entity.removeComponent),
        bind.func("Destroy", Entity.destroy),
    },
    .props = &.{
        bind.readonly("Components", struct {
            fn c(self: Entity) lua_components.Components {
                return .{ .entity = self };
            }
        }.c)
    },
    .signals = &.{
        bind.signal("Updated", Entity.updated),
        bind.signal("Destroyed", Entity.destroyed),
    },
    .ops = .{ .eq = .{ .member = bind.func("eq", Entity.eql) }, .tostring = .auto }
});
