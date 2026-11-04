// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const builtin = @import("builtin");
const zphysics = @import("zphysics");

pub const broadphase_static: zphysics.BroadPhaseLayer = 0;
pub const broadphase_moving: zphysics.BroadphaseLayer = 1;

pub const BroadphaseLayerInterface = extern struct {
    interface: zphysics.BroadPhaseLayerInterface = .init(@This()),

    pub fn init() BroadphaseLayerInterface {
        return .{};
    }

    pub fn getNumBroadPhaseLayers(_: *const zphysics.BroadPhaseLayerInterface) callconv(.c) u32 {
        return 2;
    }

    pub const getBroadPhaseLayer = if (builtin.abi == .msvc) _getMsvc else _get;

    fn _get(_: *const zphysics.BroadPhaseLayerInterface, layer: zphysics.ObjectLayer) callconv(.c) zphysics.BroadPhaseLayer {
        return @intCast(layer & 1);
    }

    fn _getMsvc(
        _: *const zphysics.BroadPhaseLayerInterface,
        out: *zphysics.BroadPhaseLayer,
        layer: zphysics.ObjectLayer,
    ) callconv(.c) *const zphysics.BroadPhaseLayer {
        out.* = @intCast(layer & 1);
        return out;
    }
};
