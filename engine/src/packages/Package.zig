// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
//! Package information

const std = @import("std");

const Package = @This();
/// Package ID, like `net.summitengine.core`
id: []const u8,
/// The package root, like "asset://net.summitengine.editor"
root: []const u8,
/// Map of aliases to dependency's root URI (like `foo = { path = "../foo" }` in the toml)
dependencies: std.StringHashMap([]const u8),

/// Initializes a package. The `Package` itself is heap allocated,
/// and `root` + `id` are duped too, so you may free the original strings.
pub fn init(allocator: std.mem.Allocator, id: []const u8, root: []const u8) !*Package {
    const self = try allocator.create(Package);
    errdefer allocator.destroy(self);
    const id_dupe = try allocator.dupe(u8, id);
    errdefer allocator.free(id_dupe);
    const root_dupe = try allocator.dupe(u8, root);

    self.* = .{ .id = id_dupe, .root = root_dupe, .dependencies = .init(allocator) };
    return self;
}

pub fn deinit(self: *Package, allocator: std.mem.Allocator) void {
    var it = self.dependencies.iterator();
    while (it.next()) |e| {
        allocator.free(e.key_ptr.*);
        allocator.free(e.value_ptr.*);
    }
    self.dependencies.deinit();
    allocator.free(self.id);
    allocator.free(self.root);
    allocator.destroy(self);
}

/// Returns if `uri` exsits inside of this package.
pub fn contains(self: *const Package, uri: []const u8) bool {
    if (!std.mem.startsWith(u8, uri, self.root)) return false;
    if (uri.len == self.root.len) return true;
    return self.root[self.root.len - 1] == '/' or uri[self.root.len] == '/';
}

/// Adds a dependency to this package. The alias and root are duped, so you may free the original strings.
pub fn addDependency(self: *Package, allocator: std.mem.Allocator, alias: []const u8, root: []const u8) !void {
    if (self.dependencies.contains(alias)) return error.DuplicateDependencyAlias;
    const alias_dupe = try allocator.dupe(u8, alias);
    errdefer allocator.free(alias_dupe);
    const root_dupe = try allocator.dupe(u8, root);
    errdefer allocator.free(root_dupe);

    try self.dependencies.put(alias_dupe, root_dupe);
}

pub fn removeDependency(self: *Package, allocator: std.mem.Allocator, alias: []const u8) !void {
    const dep = self.dependencies.fetchRemove(alias) orelse
        return error.DependencyDoesntExist;

    allocator.free(dep.key);
    allocator.free(dep.value);
}

pub fn getDependency(self: *Package, alias: []const u8) ?[]const u8 {
    return self.dependencies.get(alias);
}
