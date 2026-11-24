// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const zlua = @import("zlua");
const Host = @import("Host.zig");
const Uri = @import("../../core/Uri.zig");
const Filesystem = @import("../../filesystem/Filesystem.zig");

pub const require_cache_key = "__require_cache";

/// Used to detect cyclic requires.
var require_chain: u8 = 0;

const Diagnostic = struct {
    buf: [1024]u8 = undefined,
    msg: []const u8 = "Require failed",

    pub fn err(self: *Diagnostic, comptime fmt: []const u8, args: anytype) error{RequireFailed} {
        self.msg = std.mem.printSentinel(&self.buf, fmt, args, 0) catch "Require failed (message too long)";
        return error.RequireFailed;
    }
};

// `doRequire` is a separate function because we need
// to make sure we clean up before Lua does a scawy longjump.
pub fn require(l: *zlua.Lua) i32 {
    var diagnostic: Diagnostic = .{};
    doRequire(l, &diagnostic) catch
        l.raiseErrorStr("%s", .{diagnostic.msg.ptr});

    return 1;
}

fn doRequire(l: *zlua.Lua, diagnostic: *Diagnostic) !void {
    const path = l.checkString(1);
    const host: *Host = .fromState(l);
    const cache = zlua.Lua.upvalueIndex(1);

    // Handle builtins first
    if (path.len > 0 and path[0] == '@') {
        if (l.getField(cache, path) != .nil) return;
        l.pop(1);
    }

    var arena: std.heap.ArenaAllocator = .init(l.allocator());
    defer arena.deinit();
    const allocator = arena.allocator();

    const uri = try resolve(allocator, host, getCallerChunkname(l), path, diagnostic);
    const key = try allocator.dupeSentinel(u8, uri, 0);

    switch (l.getField(cache, key)) {
        .nil => l.pop(1),
        .light_userdata => return diagnostic.err("cylic require of module '{s}'", .{uri}),
        else => return, // Module existed on cache, it's on the stack.
    }

    l.pushLightUserdata(&require_chain);
    l.setField(cache, key);
    errdefer {
        l.pushNil();
        l.setField(cache, key);
    }

    try loadModule(l, host, allocator, key, diagnostic);
    l.pushValue(-1);
    l.setField(cache, key);
}

fn resolve(
    allocator: std.mem.Allocator,
    host: *Host,
    caller: ?[]const u8,
    path: [:0]const u8,
    diagnostic: *Diagnostic,
) ![]const u8 {
    if (path.len == 0) return diagnostic.err("`require()` does not accept empty paths", .{});
    if (std.mem.find(u8, path, "://") != null) return diagnostic.err("require() uses modules paths, not URIs! '{s}'", .{path});

    const clr = caller orelse return diagnostic.err("The path '{s}' cannot be resolved unless the caller module is known.", .{path});
    const caller_uri = Uri.parse(clr) catch return diagnostic.err("Caller chunk '{s}' isn't a URI", .{clr});

    const base = if (std.mem.startsWith(u8, path, "./") or std.mem.startsWith(u8, path, "../")) blk: {
        const dir = if (std.mem.findScalarLast(u8, caller_uri.path, '/')) |i| caller_uri.path[0..i] else "";
        const joined = try allocator.print("{s}/{s}", .{ dir, path });
        const out = try allocator.alloc(u8, joined.len);
        const normalized = Filesystem.path.normalize(joined, out) catch
            return diagnostic.err("require path '{s}' cannot leave package root", .{path});
        const result = try allocator.print("{s}://{s}", .{ caller_uri.scheme, normalized });

        if (host.packages.getOwner(result) != host.packages.getOwner(clr))
            return diagnostic.err("require path '{s}' cannot leave package root", .{path});

        break :blk result;
    } else if (path[0] == '@') blk: {
        const slash_pos = std.mem.findScalar(u8, path, '/');
        const alias = path[1 .. slash_pos orelse path.len];
        const final = if (slash_pos) |p| path[p + 1 ..] else "";

        const pkg = host.packages.getOwner(clr) orelse
            return diagnostic.err("no package owns require path '{s}'", .{clr});
        const root = pkg.getDependency(alias) orelse
            return diagnostic.err("unknown alias '@{s}' (not a builtin module or a dependency of package '{s}')", .{ alias, pkg.id });

        const joined_path = try allocator.print("{s}/{s}", .{ root, final });
        break :blk try getCanonicalPath(allocator, joined_path, root, diagnostic);
    } else return diagnostic.err("error requiring '{s}': require paths must start with './', '../' or '@'", .{path});

    return findFile(allocator, host, base, diagnostic);
}

