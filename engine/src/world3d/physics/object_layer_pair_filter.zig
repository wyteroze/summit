// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const zphysics = @import("zphysics");
const LayerMatrix = @import("LayerMatrix.zig");

pub const ObjectLayerPairFilter = extern struct {
    interface: zphysics.ObjectLayerPairFilter = .init(@This()),
    matrix: *const LayerMatrix,

    pub fn shouldCollide(
        interface: *const zphysics.ObjectLayerPairFilter,
        a: zphysics.ObjectLayer,
        b: zphysics.ObjectLayer,
    ) callconv(.c) bool {
        const self: *const ObjectLayerPairFilter = @alignCast(@fieldParentPtr("interface", interface));
        if ((a & 1) == 0 and (b & 1) == 0) return false;
        return self.matrix.collides(a >> 1, b >> 1);
    }
};
