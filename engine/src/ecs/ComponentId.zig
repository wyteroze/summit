// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zlua = @import("zlua");

const ComponentId = @This();
value: u32,

pub const invalid: ComponentId = .{ .value = std.math.maxInt(u32) };

pub fn eql(a: ComponentId, b: ComponentId) bool {
    return a.value == b.value;
}
