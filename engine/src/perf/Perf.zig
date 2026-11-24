// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
// TODO: Integrate into scheduler

const std = @import("std");
const Filesystem = @import("../filesystem/Filesystem.zig");
const threading = @import("../core/threading/threading.zig");
pub const Event = @import("Event.zig");
pub const Zone = @import("Zone.zig");

pub const Frame = struct { start: i96 };
pub fn Category(comptime category: []const u8) type {
    return struct {
        pub fn beginZone(comptime src: std.lang.SourceLocation, comptime nm: ?[]const u8) Zone {
            return Perf.singleton().beginZone(src, nm, category);
        }

        pub fn endZone(zone: Zone) void {
            Perf.singleton().endZone(zone);
        }
    };
}

const ThreadBuffer = struct {
    ring: threading.RingBuffer(Event, 16_384),
    dropped: usize = 0,
};

var instantiated: *Perf = undefined;
pub fn singleton() *Perf {
    return instantiated;
}

threadlocal var cached_thread_id: u64 = 0;
fn currentThreadId() u64 {
    if (cached_thread_id == 0) cached_thread_id = std.Thread.getCurrentId();
    return cached_thread_id;
}

threadlocal var local_buffer: ?*ThreadBuffer = null;
fn getLocalBuffer(self: *Perf) *ThreadBuffer {
    if (local_buffer) |b| return b;

    const b = self.allocator.create(ThreadBuffer) catch @panic("Out of memory");
    b.ring.head = .init(0);
    b.ring.tail = .init(0);
    b.dropped = 0;

    self.buffers_lock.lockUncancelable(self.io);
    defer self.buffers_lock.unlock(self.io);
    self.buffers.append(self.allocator, b) catch @panic("Out of memory");

    local_buffer = b;
    return b;
}

const Perf = @This();
io: std.Io,
allocator: std.mem.Allocator,
filesystem: *Filesystem,
storage: std.ArrayList(Event),
buffers: std.ArrayList(*ThreadBuffer),
buffers_lock: std.Io.Mutex = .init,
recording: bool = false,
frame_number: u64 = 0,

pub fn init(self: *Perf, io: std.Io, allocator: std.mem.Allocator, filesystem: *Filesystem) void {
    instantiated = self;
    self.* = .{
        .io = io,
        .allocator = allocator,
        .filesystem = filesystem,
        .storage = .empty,
        .buffers = .empty,
    };
}

pub fn deinit(self: *Perf) void {
    self.storage.deinit(self.allocator);
    for (self.buffers.items) |b| self.allocator.destroy(b);
    self.buffers.deinit(self.allocator);
}

// TODO: See how other profilers get timestamps, this probably isn't optimal
pub fn getTime(self: *Perf) i96 {
    return std.Io.Clock.now(.awake, self.io).nanoseconds;
}

pub fn beginZone(self: *Perf, comptime src: std.lang.SourceLocation, comptime name: ?[]const u8, comptime category: ?[]const u8) Zone {
    if (!self.recording) return .{ .start = -1, .location = &.null_location };

    const location: Zone.Location = comptime .{
        .name = name orelse src.fn_name,
        .file = src.file,
        .line = src.line,
        .category = category orelse "Uncategorized",
    };

    return .{ .start = self.getTime(), .location = &location };
}

pub fn endZone(self: *Perf, zone: Zone) void {
    // start == -1 means we weren't recording when the zone started
    if (!self.recording or zone.start == -1) return;

    const b = self.getLocalBuffer();
    if (!b.ring.push(.{
        .kind = .zone,
        .start = zone.start,
        .end = self.getTime(),
        .payload = @intFromPtr(zone.location),
        .thread_id = currentThreadId(),
    })) b.dropped += 1;
}

pub fn beginFrame(self: *Perf) Frame {
    if (!self.recording) return .{ .start = -1 };
    return .{ .start = self.getTime() };
}

pub fn endFrame(self: *Perf, frame: Frame) void {
    // start == -1 means we weren't recording when the frame started
    if (!self.recording or frame.start == -1) return;

    const b = self.getLocalBuffer();
    if (!b.ring.push(.{
        .kind = .frame,
        .start = frame.start,
        .end = self.getTime(),
        .payload = self.frame_number,
        .thread_id = currentThreadId(),
    })) b.dropped += 1;
    self.frame_number += 1;

    self.moveToStorage() catch {};
}

fn moveToStorage(self: *Perf) !void {
    const io = self.io;
    self.buffers_lock.lockUncancelable(io);
    defer self.buffers_lock.unlock(io);

    var dropped: usize = 0;
    for (self.buffers.items) |b| {
        while (b.ring.pop()) |e| try self.storage.append(self.allocator, e);
        dropped += b.dropped;
        b.dropped = 0;
    }

    if (dropped > 0) std.log.warn("{d} events were dropped when profiling.", .{dropped});
}

/// Dumps the performance trace at the given URI formatted as Chrome/Perfetto trace event format
/// compressed with gzip (`.json.gz`).
pub fn dumpTrace(self: *Perf, uri: []const u8) !void {
    std.log.info("Began dumping performance trace. This'll take a good second.", .{});
    try self.moveToStorage();

    var f = try self.filesystem.open(uri, .write);
    defer f.close();

    const allocator = self.allocator;

    const window = try allocator.alloc(u8, std.compress.flate.max_window_len);
    defer allocator.free(window);
    const buf = try allocator.alloc(u8, 64 * 2048);
    defer allocator.free(buf);

    var sink: Filesystem.FileSink = .init(&f, buf);
    var compress: std.compress.flate.Compress = try .init(&sink.writer, window, .gzip, .fastest);

    // Start timestamps from the earliest one we have, awake returns really large timestamps.
    var base: i96 = std.math.maxInt(i96);
    for (self.storage.items) |e| base = @min(base, e.start);
    for (self.storage.items) |*e| {
        e.start -= base;
        e.end -= base;
    }

    var s: std.json.Stringify = .{ .writer = &compress.writer, .options = .{} };
    try s.beginObject();
    try s.objectField("traceEvents");
    try s.beginArray();
    for (self.storage.items) |e| try s.write(e);
    try s.endArray();
    try s.endObject();

    try compress.finish();
    try sink.writer.flush();

    self.storage.clearRetainingCapacity();
    std.log.info("Dumped performance trace to {s}", .{uri});
}
