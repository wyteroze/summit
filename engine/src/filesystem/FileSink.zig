// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Filesystem = @import("Filesystem.zig");

const FileSink = @This();
file: *Filesystem.File,
writer: std.Io.Writer,

pub fn init(file: *Filesystem.File, buffer: []u8) FileSink {
    return .{
        .file = file,
        .writer = .{
            .vtable = &.{ .drain = drain },
            .buffer = buffer,
        },
    };
}

pub fn drain(w: *std.Io.Writer, data: []const []const u8, splat: usize) std.Io.Writer.Error!usize {
    const self: *FileSink = @alignCast(@fieldParentPtr("writer", w));

    if (w.end > 0) {
        self.file.write(w.buffer[0..w.end]) catch return error.WriteFailed;
        w.end = 0;
    }

    var n: usize = 0;
    for (data[0 .. data.len - 1]) |s| {
        self.file.write(s) catch return error.WriteFailed;
        n += s.len;
    }
    const last = data[data.len - 1];
    for (0..splat) |_| {
        self.file.write(last) catch return error.WriteFailed;
        n += last.len;
    }
    return n;
}
