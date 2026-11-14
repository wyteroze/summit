// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const helpers = @import("../helpers.zig");

const TextureView = @This();
raw: *c.ITextureView,

/// Returns the texture view description used to create the object
pub fn getDesc(self: TextureView) *const graphics.types.TextureViewDesc {
    return @ptrCast(self.asDeviceObject().getDesc());
}

/// Returns a pointer to the referenced texture object.
///
/// The method does **NOT** increment the reference counter of the returned object,
/// so Release() **must not** be called.
pub fn getTexture(self: TextureView) graphics.Texture {
    const b = self.method("GetTexture")(self.raw);
    return .{ .raw = b };
}

pub const method = helpers.methodHelper(@This(), "TextureView");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
pub const asDeviceObject = helpers.baseHelper(@This(), graphics.DeviceObject);
pub const asObject = helpers.baseHelper(@This(), graphics.Object);
