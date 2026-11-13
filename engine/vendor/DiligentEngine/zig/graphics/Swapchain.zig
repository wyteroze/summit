// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const helpers = @import("../helpers.zig");

const Swapchain = @This();
raw: *c.ISwapChain,

/// Presents a rendered image to the user
pub fn present(self: Swapchain, sync_interval: ?u32) void {
    self.method("Present")(self.raw, sync_interval orelse 1);
}

pub const method = helpers.methodHelper(@This(), "SwapChain");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
