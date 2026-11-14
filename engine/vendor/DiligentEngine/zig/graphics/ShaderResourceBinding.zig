// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const primitives = @import("../primitives/primitives.zig");
const helpers = @import("../helpers.zig");

const ShaderResourceBinding = @This();
raw: *c.IShaderResourceBinding,

/// Returns the variable by its name.
///
/// **Note:** This operation may potentially be expensive. If the variable will be used often, it is
/// recommended to store and reuse the pointer as it never changes.
pub fn getVariableByName(self: ShaderResourceBinding, shader_type: graphics.types.ShaderType, name: [:0]const u8) ?graphics.ShaderResourceVariable {
    const srv = self.method("GetVariableByName")(self.raw, @bitCast(shader_type), name);
    if (srv == null) return null;

    return .{ .raw = srv };
}

pub const method = helpers.methodHelper(@This(), "ShaderResourceBinding");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
pub const asObject = helpers.baseHelper(@This(), graphics.Object);
