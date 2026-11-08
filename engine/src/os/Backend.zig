// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const builtin = @import("builtin");
const DarwinBackend = @import("backends/darwin/DarwinBackend.zig");
const WindowsBackend = @import("backends/windows/WindowsBackend.zig");
const LinuxBackend = @import("backends/linux/LinuxBackend.zig");

pub const Backend = if (builtin.os.tag.isDarwin())
    @import("backends/darwin/DarwinBackend.zig")
else switch (builtin.os.tag) {
    .windows => @import("backends/windows/WindowsBackend.zig"),
    .linux => @import("backends/linux/LinuxBackend.zig"),
    else => @compileError("unsupported OS"),
};
