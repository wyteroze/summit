// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Mount = @import("Mount.zig");

pub const OpenMode = enum { read, write, append };
pub const FileError = error{ ReadOnly, FileTooLarge, UnexpectedEof, IsDir, NotFound, AccessDenied };
pub const Stat = struct { kind: enum { file, directory }, size_bytes: u64, modified_ms: i64 };

const File = @This();
mount: *Mount,
backend: Backend,
position: u64 = 0,
closed: bool = false,

pub const Backend = struct {
    ptr: *anyopaque,
    vtable: *const VTable,

    // The implementation of this vtable must be thread-safe.
    pub const VTable = struct {
        pread: *const fn (*anyopaque, buf: []u8, offset: u64) anyerror!usize,
        pwrite: ?*const fn (*anyopaque, data: []const u8, offset: u64) anyerror!usize = null,
        size: *const fn (*anyopaque) anyerror!u64,
        close: *const fn (*anyopaque) void,
    };
};

pub fn size(self: *File) !u64 {
    const b = self.backend;
    return b.vtable.size(b.ptr);
}

pub fn seek(self: *File, offset: u64) void {
    self.position = offset;
}

/// Returns the number of bytes read, which is zero at the end of the file.
/// May return fewer bytes than requested.
pub fn read(self: *File, buf: []u8) !usize {
    const b = self.backend;
    const n = try b.vtable.pread(b.ptr, buf, self.position);
    self.position += n;

    return n;
}

pub fn readExact(self: *File, buf: []u8) !void {
    var done: usize = 0;
    while (done < buf.len) {
        const n = try self.read(buf[done..]);
        if (n == 0) return FileError.UnexpectedEof;
        done += n;
    }
}

pub fn write(self: *File, data: []const u8) !void {
    const b = self.backend;
    if (b.vtable.pwrite) |pwrite| {
        var done: usize = 0;
        while (done < data.len) {
            const n = try pwrite(b.ptr, data[done..], self.position);
            self.position += n;
            done += n;
        }
    } else return FileError.ReadOnly;
}

pub fn readAlloc(self: *File, a: std.mem.Allocator, max: usize) ![]u8 {
    const len = try self.size();
    if (len > max) return error.FileTooLarge;

    const buf = try a.alloc(u8, @intCast(len));
    errdefer a.free(buf);

    self.seek(0);
    try self.readExact(buf);
    return buf;
}

/// Does nothing and doesn't call the implementation's
/// close function if the file is already closed.
pub fn close(self: *File) void {
    if (self.closed) return;
    self.closed = true;

    const b = self.backend;
    b.vtable.close(b.ptr);
    self.mount.release();
}
