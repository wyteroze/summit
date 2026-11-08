// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Backend = @import("Backend.zig").Backend;

const Os = @This();
backend: Backend,
package_id: []const u8,

pub fn init(proc_init: std.process.Init, pkg_id: []const u8) !Os {
    return .{ .backend = .init(proc_init, pkg_id), .package_id = pkg_id };
}

pub fn filesystem(self: *const Os) Filesystem {
    return .{ .os = self };
}

pub fn scheduling(self: *const Os) Scheduling {
    return .{ .os = self };
}

pub const Filesystem = struct {
    os: *const Os,

    pub fn getPersistPath(self: Filesystem, allocator: std.mem.Allocator) ![]const u8 {
        return self.os.backend.filesystem.getPersistPath(allocator);
    }

    pub fn getTempPath(self: Filesystem, allocator: std.mem.Allocator) ![]const u8 {
        return self.os.backend.filesystem.getTempPath(allocator);
    }

    pub fn getCachePath(self: Filesystem, allocator: std.mem.Allocator) ![]const u8 {
        return self.os.backend.filesystem.getCachePath(allocator);
    }
};

pub const Scheduling = struct {
    os: *const Os,

    /// Tier of a logical core.
    pub const CoreSize = enum {
        /// Performance core
        big,
        /// Unknown size (either no p/e cores on this device or we can't classify it)
        normal,
        /// Efficiency core
        small,
    };

    /// Priority of a thread.
    pub const ThreadPriority = enum {
        critical,
        high,
        normal,
        low,
        lowest,
    };

    /// Represents a logical CPU core.
    pub const Core = struct {
        id: usize,
        size: CoreSize,
    };

    /// Describes the core topology of a device.
    pub const CoreTopology = struct {
        /// All cores on the device
        cores: []Core,
        /// Indices into performance cores on the device
        performance_cores: []usize,
        /// Indices into efficiency cores on the device
        efficiency_cores: []usize,

        pub fn deinit(self: *const CoreTopology, allocator: std.mem.Allocator) void {
            allocator.free(self.cores);
            allocator.free(self.performance_cores);
            allocator.free(self.efficiency_cores);
        }
    };

    /// Gets the core topology of the device.
    pub fn getTopology(self: Scheduling, allocator: std.mem.Allocator) !CoreTopology {
        return self.os.backend.scheduling.getTopology(allocator);
    }

    /// Sets the priority of the calling thread.
    pub fn setThreadPriority(self: Scheduling, priority: ThreadPriority) void {
        return self.os.backend.scheduling.setThreadPriority(priority);
    }
};
