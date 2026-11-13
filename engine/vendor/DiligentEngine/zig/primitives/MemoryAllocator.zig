// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
//! Base interface for a raw memory allocator

const std = @import("std");
const c = @import("c");
const primitives = @import("primitives.zig");
const helpers = @import("../helpers.zig");

const MemoryAllocator = @This();
raw: *c.IMemoryAllocator,

/// Allocates block of memory
pub fn allocate(self: *MemoryAllocator, size: usize, debug_description: [*c]const u8, debug_file_name: [*c]const u8, debug_line_number: i32) ?*anyopaque {
    self.method("Allocate")(self.raw, size, debug_description, debug_file_name, debug_line_number);
}

/// Releases memory
pub fn free(self: *MemoryAllocator, ptr: ?*anyopaque) void {
    self.method("Free")(self.raw, ptr);
}

/// Allocates block of memory with specified alignment
pub fn allocateAligned(
    self: *MemoryAllocator,
    size: usize,
    alignment: usize,
    debug_description: [*c]const u8,
    debug_file_name: [*c]const u8,
    debug_line_number: i32,
) ?*anyopaque {
    return self.method("AllocateAligned")(self.raw, size, alignment, debug_description, debug_file_name, debug_line_number);
}

/// Releases memory allocated with allocateAligned
pub fn freeAligned(self: *MemoryAllocator, ptr: ?*anyopaque) void {
    self.method("FreeAligned")(self.raw, ptr);
}

const method = helpers.methodHelper(@This(), "MemoryAllocator");

/// Wraps a `std.mem.Allocator` into a Diligent `IMemoryAllocator`.
/// It must remain alive for the lifetime of Diligent Engine and any objects using the allocator.
pub fn fromZigAllocator(zig_allocator: std.mem.Allocator) MemoryAllocator {
    return ZigAllocator.init(zig_allocator).memoryAllocator();
}

pub const ZigAllocator = struct {
    interface: c.IMemoryAllocator = .{ .pVtbl = &vtable },
    allocator: std.mem.Allocator,

    const Header = struct {
        total_len: usize,
        alignment_log2: u8,
    };

    var vtable = c.IMemoryAllocatorVtbl{
        .MemoryAllocator = .{
            .Allocate = allocateCallback,
            .Free = freeCallback,
            .AllocateAligned = allocateAlignedCallback,
            .FreeAligned = freeAlignedCallback,
        },
    };

    pub fn init(allocator: std.mem.Allocator) ZigAllocator {
        return .{
            .allocator = allocator,
        };
    }

    pub fn memoryAllocator(self: *ZigAllocator) MemoryAllocator {
        return .{ .raw = &self.interface };
    }

    fn allocInternal(self: *ZigAllocator, size: usize, alignment: usize) ?*anyopaque {
        if (size == 0) return null;

        const effective_align = @max(alignment, @alignOf(usize));
        std.debug.assert(std.math.isPowerOfTwo(effective_align));

        const header_offset = std.mem.alignForward(usize, @sizeOf(Header), effective_align);
        const total_size = header_offset + size;
        const align_enum = std.mem.Alignment.fromByteUnits(effective_align);

        const raw_ptr = self.allocator.rawAlloc(
            total_size,
            align_enum,
            @returnAddress(),
        ) orelse return null;

        const user_ptr = raw_ptr + header_offset;
        const header_ptr: *Header = @ptrFromInt(@intFromPtr(user_ptr) - @sizeOf(Header));
        header_ptr.* = .{
            .total_len = total_size,
            .alignment_log2 = @backingInt(align_enum),
        };

        return user_ptr;
    }

    fn freeInternal(self: *ZigAllocator, ptr: ?*anyopaque) void {
        const user_ptr = ptr orelse return;

        const header_ptr: *const Header = @ptrFromInt(@intFromPtr(user_ptr) - @sizeOf(Header));
        const effective_align = @as(usize, 1) << @intCast(header_ptr.alignment_log2);
        const header_offset = std.mem.alignForward(usize, @sizeOf(Header), effective_align);

        const base_ptr: [*]u8 = @ptrFromInt(@intFromPtr(user_ptr) - header_offset);
        const slice = base_ptr[0..header_ptr.total_len];

        self.allocator.rawFree(
            slice,
            std.mem.Alignment.fromByteUnits(effective_align),
            @returnAddress(),
        );
    }

    fn allocateCallback(
        this: [*c]c.IMemoryAllocator,
        size: usize,
        dbg_description: [*c]const u8,
        dbg_file_name: [*c]const u8,
        dbg_line_number: i32,
    ) callconv(.c) ?*anyopaque {
        _ = dbg_description;
        _ = dbg_file_name;
        _ = dbg_line_number;

        const self: *ZigAllocator = @fieldParentPtr("interface", @as(*c.IMemoryAllocator, @ptrCast(this)));
        return self.allocInternal(size, @alignOf(std.c.max_align_t));
    }

    fn freeCallback(this: [*c]c.IMemoryAllocator, ptr: ?*anyopaque) callconv(.c) void {
        const self: *ZigAllocator = @fieldParentPtr("interface", @as(*c.IMemoryAllocator, @ptrCast(this)));
        self.freeInternal(ptr);
    }

    fn allocateAlignedCallback(
        this: [*c]c.IMemoryAllocator,
        size: usize,
        alignment: usize,
        dbg_description: [*c]const u8,
        dbg_file_name: [*c]const u8,
        dbg_line_number: i32,
    ) callconv(.c) ?*anyopaque {
        _ = dbg_description;
        _ = dbg_file_name;
        _ = dbg_line_number;

        const self: *ZigAllocator = @fieldParentPtr("interface", @as(*c.IMemoryAllocator, @ptrCast(this)));
        return self.allocInternal(size, alignment);
    }

    fn freeAlignedCallback(this: [*c]c.IMemoryAllocator, ptr: ?*anyopaque) callconv(.c) void {
        const self: *ZigAllocator = @fieldParentPtr("interface", @as(*c.IMemoryAllocator, @ptrCast(this)));
        self.freeInternal(ptr);
    }
};
