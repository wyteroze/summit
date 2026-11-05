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

// TODO: convex_hull and mesh.
pub const Shape = enum { box, sphere, capsule, cylinder };
pub const MotionType = enum { dynamic, kinematic };
pub const PhysicsMaterial = struct {
    density: f32 = 1.0,
    friction: f32 = 0.5,
    restitution: f32 = 0.0,
};

pub const Collider = struct {
    shape: Shape = .box,
    sensor: bool = false,
    material: PhysicsMaterial = .{},
};

pub const Axes = packed struct { x: bool = false, y: bool = false, z: bool = false };
pub const LockedAxes = packed struct { position: Axes = .{}, rotation: Axes = .{} };

pub const RigidBody = struct {
    motion: MotionType = .dynamic,
    // Overrides the density-derived mass if not null.
    mass: ?f32 = null,
    linear_damping: f32 = 0.05,
    angular_damping: f32 = 0.05,
    gravity_scale: f32 = 1.0,
    locked: LockedAxes = .{},
    continuous: bool = false,
};

// Internal component used to track Jolt state for each body
pub const PhysicsBody = struct {
    id: u32,
    locked: LockedAxes,
    mass: ?f32,
};
