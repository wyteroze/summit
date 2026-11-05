// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Vec3 = @import("Vec3.zig").Vec3;
const Mat4 = @import("Mat4.zig").Mat4;

pub const Quat = extern struct {
    pub const Simd4 = @Vector(4, f32);
    x: f32,
    y: f32,
    z: f32,
    w: f32,

    pub const identity: Quat = .{ .x = 0, .y = 0, .z = 0, .w = 1 };

    pub fn new(x: f32, y: f32, z: f32, w: f32) Quat {
        return .{ .x = x, .y = y, .z = z, .w = w };
    }
    pub fn simd(self: Quat) Simd4 {
        return .{ self.x, self.y, self.z, self.w };
    }
    pub fn fromSimd(v: Simd4) Quat {
        return .{ .x = v[0], .y = v[1], .z = v[2], .w = v[3] };
    }
    /// XYZW order
    pub fn toArr(self: Quat) [4]f32 {
        return .{ self.x, self.y, self.z, self.w };
    }
    /// XYZW order
    pub fn fromArr(arr: [4]f32) Quat {
        return .{ .x = arr[0], .y = arr[1], .z = arr[2], .w = arr[3] };
    }

    pub fn eq(a: Quat, b: Quat) bool {
        return a.x == b.x and a.y == b.y and a.z == b.z and a.w == b.w;
    }

    // YXZ order. RADIANS!!!
    pub fn fromEuler(vec: Vec3) Quat {
        const hx = vec.x * 0.5;
        const hy = vec.y * 0.5;
        const hz = vec.z * 0.5;

        const cx = @cos(hx);
        const sx = @sin(hx);
        const cy = @cos(hy);
        const sy = @sin(hy);
        const cz = @cos(hz);
        const sz = @sin(hz);

        return .{
            .x = sx * cy * cz + cx * sy * sz,
            .y = cx * sy * cz - sx * cy * sz,
            .z = cx * cy * sz - sx * sy * cz,
            .w = cx * cy * cz + sx * sy * sz,
        };
    }

    // XYZ in radians
    pub fn toEuler(q: Quat) Vec3 {
        // pitch (X)
        const sinp = 2 * (q.w * q.x - q.y * q.z);
        const pitch = if (@abs(sinp) >= 1)
            std.math.copysign(@as(f32, std.math.pi / 2.0), sinp)
        else
            std.math.asin(sinp);

        // yaw (Y)
        const siny = 2 * (q.w * q.y + q.x * q.z);
        const cosy = 1 - 2 * (q.x * q.x + q.y * q.y);
        const yaw = std.math.atan2(siny, cosy);

        // roll (Z)
        const sinr = 2 * (q.w * q.z + q.x * q.y);
        const cosr = 1 - 2 * (q.x * q.x + q.z * q.z);
        const roll = std.math.atan2(sinr, cosr);

        return .{ .x = pitch, .y = yaw, .z = roll };
    }

    pub fn fromAxisAngle(axis: Vec3, angle_radians: f32) Quat {
        const half = angle_radians * 0.5;

        const s = @sin(half);
        const n = axis.normalize();

        return .{
            .x = n.x * s,
            .y = n.y * s,
            .z = n.z * s,
            .w = @cos(half),
        };
    }

    pub fn mul(a: Quat, b: Quat) Quat {
        const bv = b.simd();
        const av = a.simd();

        const b1 = @shuffle(f32, bv, undefined, .{ 3, 2, 1, 0 }) * Simd4{ 1, -1, 1, -1 };
        const b2 = @shuffle(f32, bv, undefined, .{ 2, 3, 0, 1 }) * Simd4{ 1, 1, -1, -1 };
        const b3 = @shuffle(f32, bv, undefined, .{ 1, 0, 3, 2 }) * Simd4{ -1, 1, 1, -1 };

        const r = bv * @as(Simd4, @splat(av[3])) +
            b1 * @as(Simd4, @splat(av[0])) +
            b2 * @as(Simd4, @splat(av[1])) +
            b3 * @as(Simd4, @splat(av[2]));
        return .fromSimd(r);
    }

    pub fn normalize(a: Quat) Quat {
        const v = a.simd();
        const len = @sqrt(@reduce(.Add, v * v));
        if (len == 0) return .identity;

        return .fromSimd(v * @as(@Vector(4, f32), @splat(1.0 / len)));
    }

    pub fn toMat4(q: Quat) Mat4 {
        const xx = q.x * q.x;
        const yy = q.y * q.y;
        const zz = q.z * q.z;
        const xy = q.x * q.y;
        const xz = q.x * q.z;
        const yz = q.y * q.z;
        const wx = q.w * q.x;
        const wy = q.w * q.y;
        const wz = q.w * q.z;

        return .{ .m = .{
            .{ 1 - 2 * (yy + zz), 2 * (xy - wz), 2 * (xz + wy), 0 },
            .{ 2 * (xy + wz), 1 - 2 * (xx + zz), 2 * (yz - wx), 0 },
            .{ 2 * (xz - wy), 2 * (yz + wx), 1 - 2 * (xx + yy), 0 },
            .{ 0, 0, 0, 1 },
        } };
    }

    pub fn negate(q: Quat) Quat {
        return .{ .x = -q.x, .y = -q.y, .z = -q.z, .w = -q.w };
    }

    pub fn slerp(q0: Quat, other: Quat, a: f32) Quat {
        var d = q0.dot(other);
        const q1 = if (d < 0) blk: {
            d = -d;
            break :blk other.negate();
        } else other;

        if (d > 0.9995) {
            return Quat.new(
                std.math.lerp(q0.x, q1.x, a),
                std.math.lerp(q0.y, q1.y, a),
                std.math.lerp(q0.z, q1.z, a),
                std.math.lerp(q0.w, q1.w, a),
            ).normalize();
        }

        const t0 = std.math.acos(d);
        const t = t0 * a;
        const st0 = @sin(t0);

        const s0 = @cos(t) - d * @sin(t) / st0;
        const s1 = @sin(t) / st0;

        return .new(
            s0 * q0.x + s1 * q1.x,
            s0 * q0.y + s1 * q1.y,
            s0 * q0.z + s1 * q1.z,
            s0 * q0.w + s1 * q1.w,
        );
    }

    pub fn dot(a: Quat, b: Quat) f32 {
        return @reduce(.Add, a.simd() * b.simd());
    }

    /// Rotate a vector by this (unit) quaternion.
    pub fn rotate(q: Quat, v: Vec3) Vec3 {
        const tx = 2 * (q.y * v.z - q.z * v.y);
        const ty = 2 * (q.z * v.x - q.x * v.z);
        const tz = 2 * (q.x * v.y - q.y * v.x);

        return .{
            .x = v.x + q.w * tx + (q.y * tz - q.z * ty),
            .y = v.y + q.w * ty + (q.z * tx - q.x * tz),
            .z = v.z + q.w * tz + (q.x * ty - q.y * tx),
        };
    }

    pub fn format(
        self: @This(),
        writer: *std.Io.Writer,
    ) std.Io.Writer.Error!void {
        try writer.print(
            "Quat({d:.2}, {d:.2}, {d:.2}, {d:.2})",
            .{ self.x, self.y, self.z, self.w },
        );
    }
};

const bind = @import("../../scripting/bind/bind.zig");
pub const api = bind.value(Quat, .{
    .fields = &.{ "x", "y", "z", "w" },
    .methods = &.{
        bind.func("toEuler", Quat.toEuler),
        bind.func("normalize", Quat.normalize),
        bind.func("toMat4", Quat.toMat4),
        bind.func("slerp", Quat.slerp),
        bind.func("rotate", Quat.rotate),
    },
    .statics = &.{
        bind.constant("identity", Quat.identity),
        bind.func("new", Quat.new),
        bind.func("fromEuler", Quat.fromEuler),
        bind.func("fromAxisAngle", Quat.fromAxisAngle),
    },
    .ops = .{
        .eq = .{ .member = bind.func("eql", Quat.eq) },
    },
});
