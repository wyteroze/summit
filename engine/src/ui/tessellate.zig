// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const types = @import("types.zig");
const render = @import("../render/render.zig");
const PainterMesh = render.types.PainterMesh;

pub fn tessellate(allocator: std.mem.Allocator, commands: []const types.PainterCommand, mesh: *PainterMesh) !void {
    mesh.clear();

    for (commands) |cmd| switch (cmd) {
        .line => |l| try appendLine(allocator, mesh, l),
        .rectangle => {}
    };
}

fn appendLine(allocator: std.mem.Allocator, mesh: *PainterMesh, l: types.PainterLine) !void {
    const dx = l.end.x - l.start.x;
    const dy = l.end.y - l.start.y;
    const len = @sqrt(dx*dx + dy*dy);

    if (len < 0.0001 or l.thickness <= 0) return;

    const half = l.thickness * 0.5;
    // This extra 1.0 is so that the fragment shader can have space to antialias edge pixels.
    const outer = half + 1.0;

    const nx = -dy / len * outer;
    const ny = dx / len * outer;

    const color = l.color.srgbDecode().toArr();
    const base: u32 = @intCast(mesh.vertices.items.len);

    try mesh.vertices.appendSlice(allocator, &.{
        .{ .pos = .{ l.start.x + nx, l.start.y + ny }, .uv = .{ half,  outer }, .color = color },
        .{ .pos = .{ l.end.x   + nx, l.end.y   + ny }, .uv = .{ half,  outer }, .color = color },
        .{ .pos = .{ l.end.x   - nx, l.end.y   - ny }, .uv = .{ half, -outer }, .color = color },
        .{ .pos = .{ l.start.x - nx, l.start.y - ny }, .uv = .{ half, -outer }, .color = color },
    });
    try mesh.indices.appendSlice(allocator, &.{
        base, base+1, base+2,
        base, base+2, base+3
    });
}