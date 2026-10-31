// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const gpu = @import("../../gpu/gpu.zig");
const RenderGraph = @import("../RenderGraph.zig");
const resource = @import("../resource.zig");
const pass = @import("pass.zig");
const core = @import("../../core/core.zig");
const Assets = @import("../../assets/Assets.zig");
const render_types = @import("../types.zig");
const text = @import("../text/text.zig");
const math = core.math;

const Active = enum { none, ui, painter };
const initial_vertex_bytes = 4096 * @sizeOf(render_types.PainterVertex);
const initial_index_bytes = 16384 * @sizeOf(u32);

const GpuUiParams = extern struct {
    ortho: [4][4]f32,
    pos: [2]f32,
    size: [2]f32,
    color: [4]f32,
    uv_pos: [2]f32,
    uv_size: [2]f32,
    is_text: u32,
    is_rounded: u32,
    _pad: [2]f32 = undefined,
    corner_radii: [4]f32,
    border_widths: [4]f32,
    border_color: [4]f32,
};

const GpuPainterParams = extern struct {
    ortho: [4][4]f32,
    origin: [2]f32,
    size: [2]f32,
    scale: f32,
    clip: u32,
    antialiased: u32,
    _pad: u32 = 0,

    comptime {
        std.debug.assert(@sizeOf(GpuPainterParams) == 96);
    }
};

const UiPass = @This();
ui_pipeline: gpu.GpuDevice.GpuPipeline,
ui_shader: gpu.GpuDevice.GpuShader,
ui_sampler: gpu.GpuDevice.GpuSampler,
ui_vs_ubuf: gpu.GpuDevice.GpuBuffer,
ui_quad: Assets.types.GpuMesh,

painter_pipeline: gpu.GpuDevice.GpuPipeline,
painter_shader: gpu.GpuDevice.GpuShader,
painter_vs_ubuf: gpu.GpuDevice.GpuBuffer,
painter_vbuf: gpu.GpuDevice.GpuBuffer,
painter_ibuf: gpu.GpuDevice.GpuBuffer,

pub fn init(device: *gpu.GpuDevice, ui_shader: gpu.GpuDevice.GpuShader, painter_shader: gpu.GpuDevice.GpuShader) !UiPass {
    const ui_pipeline = try device.createPipeline(.{
        .name = "Ui pipeline",
        .shader = ui_shader.handle,
        .cull_mode = .front,
        .depth_format = null,
        .depth_write = false,
        .alpha_blend_enabled = true,
        .layout = &.{
            .{ .offset = 0, .format = .float3 }, // pos
            .{ .offset = 12, .format = .float3 }, // normal
            .{ .offset = 24, .format = .float2 }, // uv
        },
        .resources = &.{
            .{ .name = "vsParams", .visibility = .vertex_fragment, .kind = .uniform_buffer },
            .{ .name = "atlasTexture", .visibility = .fragment, .kind = .texture },
            .{ .name = "atlasSampler", .visibility = .fragment, .kind = .sampler },
        },
        .index_type = .uint32,
    });
    const painter_pipeline = try device.createPipeline(.{
        .name = "Ui painter pipeline",
        .shader = painter_shader.handle,
        .cull_mode = .none,
        .depth_format = null,
        .depth_write = false,
        .alpha_blend_enabled = true,
        .layout = &.{
            .{ .offset = 0, .format = .float2 }, // pos
            .{ .offset = 8, .format = .float2 }, // uv
            .{ .offset = 16, .format = .float4 }, // color
        },
        .resources = &.{
            .{ .name = "vsParams", .visibility = .vertex_fragment, .kind = .uniform_buffer },
        },
        .index_type = .uint32,
    });

    return .{
        .ui_pipeline = ui_pipeline,
        .ui_shader = ui_shader,
        .ui_sampler = try device.createSampler(.{}),
        .ui_vs_ubuf = try device.createBuffer(.{
            .name = "Ui vs ubuf",
            .type = .uniform,
            .usage = .dynamic,
            .size = @sizeOf(GpuUiParams),
        }),
        .ui_quad = .{
            .vertex_buffer = try device.createBuffer(.{
                .name = "Ui quad vertex buffer",
                .data = std.mem.sliceAsBytes(([_]Assets.types.Vertex{
                    .{ .position = .{ 0.0, 0.0, 0.0 }, .normal = .{ 0, 0, 1 }, .uv = .{ 0, 0 } },
                    .{ .position = .{ 1.0, 0.0, 0.0 }, .normal = .{ 0, 0, 1 }, .uv = .{ 1, 0 } },
                    .{ .position = .{ 0.0, 1.0, 0.0 }, .normal = .{ 0, 0, 1 }, .uv = .{ 0, 1 } },
                    .{ .position = .{ 1.0, 1.0, 0.0 }, .normal = .{ 0, 0, 1 }, .uv = .{ 1, 1 } },
                })[0..]),
                .size = 4,
            }),
            .index_buffer = try device.createBuffer(.{
                .name = "Ui quad index buffer",
                .type = .index,
                .data = std.mem.sliceAsBytes(([_]u32{ 0, 2, 1, 1, 2, 3 })[0..]),
            }),
            .vertex_count = 4,
            .index_count = 6,
        },
        .painter_pipeline = painter_pipeline,
        .painter_shader = painter_shader,
        .painter_vs_ubuf = try device.createBuffer(.{
            .name = "Painter vs ubuf",
            .type = .uniform,
            .usage = .dynamic,
            .size = @sizeOf(GpuPainterParams),
        }),
        .painter_vbuf = try device.createBuffer(.{ .name = "Painter vertex buffer", .usage = .dynamic, .size = initial_vertex_bytes }),
        .painter_ibuf = try device.createBuffer(.{ .name = "Painter index buffer", .type = .index, .usage = .dynamic, .size = initial_index_bytes }),
    };
}

