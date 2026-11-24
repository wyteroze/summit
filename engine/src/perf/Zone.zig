// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

pub const Location = struct {
    name: []const u8,
    file: []const u8,
    line: u32,
    category: []const u8,

    pub const null_location: Location = .{ .name = "", .file = "", .line = 0, .category = "" };
};

const Zone = @This();
location: *const Location,
start: i96,
