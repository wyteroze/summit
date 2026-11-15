// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Entry = @import("Entry.zig");

pub const Row = struct { name: []const u8, total: usize = 0, documented: usize = 0 };

pub fn needsDocs(e: Entry) bool {
    return !e.hidden and e.inherited_from == null and e.kind != .field;
}

pub fn group(e: Entry) []const u8 {
    // Entries that don't contain a `.` and a type kind are globals
    const dot = std.mem.indexOfScalar(u8, e.path, '.') orelse
        return if (e.kind == .module) e.path else "globals";
    return e.path[0..dot];
}

pub fn generateReport(w: *std.Io.Writer, all: []const Entry, rows: []Row) !usize {
    var n: usize = 0;
    for (all) |e| {
        if (!needsDocs(e)) continue;
        const g = group(e);
        const row = for (rows[0..n]) |*r| {
            if (std.mem.eql(u8, r.name, g)) break r;
        } else blk: {
            rows[n] = .{ .name = g };
            n += 1;
            break :blk &rows[n - 1];
        };
        row.total += 1;
        if (e.summary.len > 0) row.documented += 1;
    }

    var total: usize = 0;
    var done: usize = 0;
    for (rows[0..n]) |r| {
        try w.print("{s: <16} {d: >4}/{d: <4} {d: >3}%\n", .{ r.name, r.documented, r.total, percent(r.documented, r.total) });
        total += r.total;
        done += r.documented;
    }

    try w.print("{s: <16} {d: >4}/{d: <4} {d: >3}%\n", .{ "Total", done, total, percent(done, total) });
    return total - done;
}

fn percent(a: usize, b: usize) usize {
    return if (b == 0) 100 else a * 100 / b;
}
