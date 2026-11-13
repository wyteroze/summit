// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

pub const IOSNativeWindow = extern struct {
    ca_layer: ?*anyopaque,

    pub fn getLayer(self: *const IOSNativeWindow) ?*anyopaque {
        return self.ca_layer;
    }
};
