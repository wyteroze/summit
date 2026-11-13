// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

pub const AndroidNativeWindow = extern struct {
    a_window: ?*anyopaque,

    pub fn init(a_window: ?*anyopaque) AndroidNativeWindow {
        return .{ .a_window = a_window };
    }
};
