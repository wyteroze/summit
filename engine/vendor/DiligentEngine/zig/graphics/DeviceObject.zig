// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const helpers = @import("../helpers.zig");

/// Base object for all objects created by the render device Diligent::IRenderDevice
const DeviceObject = @This();
raw: *c.IDeviceObject,

/// Returns the buffer description used to create the object
pub fn getDesc(self: DeviceObject) *const graphics.types.BufferDesc {
    const attribs = self.method("GetDesc")(self.raw);
    return @ptrCast(attribs);
}

pub const method = helpers.methodHelper(@This(), "DeviceObject");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
pub const asObject = helpers.baseHelper(@This(), graphics.Object);
