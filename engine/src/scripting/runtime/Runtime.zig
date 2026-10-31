// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zlua = @import("zlua");
const core = @import("../../core/core.zig");
const bind = @import("../bind/bind.zig");
const ecs = @import("../../ecs/ecs.zig");
const Assets = @import("../../assets/Assets.zig");
const Input = @import("../../input/Input.zig");
const Ui = @import("../../ui/Ui.zig");
const Audio = @import("../../audio/Audio.zig");
const Script = @import("Script.zig");

pub const ScriptHandle = struct { id: u64 };

const Runtime = @This();
state: *zlua.Lua,
binder: bind.Binder(bind.api),
dispatcher: core.signal.Dispatcher,
scripts: std.AutoHashMap(u64, Script),
next_script_id: u64 = 0,

pub fn init(alloc: std.mem.Allocator, host: *bind.Host) !Runtime {
    const l: *zlua.Lua = try .init(alloc);
    l.openLibs();

    var binder: bind.Binder(bind.api) = .init(l, host);
    binder.install();

    return .{ .state = l, .binder = binder, .dispatcher = .init(alloc), .scripts = .init(alloc) };
}

pub fn deinit(self: *Runtime) void {
    var iter = self.scripts.valueIterator();
    while (iter.next()) |s| {
        s.deinit();
    }
    self.scripts.deinit();
    self.gcCollect();
    self.dispatcher.deinit();
    self.state.deinit();
}

pub fn loadScript(self: *Runtime, name: ?[:0]const u8, source: Assets.types.ScriptSource) !ScriptHandle {
    const thread = self.state.newThread();
    const thread_ref = self.state.ref(-1);
    errdefer self.state.unref(thread_ref);
    self.state.pop(1);

    const id = self.next_script_id;
    self.next_script_id +%= 1;

    try self.scripts.put(id, try .init(&self.dispatcher, name, self.state, thread, thread_ref, source, self.binder));
    return .{ .id = id };
}

pub fn getScript(self: *Runtime, handle: ScriptHandle) !*Script {
    return self.scripts.getPtr(handle.id) orelse return error.InvalidId;
}

pub fn instantiateSystem(self: *Runtime, handle: ScriptHandle, world: *ecs.World) !ecs.SystemRegistry.SystemHandle {
    return (try self.getScript(handle)).instantiateSystem(world);
}

pub fn instantiateEntity(self: *Runtime, handle: ScriptHandle, entity: ecs.Entity) !void {
    try (try self.getScript(handle)).instantiateEntity(entity);
}

pub fn allocator(self: Runtime) std.mem.Allocator {
    return self.state.allocator();
}

pub fn gcCollect(self: Runtime) void {
    return self.state.gcCollect();
}

pub fn gcCount(self: Runtime) i32 {
    return self.state.gcCount();
}

pub fn allocationRate(self: Runtime) ?i64 {
    return self.state.allocationRate();
}

pub fn traceback(self: Runtime) [:0]const u8 {
    self.state.traceback(self.state, null, 0);
    defer self.state.pop(1);

    return self.state.toString(-1) catch "<failed to get traceback>";
}
