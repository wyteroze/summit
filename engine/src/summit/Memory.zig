// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const builtin = @import("builtin");
const core = @import("../core/core.zig");
const SizeFormatter = core.SizeFormatter;

// why do you make me do this Apple
const objc = if (builtin.target.os.tag.isDarwin()) struct {
    pub extern fn objc_autoreleasePoolPush() ?*anyopaque;
    pub extern fn objc_autoreleasePoolPop(pool: ?*anyopaque) void;
} else struct {
    // zig fmt: off
    pub inline fn objc_autoreleasePoolPush() ?*anyopaque { return null; }
    pub inline fn objc_autoreleasePoolPop(_: ?*anyopaque) void { }
    // zig fmt: on
};

pub const MemoryPool = struct { ptr: ?*anyopaque };
pub const MemoryCategoryInfo = struct {
    bytes_allocated: usize,
    bytes_freed: usize,

    pub fn currentUsage(self: MemoryCategoryInfo) usize {
        return self.bytes_allocated - self.bytes_freed;
    }
};

const Memory = @This();

parent: std.mem.Allocator,
root: *core.TrackedAllocator,
allocators: std.StringHashMap(*core.TrackedAllocator),

pub fn init(allocator: std.mem.Allocator) !Memory {
    const root = try allocator.create(core.TrackedAllocator);
    errdefer allocator.destroy(root);
    root.* = .init(allocator, "Overall");

    return .{
        .parent = allocator,
        .root = root,
        .allocators = .init(root.allocator()),
    };
}

pub fn deinit(self: *Memory) void {
    const ra = self.root.allocator();

    var it = self.allocators.iterator();
    while (it.next()) |e| {
        ra.free(e.key_ptr.*);
        ra.destroy(e.value_ptr.*);
    }
    self.allocators.deinit();
    self.parent.destroy(self.root);
}

pub fn addCategory(self: *Memory, category: []const u8) !void {
    _ = try self.ensureCategory(category, true);
}

fn ensureCategory(self: *Memory, category: []const u8, must_be_new: bool) !*core.TrackedAllocator {
    if (self.allocators.get(category)) |existing| {
        if (must_be_new) return error.CategoryAlreadyExists;
        return existing;
    }

    const ra = self.root.allocator();
    const key = try ra.dupe(u8, category);
    errdefer ra.free(key);
    const tracked = try ra.create(core.TrackedAllocator);
    errdefer ra.destroy(tracked);
    tracked.* = .init(ra, null);

    try self.allocators.put(key, tracked);
    return tracked;
}

pub fn ensureGetCategoryAllocator(self: *Memory, category: []const u8) !std.mem.Allocator {
    return (try self.ensureCategory(category, false)).allocator();
}

pub fn removeCategory(self: *Memory, category: []const u8) !void {
    const kv = self.allocators.fetchRemove(category) orelse return error.CategoryDoesNotExist;
    const ra = self.root.allocator();
    ra.free(kv.key);
    ra.destroy(kv.value);
}

pub fn getCategoryAllocator(self: *Memory, category: []const u8) !std.mem.Allocator {
    const a = self.allocators.get(category) orelse return error.InvalidCategory;
    return a.allocator();
}

pub fn getCategoryInfo(self: *Memory, category: []const u8) !MemoryCategoryInfo {
    const a = self.allocators.get(category) orelse return error.InvalidCategory;
    return .{ .bytes_allocated = a.bytes_allocated, .bytes_freed = a.bytes_freed };
}

pub fn getRootAllocatorInfo(self: *Memory) MemoryCategoryInfo {
    return .{ .bytes_allocated = self.root.bytes_allocated, .bytes_freed = self.root.bytes_freed };
}

pub fn pushMemoryPool(_: *Memory) MemoryPool {
    return .{ .ptr = objc.objc_autoreleasePoolPush() };
}

pub fn popMemoryPool(_: *Memory, pool: MemoryPool) void {
    objc.objc_autoreleasePoolPop(pool.ptr);
}

pub fn dumpCategories(self: *const Memory) void {
    std.log.info("----- Memory categories ({f} total) -----", .{SizeFormatter.fmtSize(self.root.currentUsage())});
    var iter = self.allocators.iterator();
    while (iter.next()) |e|
        std.log.info("{s}: {f}", .{ e.key_ptr.*, SizeFormatter.fmtSize(e.value_ptr.*.currentUsage()) });

    std.log.info("----- Memory categories finished", .{});
}
