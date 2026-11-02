// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");

pub const ComponentId = packed struct {
    value: u24,
    world_id: u8,

    comptime {
        std.debug.assert(@sizeOf(ComponentId) == 4);
    }

    pub const invalid: ComponentId = .{ .value = std.math.maxInt(u24), .world_id = std.math.maxInt(u8) };

    pub fn toU32(self: ComponentId) u32 {
        return @bitCast(self);
    }

    pub fn eql(a: ComponentId, b: ComponentId) bool {
        return a.toU32() == b.toU32();
    }
};
