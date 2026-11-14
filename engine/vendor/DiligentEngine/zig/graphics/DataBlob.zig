// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const helpers = @import("../helpers.zig");
const graphics = @import("graphics.zig");

const DataBlob = @This();
raw: *c.IDataBlob,

pub const method = helpers.methodHelper(@This(), "DataBlob");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
pub const asObject = helpers.baseHelper(@This(), graphics.Object);
