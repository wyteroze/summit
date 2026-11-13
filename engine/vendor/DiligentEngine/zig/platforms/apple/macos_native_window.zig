// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const builtin = @import("builtin");

pub const MacOSNativeWindow = extern struct {
    ns_view: ?*anyopaque,

    pub fn getLayer(self: *const MacOSNativeWindow) ?*anyopaque {
        const _GetLayer = @extern(
            *const fn (self: *const MacOSNativeWindow) callconv(.c) ?*anyopaque,
            .{ .name = "_ZNK8Diligent17MacOSNativeWindow8GetLayerEv" },
        );

        return _GetLayer(self);
    }

    pub fn init(ns_view: ?*anyopaque) MacOSNativeWindow {
        return .{ .ns_view = ns_view };
    }
};
