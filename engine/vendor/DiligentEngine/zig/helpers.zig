// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");

pub fn ensureSame(comptime Zig: type, comptime C: type) void {
    if (@sizeOf(Zig) != @sizeOf(C)) {
        @compileError(std.fmt.comptimePrint(
            "Size mismatch for {s}: Zig size = {d}, C size = {d}",
            .{ @typeName(Zig), @sizeOf(Zig), @sizeOf(C) },
        ));
    }

    if (@alignOf(Zig) != @alignOf(C)) {
        @compileError(std.fmt.comptimePrint(
            "Align mismatch for {s}: Zig align = {d}, C align = {d}",
            .{ @typeName(Zig), @alignOf(Zig), @alignOf(C) },
        ));
    }

    const z_type_info = @typeInfo(Zig);
    const c_type_info = @typeInfo(C);
    if (z_type_info == .@"struct" and c_type_info == .@"struct") {
        const z_struct = z_type_info.@"struct";
        const c_struct = c_type_info.@"struct";
        const z_field_names = z_struct.field_names;
        const c_field_names = c_struct.field_names;

        if (z_field_names.len != c_field_names.len) {
            @compileError(std.fmt.comptimePrint(
                "Field count mismatch for {s}: Zig fields = {d}, C fields = {d}",
                .{ @typeName(Zig), z_field_names.len, c_field_names.len },
            ));
        }

        inline for (z_field_names, c_field_names) |zn, cn| {
            const z_off = @offsetOf(Zig, zn);
            const c_off = @offsetOf(C, cn);

            if (z_off != c_off) {
                @compileError(std.fmt.comptimePrint(
                    "Offset mismatch for {s}: Zig offset = {d}, C offset = {d}",
                    .{ @typeName(Zig), z_off, c_off },
                ));
            }
        }
    } else if (z_type_info == .@"enum" and c_type_info == .@"enum") {
        const z_enum = z_type_info.@"enum";
        const c_enum = c_type_info.@"enum";
        const z_field_names = z_enum.field_names;
        const c_field_names = c_enum.field_names;

        inline for (z_field_names, c_field_names, 0..) |zn, cn, i| {
            _ = zn;
            _ = cn;
            _ = i;
        }
    }
}

pub inline fn method(obj: anytype, comptime group: []const u8, comptime name: []const u8) @TypeOf(@field(@field(obj.*.pVtbl.*, group), name).?) {
    return @field(@field(obj.*.pVtbl.*, group), name).?;
}

// I know this is janky. I'm sorry. I've just been doing this so long I want to be done already. I don't know why zig doesn't let you do this easier.
pub fn methodHelper(comptime Self: type, comptime group: []const u8) blk: {
    const Raw = @typeInfo(@FieldType(Self, "raw")).pointer.child;
    const Vtbl = @typeInfo(@FieldType(Raw, "pVtbl")).pointer.child;
    const GroupT = @FieldType(Vtbl, group);

    break :blk @TypeOf(struct {
        pub fn call(self: *const Self, comptime name: []const u8) @typeInfo(@FieldType(GroupT, name)).optional.child {
            return @field(@field(self.raw.*.pVtbl.*, group), name).?;
        }
    }.call);
} {
    const Raw = @typeInfo(@FieldType(Self, "raw")).pointer.child;
    const Vtbl = @typeInfo(@FieldType(Raw, "pVtbl")).pointer.child;
    const GroupT = @FieldType(Vtbl, group);

    return struct {
        pub fn call(self: *const Self, comptime name: []const u8) @typeInfo(@FieldType(GroupT, name)).optional.child {
            return @field(@field(self.raw.*.pVtbl.*, group), name).?;
        }
    }.call;
}

pub fn baseHelper(comptime From: type, comptime To: type) fn (From) To {
    return struct {
        fn convert(from: From) To {
            return .{ .raw = @ptrCast(from.raw) };
        }
    }.convert;
}

fn camel(comptime name: []const u8) []const u8 {
    comptime {
        var buf: [name.len]u8 = undefined;
        @memcpy(&buf, name);
        buf[0] = std.ascii.toLower(buf[0]);
        const final = buf;
        return &final;
    }
}

pub fn ensureMethodsImplemented(
    comptime Self: type,
    comptime group: []const u8,
    comptime skipped: []const []const u8,
) void {
    const Raw = @typeInfo(@FieldType(Self, "raw")).pointer.child;
    const Vtbl = @typeInfo(@FieldType(Raw, "pVtbl")).pointer.child;
    const GroupT = @FieldType(Vtbl, group);

    inline for (std.meta.fieldNames(GroupT)) |c_name| {
        const is_skipped = for (skipped) |s| {
            if (std.mem.eql(u8, s, c_name)) break true;
        } else false;

        if (!is_skipped and !@hasDecl(Self, camel(c_name))) {
            @compileError(std.fmt.comptimePrint(
                "{s}: vtable method '{s}' has no wrapper '{s}' (add it or list it as skipped)",
                .{ @typeName(Self), c_name, camel(c_name) },
            ));
        }
    }
}

pub fn ensureHandle(comptime Self: type) void {
    if (@sizeOf(Self) != @sizeOf(*anyopaque) or @alignOf(Self) != @alignOf(*anyopaque))
        @compileError(@typeName(Self) ++ " must be layout-identical to a single pointer");
}

pub fn objectMethods(comptime Self: type) type {
    return struct {
        pub fn addRef(self: Self) void {
            method(self.raw, "Object", "AddRef")(@ptrCast(self.raw));
        }
        pub fn release(self: Self) void {
            _ = method(self.raw, "Object", "Release")(@ptrCast(self.raw));
        }
    };
}
