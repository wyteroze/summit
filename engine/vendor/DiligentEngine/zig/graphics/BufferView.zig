// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
//! Buffer view interface
//!
//! To create a buffer view, call Buffer.createView().
//! **Remarks:**
//! Buffer view holds strong references to the buffer. The buffer
//! will not be destroyed until all views are released.

const c = @import("c");
const graphics = @import("graphics.zig");
const helpers = @import("../helpers.zig");

const BufferView = @This();
raw: *c.IBufferView,

/// Returns the buffer description used to create the object
pub fn getDesc(self: BufferView) *const graphics.types.BufferViewDesc {
    return @ptrCast(self.asDeviceObject().getDesc());
}

/// Returns pointer to the referenced buffer object.
///
/// The method does **NOT** increment the reference counter of the returned object,
/// so Release() **must not** be called.
pub fn getBuffer(self: BufferView) graphics.Buffer {
    const b = self.method("GetBuffer")(self.raw);
    return .{ .raw = b };
}

pub const method = helpers.methodHelper(@This(), "BufferView");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
pub const asDeviceObject = helpers.baseHelper(@This(), graphics.DeviceObject);
pub const asObject = helpers.baseHelper(@This(), graphics.Object);
