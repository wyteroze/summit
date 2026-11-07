// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const zphysics = @import("zphysics");
const ContactQueue = @import("Physics.zig").ContactQueue;

pub const ContactListener = extern struct {
    interface: zphysics.ContactListener = .init(@This()),
    queue: *ContactQueue,

    pub fn onContactValidate(
        _: *zphysics.ContactListener,
        _: *const zphysics.Body,
        _: *const zphysics.Body,
        _: *const [3]zphysics.Real,
        _: *const zphysics.CollideShapeResult,
    ) callconv(.c) zphysics.ValidateResult {
        return .accept_all_contacts;
    }

    pub fn onContactAdded(
        iface: *zphysics.ContactListener,
        b1: *const zphysics.Body,
        b2: *const zphysics.Body,
        manifold: *const zphysics.ContactManifold,
        _: *zphysics.ContactSettings,
    ) callconv(.c) void {
        const self: *ContactListener = @alignCast(@fieldParentPtr("interface", iface));
        self.queue.push(.{
            .kind = .began,
            .a_id = @backingInt(b1.id),
            .b_id = @backingInt(b2.id),
            .sensor_side = if (b1.isSensor()) .a else if (b2.isSensor()) .b else .none,
            .position = .fromArr(manifold.base_offset[0..3].*),
            .normal = .fromArr(manifold.normal[0..3].*),
        }) catch {};
    }

    pub fn onContactPersisted(
        _: *zphysics.ContactListener,
        _: *const zphysics.Body,
        _: *const zphysics.Body,
        _: *const zphysics.ContactManifold,
        _: *zphysics.ContactSettings,
    ) callconv(.c) void {}

    pub fn onContactRemoved(
        iface: *zphysics.ContactListener,
        pair: *const zphysics.SubShapeIdPair,
    ) callconv(.c) void {
        const self: *ContactListener = @alignCast(@fieldParentPtr("interface", iface));
        self.queue.push(.{
            .kind = .ended,
            .a_id = @backingInt(pair.first.body_id),
            .b_id = @backingInt(pair.second.body_id),
        }) catch {};
    }
};
