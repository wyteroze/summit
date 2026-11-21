// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const File = @import("File.zig");

const Mount = @This();
/// The scheme that represents the mount. This is used for resolving URIs and owned by the `Filesystem`.
scheme: []const u8,
/// Implementation of the mount
backend: Backend,
/// When resolving, determines if escaping from the root is allowed.
scoped: bool = true,
reserved: bool = false,
refs: std.atomic.Value(u32) = .init(0),

pub const Backend = struct {
    ptr: *anyopaque,
    vtable: *const VTable,

    pub const VTable = struct {
        open: *const fn (*anyopaque, path: []const u8, mode: File.OpenMode) anyerror!File.Backend,
        stat: *const fn (*anyopaque, path: []const u8) anyerror!?File.Stat,
        list: *const fn (*anyopaque, path: []const u8, a: std.mem.Allocator) anyerror![][]const u8,
        remove: ?*const fn (*anyopaque, path: []const u8) anyerror!void = null,
        createDir: ?*const fn (*anyopaque, path: []const u8) anyerror!void = null,
        deinit: *const fn (*anyopaque) void,
    };
};

/// Opens a file at the given path.
pub fn open(self: *Mount, path: []const u8, mode: File.OpenMode) !File {
    const b = self.backend;
    const fb = try b.vtable.open(b.ptr, path, mode);

    return .{ .mount = self, .backend = fb };
}

/// Returns basic information about a file at the given path.
/// Returns null if the backend doesn't provide information.
pub fn stat(self: Mount, path: []const u8) !?File.Stat {
    const b = self.backend;
    return b.vtable.stat(b.ptr, path);
}

/// Returns a list of files at the given path.
pub fn list(self: Mount, path: []const u8, allocator: std.mem.Allocator) ![][]const u8 {
    const b = self.backend;
    return b.vtable.list(b.ptr, path, allocator);
}

/// Removes a file or path at the given path.
pub fn remove(self: Mount, path: []const u8) !void {
    const b = self.backend;
    return b.vtable.remove(b.ptr, path);
}

/// Creates a directory at the given path.
pub fn createDir(self: Mount, path: []const u8) !void {
    const b = self.backend;
    return b.vtable.createDir(b.ptr, path);
}

/// Adds a reference to this Mount.
pub fn acquire(self: *Mount) void {
    _ = self.refs.fetchAdd(1, .monotonic);
}

/// Releases a reference to this Mount.
pub fn release(self: *Mount) void {
    var current = self.refs.load(.monotonic);
    while (true) {
        if (current == 0) return;

        if (self.refs.cmpxchgWeak(current, current - 1, .acq_rel, .monotonic)) |a| {
            current = a;
        } else break;
    }
}
