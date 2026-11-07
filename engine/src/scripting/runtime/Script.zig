// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zlua = @import("zlua");
const World3D = @import("../../world3d/World3D.zig");
const Host = @import("../bind/bind.zig").Host;
const core = @import("../../core/core.zig");
const Ecs = @import("../../ecs/Ecs.zig");
const bind = @import("../bind/bind.zig");
const types = @import("../../assets/types.zig");
const Lua = zlua.Lua;

pub const Lifecycle = enum { init, update, deinit };

const Script = @This();
source: types.ScriptSource,
arena: std.heap.ArenaAllocator,
main: *Lua,
state: *Lua,
thread_ref: i32,
ref: i32,
binder: bind.Binder(bind.api),
lifecycle_refs: std.enums.EnumArray(Lifecycle, ?i32) = .initFill(null),
event_refs: std.enums.EnumArray(Ecs.EventCallback.Tag, ?i32) = .initFill(null),

pub fn init(
    name: ?[:0]const u8,
    main: *Lua,
    state: *Lua,
    thread_ref: i32,
    source: types.ScriptSource,
    binder: bind.Binder(bind.api),
) !Script {
    // compile and run script
    const bytecode = switch (source.type) {
        .text => try zlua.compile(state.allocator(), source.data, .{}),
        .bytecode => source.data,
    };
    defer if (source.type == .text) state.allocator().free(bytecode);

    if (bytecode.len > 0 and bytecode[0] == 0) {
        std.log.err("Script compilation failed: {s}", .{bytecode[1..]});
        return error.ScriptCompilationFailed;
    }

    try state.loadBytecode(name orelse "Unnamed script", bytecode);
    state.protectedCall(.{ .args = 0, .results = 1 }) catch {
        std.log.err("Failed to initialize script: {s}", .{state.toString(-1) catch unreachable});
        state.pop(1);

        return error.ScriptInitFailed;
    };

    if (!state.isTable(-1)) {
        std.log.err("Script must return a table; got {t} instead", .{state.typeOf(-1)});
        return error.ScriptMustReturnTable;
    }

    const ref = state.ref(-1);
    // Lua should never modify this table once it's returned.
    // This might change in the future if users should be allowed
    // to attach their own data to the returned table. Right now though,
    // it's just functions that we use and don't want Lua changing.
    state.setReadonly(-1, true);
    state.pop(1);

    return .{
        .source = source,
        .arena = .init(state.allocator()),
        .main = main,
        .state = state,
        .thread_ref = thread_ref,
        .ref = ref,
        .binder = binder,
    };
}

pub fn deinit(self: *Script) void {
    for (self.event_refs.values) |v| if (v) |r| self.state.unref(r);
    for (self.lifecycle_refs.values) |v| if (v) |r| self.state.unref(r);

    self.state.unref(self.ref);
    self.main.unref(self.thread_ref);
    self.arena.deinit();
}

pub fn allocator(self: *Script) std.mem.Allocator {
    return self.arena.allocator();
}

pub fn callFunction(self: *const Script, name: [:0]const u8, comptime ResultTypes: []const type, args: anytype) !@Tuple(ResultTypes) {
    const l = self.state;
    const top = l.getTop();
    defer l.setTop(top);

    _ = l.getIndexRaw(zlua.registry_index, self.ref);
    if (l.getField(-1, name) != .function) return error.NotAFunction;

    return self.callFunctionAtIndex(-1, ResultTypes, args);
}

fn callFunctionAtIndex(self: *const Script, idx: i32, comptime ResultTypes: []const type, args: anytype) !@Tuple(ResultTypes) {
    const l = self.state;
    const top = l.getTop();
    defer l.setTop(top);

    const abs_index = l.absIndex(idx);
    const handler_idx = self.pushMsgHandler();
    l.pushValue(abs_index);

    inline for (args) |a| self.binder.pushValue(self.state, a);

    self.state.protectedCall(.{ .args = args.len, .results = ResultTypes.len, .msg_handler = handler_idx }) catch {
        self.luaErr();
        return error.FunctionCallFailed;
    };

    var results: @Tuple(ResultTypes) = undefined;
    inline for (ResultTypes, 0..) |R, i| {
        const r_idx = handler_idx + 1 + @as(i32, @intCast(i));
        results[i] = self.binder.parseValue(self.state, R, r_idx);
    }

    return results;
}

