// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

pub const Win32NativeWindow = extern struct {
    hwnd: ?*anyopaque = null,

    pub fn init(hwnd: ?*anyopaque) Win32NativeWindow {
        return .{ .hwnd = hwnd };
    }
};
