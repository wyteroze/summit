// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zphysics = @import("zphysics");
const BroadphaseLayerInterface = @import("broadphase_layer_interface.zig").BroadphaseLayerInterface;
const ObjectVsBroadPhaseLayerFilter = @import("object_vs_broadphase_layer_filter.zig").ObjectVsBroadPhaseLayerFilter;
const ObjectLayerPairFilter = @import("object_layer_pair_filter.zig").ObjectLayerPairFilter;
const LayerMatrix = @import("LayerMatrix.zig");

const Physics = @This();
allocator: std.mem.Allocator,
physics_system: *zphysics.PhysicsSystem,
matrix: *LayerMatrix,
broadphase_layer_interface: *BroadphaseLayerInterface,
object_vs_broadphase_layer_filter: *ObjectVsBroadPhaseLayerFilter,
object_layer_pair_filter: *ObjectLayerPairFilter,

pub fn init(io: std.Io, allocator: std.mem.Allocator) !Physics {
    try zphysics.init(allocator, io, .{});

    const matrix = try allocator.create(LayerMatrix);
    errdefer allocator.destroy(matrix);
    matrix.* = .{};

    const broadphase_layer_interface = try allocator.create(BroadphaseLayerInterface);
    errdefer allocator.destroy(broadphase_layer_interface);
    broadphase_layer_interface.* = .init();

    const object_vs_broadphase_layer_filter = try allocator.create(ObjectVsBroadPhaseLayerFilter);
    errdefer allocator.destroy(object_vs_broadphase_layer_filter);
    object_vs_broadphase_layer_filter.* = .{};

    const object_layer_pair_filter = try allocator.create(ObjectLayerPairFilter);
    errdefer allocator.destroy(object_layer_pair_filter);
    object_layer_pair_filter.* = .{ .matrix = matrix };

    return .{
        .allocator = allocator,
        .physics_system = try .create(
            &broadphase_layer_interface.interface,
            &object_vs_broadphase_layer_filter.filter,
            &object_layer_pair_filter.interface,
            .{},
        ),
        .matrix = matrix,
        .broadphase_layer_interface = broadphase_layer_interface,
        .object_vs_broadphase_layer_filter = object_vs_broadphase_layer_filter,
        .object_layer_pair_filter = object_layer_pair_filter,
    };
}

pub fn deinit(self: *Physics) void {
    self.physics_system.destroy();
    zphysics.deinit();
    self.allocator.destroy(self.broadphase_layer_interface);
    self.allocator.destroy(self.object_vs_broadphase_layer_filter);
    self.allocator.destroy(self.object_layer_pair_filter);
    self.allocator.destroy(self.matrix);
}
