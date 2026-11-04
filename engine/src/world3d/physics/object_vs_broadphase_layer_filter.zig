// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const zphysics = @import("zphysics");

pub const ObjectVsBroadPhaseLayerFilter = extern struct {
    filter: zphysics.ObjectVsBroadPhaseLayerFilter = .init(@This()),

    pub fn shouldCollide(
        _: *const zphysics.ObjectVsBroadPhaseLayerFilter,
        object: zphysics.ObjectLayer,
        broad_phase: zphysics.BroadPhaseLayer,
    ) callconv(.c) bool {
        const object_is_moving = (object & 1) != 0;
        const tree_is_moving = broad_phase == 1;
        return object_is_moving or tree_is_moving;
    }
};
