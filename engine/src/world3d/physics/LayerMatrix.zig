// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const zphysics = @import("zphysics");
pub const max_layers = 32;

const LayerMatrix = @This();
rows: [max_layers]u32 = @splat(0xFFFFFFFF),

pub fn collides(self: *const LayerMatrix, a: u32, b: u32) bool {
    return (self.rows[a] >> @intCast(b)) & 1 != 0;
}

pub fn set(self: *LayerMatrix, a: u32, b: u32, val: bool) void {
    const ba = @as(u32, 1) << @intCast(a);
    const bb = @as(u32, 1) << @intCast(a);

    if (val) {
        self.rows[a] |= bb;
        self.rows[b] |= ba;
    } else {
        self.rows[a] &= ~bb;
        self.rows[b] &= ~ba;
    }
}

pub fn objectLayer(index: u32, moving: bool) zphysics.ObjectLayer {
    return @intCast((index << 1) | @intFromBool(moving));
}
