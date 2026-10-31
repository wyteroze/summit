// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const builtin = @import("builtin");
const Summit = @import("../summit/Summit.zig");

pub const panic = std.debug.FullPanic(panicFn);
threadlocal var tried_panic = false;
threadlocal var fault_ctx: ?*anyopaque = null;

pub fn setupPanic() void {
    if (builtin.target.os.tag == .windows) return;

    std.debug.updateSegfaultHandler(&.{
        .handler = .{ .sigaction = posixFault },
        .mask = std.posix.sigemptyset(),
        .flags = std.posix.SA.SIGINFO | std.posix.SA.NODEFER,
    });
}

fn posixFault(sig: std.posix.SIG, _: *const std.posix.siginfo_t, ctx: ?*anyopaque) callconv(.c) void {
    @branchHint(.cold);

    const msg = switch (sig) {
        .SEGV => "Segmentation fault",
        .BUS => "Bus error",
        .FPE => "Floating point exception",
        .ILL => "Illegal instruction",
        else => "Unhandled fault",
    };

    fault_ctx = ctx;
    panicFn(msg, null);
}

pub export fn summit_panic(msg: [*:0]const u8) callconv(.c) noreturn {
    @branchHint(.cold);

    panicFn(std.mem.span(msg), @returnAddress());
}

fn panicFn(msg: []const u8, _: ?usize) noreturn {
    @branchHint(.cold);

    if (tried_panic) std.process.abort();
    tried_panic = true;

    const stderr = std.debug.lockStderr(&.{}).terminal();
    defer std.debug.unlockStderr();
    const writer = stderr.writer;

    trace: {
        stderr.setColor(.bright_red) catch {};
        stderr.setColor(.bold) catch {};
        writer.print("{s} ", .{msg}) catch {};
        stderr.setColor(.reset) catch {};

        stderr.setColor(.bright_red) catch {};
        stderr.setColor(.dim) catch {};
        writer.print("(thread {d})", .{std.Thread.getCurrentId()}) catch {};
        stderr.setColor(.reset) catch {};

        if (@errorReturnTrace()) |t| if (t.index > 0) {
            writer.print("Error context:\n", .{}) catch break :trace;
            std.debug.writeErrorReturnTrace(t, stderr) catch break :trace;
        };

        const native_ctx: ?std.debug.cpu_context.Native =
            if (fault_ctx) |ctx| std.debug.cpu_context.fromPosixSignalContext(ctx) else null;

        stderr.setColor(.bright_red) catch {};
        writer.print("\nStack trace:\n", .{}) catch break :trace;
        stderr.setColor(.reset) catch {};

        if (native_ctx) |c| {
            std.debug.writeCurrentStackTrace(.{ .context = &c, .allow_unsafe_unwind = true }, stderr) catch break :trace;
        } else {
            std.debug.dumpCurrentStackTrace(.{
                .first_address = @returnAddress(),
                .allow_unsafe_unwind = true,
            });
        }

        // Not a good idea im terms of stability to be doing this, but whatever, we're crashing anyways.
        const summit = Summit.singleton();
        const lua_traceback = summit.runtime.traceback();
        stderr.setColor(.bright_red) catch {};
        writer.writeAll("Lua trace:\n") catch break :trace;
        stderr.setColor(.reset) catch {};
        writer.print("{s:0}", .{lua_traceback}) catch break :trace;
    }

    stderr.setColor(.reset) catch {};
    std.process.abort();
}
