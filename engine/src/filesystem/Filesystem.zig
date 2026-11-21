// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
//! Virtual filesystem. This doesn't do anything OS specific on its own,
//! rather it uses `Mount`s that define their own implementation
//! For example, a URI like `foo://bar.zip` would be handled
//! by a mount with the `foo` scheme. Mounts can also be read-only.

const std = @import("std");
const Uri = @import("../core/Uri.zig");
pub const File = @import("File.zig");
pub const Mount = @import("Mount.zig");
pub const Directory = @import("builtin/Directory.zig");

const Filesystem = @This();
allocator: std.mem.Allocator,
mounts: std.StringHashMap(*Mount),

pub fn init(allocator: std.mem.Allocator) Filesystem {
    return .{ .allocator = allocator, .mounts = .init(allocator) };
}

pub fn deinit(self: *Filesystem) void {
    var iter = self.mounts.valueIterator();
    while (iter.next()) |mnt| self.destroyMount(mnt.*);
    self.mounts.deinit();
}

pub fn open(self: *Filesystem, uri: []const u8, mode: File.OpenMode) !File {
    const mnt, const pth = try self.getMountAndPath(self.allocator, uri);
    defer self.allocator.free(pth);

    var file = try mnt.open(pth, mode);
    errdefer file.close();
    if (mode == .append) file.position = try file.size();

    return file;
}

pub fn mount(
    self: *Filesystem,
    scheme: []const u8,
    backend: Mount.Backend,
    options: struct { scoped: bool = true, reserved: bool = false },
) !void {
    if (self.mounts.contains(scheme)) return error.SchemeAlreadyRegistered;
    const mnt = try self.allocator.create(Mount);
    const s = try self.allocator.dupe(u8, scheme);
    mnt.* = .{
        .scheme = s,
        .backend = backend,
        .scoped = options.scoped,
        .reserved = options.reserved,
    };

    try self.mounts.put(scheme, mnt);
}

/// Returns the entire file's contents.
/// You must provide an allocator and free the returned data.
pub fn read(self: *Filesystem, allocator: std.mem.Allocator, uri: []const u8) ![]const u8 {
    var file = try self.open(uri, .read);
    defer file.close();

    const size = try file.size();
    const buf = try allocator.alloc(u8, size);
    try file.readExact(buf);

    return buf;
}

pub fn write(self: *Filesystem, uri: []const u8, data: []const u8) !void {
    var file = try self.open(uri, .write);
    defer file.close();

    try file.write(data);
    return;
}

pub fn stat(self: *Filesystem, uri: []const u8) !File.Stat {
    const mnt, const pth = try self.getMountAndPath(self.allocator, uri);
    defer self.allocator.free(pth);

    return (try mnt.stat(pth)) orelse return error.NotFound;
}

pub fn exists(self: *Filesystem, uri: []const u8) !bool {
    return if (self.stat(uri)) |_| // File exists
        true
    else |err| if (err == error.NotFound) // File doesn't exist
        false
    else // Some unhandled error
        err;
}

pub fn list(self: *Filesystem, allocator: std.mem.Allocator, uri: []const u8) ![][]const u8 {
    const mnt, const pth = try self.getMountAndPath(self.allocator, uri);
    defer self.allocator.free(pth);

    return mnt.list(pth, allocator);
}

pub fn createDirectory(self: *Filesystem, uri: []const u8) !void {
    const mnt, const pth = try self.getMountAndPath(self.allocator, uri);
    defer self.allocator.free(pth);

    try mnt.createDir(pth);
}

pub fn remove(self: *Filesystem, uri: []const u8) !void {
    const mnt, const pth = try self.getMountAndPath(self.allocator, uri);
    defer self.allocator.free(pth);

    try mnt.remove(pth);
}

fn acquire(self: *Filesystem, scheme: []const u8) !*Mount {
    const m = self.mounts.get(scheme) orelse return error.MountDoesntExist;
    m.acquire();

    return m;
}

fn destroyMount(self: *Filesystem, mnt: *Mount) void {
    mnt.backend.vtable.deinit(mnt.backend.ptr);
    self.allocator.free(mnt.scheme);
    self.allocator.destroy(mnt);
}

/// From a URI, returns its corresponding mount and the URI's resolved path for the mount.
/// The returned path belongs to the caller
fn getMountAndPath(self: *Filesystem, allocator: std.mem.Allocator, uri: []const u8) !struct { *Mount, []const u8 } {
    const parts: Uri = try .parse(uri);
    const mnt = self.acquire(parts.scheme) catch |e| {
        std.log.err("The mount associated with the '{s}://' scheme does not exist. ({t})", .{ parts.scheme, e });
        return e;
    };
    errdefer mnt.release();

    var buf: [std.Io.Dir.max_path_bytes]u8 = undefined;
    const pth = if (mnt.scoped) blk: {
        if (parts.path.len > buf.len) return error.PathTooLong;
        break :blk try path.normalize(parts.path, &buf);
    } else parts.path;

    return .{ mnt, try allocator.dupe(u8, pth) };
}

