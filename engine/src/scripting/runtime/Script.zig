// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zlua = @import("zlua");
const core = @import("../../core/core.zig");
const ecs = @import("../../ecs/ecs.zig");
const bind = @import("../bind/bind.zig");
const types = @import("../../assets/types.zig");
const Lua = zlua.Lua;

const Script = @This();
source: types.ScriptSource,
arena: std.heap.ArenaAllocator,
main: *Lua,
state: *Lua,
thread_ref: i32,
ref: i32,
binder: bind.Binder(bind.api),
on_deinit: core.signal.Signal(.{*Script}),

pub fn init(
    dispatcher: *core.signal.Dispatcher,
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
    state.pop(1);

    return .{
        .source = source,
        .arena = .init(state.allocator()),
        .main = main,
        .state = state,
        .thread_ref = thread_ref,
        .ref = ref,
        .binder = binder,
        .on_deinit = .init(state.allocator(), dispatcher),
    };
}

pub fn deinit(self: *Script) void {
    self.state.unref(self.ref);
    self.main.unref(self.thread_ref);
    self.on_deinit.deinit();
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

pub fn instantiateSystem(self: *Script, world: *ecs.World) !ecs.SystemRegistry.SystemHandle {
    if (self.ref == 0) return error.NoInstanceTable;
    const l = self.state;

    const top = l.getTop();
    defer l.setTop(top);

    const alloc = self.allocator();
    var ids: std.ArrayList(ecs.ComponentId) = .empty;
    _ = l.getIndexRaw(zlua.registry_index, self.ref);
    if (l.getField(-1, "query") != .table) {
        std.log.err("Systems must have a `query` table containing component names.", .{});
        return error.InvalidOrNoQuery;
    }

    l.pushNil();
    while (l.next(-2)) {
        const component_name = l.checkString(-1);
        if (world.components.id(component_name)) |id| try ids.append(alloc, id);

        l.pop(1);
    }
    l.pop(1);

    const init_type = l.getField(-1, "init");
    const deinit_type = l.getField(-2, "deinit");
    l.pop(2);

    return try world.registerSystem(
        try ids.toOwnedSlice(alloc),
        // Init function
        if (init_type == .function) struct {
            fn init(_: *ecs.World, ctx: *anyopaque) void {
                const slf: *Script = @ptrCast(@alignCast(ctx));
                _ = slf.callFunction("init", &.{}, .{}) catch {};
            }
        }.init else null,
        // Update function
        struct {
            fn update(e: ecs.Entity, dt: f32, ctx: *anyopaque) void {
                const slf: *Script = @ptrCast(@alignCast(ctx));
                _ = slf.callFunction("update", &.{}, .{ e, dt }) catch {};
            }
        }.update,
        // Deinit function
        if (deinit_type == .function) struct {
            fn deinit(ctx: *anyopaque) void {
                const slf: *Script = @ptrCast(@alignCast(ctx));
                _ = slf.callFunction("deinit", &.{}, .{}) catch {};
            }
        }.deinit else null,
        self,
    );
}

pub fn instantiateEntity(self: *Script, entity: ecs.Entity) !void {
    if (self.ref == 0) return error.NoInstanceTable;
    const l = self.state;

    const top = l.getTop();
    defer l.setTop(top);

    _ = try self.callFunction("init", &.{}, .{entity});
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
