// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
// This file is used for the `zig build docs` step.

const std = @import("std");
const engine = @import("engine");
const bind = engine.scripting.bind;
const collect = engine.doc.collect;
const md = engine.doc.markdown;
const coverage = engine.doc.coverage;
const mkdocs = engine.doc.mkdocs;

const Registry = bind.registry.Registry;
const entries = collect(bind.api, Registry(bind.api));

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const allocator = init.gpa;
    const cwd = std.Io.Dir.cwd();

    var strict: bool = false;
    var path: ?[:0]const u8 = null;

    var iter = try init.minimal.args.iterateAllocator(init.arena.allocator());
    while (iter.next()) |arg| {
        if (std.mem.eql(u8, arg, "--path")) {
            path = iter.next() orelse {
                std.log.err("Invalid path argument. You should pass `--path <path>`", .{});
                std.process.exit(1);
            };
        } else if (std.mem.eql(u8, arg, "--strict")) {
            strict = true;
        }
    }

    if (path == null) {
        std.log.err("No path argument provided. You should pass `--path <path>`", .{});
        std.process.exit(1);
    }

    for (entries) |e| if (md.isPage(e.kind) and !e.hidden) {
        var name_buf: [std.Io.Dir.max_path_bytes]u8 = undefined;
        var nw: std.Io.Writer = .fixed(&name_buf);
        try md.writeFilePath(&nw, e);

        var buf: [1 << 16]u8 = undefined;
        const file_path = try std.Io.Dir.path.join(allocator, &.{ path.?, nw.buffered() });
        defer allocator.free(file_path);

        std.log.debug("Writing file at {s}", .{file_path});
        try cwd.createDirPath(io, std.Io.Dir.path.dirname(file_path).?);
        var file = try cwd.createFile(io, file_path, .{});
        defer file.close(io);

        var writer = file.writer(io, &buf);
        const interface = &writer.interface;

        try md.renderPage(interface, entries, e);
        try interface.flush();
    };

    const mkdocs_path = try std.Io.Dir.path.join(allocator, &.{ path.?, "../", "mkdocs.yml" });
    defer allocator.free(mkdocs_path);

    var mk_buf: [1 << 14]u8 = undefined;
    var mk_file = try cwd.createFile(io, mkdocs_path, .{});
    defer mk_file.close(io);
    var mk_writer = mk_file.writer(io, &mk_buf);
    try mkdocs.writeMkdocs(&mk_writer.interface, entries, "Summit");
    try mk_writer.interface.flush();

    var rows: [64]coverage.Row = undefined;
    var out_buf: [4096]u8 = undefined;
    var stderr = std.Io.File.stderr().writer(io, &out_buf);
    const interface = &stderr.interface;
    try interface.print("Coverage report: \n", .{});

    const missing = try coverage.generateReport(interface, entries, &rows);
    try stderr.interface.flush();

    if (strict and missing > 0) std.process.exit(1);
}
