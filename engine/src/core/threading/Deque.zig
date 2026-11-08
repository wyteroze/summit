// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");

pub fn Deque(comptime T: type) type {
    return struct {
        const Self = @This();

        buffer: []T,
        mask: usize,
        top: std.atomic.Value(i64) = .init(0),
        bottom: std.atomic.Value(i64) = .init(0),

        pub fn init(allocator: std.mem.Allocator, size: usize) !Self {
            std.debug.assert(std.math.isPowerOfTwo(size));

            return .{
                .buffer = try allocator.alloc(T, size),
                .mask = size - 1,
            };
        }

        pub fn deinit(self: *Self, allocator: std.mem.Allocator) void {
            allocator.free(self.buffer);
        }

        /// Should only be called on the owner thread
        pub fn pushToBottom(self: *Self, item: T) bool {
            const b = self.bottom.load(.monotonic);
            const t = self.top.load(.acquire);
            if (b - t >= @as(i64, @intCast(self.buffer.len))) return false;
            self.buffer[@intCast(b & @as(i64, @intCast(self.mask)))] = item;
            self.bottom.store(b + 1, .release);
            return true;
        }

        /// Should only be called on the owner thread
        pub fn popFromBottom(self: *Self) ?T {
            const b = self.bottom.load(.monotonic) - 1;
            self.bottom.store(b, .seq_cst);

            const t = self.top.load(.seq_cst);
            if (t > b) { // empty
                self.bottom.store(b + 1, .monotonic);
                return null;
            }

            const item = self.buffer[@intCast(b & @as(i64, @intCast(self.mask)))];
            if (t == b) {
                const won = self.top.cmpxchgStrong(t, t + 1, .seq_cst, .monotonic) == null;
                self.bottom.store(b + 1, .monotonic);
                return if (won) item else null;
            }

            return item;
        }

        /// Can be called on any thread
        pub fn steal(self: *Self) ?T {
            const t = self.top.load(.seq_cst);
            const b = self.bottom.load(.seq_cst);
            if (t >= b) return null;

            const item = self.buffer[@intCast(t & @as(i64, @intCast(self.mask)))];
            if (self.top.cmpxchgStrong(t, t + 1, .seq_cst, .monotonic) != null) return null;

            return item;
        }
    };
}
