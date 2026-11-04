// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zphysics = @import("zphysics");

const Physics = @This();
allocator: std.mem.Allocator,

pub fn init(io: std.Io, allocator: std.mem.Allocator) !Physics {
    try zphysics.init(allocator, io, .{});
    return .{ .allocator = allocator };
}

pub fn deinit(_: *Physics) void {
    zphysics.deinit();
}
