// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const ComponentId = @import("ComponentId.zig").ComponentId;

pub const FreeFn = *const fn (allocator: std.mem.Allocator, bytes: []u8) void;

const ComponentInfo = @This();
name: []const u8,
type_name: []const u8,
size: u32,
alignment: u32,
free_fn: ?FreeFn = null,

pub fn free(self: *const ComponentInfo, allocator: std.mem.Allocator, bytes: []u8) void {
    if (self.free_fn) |f| f(allocator, bytes);
}

// TODO: String comparison probably isn't the fastest way we can do this. If we don't need
// `type_name` to be readable, hash it instead.
pub fn matchesType(self: *const ComponentInfo, comptime T: type) bool {
    return std.mem.eql(u8, self.type_name, @typeName(T)) and self.size == @sizeOf(T) and self.alignment == @alignOf(T);
}
