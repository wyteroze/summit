// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const types = @import("types.zig");
const names = @import("names.zig");

pub const Bound = struct { m: types.Member, via: ?type = null };
pub const InstanceEntry = union(enum) {
    field: struct { zig: []const u8, lua: [:0]const u8 },
    prop: Bound,
    method: Bound,

    pub fn name(comptime self: InstanceEntry) []const u8 {
        return switch (self) {
            .field => |f| f.lua,
            .prop => |p| p.m.name,
            .method => |m| m.m.name,
        };
    }
};
pub fn hasName(comptime list: []const InstanceEntry, comptime name: []const u8) bool {
    for (list) |e| if (std.mem.eql(u8, e.name(), name)) return true;
    return false;
}

pub fn entries(comptime r: anytype) []const InstanceEntry {
    comptime {
        var out: []const InstanceEntry = &.{};
        const T = @TypeOf(r);

        if (@hasField(T, "fields")) {
            for (r.fields) |f| out = out ++ .{InstanceEntry{ .field = .{ .zig = f, .lua = names.camel(f) } }};
        }
        if (@hasField(T, "props")) {
            for (r.props) |p| out = out ++ .{InstanceEntry{ .prop = .{ .m = p } }};
        }
        if (@hasField(T, "methods")) {
            for (r.methods) |m| out = out ++ .{InstanceEntry{ .method = .{ .m = m } }};
        }
        if (@hasField(T, "signals")) {
            for (r.signals) |s| out = out ++ .{InstanceEntry{ .prop = .{ .m = s } }};
        }

        if (@hasField(T, "inherit")) if (r.inherit) |inh| {
            const ir = inh.recipe;
            for (ir.props) |p| if (!hasName(out, p.name)) {
                out = out ++ .{InstanceEntry{ .prop = .{ .m = p, .via = inh.via } }};
            };
            for (ir.methods) |m| if (!hasName(out, m.name)) {
                out = out ++ .{InstanceEntry{ .method = .{ .m = m, .via = inh.via } }};
            };
            for (ir.signals) |s| if (!hasName(out, s.name)) {
                out = out ++ .{InstanceEntry{ .prop = .{ .m = s, .via = inh.via } }};
            };
        };

        return out;
    }
}
