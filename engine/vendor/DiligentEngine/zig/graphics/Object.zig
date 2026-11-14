// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const helpers = @import("../helpers.zig");

/// Base object for all objects created by the render device Diligent::IRenderDevice
const Object = @This();
raw: *c.IObject,

pub const method = helpers.methodHelper(@This(), "Object");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
