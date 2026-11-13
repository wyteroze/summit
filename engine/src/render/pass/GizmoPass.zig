// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const gpu = @import("../../gpu/gpu.zig");
const resource = @import("../resource.zig");
const pass = @import("pass.zig");
const core = @import("../../core/core.zig");
const Gizmos = @import("../Gizmos.zig");
const math = core.math;

const initial_vertex_bytes = 4096 * @sizeOf(Gizmos.Vertex);

const GizmoPass = @This();
tested_pipeline: gpu.GpuDevice.GpuPipeline,
overlay_pipeline: gpu.GpuDevice.GpuPipeline,
shader: gpu.GpuDevice.GpuShader,
vs_ubuf: gpu.GpuDevice.GpuBuffer,
vbuf: gpu.GpuDevice.GpuBuffer,

fn makePipeline(
    device: *gpu.GpuDevice,
    shader: gpu.GpuDevice.GpuShader,
    name: [:0]const u8,
    depth_test: bool,
) !gpu.GpuDevice.GpuPipeline {
    return device.createPipeline(.{
        .name = name,
        .shader = shader.handle,
        .topology = .lines,
        .cull_mode = .none,
        .depth_format = .d32,
        .depth_write = false,
        .alpha_blend_enabled = true,
        .comparison_func = if (depth_test) .greater_equal else .always,
        .layout = &.{
            .{ .offset = 0, .format = .float3 }, // position
            .{ .offset = @offsetOf(Gizmos.Vertex, "color"), .format = .ubyte4_norm },
        },
        .resources = &.{
            .{ .name = "vsParams", .visibility = .vertex, .kind = .uniform_buffer },
        },
    });
}

pub fn init(device: *gpu.GpuDevice, shader: gpu.GpuDevice.GpuShader) !GizmoPass {
    return .{
        .tested_pipeline = try makePipeline(device, shader, "Gizmo pipeline (depth tested)", true),
        .overlay_pipeline = try makePipeline(device, shader, "Gizmo pipeline (overlay)", false),
        .shader = shader,
        .vs_ubuf = try device.createBuffer(.{
            .name = "Gizmo vs ubuf",
            .type = .uniform,
            .usage = .dynamic,
            .size = @sizeOf([2]math.Mat4),
        }),
        .vbuf = try device.createBuffer(.{
            .name = "Gizmo vertex buffer",
            .usage = .dynamic,
            .size = initial_vertex_bytes,
        }),
    };
}

pub fn deinit(self: *GizmoPass, allocator: std.mem.Allocator) void {
    self.tested_pipeline.deinit();
    self.overlay_pipeline.deinit();
    self.shader.deinit();
    self.vs_ubuf.deinit();
    self.vbuf.deinit();
    allocator.destroy(self);
}

fn execute(self: *GizmoPass, ctx: pass.PassContext) void {
    const tested = ctx.scene.gizmo_tested;
    const overlay = ctx.scene.gizmo_overlay;
    const total = tested.len + overlay.len;
    if (total == 0) return;

    const depth_handle = ctx.resources.get(resource.depth_buffer, .depth_target) orelse @panic("depth_buffer resource missing!");
    const color_handle = ctx.resources.get(resource.color_target, .render_target);

    const verts = ctx.frame_allocator.alloc(Gizmos.Vertex, total) catch return;
    @memcpy(verts[0..tested.len], tested);
    @memcpy(verts[tested.len..], overlay);
    self.vbuf.grow(@as(u32, @intCast(total)) * @sizeOf(Gizmos.Vertex)) catch |e| std.log.err("Failed to grow vbuf: {t}", .{e});
    self.vbuf.update(std.mem.sliceAsBytes(verts)) catch |e| std.log.err("{t}", .{e});

    const vs_params: [2][4][4]f32 = .{
        ctx.view.view_matrix.m,
        ctx.view.proj_matrix.m,
    };
    self.vs_ubuf.update(std.mem.asBytes(&vs_params)) catch |e| std.log.err("{t}", .{e});

    ctx.device.beginPass(.{
        .width = ctx.view.viewport_size[0],
        .height = ctx.view.viewport_size[1],
        .depth_target = depth_handle,
        .color_target = color_handle,
    });

    if (tested.len > 0) {
        self.tested_pipeline.apply();
        self.tested_pipeline.applyBindings(.{
            .vertex_buffers = .{ self.vbuf.handle, null, null, null },
            .resources = &.{
                .{ .name = "vsParams", .handle = .{ .uniform_buffer = self.vs_ubuf.handle } },
            },
        }) catch |e| std.log.err("Failed to apply pipeline bindings: {t}", .{e});
        self.tested_pipeline.draw(0, @intCast(tested.len), 1);
    }
    if (overlay.len > 0) {
        self.overlay_pipeline.apply();
        self.overlay_pipeline.applyBindings(.{
            .vertex_buffers = .{ self.vbuf.handle, null, null, null },
            .resources = &.{
                .{ .name = "vsParams", .handle = .{ .uniform_buffer = self.vs_ubuf.handle } },
            },
        }) catch |e| std.log.err("Failed to apply pipeline bindings: {t}", .{e});
        self.overlay_pipeline.draw(@intCast(tested.len), @intCast(overlay.len), 1);
    }
}

pub fn node(self: *GizmoPass) pass.PassNode {
    return .{
        .name = "GizmoPass",
        .reads = &.{ resource.depth_buffer, resource.color_target },
        .writes = &.{},
        .after = &.{"ForwardPass"},
        .ptr = self,
        .execute_fn = struct {
            fn c(ptr: *anyopaque, ctx: pass.PassContext) void {
                execute(@ptrCast(@alignCast(ptr)), ctx);
            }
        }.c,
        .deinit_fn = struct {
            fn c(ptr: *anyopaque, allocator: std.mem.Allocator) void {
                deinit(@ptrCast(@alignCast(ptr)), allocator);
            }
        }.c,
    };
}
