// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const helpers = @import("../helpers.zig");

const CommandQueue = @This();
raw: *c.ICommandQueue,

pub fn getNextFenceValue(self: *const CommandQueue) u64 {
    return self.method("GetNextFenceValue")(self.raw);
}

pub fn getCompletedFenceValue(self: *CommandQueue) u64 {
    return self.method("GetCompletedFenceValue")(self.raw);
}

pub fn waitForIdle(self: *CommandQueue) u64 {
    return self.method("WaitForIdle")(self.raw);
}

pub const method = helpers.methodHelper(@This(), "CommandQueue");
pub const asObject = helpers.baseHelper(@This(), graphics.Object);