fn getCanonicalPath(allocator: std.mem.Allocator, uri: []const u8, root: []const u8, diagnostic: *Diagnostic) ![]const u8 {
    const u = Uri.parse(uri) catch
        return diagnostic.err("invalid module path '{s}'", .{uri});

    const out = try allocator.alloc(u8, u.path.len);
    const norm = Filesystem.path.normalize(u.path, out) catch
        return diagnostic.err("'{s}' escapes its package", .{uri});

    const result = try allocator.print("{s}://{s}", .{ u.scheme, norm });
    if (!std.mem.startsWith(u8, result, root))
        return diagnostic.err("'{s}' cannot escape its package", .{uri});

    return result;
}

fn findFile(allocator: std.mem.Allocator, host: *Host, base: []const u8, diagnostic: *Diagnostic) ![]const u8 {
    inline for (.{ ".luau", "/init.luau" }) |suffix| {
        const p = try allocator.print("{s}" ++ suffix, .{base});
        if (host.filesystem.exists(p) catch false) return p;
    }

    return diagnostic.err("module '{s}' not found (checked for {s}.luau and {s}/init.luau)", .{ base, base, base });
}

fn loadModule(l: *zlua.Lua, host: *Host, allocator: std.mem.Allocator, uri: [:0]const u8, diagnostic: *Diagnostic) !void {
    const src = host.filesystem.read(allocator, uri) catch |e|
        return diagnostic.err("failed to load module '{s}': {t}", .{ uri, e });

    const bytecode = try zlua.compile(allocator, src, .{});
    if (bytecode.len > 0 and bytecode[0] == 0)
        return diagnostic.err("{s}", .{bytecode[1..]});

    const main = l.mainThread();
    const t = main.newThread();
    const t_ref = main.ref(-1);
    main.pop(1);
    defer main.unref(t_ref);
    t.sandboxThread();

    const chunk = try allocator.printSentinel("={s}", .{uri}, 0);
    const base = t.getTop();
    t.loadBytecode(chunk, bytecode) catch
        return diagnostic.err("failed to load '{s}'", .{uri});

    t.protectedCall(.{ .args = 0, .results = zlua.mult_return }) catch
        return diagnostic.err("{s}", .{t.toString(-1) catch "unknown error in module"});

    const num_results = t.getTop() - base;
    if (num_results != 1)
        return diagnostic.err("module {s} must return exactly one value, got {d} instead", .{ uri, num_results });

    if (t.isNil(-1)) return diagnostic.err("module {s} must return a non-nil value", .{uri});
    t.xMove(l, 1);
}

fn getCallerChunkname(l: *zlua.Lua) ?[]const u8 {
    var info: zlua.DebugInfo = .{};
    l.getInfo(1, .{ .s = true }, &info);
    const src = info.source;
    if (src.len > 0 and src[0] == '=') return src[1..];

    return null; // Not a module uri
}

pub fn invalidate(l: *zlua.Lua, uri: [:0]const u8) void {
    _ = l.getField(zlua.registry_index, require_cache_key);
    l.pushNil();
    l.setField(-2, uri);
    l.pop(1);
}