/// Path utilities.
pub const path = struct {
    /// The result is separated by `/` and doesn't have any leading/trailing slashes or `.`/`..` components.
    /// The length of out should be bigger or the same as `raw`.
    pub fn normalize(raw: []const u8, out: []u8) ![]u8 {
        if (std.mem.findAny(u8, raw, "\\:\x00") != null) return error.InvalidCharacter;

        var len: usize = 0;
        var it = std.mem.splitScalar(u8, raw, '/');
        while (it.next()) |part| {
            if (part.len == 0 or std.mem.eql(u8, part, ".")) continue;
            if (std.mem.eql(u8, part, "..")) {
                if (len == 0) return error.EscapesRoot;
                len = std.mem.findScalarLast(u8, out[0..len], '/') orelse 0;
                continue;
            }

            if (len != 0) {
                out[len] = '/';
                len += 1;
            }

            @memcpy(out[len..][0..part.len], part);
            len += part.len;
        }

        return out[0..len];
    }
};

const bind = @import("../scripting/bind/bind.zig");
const zlua = @import("zlua");
// TODO: Expose mounts API to Lua
pub const api = bind.module("fs", .{
    .kind = .{ .singleton = Filesystem },
    .members = &.{
        bind.func("read", luaRead).doc(.{
            .since = "0.0.2",
            .returns_luau = "buffer",
            .summary = "Reads a file at the given path and returns a buffer of the result.",
            .body =
            \\Reads a file at the given path and returns a buffer of the result.
            \\Note that due to [Luau restrictions](https://luau.org/library/#buffer-library),
            \\attempting to read a file larger than 1GiB will result in an error.
            ,
        }),
        bind.func("readText", luaReadText).doc(.{
            .since = "0.0.2",
            .returns_luau = "string",
            .summary = "Reads a file at the given path and returns a string of the result.",
        }),
        bind.func("write", luaWrite).doc(.{
            .since = "0.0.2",
            .summary = "Writes a string or buffer to a file at the given path. Can't be called on read-only mounts.",
            .params = &.{
                .{ .name = "data", .doc = "Data to write to the file", .luau = "string | buffer" },
            },
            .body =
            \\Writes a string or buffer to a file at the given path.
            \\If the file doesn't exist yet, it creates it. If the file exists, it overwrites its contents.
            ,
        }),
        bind.func("exists", exists).doc(.{
            .since = "0.0.2",
            .summary = "Returns if a file or directory exists at the given path.",
        }),
        bind.func("stat", stat).doc(.{
            .since = "0.0.2",
            .summary = "Returns basic information about the file or directory at the given path.",
        }),
        bind.func("list", luaList).doc(.{
            .since = "0.0.2",
            .summary = "Returns a list of files/directories in the given path.",
        }),
        bind.func("createDirectory", createDirectory).doc(.{
            .since = "0.0.2",
            .summary = "Creates a directory at the given path, doing nothing if the directory already exists. Can't be called on read-only mounts.",
        }),
        bind.func("remove", remove).doc(.{
            .since = "0.0.2",
            .summary = "Removes a file or directory at the given path. Can't be called on read-only mounts.",
        }),
        // TODO: implement `fs.open()`. File lifetimes need to be sorted out before that's possible.
    },
}).doc(.{
    .since = "0.0.2",
    .summary = "Module for filesystem related utilities.",
    .body =
    \\Module for filesystem related utilities.
    \\Filesystem operations throwing errors are an expected part of how they work. Make sure to wrap your filesystem calls in `pcall`.
    ,
});

fn luaRead(self: *Filesystem, uri: []const u8, l: *zlua.Lua) !bind.Pushed {
    const s = try self.stat(uri);
    var file = try self.open(uri, .read);
    defer file.close();

    const buf = l.newBuffer(s.size_bytes);
    try file.readExact(buf);

    return .{ .n = 1 };
}

fn luaReadText(self: *Filesystem, uri: []const u8, l: *zlua.Lua) !bind.Pushed {
    const s = try self.stat(uri);
    const size = s.size_bytes;

    var file = try self.open(uri, .read);
    defer file.close();

    var buf: zlua.Buffer = undefined;
    const b = buf.initSize(l, size);
    try file.readExact(b[0..size]);
    buf.pushResultSize(size);

    return .{ .n = 1 };
}

fn luaWrite(self: *Filesystem, uri: []const u8, l: *zlua.Lua) !void {
    const data: []const u8 = switch (l.typeOf(2)) {
        .string => l.checkString(2),
        .buffer => l.checkBuffer(2),
        else => l.typeError(2, "string or buffer"),
    };

    try self.write(uri, data);
}

fn luaList(self: *Filesystem, uri: []const u8, l: *zlua.Lua) !bind.Pushed {
    const allocator = l.allocator();
    const lst = try self.list(allocator, uri);
    defer {
        for (lst) |str| allocator.free(str);
        allocator.free(lst);
    }

    l.createTable(@intCast(lst.len), 0);
    for (lst, 1..) |str, i| {
        _ = l.pushString(str);
        l.setIndexRaw(-2, @intCast(i));
    }

    return .{ .n = 1 };
}
