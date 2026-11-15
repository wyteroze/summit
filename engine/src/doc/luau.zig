// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const names = @import("../scripting/bind/names.zig");
pub const Dir = enum { in, out };

fn ptrChild(comptime T: type) ?type {
    const info = @typeInfo(T);
    if (info != .pointer) return null;
    return info.pointer.child;
}

// From marshal.zig
// I know it's bad to be duping these but I'm working on removing signals entirely anyway. data oriented design ftw
fn signalOf(comptime T: type) ?type {
    const info = @typeInfo(T);
    if (info != .pointer or info.pointer.size != .one) return null;

    const C = info.pointer.child;
    return if (@typeInfo(C) == .@"struct" and @hasDecl(C, "Args") and @hasDecl(C, "rawConnect")) C else null;
}

fn join(comptime parts: []const []const u8, comptime sep: []const u8) []const u8 {
    comptime {
        var out: []const u8 = "";
        for (parts, 0..) |p, i| out = out ++ (if (i == 0) "" else sep) ++ p;
        return out;
    }
}

fn opt(comptime t: []const u8) []const u8 {
    return if (std.mem.endsWith(u8, t, "?")) t else t ++ "?";
}

fn signalType(comptime Sig: type, comptime Reg: type) []const u8 {
    comptime {
        const arg_types = @typeInfo(Sig.Args).@"struct".field_types;
        var parts: []const []const u8 = &.{};
        for (arg_types) |A| parts = parts ++ &[_][]const u8{luau(A, Reg, .out)};

        return "Signal<" ++ (if (parts.len == 0) "()" else join(parts, ", ")) ++ ">";
    }
}

fn anonTable(comptime T: type, comptime Reg: type, comptime dir: Dir) []const u8 {
    comptime {
        const info = @typeInfo(T).@"struct";
        var parts: []const []const u8 = &.{};

        if (info.is_tuple) {
            for (info.field_types) |F| parts = parts ++ &[_][]const u8{luau(F, Reg, dir)};
            return "(" ++ join(parts, ", ") ++ ")";
        }

        for (info.field_names, info.field_types, 0..) |nm, F, i| {
            var ty = luau(F, Reg, dir);
            if (dir == .in) {
                if (info.field_attrs[i].default_value_ptr == null)
                    @compileError(@typeName(T) ++ "." ++ nm ++ " needs a default to be accepted from Lua");
                ty = opt(ty);
            }
            parts = parts ++ &[_][]const u8{names.camel(nm) ++ ": " ++ ty};
        }

        return if (parts.len == 0) "{}" else "{ " ++ join(parts, ", ") ++ " }";
    }
}

fn unionType(comptime T: type, comptime number: ?[]const u8, comptime Reg: type, comptime dir: Dir) []const u8 {
    comptime {
        const info = @typeInfo(T).@"union";
        var parts: []const []const u8 = &.{};

        for (info.field_names, info.field_types) |nm, F| {
            const key = names.camel(nm);
            if (F == void) {
                // Void enum variants are just strings
                parts = parts ++ &[_][]const u8{"\"" ++ key ++ "\""};
            } else if (number != null and std.mem.eql(u8, nm, number.?)) {
                // Number enum variants are just numbers
                parts = parts ++ &[_][]const u8{luau(F, Reg, dir)};
            } else {
                // Payload variants are tables with one entry, like `{ grid: GridLayout }`
                parts = parts ++ &[_][]const u8{"{ " ++ key ++ ": " ++ luau(F, Reg, dir) ++ " }"};
            }
        }
        return join(parts, " | ");
    }
}

pub fn luau(comptime T: type, comptime Reg: type, comptime dir: Dir) []const u8 {
    comptime {
        if (ptrChild(T)) |C| if (Reg.kindOf(C) != null) return luau(C, Reg, dir);
        if (Reg.kindOf(T)) |k| switch (k) {
            .value, .handle, .variant => return Reg.nameOf(T),
            .record => return Reg.nameOf(T) ++ if (dir == .in) "Init" else "",
            else => unreachable,
        };
        if (signalOf(T)) |S| return signalType(S, Reg);
        return switch (@typeInfo(T)) {
            .bool => "boolean",
            .int, .float, .comptime_int, .comptime_float => "number",
            .optional => |o| opt(luau(o.child, Reg, dir)),
            .@"enum" => names.shortTypeName(T),
            .@"union" => unionType(T, null, Reg, dir),
            .pointer => if (T == []const u8 or T == [:0]const u8) "string" else @compileError("Unmarshallable type: " ++ @typeName(T)),
            .@"struct" => anonTable(T, Reg, dir),
            .void => "()",
            else => @compileError("Unmarshallable type: " ++ @typeName(T)),
        };
    }
}