/// Globals should be set before calling this.
pub fn instantiateSystem(self: *Script, world: *Ecs.World) !Ecs.SystemRegistry.SystemHandle {
    if (self.ref == 0) return error.NoInstanceTable;
    try self.cacheAllRefs();
    const lc = self.lifecycle_refs;

    const l = self.state;
    const top = l.getTop();
    defer l.setTop(top);

    _ = l.getIndexRaw(zlua.registry_index, self.ref);

    // Run it before processing the query so the system may create any components it needs to use.
    if (lc.get(.init)) |ref| {
        _ = l.getIndexRaw(zlua.registry_index, ref);
        _ = self.callFunctionAtIndex(-1, &.{}, .{}) catch
            return error.SystemInitFailed;
        l.pop(1);
    }

    const alloc = self.allocator();
    // Duped by `registerSystem`
    var ids: std.ArrayList(Ecs.ComponentId) = .empty;
    defer ids.deinit(alloc);

    if (l.getField(-1, "query") != .table) {
        std.log.err("Systems must have a `query` table containing component names, even if empty.", .{});
        return error.InvalidOrNoQuery;
    }

    l.pushNil();
    while (l.next(-2)) {
        const name = l.checkString(-1);
        const id = world.components.id(name) orelse {
            std.log.err("Unknown component '{s}' in system query", .{name});
            return error.UnknownComponentInQuery;
        };
        try ids.append(alloc, id);
        l.pop(1);
    }
    l.pop(1);

    return try world.registerSystem(
        ids.items,
        // No need for init fn, we just called it
        null,
        // Update function
        if (lc.get(.update) != null) struct {
            fn update(e: Ecs.Entity, dt: f32, ctx: *anyopaque) void {
                const s: *Script = @ptrCast(@alignCast(ctx));
                const lua = s.state;

                _ = lua.getIndexRaw(zlua.registry_index, s.lifecycle_refs.get(.update).?);
                _ = s.callFunctionAtIndex(-1, &.{}, .{ e, dt }) catch {};
                lua.pop(1);
            }
        }.update else null,
        // Deinit function
        if (lc.get(.deinit) != null) struct {
            fn deinit(ctx: *anyopaque) void {
                const s: *Script = @ptrCast(@alignCast(ctx));
                const lua = s.state;

                _ = lua.getIndexRaw(zlua.registry_index, s.lifecycle_refs.get(.deinit).?);
                _ = s.callFunctionAtIndex(-1, &.{}, .{}) catch {};
                lua.pop(1);
            }
        }.deinit else null,
        struct {
            fn event(e: Ecs.Entity, evt: Ecs.EventCallback, ctx: *anyopaque) void {
                const s: *Script = @ptrCast(@alignCast(ctx));
                s.dispatch(e, evt);
            }
        }.event,
        self.eventMask(),
        self,
    );
}

/// Globals should be set before calling this.
pub fn instantiateEntity(self: *Script, entity: Ecs.Entity) !void {
    if (self.ref == 0) return error.NoInstanceTable;
    try self.cacheAllRefs();
    const l = self.state;

    const top = l.getTop();
    defer l.setTop(top);

    _ = try self.callFunction("init", &.{}, .{entity});
}

pub fn setGlobal(self: *const Script, name: [:0]const u8, val: anytype) void {
    const l = self.state;

    l.pushGlobalTable();
    self.binder.pushValue(l, val);
    l.setField(-2, name);
    l.pop(1);
}

/// Calls the Lua callback for `evt` as callback(entity, ...payload).
/// Does nothing if the callback is not implemented.
pub fn dispatch(self: *const Script, entity: Ecs.Entity, evt: Ecs.EventCallback) void {
    const ref = self.event_refs.get(std.meta.activeTag(evt)) orelse return;
    const l = self.state;
    const top = l.getTop();
    defer l.setTop(top);

    const handler_idx = self.pushMsgHandler();
    _ = l.getIndexRaw(zlua.registry_index, ref);
    self.binder.pushValue(l, entity);

    var nargs: i32 = 1;
    switch (evt) {
        inline else => |payload| inline for (comptime fieldNames(@TypeOf(payload))) |nm| {
            self.binder.pushValue(l, @field(payload, nm));
            nargs += 1;
        },
    }

    l.protectedCall(.{ .args = nargs, .results = 0, .msg_handler = handler_idx }) catch self.luaErr();
}

/// Returns which events this script implements.
pub fn eventMask(self: *Script) Ecs.EventCallback.Set {
    var mask: Ecs.EventCallback.Set = .empty;
    var it = self.event_refs.iterator();
    while (it.next()) |e| if (e.value.* != null) mask.insert(e.key);
    return mask;
}

fn cacheRefs(self: *Script, comptime E: type, refs: *std.enums.EnumArray(E, ?i32)) !void {
    const l = self.state;
    const top = l.getTop();
    defer l.setTop(top);

    _ = l.getIndexRaw(zlua.registry_index, self.ref);
    const field_names = comptime fieldNames(E);

    inline for (field_names) |nm| {
        switch (l.getField(-1, nm)) {
            .function => refs.set(@field(E, nm), l.ref(-1)),
            .nil => {},
            else => {
                std.log.err("'{s}' must be a function or nil", .{nm});
                return error.EventCallbackMustBeFunctionOrNil;
            },
        }
        l.pop(1);
    }
}

fn cacheAllRefs(self: *Script) !void {
    try self.cacheRefs(Lifecycle, &self.lifecycle_refs);
    try self.cacheRefs(Ecs.EventCallback.Tag, &self.event_refs);
}

fn fieldNames(comptime E: type) []const [:0]const u8 {
    return switch (@typeInfo(E)) {
        .@"union" => |u| u.field_names,
        .@"enum" => |e| e.field_names,
        .@"struct" => |s| s.field_names,
        else => @compileError("expected a union or enum or struct"),
    };
}

fn pushMsgHandler(self: *const Script) i32 {
    self.state.pushFunction(zlua.wrap(struct {
        fn c(l: *Lua) i32 {
            const msg = l.toString(-1) catch "unknown error";
            l.traceback(l, msg, 1);
            return 1;
        }
    }.c), "msgHandler");

    return self.state.getTop();
}

fn luaErr(self: *const Script) void {
    const msg = self.state.toString(-1) catch "unknown error";
    var formatted = false;

    // find the ": "
    if (std.mem.indexOf(u8, msg, ": ")) |msg_sep| {
        // search backwards in order to find the separator of file and line
        if (std.mem.findScalarLast(u8, msg[0..msg_sep], ':')) |line_sep| {
            const line = msg[line_sep + 1 .. msg_sep];
            const err_msg = msg[msg_sep + 2 ..]; // skip ":"

            // todo: change second format arg to script path, I removed it without
            // knowing this needed it and I'm too lazy to add it back
            std.log.err("{s}         in {s} (line {s})", .{ err_msg, "script", line });
            formatted = true;
        }
    }

    if (!formatted) std.log.err("{s}", .{msg});
    self.state.pop(1);
}
