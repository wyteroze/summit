// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zlua = @import("zlua");
const Ecs = @import("Ecs.zig");
const bind = @import("../scripting/bind/bind.zig");
const Pushed = @import("../scripting/bind/wrap.zig").Pushed;

pub const type_name = "lua.Value";

pub const LuaValue = struct { l: *zlua.Lua, ref: i32 };

pub fn freeLuaValue(_: std.mem.Allocator, bytes: []u8) void {
    const v: *LuaValue = @ptrCast(@alignCast(bytes.ptr));
    v.l.unref(v.ref);
}

fn write(e: Ecs.Entity, l: *zlua.Lua, codecs: []const Ecs.Codec, name: []const u8, comptime mode: Ecs.World.WriteMode, ecs: *Ecs) !void {
    const world = try ecs.getWorld(e.world_id);
    if (!world.isEntityAlive(e)) return error.InvalidEntity;
    const id = world.componentId(name) orelse return error.UnknownComponent;
    const info = world.components.info(id);

    var buf: [Ecs.ComponentRegistry.max_component_size]u8 align(Ecs.ComponentRegistry.max_alignment) = undefined;
    const bytes = buf[0..info.size];

    var new_ref: ?i32 = null;
    errdefer if (new_ref) |r| l.unref(r);

    if (std.mem.eql(u8, info.type_name, type_name)) {
        const ref = l.ref(3);
        new_ref = ref;

        const v: LuaValue = .{ .l = l.mainThread(), .ref = ref };
        @memcpy(bytes, std.mem.asBytes(&v));
    } else {
        const c = Ecs.Codec.find(codecs, info.type_name) orelse return error.ComponentNotExposedToLua;
        c.read(l, 3, bytes);
    }

    try world.writeRawUnchecked(e, id, bytes, mode);
}

pub fn addComponent(e: Ecs.Entity, l: *zlua.Lua, codecs: []const Ecs.Codec, name: []const u8, ecs: *Ecs) !void {
    return write(e, l, codecs, name, .add, ecs);
}

pub fn setComponent(e: Ecs.Entity, l: *zlua.Lua, codecs: []const Ecs.Codec, name: []const u8, ecs: *Ecs) !void {
    return write(e, l, codecs, name, .upsert, ecs);
}

pub fn getComponent(e: Ecs.Entity, l: *zlua.Lua, codecs: []const Ecs.Codec, name: []const u8, ecs: *Ecs) !Pushed {
    const world = try ecs.getWorld(e.world_id);
    const id = world.components.id(name) orelse return error.UnknownComponent;
    const info = world.components.info(id);

    const bytes = try world.getComponentRaw(e, id) orelse {
        l.pushNil();
        return .{ .n = 1 };
    };

    if (std.mem.eql(u8, info.type_name, type_name)) {
        const v: *LuaValue = @ptrCast(@alignCast(bytes.ptr));
        _ = l.getIndexRaw(zlua.registry_index, v.ref);
        return .{ .n = 1 };
    }

    const c = Ecs.Codec.find(codecs, info.type_name) orelse return error.ComponentNotExposedToLua;
    if (c.push_component) |pc| {
        pc(l, e, id, bytes);
        return .{ .n = 1 };
    }

    c.push(l, bytes);
    return .{ .n = 1 };
}

// "Proxy" object for `entity.Components`.
pub const Components = struct {
    entity: Ecs.Entity,

    pub fn index(self: Components, l: *zlua.Lua, codecs: []const Ecs.Codec, name: []const u8, ecs: *Ecs) !Pushed {
        return getComponent(self.entity, l, codecs, name, ecs);
    }

    pub fn newindex(self: Components, l: *zlua.Lua, codecs: []const Ecs.Codec, name: []const u8, ecs: *Ecs) !void {
        return write(self.entity, l, codecs, name, .upsert, ecs);
    }

    pub const api = bind.value(Components, .{
        .name = "Components",
        .ops = .{
            .index = .{ .member = bind.func("index", Components.index) },
            .newindex = .{ .member = bind.func("newindex", Components.newindex) },
        },
    });
};

pub const ComponentRef = struct {
    entity: Ecs.Entity,
    id: Ecs.ComponentId,

    const Resolved = struct { world: *Ecs.World, codec: *const Ecs.Codec, bytes: []u8 };

    fn resolve(self: ComponentRef, ecs: *Ecs, codecs: []const Ecs.Codec) !Resolved {
        const w = try ecs.getWorld(self.entity.world_id);
        const bytes = try w.getComponentRaw(self.entity, self.id) orelse return error.ComponentMissing;

        const info = w.components.info(self.id);
        const c = Ecs.Codec.find(codecs, info.type_name) orelse return error.ComponentNotExposedToLua;

        return .{ .world = w, .codec = c, .bytes = bytes };
    }

    pub fn index(self: ComponentRef, l: *zlua.Lua, codecs: []const Ecs.Codec, key: []const u8, ecs: *Ecs) !Pushed {
        const r = try self.resolve(ecs, codecs);
        r.codec.push(l, r.bytes);
        _ = l.pushString(key);
        _ = l.getTable(-2);
        l.remove(-2);
        return .{ .n = 1 };
    }

    pub fn newindex(self: ComponentRef, l: *zlua.Lua, codecs: []const Ecs.Codec, key: []const u8, ecs: *Ecs) !void {
        const r = try self.resolve(ecs, codecs);

        r.codec.push(l, r.bytes);
        _ = l.pushString(key);
        l.pushValue(3);
        l.setTable(-3);

        var buf: [Ecs.ComponentRegistry.max_component_size]u8 align(Ecs.ComponentRegistry.max_alignment) = undefined;
        const out = buf[0..r.bytes.len];
        r.codec.read(l, -1, out);
        l.pop(1);

        try r.world.writeRaw(self.entity, self.id, out, .set);
    }

    pub fn tostring(self: ComponentRef, l: *zlua.Lua, codecs: []const Ecs.Codec, ecs: *Ecs) !Pushed {
        const r = try self.resolve(ecs, codecs);
        r.codec.push(l, r.bytes);
        _ = l.toStringEx(-1);
        l.remove(-2);

        return .{ .n = 1 };
    }

    // TODO: While this works at face value, it's inherently funky
    // because it wraps the real value of the component. While tostring() works,
    // stuff like typeof, iterators, etc. don't. Either find a solution that eliminates
    // the need for even having this, or make all needed metamethods fall back to the
    // underlying type's implementation of it. `ComponentRef` shouldn't even be a concept to Lua.
    pub const api = bind.value(ComponentRef, .{
        .name = "ComponentRef",
        .ops = .{
            .index = .{ .member = bind.func("index", ComponentRef.index) },
            .newindex = .{ .member = bind.func("newindex", ComponentRef.newindex) },
            .tostring = .{ .member = bind.func("tostring", ComponentRef.tostring) },
        },
    });
};
