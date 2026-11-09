// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const builtin = @import("builtin");
const Scheduler = @import("../Scheduler.zig");
const Job = Scheduler.Job;

const impl = switch (builtin.cpu.arch) {
    .aarch64 => @import("../arch/aarch64.zig"),
    .x86_64 => @import("../arch/x86_64.zig"),
    else => @compileError("unsupported arch " ++ @tagName(builtin.cpu.arch)),
};
const Registers = impl.Registers;

comptime {
    @export(&impl.swap, .{ .name = "summit_fiber_swap", .visibility = .hidden });
}
extern fn summit_fiber_swap(from: *Registers, to: *Registers) callconv(.c) void;

pub const State = enum { idle, running, parked, finished };
pub const EntryArg = *anyopaque;
pub const EntryFn = *const fn (EntryArg) void;

const Fiber = @This();
regs: Registers = .{},
stack: []align(std.heap.page_size_min) u8,
state: State = .idle,
entry_fn: EntryFn = undefined,
entry_arg: EntryArg = undefined,
job: ?Job = null,
next_waiter: ?*Fiber = null,

pub fn init(stack_size: usize) !Fiber {
    const page = std.heap.pageSize();
    const total = std.mem.alignForward(usize, stack_size, page) + page; // `+ page` is for guard page
    const mem = try std.posix.mmap(
        null,
        total,
        .{ .READ = true, .WRITE = true },
        .{ .TYPE = .PRIVATE, .ANONYMOUS = true },
        -1,
        0,
    );
    errdefer std.posix.munmap(mem);

    if (std.c.mprotect(mem.ptr, page, .{ .READ = false, .WRITE = false }) != 0)
        return error.Unexpected;

    return .{ .stack = mem };
}

pub fn deinit(self: *Fiber) void {
    std.posix.munmap(self.stack);
}

pub fn initHome(_: *Fiber) void {}

pub fn reset(self: *Fiber, entry_fn: EntryFn, entry_arg: EntryArg) void {
    self.entry_fn = entry_fn;
    self.entry_arg = entry_arg;
    self.state = .idle;
    self.next_waiter = null;

    const top = (@intFromPtr(self.stack.ptr) + self.stack.len) & ~@as(usize, 0xF);
    self.regs = impl.initRegs(top, self, @intFromPtr(&trampolineLand));
}

pub fn trampolineLand(self: *Fiber) callconv(.c) noreturn {
    Scheduler.afterSwitch();

    self.state = .running;
    // We might resume on a different thread afterwards
    self.entry_fn(self.entry_arg);
    self.state = .finished;

    const home = Scheduler.currentHomeFiber();
    @call(.never_inline, summit_fiber_swap, .{ &self.regs, &home.regs });
    unreachable;
}

pub fn switchTo(self: *Fiber, target: *Fiber) void {
    @call(.never_inline, summit_fiber_swap, .{ &self.regs, &target.regs });
    // Runs on the thread that resumed us
    Scheduler.afterSwitch();
}