pub fn deinit(self: *UiPass, allocator: std.mem.Allocator) void {
    self.ui_pipeline.deinit();
    self.ui_shader.deinit();
    self.ui_sampler.deinit();
    self.ui_vs_ubuf.deinit();
    self.ui_quad.deinit();

    self.painter_pipeline.deinit();
    self.painter_shader.deinit();
    self.painter_vs_ubuf.deinit();
    self.painter_vbuf.deinit();
    self.painter_ibuf.deinit();

    allocator.destroy(self);
}

fn execute(self: *UiPass, ctx: pass.PassContext) void {
    const size = ctx.view.viewport_size;
    const scale = ctx.view.scale;
    const items = ctx.scene.ui_items;
    const ortho: math.Mat4 = .ortho(0, @floatFromInt(size[0]), @floatFromInt(size[1]), 0.0, -1.0, 1.0);

    const first_idx = ctx.frame_allocator.alloc(u32, items.len) catch @panic("Out of memory");
    {
        var vert_count: usize = 0;
        var idx_count: usize = 0;
        for (items) |itm| switch (itm) {
            .painter => |p| {
                vert_count += p.vertices.len;
                idx_count += p.indices.len;
            },
            else => {},
        };

        if (idx_count > 0) {
            const verts = ctx.frame_allocator.alloc(render_types.PainterVertex, vert_count) catch @panic("Out of memory");
            const idxs = ctx.frame_allocator.alloc(u32, idx_count) catch @panic("Out of memory");

            var v: usize = 0;
            var n: usize = 0;
            for (items, 0..) |item, i| switch (item) {
                .painter => |p| {
                    first_idx[i] = @intCast(n);
                    @memcpy(verts[v..][0..p.vertices.len], p.vertices);
                    for (p.indices, 0..) |idx, k| idxs[n + k] = idx + @as(u32, @intCast(v));

                    v += p.vertices.len;
                    n += p.indices.len;
                },
                else => {},
            };

            self.painter_vbuf.grow(vert_count * @sizeOf(render_types.PainterVertex));
            self.painter_ibuf.grow(idx_count * @sizeOf(u32));

            self.painter_vbuf.update(std.mem.sliceAsBytes(verts));
            self.painter_ibuf.update(std.mem.sliceAsBytes(idxs));
        }
    }

    ctx.device.beginPass(.{
        .clear_color = ctx.scene.clear_color,
        .color_target = ctx.resources.get(resource.color_target, .render_target),
        .width = size[0],
        .height = size[1],
    });

    const default_image_handle = ctx.resources.get(resource.default_image, .image) orelse @panic("default_image resource missing!");
    const default_sampler_handle = ctx.resources.get(resource.default_sampler, .sampler) orelse @panic("default_sampler resource missing!");

    var active: Active = .none;

    for (items, 0..) |item, i| switch (item) {
        .quad => |obj| {
            if (active != .ui) {
                self.ui_pipeline.apply();
                active = .ui;
            }

            const is_rounded = blk: {
                for (obj.corners) |c| {
                    if (c > 0) break :blk true;
                }

                break :blk false;
            };

            const vs_params: GpuUiParams = .{
                .ortho = ortho.m,
                .pos = .{ obj.pos[0] * scale, obj.pos[1] * scale },
                .size = .{ obj.size[0] * scale, obj.size[1] * scale },
                .color = obj.color.toArr(),
                .uv_pos = obj.uv_pos,
                .uv_size = obj.uv_size,
                .is_text = @intCast(@intFromBool(obj.is_text)),
                .is_rounded = @intCast(@intFromBool(is_rounded)),
                .corner_radii = blk: {
                    const vec: @Vector(4, f32) = obj.corners;
                    break :blk vec * @as(@Vector(4, f32), @splat(scale));
                },
                .border_widths = blk: {
                    const vec: @Vector(4, f32) = obj.borders;
                    break :blk vec * @as(@Vector(4, f32), @splat(scale));
                },
                .border_color = obj.border_color.toArr(),
            };

            self.ui_vs_ubuf.update(std.mem.asBytes(&vs_params));

            const texture_handle = obj.texture orelse default_image_handle;
            const sampler_handle = obj.sampler orelse default_sampler_handle;

            self.ui_pipeline.applyBindings(.{
                .vertex_buffers = .{ self.ui_quad.vertex_buffer.handle, null, null, null },
                .index_buffer = self.ui_quad.index_buffer.handle,
                .resources = &.{
                    .{ .name = "vsParams", .handle = .{ .uniform_buffer = self.ui_vs_ubuf.handle } },
                    .{ .name = "atlasTexture", .handle = .{ .texture = texture_handle } },
                    .{ .name = "atlasSampler", .handle = .{ .sampler = sampler_handle } },
                },
            });
            self.ui_pipeline.draw(0, self.ui_quad.index_count, 1);
        },
        .painter => |p| {
            if (p.indices.len == 0) continue;
            if (active != .painter) {
                self.painter_pipeline.apply();
                active = .painter;
            }

            const params: GpuPainterParams = .{
                .ortho = ortho.m,
                .origin = .{ p.origin[0] * scale, p.origin[1] * scale },
                .size = .{ p.size[0] * scale, p.size[1] * scale },
                .scale = scale,
                .clip = @intCast(@intFromBool(p.clip)),
                .antialiased = @intCast(@intFromBool(p.antialiased)),
            };
            self.painter_vs_ubuf.update(std.mem.asBytes(&params));

            self.painter_pipeline.applyBindings(.{
                .vertex_buffers = .{ self.painter_vbuf.handle, null, null, null },
                .index_buffer = self.painter_ibuf.handle,
                .resources = &.{
                    .{ .name = "vsParams", .handle = .{ .uniform_buffer = self.painter_vs_ubuf.handle } },
                },
            });
            self.painter_pipeline.draw(first_idx[i], @intCast(p.indices.len), 1);
        },
    };
}

pub fn node(self: *UiPass) pass.PassNode {
    return .{
        .name = "UiPass",
        .reads = &.{ resource.default_sampler, resource.default_image, resource.color_target },
        .writes = &.{},
        .after = &.{},
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
