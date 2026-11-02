// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");

pub const Entity = packed struct {
    index: u32,
    generation: u24,
    world_id: u8,

    comptime {
        std.debug.assert(@sizeOf(Entity) == 8);
    }

    pub const invalid: Entity = .{ .index = std.math.maxInt(u32), .generation = std.math.maxInt(u24), .world_id = std.math.maxInt(u8) };

    pub fn eql(a: Entity, b: Entity) bool {
        return a.toU64() == b.toU64();
    }

    pub fn toU64(self: Entity) u64 {
        return @bitCast(self);
    }

    pub fn fromU64(int: u64) Entity {
        return @bitCast(int);
    }

    pub fn format(
        self: @This(),
        writer: *std.Io.Writer,
    ) std.Io.Writer.Error!void {
        try writer.print("Entity {d}", .{self.toU64()});
    }
};
