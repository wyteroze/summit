// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");

const Filesystem = @This();
io: std.Io,
allocator: std.mem.Allocator,

pub fn init(io: std.Io, allocator: std.mem.Allocator) Filesystem {
    return .{ .io = io, .allocator = allocator };
}

pub fn deinit(_: *Filesystem) void {}
