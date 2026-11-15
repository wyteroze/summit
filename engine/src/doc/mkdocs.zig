// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Entry = @import("Entry.zig");
const md = @import("markdown.zig");
const Writer = std.Io.Writer;

fn pageKindIs(e: Entry, modules: bool) bool {
    return md.isPage(e.kind) and !e.hidden and (e.kind == .module) == modules;
}

fn navSection(w: *Writer, all: []const Entry, title: []const u8, modules: bool) !void {
    try w.print("  - {s}:\n", .{title});
    for (all) |e| if (pageKindIs(e, modules)) {
        try w.print("    - \"{s}\": ", .{e.path});
        try md.writeFilePath(w, e);
        try w.writeByte('\n');
    };
}

pub fn writeMkdocs(w: *Writer, all: []const Entry, site_name: []const u8) !void {
    try w.print("site_name: {s}\ndocs_dir: docs\ntheme:\n  name: readthedocs\nnav:\n", .{site_name});
    try w.writeAll("  - Home: index.md\n");
    try navSection(w, all, "Modules", true);
    try navSection(w, all, "Types", false);
}
