// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const DirSource = @import("DirSource.zig");

var exe_path: [std.Io.Dir.max_path_bytes]u8 = undefined;

pub const scheme = "file";
pub fn init(allocator: std.mem.Allocator, io: std.Io) !DirSource {
    const path_len = try std.process.currentPath(io, &exe_path);
    return .init(allocator, io, exe_path[0..path_len]);
}
