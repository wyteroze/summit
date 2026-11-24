// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zlua = @import("zlua");
const Host = @import("Host.zig");
const Perf = @import("../../perf/Perf.zig");

const PerfCategory = Perf.Category("scripting.bind.wrap");
pub const ParamKind = enum { host, lua_state, via_self, lua };

pub fn classify(comptime P: type, comptime via: ?type) ParamKind {
    if (hostField(P) != null) return .host;
    if (P == *zlua.Lua) return .lua_state;
    if (via != null and P == via.?.To) return .via_self;
    return .lua;
}

pub const Signature = struct {
    lua_params: []const type,
    injected: []const []const u8,
    raw: bool,
};

pub fn signature(comptime F: type, comptime via: ?type) Signature {
    comptime {
        var lua: []const type = &.{};
        var inj: []const []const u8 = &.{};
        var raw = false;
        for (@typeInfo(F).@"fn".param_types) |P| switch (classify(P.?, via)) {
            .host => inj = inj ++ .{hostField(P.?).?},
            .lua_state => raw = true,
            .via_self => lua = lua ++ .{via.?.From},
            .lua => lua = lua ++ .{P.?},
        };
        return .{ .lua_params = lua, .injected = inj, .raw = raw };
    }
}

pub const WrapOpts = struct { skip_after_self: u8 = 0, via: ?type = null };
pub const Pushed = struct { n: i32 };

pub fn Wrap(comptime Mar: type) type {
    return struct {
        pub fn cFn(comptime f: anytype, comptime o: WrapOpts) zlua.CFn {
            return zlua.wrap(Gen(f, o).call);
        }

        pub fn Gen(comptime f: anytype, comptime o: WrapOpts) type {
            const F = @TypeOf(f);
            const info = @typeInfo(F).@"fn";
            return struct {
                pub fn call(l: *zlua.Lua) i32 {
                    const z = PerfCategory.beginZone(@src(), "Lua engine invocation");
                    defer PerfCategory.endZone(z);

                    return invoke(l);
                }

                fn invoke(l: *zlua.Lua) i32 {
                    var args: std.meta.ArgsTuple(F) = undefined;
                    comptime var next: i32 = 1;
                    comptime var has_self = false;

                    inline for (info.param_types, 0..) |P, i| {
                        switch (comptime classify(P.?, o.via)) {
                            .host => args[i] = @field(Host.fromState(l), hostField(P.?).?),
                            .lua_state => args[i] = l,
                            .via_self => {
                                const outer = Mar.parse(o.via.?.From, l, next);
                                args[i] = o.via.?.get(outer);
                                next += 1;

                                if (!has_self) {
                                    has_self = true;
                                    next += o.skip_after_self;
                                }
                            },
                            .lua => {
                                args[i] = Mar.parse(P.?, l, next);
                                next += 1;
                                if (!has_self) {
                                    has_self = true;
                                    next += o.skip_after_self;
                                }
                            },
                        }
                    }

                    const result = @call(.auto, f, args);
                    return pushResult(info.return_type.?, l, result);
                }
            };
        }

        fn pushResult(comptime R: type, l: *zlua.Lua, r: R) i32 {
            if (comptime R == Pushed) return r.n;
            switch (@typeInfo(R)) {
                .void => return 0,
                .error_union => |eu| {
                    const v = r catch |e| return l.raiseErrorStr("%s", .{@errorName(e).ptr});
                    return pushResult(eu.payload, l, v);
                },
                .@"struct" => |s| if (s.is_tuple) {
                    inline for (s.field_names) |nm| Mar.push(l, @field(r, nm));
                    return s.field_names.len;
                } else {
                    Mar.push(l, r);
                    return 1;
                },

                else => {
                    Mar.push(l, r);
                    return 1;
                },
            }
        }
    };
}

fn hostField(comptime P: type) ?[]const u8 {
    const info = @typeInfo(Host).@"struct";
    inline for (info.field_types, 0..) |f, i| if (f == P) return info.field_names[i];
    return null;
}
