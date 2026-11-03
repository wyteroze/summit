// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const core = @import("../core/core.zig");

pub const Environment = struct {
    ambient: core.Color = .fromRgbFloat(0.1, 0.1, 0.1, 1.0),
    clear_color: core.Color = .fromRgbFloat(0, 0, 0, 1.0),
};

pub const Scene = struct {
    environment: Environment = .{},
};

pub const Camera = struct {
    fov: f32 = 90,
    near_plane: f32 = 0.1,
};
