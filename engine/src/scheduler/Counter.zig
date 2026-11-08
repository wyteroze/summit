// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Scheduler = @import("Scheduler.zig");

const Counter = @This();
value: std.atomic.Value(u32) = .init(0),
lock: std.Io.Mutex = .init,
waiters: ?*Scheduler.Fiber = null,

pub fn add(self: *Counter, n: u32) void {
    _ = self.value.fetchAdd(n, .monotonic);
}

pub fn isDone(self: *Counter, io: std.Io) bool {
    if (self.value.load(.acquire) != 0) return false;
    self.lock.lockUncancelable(io);
    self.lock.unlock(io);
    return true;
}

pub fn decrement(self: *Counter, scheduler: *Scheduler) void {
    const io = scheduler.io;
    self.lock.lockUncancelable(io);

    const prev = self.value.fetchSub(1, .acq_rel);
    var list: ?*Scheduler.Fiber = null;
    if (prev == 1) {
        list = self.waiters;
        self.waiters = null;
    }
    self.lock.unlock(io);

    while (list) |f| {
        list = f.next_waiter;
        f.next_waiter = null;
        scheduler.makeRunnable(f);
    }
}
