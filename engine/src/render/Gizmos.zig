// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const core = @import("../core/core.zig");
const gpu = @import("../gpu/gpu.zig");
const bind = @import("../scripting/bind/bind.zig");
const Vec3 = core.math.Vec3;
const Quat = core.math.Quat;
const Color = core.Color;

pub const max_vertices = 1 << 18;

pub const Vertex = extern struct {
    position: [3]f32,
    color: u32, // rgba8
};

const Gizmos = @This();
allocator: std.mem.Allocator,
tested: std.ArrayList(Vertex) = .empty,
overlay: std.ArrayList(Vertex) = .empty,
dropped: usize = 0,

pub fn init(allocator: std.mem.Allocator) Gizmos {
    return .{ .allocator = allocator };
}

pub fn deinit(self: *Gizmos) void {
    self.tested.deinit(self.allocator);
    self.overlay.deinit(self.allocator);
}

pub fn clear(self: *Gizmos) void {
    self.tested.clearRetainingCapacity();
    self.overlay.clearRetainingCapacity();
    self.dropped = 0;
}

pub fn line(self: *Gizmos, a: Vec3, b: Vec3, color: ?Color, always_on_top: ?bool) void {
    if (self.tested.items.len + self.overlay.items.len + 2 > max_vertices) {
        self.dropped += 2;
        return;
    }
    const list = if (always_on_top orelse true) &self.overlay else &self.tested;
    const c: [4]u8 = (color orelse Color.fromRgbFloat(1, 1, 1, 1)).toRgb();
    list.appendSlice(self.allocator, &.{
        .{ .position = a.arr(), .color = @bitCast(c) },
        .{ .position = b.arr(), .color = @bitCast(c) },
    }) catch {
        self.dropped += 2;
    };
}

pub fn ray(self: *Gizmos, origin: Vec3, dir: Vec3, len: f32, color: ?Color, always_on_top: ?bool) void {
    self.arrow(origin, origin.add(dir.normalize().scale(len)), color, always_on_top);
}

pub fn triangle(self: *Gizmos, a: Vec3, b: Vec3, c: Vec3, color: ?Color, always_on_top: ?bool) void {
    self.line(a, b, color, always_on_top);
    self.line(b, c, color, always_on_top);
    self.line(c, a, color, always_on_top);
}

pub fn arrow(self: *Gizmos, from: Vec3, to: Vec3, color: ?Color, always_on_top: ?bool) void {
    self.line(from, to, color, always_on_top);

    const d = to.sub(from);
    const len = d.length();
    if (len < 1e-6) return;

    const fwd = d.scale(1.0 / len);
    const side = perpendicular(fwd);
    const up = fwd.cross(side);

    const head = @min(len * 0.25, 0.3);
    const base = to.sub(fwd.scale(head));
    const r = head * 0.4;

    self.line(to, base.add(side.scale(r)), color, always_on_top);
    self.line(to, base.sub(side.scale(r)), color, always_on_top);
    self.line(to, base.add(up.scale(r)), color, always_on_top);
    self.line(to, base.sub(up.scale(r)), color, always_on_top);
}

pub fn circle(self: *Gizmos, center: Vec3, normal: Vec3, radius: f32, color: ?Color, always_on_top: ?bool) void {
    const segments = 32;
    const n = normal.normalize();
    const u = perpendicular(n);
    const v = n.cross(u);

    var prev = center.add(u.scale(radius));
    for (1..segments + 1) |i| {
        const t = std.math.tau * @as(f32, @floatFromInt(i)) / segments;
        const p = center.add(u.scale(@cos(t) * radius)).add(v.scale(@sin(t) * radius));
        self.line(prev, p, color, always_on_top);
        prev = p;
    }
}

pub fn sphere(self: *Gizmos, center: Vec3, radius: f32, color: ?Color, always_on_top: ?bool) void {
    self.circle(center, .x_axis, radius, color, always_on_top);
    self.circle(center, .y_axis, radius, color, always_on_top);
    self.circle(center, .z_axis, radius, color, always_on_top);
}

pub fn box(self: *Gizmos, center: Vec3, size: Vec3, rotation: Quat, color: ?Color, always_on_top: ?bool) void {
    const half = size.scale(0.5);

    var c: [8]Vec3 = undefined;
    for (&c, 0..) |*corner, i| {
        const local = Vec3.new(
            if (i & 1 != 0) half.x else -half.x,
            if (i & 2 != 0) half.y else -half.y,
            if (i & 4 != 0) half.z else -half.z,
        );
        corner.* = center.add(rotation.rotate(local));
    }
    for (0..8) |i| {
        inline for (.{ 1, 2, 4 }) |bit| {
            if (i & bit == 0) self.line(c[i], c[i | bit], color, always_on_top);
        }
    }
}

pub fn axes(self: *Gizmos, pos: Vec3, rot: Quat, size: f32, always_on_top: ?bool) void {
    self.line(pos, pos.add(rot.rotate(Vec3.x_axis.scale(size))), .fromRgbFloat(1, 0, 0, null), always_on_top);
    self.line(pos, pos.add(rot.rotate(Vec3.y_axis.scale(size))), .fromRgbFloat(0, 1, 0, null), always_on_top);
    self.line(pos, pos.add(rot.rotate(Vec3.z_axis.scale(size))), .fromRgbFloat(0, 0, 1, null), always_on_top);
}

fn perpendicular(n: Vec3) Vec3 {
    const axis: Vec3 = if (@abs(n.x) < 0.9) .x_axis else .y_axis;
    const p = n.cross(axis);
    return p.div(Vec3.fromSimd(@splat(@sqrt(@reduce(.Add, p.mul(p).simd())))));
}

pub const api = bind.module("render/gizmos", .{
    .kind = .{ .singleton = Gizmos },
    .members = &.{
        bind.func("line", line),
        bind.func("ray", ray),
        bind.func("triangle", triangle),
        bind.func("arrow", arrow),
        bind.func("circle", circle),
        bind.func("sphere", sphere),
        bind.func("box", box),
        bind.func("axes", axes),
    },
});
