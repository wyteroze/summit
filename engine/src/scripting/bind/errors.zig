// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");

pub const ParsedError = struct {
    message: []const u8,
    uri: ?[]const u8 = null,
    line: ?u32 = null,
    traceback: ?[]const u8 = null,
};

const traceback_marker = "\nstack traceback:\n";

pub fn parse(raw: []const u8) ParsedError {
    var head = raw;
    var traceback: ?[]const u8 = null;
    if (std.mem.find(u8, raw, traceback_marker)) |i| {
        head = raw[0..i];
        traceback = raw[i + traceback_marker.len ..];
    }

    var from: usize = 0;
    while (std.mem.findScalarPos(u8, head, from, ':')) |colon| {
        from = colon + 1;

        var end = from;
        while (end < head.len and std.ascii.isDigit(head[end])) end += 1;
        if (end == from) continue;
        if (!std.mem.startsWith(u8, head[end..], ": ")) continue;

        const line = std.fmt.parseInt(u32, head[from..end], 10) catch continue;
        return .{
            // Compile errors don't have a chunkname
            .uri = if (colon == 0) null else head[0..colon],
            .line = line,
            .message = head[end + 2 ..],
            .traceback = traceback,
        };
    }

    return .{ .message = head, .traceback = traceback };
}

pub fn log(raw: []const u8, fallback_uri: ?[]const u8) void {
    const p = parse(raw);

    if (p.uri orelse fallback_uri) |uri| {
        if (p.line) |line| {
            std.log.err("{s}\n    at {s}:{d}", .{ p.message, uri, line });
        } else {
            std.log.err("{s}\n    in {s}", .{ p.message, uri });
        }
    } else {
        std.log.err("{s}", .{p.message});
    }

    if (p.traceback) |tb| std.log.err("stack traceback:\n{s}", .{tb});
}
