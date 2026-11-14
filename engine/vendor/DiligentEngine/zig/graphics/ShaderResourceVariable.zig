// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const primitives = @import("../primitives/primitives.zig");
const helpers = @import("../helpers.zig");

const ShaderResourceVariable = @This();
raw: *c.IShaderResourceVariable,

pub fn set(
    self: ShaderResourceVariable,
    object: graphics.DeviceObject,
    flags: graphics.types.SetShaderResourceFlags,
) void {
    self.method("Set")(self.raw, object.raw, @bitCast(flags));
}

pub const method = helpers.methodHelper(@This(), "ShaderResourceVariable");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
pub const asObject = helpers.baseHelper(@This(), graphics.Object);
