// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Entry = @import("Entry.zig");
const Writer = std.Io.Writer;

pub fn isPage(k: Entry.Kind) bool {
    return switch (k) {
        .module, .handle, .value, .record, .variant => true,
        else => false,
    };
}

pub fn writeFilePath(w: *Writer, e: Entry) !void {
    try w.writeAll(if (e.kind == .module) "modules/" else "types/");
    for (e.path) |c| try w.writeByte(if (c == '/') '.' else c);
    try w.writeAll(".md");
}

fn isDirectChild(parent: Entry, e: Entry) bool {
    if (e.path.len <= parent.path.len + 1) return false;
    if (!std.mem.startsWith(u8, e.path, parent.path)) return false;
    if (e.path[parent.path.len] != '.') return false;

    return std.mem.findScalar(u8, e.path[parent.path.len + 1 ..], '.') == null;
}

fn cell(w: *Writer, s: []const u8) !void {
    for (s) |c| switch (c) {
        '|' => try w.writeAll("\\|"),
        '\n' => try w.writeByte(' '),
        else => try w.writeByte(c),
    };
}

fn signature(w: *Writer, parent: Entry, e: Entry) !void {
    const sep: u8 = if (e.is_method) ':' else '.';
    try w.print("{s}{c}{s}(", .{ parent.name, sep, e.name });
    for (e.params, 0..) |p, i| {
        if (i != 0) try w.writeAll(", ");
        try w.print("{s}: {s}", .{ p.name, p.luau });
    }

    try w.print(") -> {s}", .{e.returns});
}

pub fn renderPage(w: *Writer, all: []const Entry, page: Entry) !void {
    try frontmatter(w, page);

    try w.print("# {s}\n\n", .{page.name});
    if (page.deprecated) |d| try w.print("**Deprecated:** {s}\n\n", .{d});
    if (page.since) |s| try w.print("*Since {s}*\n\n", .{s});
    if (page.summary.len > 0) try w.print("{s}\n\n", .{page.summary});
    if (page.body.len > 0) try w.print("{s}\n\n", .{page.body});

    if (page.kind == .module) try typeIndex(w, all, page);
    try memberTable(w, all, page, "Constants", .constant);
    try memberTable(w, all, page, "Properties", .prop);
    try memberTable(w, all, page, "Fields", .field);
    try functions(w, all, page, "Functions", false);
    try functions(w, all, page, "Methods", true);
    try inherited(w, all, page);
}

fn typeIndex(w: *Writer, all: []const Entry, page: Entry) !void {
    var first = true;
    for (all) |e| if (isDirectChild(page, e) and isPage(e.kind) and !e.hidden) {
        if (first) try w.writeAll("## Types\n\n");
        first = false;
        try w.print("- [{s}](../", .{e.name});
        try writeFilePath(w, e);
        try w.print(")  {s}\n", .{e.summary});
    };
    if (!first) try w.writeAll("\n");
}

fn memberTable(w: *Writer, all: []const Entry, page: Entry, title: []const u8, kind: Entry.Kind) !void {
    var first = true;
    for (all) |e| {
        if (!isDirectChild(page, e) or e.kind != kind or e.hidden or e.inherited_from != null) continue;
        if (first) {
            try w.print("## {s}\n\n| Name | Type | Access | Description |\n|---|---|---|---|\n", .{title});
            first = false;
        }
        try w.writeAll("| `");
        try cell(w, e.name);
        try w.writeAll("` | `");
        try cell(w, e.luau);
        try w.print("` | {s} | ", .{if (e.writable) "Access + modify" else "Access-only"});
        try cell(w, e.summary);
        try w.writeAll(" |\n");
    }
    if (!first) try w.writeAll("\n");
}

fn functions(w: *Writer, all: []const Entry, page: Entry, title: []const u8, methods: bool) !void {
    var first = true;
    for (all) |e| {
        if (!isDirectChild(page, e) or e.kind != .func or e.hidden) continue;
        if (e.is_method != methods or e.inherited_from != null) continue;
        if (first) try w.print("## {s}\n\n", .{title});
        first = false;

        try w.print("### {s}\n\n```luau\n", .{e.name});
        try signature(w, page, e);
        try w.writeAll("\n```\n\n");
        if (e.deprecated) |d| try w.print("**Deprecated:** {s}\n\n", .{d});
        if (e.since) |s| try w.print("*Since {s}*\n\n", .{s});
        if (e.summary.len > 0) try w.print("{s}\n\n", .{e.summary});
        if (e.body.len > 0) try w.print("{s}\n\n", .{e.body});
        if (e.params.len > 0) {
            try w.writeAll("| Parameter | Type | Description |\n|---|---|---|\n");
            for (e.params) |p| {
                try w.print("| `{s}` | `", .{p.name});
                try cell(w, p.luau);
                try w.writeAll("` | ");
                try cell(w, p.doc);
                try w.writeAll(" |\n");
            }
            try w.writeAll("\n");
        }
        if (e.returns_doc.len > 0) try w.print("**Returns:** {s}\n\n", .{e.returns_doc});
        if (e.can_throw) try w.writeAll("Can raise an error.\n\n");
    }
}

fn inherited(w: *Writer, all: []const Entry, page: Entry) !void {
    var first = true;
    for (all) |e| {
        if (!isDirectChild(page, e) or e.hidden) continue;
        const from = e.inherited_from orelse continue;
        if (first) try w.writeAll("## Inherits\n\n");
        first = false;

        try w.print("- `{s}` (from {s})\n", .{ e.name, from });
    }
}

fn yaml(w: *Writer, s: []const u8) !void {
    try w.writeByte('"');
    for (s) |c| switch (c) {
        '"' => try w.writeAll("\\\""),
        '\\' => try w.writeAll("\\\\"),
        '\n' => try w.writeAll("\\n"),
        else => try w.writeByte(c),
    };
    try w.writeByte('"');
}

fn frontmatter(w: *Writer, page: Entry) !void {
    try w.writeAll("---\ntitle: ");
    try yaml(w, page.name);
    try w.print("\nkind: {t}\npath: ", .{page.kind});
    try yaml(w, page.path);
    if (page.summary.len > 0) {
        try w.writeAll("\ndescription: ");
        try yaml(w, page.summary);
    }
    if (page.icon) |i| try w.print("\nicon: {s}", .{i});
    if (page.since) |s| try w.print("\nsince: {s}", .{s});
    if (page.deprecated != null) try w.writeAll("\ndeprecated: true");
    try w.print("\nlang: luau", .{});
    try w.writeAll("\n---\n\n");
}
