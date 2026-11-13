// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const helpers = @import("../helpers.zig");

const Buffer = @This();
raw: *c.IBuffer,

/// Returns the buffer description used to create the object
pub fn getDesc(self: Buffer) *const graphics.types.BufferDesc {
    const attribs = helpers.method(self.raw, "DeviceObject", "GetDesc")(@ptrCast(self.raw));
    return @ptrCast(attribs);
}

pub const method = helpers.methodHelper(@This(), "Buffer");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
