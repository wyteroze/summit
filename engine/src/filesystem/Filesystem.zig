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
    const parts: Uri = try .parse(uri);
    const mnt = self.acquire(parts.scheme) catch |e| {
        std.log.err("The mount associated with the '{s}://' scheme does not exist. ({t})", .{ parts.scheme, e });
        return e;
    };
    errdefer mnt.release();

    var buf: [std.Io.Dir.max_path_bytes]u8 = undefined;
    // Path
    const pth = if (mnt.scoped) blk: {
        if (parts.path.len > buf.len) return error.PathTooLong;
        break :blk try path.normalize(parts.path, &buf);
    } else parts.path;

    var file = try mnt.open(pth, mode);
    errdefer file.close();
    if (mode == .append) file.pos = try file.size();

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
    if (try file.read(buf) != size) return error.ReadFailed;

    return buf;
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
