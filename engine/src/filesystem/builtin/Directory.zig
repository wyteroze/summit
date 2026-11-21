// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const File = @import("../File.zig");
const Mount = @import("../Mount.zig");
const FileBackend = File.Backend;
const MountBackend = Mount.Backend;

const Directory = @This();
io: std.Io,
allocator: std.mem.Allocator,
dir: std.Io.Dir,
writable: bool,
/// Writes create missing parent directories
create_parents: bool,

pub const Options = struct {
    writable: bool = false,
    /// Creates root directory if it doesn't exist
    create: bool = false,
    /// Writes create missing parent directories
    create_parents: bool = false,
};

pub fn open(io: std.Io, allocator: std.mem.Allocator, parent: std.Io.Dir, sub_path: []const u8, opts: Options) !*Directory {
    if (opts.create) try parent.createDirPath(io, sub_path);
    var dir = try parent.openDir(io, sub_path, .{ .iterate = true });
    errdefer dir.close(io);

    const self = try allocator.create(Directory);
    self.* = .{
        .io = io,
        .allocator = allocator,
        .dir = dir,
        .writable = opts.writable,
        .create_parents = opts.create_parents,
    };

    return self;
}

pub fn backend(self: *Directory) MountBackend {
    return .{ .ptr = self, .vtable = if (self.writable) &rw_vtable else &readonly_vtable };
}

const rw_vtable: MountBackend.VTable = .{
    .open = openFile,
    .stat = stat,
    .list = list,
    .remove = remove,
    .createDir = createDir,
    .deinit = destroy,
};

const readonly_vtable: MountBackend.VTable = .{
    .open = openFile,
    .stat = stat,
    .list = list,
    .remove = null,
    .createDir = null,
    .deinit = destroy,
};

fn cast(ptr: *anyopaque, comptime T: type) *T {
    return @ptrCast(@alignCast(ptr));
}

fn destroy(ptr: *anyopaque) void {
    const self = cast(ptr, Directory);
    self.dir.close(self.io);
    self.allocator.destroy(self);
}

fn openFile(ptr: *anyopaque, path: []const u8, mode: File.OpenMode) anyerror!FileBackend {
    const self = cast(ptr, Directory);
    const io = self.io;
    if (path.len == 0) return error.IsDir;
    if (mode != .read and !self.writable) return error.ReadOnly;

    const file = switch (mode) {
        .read => try self.dir.openFile(io, path, .{}),
        .write, .append => blk: {
            if (self.create_parents) {
                if (std.Io.Dir.path.dirname(path)) |parent| try self.dir.createDirPath(io, parent);
            }

            break :blk try self.dir.createFile(io, path, .{ .read = true, .truncate = mode == .write });
        },
    };
    errdefer file.close(io);

    if (mode == .read) {
        if ((try file.stat(io)).kind == .directory) return error.IsDir;
    }

    const dir_file = try self.allocator.create(DirFile);
    dir_file.* = .{ .io = io, .allocator = self.allocator, .file = file };
    return .{ .ptr = dir_file, .vtable = if (mode == .read) &DirFile.readonly_vtable else &DirFile.rw_vtable };
}

fn stat(ptr: *anyopaque, path: []const u8) anyerror!?File.Stat {
    const self = cast(ptr, Directory);
    const io = self.io;
    const p = if (path.len == 0) "." else path;

    const s = self.dir.statFile(io, p, .{}) catch |e| switch (e) {
        error.FileNotFound => return null,
        error.IsDir => blk: {
            var dir = try self.dir.openDir(io, p, .{});
            defer dir.close(io);

            break :blk try dir.stat(io);
        },
        else => return e,
    };

    return .{
        .kind = if (s.kind == .directory) .directory else .file,
        .size_bytes = s.size,
        .modified_ms = s.mtime.toMilliseconds(),
    };
}

fn list(ptr: *anyopaque, path: []const u8, allocator: std.mem.Allocator) anyerror![][]const u8 {
    const self = cast(ptr, Directory);
    const io = self.io;

    const p = if (path.len == 0) "." else path;
    var d = try self.dir.openDir(io, p, .{ .iterate = true });
    defer d.close(io);

    var names: std.ArrayList([]const u8) = .empty;
    errdefer {
        for (names.items) |nm| allocator.free(nm);
        names.deinit(allocator);
    }

    var iter = d.iterate();
    while (try iter.next(io)) |e| {
        const nm = try allocator.dupe(u8, e.name);
        errdefer allocator.free(nm);
        try names.append(allocator, nm);
    }

    std.mem.sort([]const u8, names.items, {}, struct {
        fn lt(_: void, x: []const u8, y: []const u8) bool {
            return std.mem.lessThan(u8, x, y);
        }
    }.lt);

    return names.toOwnedSlice(allocator);
}

fn remove(ptr: *anyopaque, path: []const u8) anyerror!void {
    const self = cast(ptr, Directory);
    const io = self.io;
    // Disallow deleting the mount root
    if (path.len == 0) return error.AccessDenied;

    const s = (try stat(ptr, path)) orelse return error.FileNotFound;
    switch (s.kind) {
        .file => try self.dir.deleteFile(io, path),
        .directory => try self.dir.deleteDir(io, path),
    }
}

fn createDir(ptr: *anyopaque, path: []const u8) anyerror!void {
    if (path.len == 0) return;
    const self = cast(ptr, Directory);
    const io = self.io;

    try self.dir.createDirPath(io, path);
}

pub const DirFile = struct {
    io: std.Io,
    allocator: std.mem.Allocator,
    file: std.Io.File,

    fn pread(ptr: *anyopaque, buf: []u8, offset: u64) anyerror!usize {
        const self = cast(ptr, DirFile);
        return self.file.readPositionalAll(self.io, buf, offset);
    }

    fn pwrite(ptr: *anyopaque, data: []const u8, offset: u64) anyerror!usize {
        const self = cast(ptr, DirFile);
        return self.file.writePositional(self.io, &.{data}, offset);
    }

    fn size(ptr: *anyopaque) anyerror!u64 {
        const self = cast(ptr, DirFile);
        return (try self.file.stat(self.io)).size;
    }

    fn close(ptr: *anyopaque) void {
        const self = cast(ptr, DirFile);
        self.file.close(self.io);
        self.allocator.destroy(self);
    }

    const readonly_vtable: FileBackend.VTable = .{ .pread = pread, .size = size, .close = close };
    const rw_vtable: FileBackend.VTable = .{ .pread = pread, .pwrite = pwrite, .size = size, .close = close };
};
