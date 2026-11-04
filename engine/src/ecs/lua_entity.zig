// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zlua = @import("zlua");
const bind = @import("../scripting/bind/bind.zig");
const Ecs = @import("Ecs.zig");
const Entity = Ecs.Entity;
const World = Ecs.World;
const lua_components = Ecs.lua_components;

fn worldOf(e: Entity, ecs: *Ecs) !*World {
    return try ecs.getWorld(e.world_id);
}

pub fn isAlive(e: Entity, ecs: *Ecs) !bool {
    return (try worldOf(e, ecs)).isEntityAlive(e);
}

pub fn destroy(e: Entity, ecs: *Ecs) !void {
    return (try worldOf(e, ecs)).destroyEntity(e);
}

pub fn hasComponent(e: Entity, ecs: *Ecs, name: []const u8) !bool {
    const w = try worldOf(e, ecs);
    const id = w.componentId(name) orelse return error.InvalidComponent;
    return w.hasComponent(e, id);
}

pub fn removeComponent(e: Entity, ecs: *Ecs, name: []const u8) !void {
    const w = try worldOf(e, ecs);
    const id = w.componentId(name) orelse return error.InvalidComponent;
    try w.removeComponent(e, id);
}

// For reading/writing components. Lua just does `entity.componentName` to access.
pub fn index(e: Entity, l: *zlua.Lua, codecs: []const Ecs.Codec, name: []const u8, ecs: *Ecs) !lua_components.Pushed {
    return lua_components.getComponent(e, l, codecs, name, ecs);
}

pub fn newindex(e: Entity, l: *zlua.Lua, codecs: []const Ecs.Codec, name: []const u8, ecs: *Ecs) !void {
    return lua_components.write(e, l, codecs, name, .upsert, ecs);
}

pub const sub_api = bind.handle(Entity, .{
    .alive = bind.func("isAlive", isAlive),
    .methods = &.{
        bind.func("addComponent", lua_components.addComponent),
        bind.func("setComponent", lua_components.setComponent),
        bind.func("getComponent", lua_components.getComponent),
        bind.func("hasComponent", hasComponent),
        bind.func("removeComponent", removeComponent),
        bind.func("destroy", destroy),
    },
    .ops = .{
        .eq = .{ .member = bind.func("eq", Entity.eql) },
        .index = .{ .member = bind.func("index", index) },
        .newindex = .{ .member = bind.func("newindex", newindex) },
        .tostring = .auto,
    },
});
