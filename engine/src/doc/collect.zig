const std = @import("std");
const types = @import("../scripting/bind/types.zig");
const wrap = @import("../scripting/bind/wrap.zig");
const instance = @import("../scripting/bind/instance.zig");
const signal = @import("../scripting/bind/signal.zig");
const Entry = @import("Entry.zig");
const Param = Entry.Param;
const luau = @import("luau.zig").luau;

fn sub(comptime parent: []const u8, comptime name: []const u8) []const u8 {
    return if (parent.len == 0) name else parent ++ "." ++ name;
}

fn entryKind(comptime k: types.Kind) Entry.Kind {
    return switch (k) {
        .module => .module,
        .handle, .object => .handle,
        .value => .value,
        .record => .record,
        .variant => .variant,
        .func => .func,
        .constant => .constant,
        .prop, .signal => .prop,
        .globals => unreachable,
    };
}

pub fn collect(comptime api: []const types.Member, comptime Reg: type) []const Entry {
    comptime {
        @setEvalBranchQuota(10_000_000);
        var out: []const Entry = &.{};

        for (api) |top| {
            var parent: []const u8 = "";
            if (top.kind == .module) {
                parent = top.name;
                out = out ++ &[_]Entry{head(top.name, top, .module)};
            }
            for (top.impl.recipe.members) |m| out = out ++ memberEntries(parent, m, Reg);
        }
        out = out ++ signalEntries(Reg);

        for (out, 0..) |a, i| for (out[i + 1 ..]) |b| {
            if (std.mem.eql(u8, a.path, b.path)) @compileError("Duplicate doc path: " ++ a.path);
        };
        return out;
    }
}

fn head(comptime path: []const u8, comptime m: types.Member, comptime kind: Entry.Kind) Entry {
    const d = m.docs;
    return .{
        .path = path,
        .name = m.name,
        .kind = kind,
        .summary = d.summary,
        .body = d.body,
        .icon = d.icon,
        .since = d.since,
        .deprecated = d.deprecated,
        .hidden = d.hidden,
    };
}

fn memberEntries(comptime parent: []const u8, comptime m: types.Member, comptime Reg: type) []const Entry {
    const path = sub(parent, m.name);
    switch (m.kind) {
        .func => return &.{callable(path, m, Reg, false, null)},
        .constant => {
            var e = head(path, m, .constant);
            e.luau = luau(@TypeOf(m.impl.val), Reg, .out);
            return &.{e};
        },
        .prop => return &.{propEntry(path, m, Reg, null, null)},
        .value, .handle, .object => return typeEntries(path, m, Reg),
        .record, .variant => return typeEntries(path, m, Reg),
        else => return &.{},
    }
}

fn typeEntries(comptime path: []const u8, comptime m: types.Member, comptime Reg: type) []const Entry {
    const T = m.impl.Type;
    if (@hasDecl(T, "SignalType")) return &.{};
    if (m.kind == .record or m.kind == .variant) return &.{head(path, m, entryKind(m.kind))}; // TODO: fields/variants

    const r = m.impl.recipe;
    var out: []const Entry = &.{head(path, m, entryKind(m.kind))};

    for (instance.entries(r)) |ie| {
        out = out ++ &[_]Entry{switch (ie) {
            .field => |f| blk: {
                var e: Entry = .{ .path = sub(path, f.lua), .name = f.lua, .kind = .field, .writable = true };
                e.luau = luau(@FieldType(T, f.zig), Reg, .out);
                if (@hasField(@TypeOf(r), "field_docs")) {
                    for (r.field_docs) |fd| if (std.mem.eql(u8, fd.name, f.lua)) {
                        e.summary = fd.doc;
                    };
                }
                break :blk e;
            },
            .prop => |p| propEntry(sub(path, p.m.name), p.m, Reg, p.via, baseName(r, p.via)),
            .method => |p| blk: {
                var e = callable(sub(path, p.m.name), p.m, Reg, true, p.via);
                e.inherited_from = baseName(r, p.via);
                break :blk e;
            },
        }};
    }
    for (r.statics) |s| out = out ++ &[_]Entry{switch (s.kind) {
        .func => callable(sub(path, s.name), s, Reg, false, null),
        .constant => blk: {
            var e = head(sub(path, s.name), s, .constant);
            e.luau = luau(@TypeOf(s.impl.val), Reg, .out);
            break :blk e;
        },
        else => unreachable,
    }};
    // TODO: For each op, emit a func for their corresponding metamethod.

    return out;
}

fn baseName(comptime r: anytype, comptime via: ?type) ?[]const u8 {
    return if (via != null) r.inherit.?.base_name else null;
}

fn propEntry(comptime path: []const u8, comptime m: types.Member, comptime Reg: type, comptime via: ?type, comptime base: ?[]const u8) Entry {
    const sig = wrap.signature(@TypeOf(m.impl.getter), via);
    const R = @typeInfo(@TypeOf(m.impl.getter)).@"fn".return_type.?;
    var e = head(path, m, .prop);
    e.luau = luau(if (@typeInfo(R) == .error_union) @typeInfo(R).error_union.payload else R, Reg, .out);
    e.writable = @hasDecl(m.impl, "setter");
    e.injected = sig.injected;
    e.inherited_from = base;

    return e;
}

fn callable(comptime path: []const u8, comptime m: types.Member, comptime Reg: type, comptime has_self: bool, comptime via: ?type) Entry {
    const F = @TypeOf(m.impl.function);
    const sig = wrap.signature(F, via);
    const skip = @intFromBool(has_self);
    const d = m.docs;

    var params: []const Param = &.{};
    if (sig.raw) {
        for (d.params) |p| params = params ++ &[_]Param{.{
            .name = p.name,
            .luau = p.luau orelse @compileError(path ++ ": raw function params need .luau"),
            .doc = p.doc,
        }};
    } else {
        const n = sig.lua_params.len - skip;
        if (d.params.len != 0 and d.params.len != n)
            @compileError(std.fmt.comptimePrint("{s}: documents {d} params, but Lua passes {d}", .{ path, d.params.len, n }));
        for (sig.lua_params[skip..], 0..) |P, i| params = params ++ &[_]Param{.{
            .name = if (d.params.len != 0) d.params[i].name else std.fmt.comptimePrint("arg{d}", .{i + 1}),
            .luau = luau(P, Reg, .in),
            .doc = if (d.params.len != 0) d.params[i].doc else "",
        }};
    }

    const R = @typeInfo(F).@"fn".return_type.?;
    const throws = @typeInfo(R) == .error_union;
    const Payload = if (throws) @typeInfo(R).error_union.payload else R;

    var e = head(path, m, .func);
    e.params = params;
    e.is_method = has_self;
    e.can_throw = throws;
    e.injected = sig.injected;
    e.returns_doc = d.returns;
    e.returns = if (Payload == wrap.Pushed)
        d.returns_luau orelse @compileError(path ++ " returns `Pushed`, you need to set its doc's `.returns_luau`.")
    else
        luau(Payload, Reg, .out);
    return e;
}

fn signalEntries(comptime Reg: type) []const Entry {
    return &[_]Entry{
        .{ .path = "Signal", .name = "Signal", .kind = .handle },
        .{
            .path = "Signal.connect",
            .name = "connect",
            .kind = .func,
            .is_method = true,
            .params = &.{.{ .name = "callback", .luau = "(T...) -> ()" }},
            .returns = "SignalConnection",
        },
    } ++ typeEntries("SignalConnection", signal.connection, Reg);
}
