const std = @import("std");

pub const ShaderModule = struct {
    /// Module name: `import <name>;`
    name: [:0]const u8,
    source: [:0]const u8,
};

pub const engine_modules = [_]ShaderModule{
    .{ .name = "lighting", .source = @embedFile("src/lighting.slang") },
};
