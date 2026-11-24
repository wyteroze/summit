// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Filesystem = @import("../filesystem/Filesystem.zig");
const Package = @import("Package.zig");

const Packages = @This();
allocator: std.mem.Allocator,
filesystem: *Filesystem,
packages: std.StringHashMap(*Package),

pub fn init(allocator: std.mem.Allocator, filesystem: *Filesystem) Packages {
    return .{ .allocator = allocator, .filesystem = filesystem, .packages = .init(allocator) };
}

pub fn deinit(self: *Packages) void {
    var iter = self.packages.valueIterator();
    while (iter.next()) |pkg| pkg.*.deinit(self.allocator);
    self.packages.deinit();
}

pub fn getOwner(self: *Packages, uri: []const u8) ?*Package {
    var best_match: ?*Package = null;
    var iter = self.packages.valueIterator();
    while (iter.next()) |p| {
        const pkg = p.*;
        if (!pkg.contains(uri)) continue;
        if (best_match == null or pkg.root.len > best_match.?.root.len) best_match = pkg;
    }

    return best_match;
}

pub fn registerPackage(self: *Packages, id: []const u8, root: []const u8) !*Package {
    if (self.packages.contains(id)) return error.PackageAlreadyRegistered;
    const pkg = try Package.init(self.allocator, id, root);
    errdefer pkg.deinit(self.allocator);
    // Key is owned by the package
    try self.packages.put(pkg.id, pkg);
    return pkg;
}

pub fn unregisterPackage(self: *Packages, id: []const u8) !void {
    const kv = self.packages.fetchRemove(id) orelse return error.UnknownPackage;
    kv.value.deinit(self.allocator);
}
