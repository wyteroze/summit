// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const desc = @import("../desc.zig");
const types = @import("../types.zig");
const diligent = @import("diligent");
const graphics = diligent.graphics;
const primitives = diligent.primitives;
const build_opts = @import("build_options");

fn summitFilterToDiligent(filter: types.FilterType) graphics.types.FilterType {
    return switch (filter) {
        .linear => .linear,
        .nearest => .point,
    };
}

fn summitComparisonFuncToDiligent(func: types.ComparisonFunc) graphics.types.ComparisonFunction {
    return switch (func) {
        .less => .less,
        .less_equal => .less_equal,
        .greater => .greater,
        .greater_equal => .greater_equal,
        .always => .always,
        .never => .never,
        .equal => .equal,
        .not_equal => .not_equal,
    };
}

fn summitWrapToDiligent(wrap: types.WrapType) graphics.types.TextureAddressMode {
    return switch (wrap) {
        .clamp => .clamp,
        .repeat => .wrap,
    };
}

fn summitPixelFormatToDiligent(format: types.PixelFormat) graphics.types.TextureFormat {
    return switch (format) {
        .rgba8 => .rgba8_unorm_srgb,
        .rgba16f => .rgba16_float,
        .d24_s8 => .d24_unorm_s8_uint,
        .d32 => .d32_float,
        .r8_unorm => .r8_unorm,
        .bgra8 => .bgra8_unorm,
    };
}

fn summitVisibilityToDiligent(vis: desc.ResourceVisibility) graphics.types.ShaderType {
    return switch (vis) {
        .vertex => .{ .vertex = true },
        .fragment => .{ .pixel = true },
        .compute => .{ .compute = true },
        .vertex_fragment => .{ .vertex = true, .pixel = true },
    };
}

fn summitShaderStageToDiligent(stage: desc.ShaderStage) graphics.types.ShaderType {
    return switch (stage) {
        .vertex => .{ .vertex = true },
        .fragment => .{ .pixel = true },
        .compute => .{ .compute = true },
    };
}

/// Caller owns the returned slice
fn buildResourceVars(
    allocator: std.mem.Allocator,
    resources: []const desc.ResourceDesc,
) ![]graphics.types.ShaderResourceVariableDesc {
    const vars = try allocator.alloc(graphics.types.ShaderResourceVariableDesc, resources.len);
    errdefer allocator.free(vars);

    for (resources, vars) |r, *v| v.* = .{
        .shader_stages = summitVisibilityToDiligent(r.visibility),
        .name = r.name.ptr,
        .type = .dynamic,
    };

    return vars;
}

// For ShaderHandle
const Shader = struct {
    vs: ?graphics.Shader = null,
    ps: ?graphics.Shader = null,
    cs: ?graphics.Shader = null,

    fn release(self: *Shader) void {
        if (self.vs) |s| s.release();
        if (self.ps) |s| s.release();
        if (self.cs) |s| s.release();
        self.* = .{};
    }

    fn fromHandle(h: types.ShaderHandle) *Shader {
        return @ptrCast(@alignCast(h));
    }
};

// For PipelineHandle
const Pipeline = struct {
    pso: graphics.PipelineState,
    srb: graphics.ShaderResourceBinding,
    index_type: graphics.types.ValueType,
    has_index_buffer: bool = false,

    fn fromHandle(h: types.PipelineHandle) *Pipeline {
        return @ptrCast(@alignCast(h));
    }
};

const engine = switch (build_opts.backend) {
    .vulkan => graphics.engines.GraphicsEngineVulkan,
    .d3d11 => graphics.engines.GraphicsEngineD3D11,
    .d3d12 => graphics.engines.GraphicsEngineD3D12,
    .gl => graphics.engines.GraphicsEngineOpenGL,
};

comptime {
    if (build_opts.backend == .gl) @compileError("GL backend isn't currently supported. It'll be fixed later.");
}

const DiligentBackend = @This();
factory: graphics.EngineFactory,
device: graphics.RenderDevice,
context: graphics.DeviceContext,
alloc: *primitives.MemoryAllocator.ZigAllocator,

pub fn init(allocator: std.mem.Allocator) !DiligentBackend {
    const zig_alloc = try allocator.create(primitives.MemoryAllocator.ZigAllocator);
    errdefer allocator.destroy(zig_alloc);
    zig_alloc.* = .init(allocator);

    var factory = try engine.loadAndGetFactory(zig_alloc);
    const device, const context = try factory.createDeviceAndContexts(.{});

    return .{
        .factory = factory.asBase(),
        .device = device,
        .context = context,
        .alloc = zig_alloc,
    };
}

pub fn deinit(self: *DiligentBackend) void {
    self.context.flush();
    self.context.waitForIdle();
    self.context.release();
    self.device.release();
    self.alloc.allocator.destroy(self.alloc);
}

// Buffer

pub fn createBuffer(self: *DiligentBackend, d: desc.BufferDesc) !types.BufferHandle {
    if (d.type == .storage and d.stride == 0)
        return error.InvalidStride;

    const size = if (d.data) |data| data.len else d.size;

    const b = try self.device.createBuffer(.{
        .name = d.name,
        .size = size,
        .bind_flags = switch (d.type) {
            .index => .{ .index_buffer = true },
            .vertex => .{ .vertex_buffer = true },
            .uniform => .{ .uniform_buffer = true },
            .storage => .{ .shader_resource = true, .unordered_access = true },
        },
        .usage = switch (d.usage) {
            .default => .default,
            .immutable => .immutable,
            .dynamic, .stream => .dynamic,
            .readback => .staging,
        },
        .cpu_access_flags = switch (d.usage) {
            .default, .immutable => .{},
            .dynamic, .stream => .{ .write = true },
            .readback => .{ .read = true },
        },
        .element_byte_stride = d.stride,
        .buffer_mode = if (d.type == .storage) .structured else .undefined,
    }, if (d.data) |data| .{
        .data = data.ptr,
        .data_size = data.len,
    } else null);

    return @ptrCast(b.raw);
}

pub fn updateBuffer(self: *DiligentBackend, h: types.BufferHandle, data: []const u8) !void {
    const buffer: graphics.Buffer = .{ .raw = @ptrCast(@alignCast(h)) };
    const d = buffer.getDesc();

    switch (d.usage) {
        .default => self.context.updateBuffer(buffer, 0, data, .transition),
        .dynamic => {
            const mapped = self.context.mapBuffer(buffer, .write, .{ .discard = true }) orelse return error.BufferMapFailed;
            defer self.context.unmapBuffer(buffer, .write);

            const dest: [*]u8 = @ptrCast(mapped);
            @memcpy(dest[0..data.len], data);
        },
        .staging => {
            if (!d.cpu_access_flags.write) return error.BufferNotWritable;

            const mapped = self.context.mapBuffer(buffer, .write, .{}) orelse return error.BufferMapFailed;
            defer self.context.unmapBuffer(buffer, .write);

            const dest: [*]u8 = @ptrCast(mapped);
            @memcpy(dest[0..data.len], data);
        },
        .immutable => return error.UnableToUpdateImmutableBuffer,
        .unified, .sparse => return error.UnsupportedBufferUsage,
    }
}

pub fn destroyBuffer(_: *DiligentBackend, h: types.BufferHandle) void {
    const buffer: graphics.Buffer = .{ .raw = @ptrCast(@alignCast(h)) };
    buffer.release();
}

// Sampler

pub fn createSampler(self: *DiligentBackend, d: desc.SamplerDesc) !types.SamplerHandle {
    const sampler = try self.device.createSampler(.{
        .min_filter = summitFilterToDiligent(d.min_filter),
        .mag_filter = summitFilterToDiligent(d.mag_filter),
        .mip_filter = summitFilterToDiligent(d.mip_filter),
        .address_u = summitWrapToDiligent(d.wrap_u),
        .address_v = summitWrapToDiligent(d.wrap_v),
    });

    return @ptrCast(sampler.raw);
}

pub fn destroySampler(_: DiligentBackend, h: types.SamplerHandle) void {
    const sampler: graphics.Sampler = .{ .raw = @ptrCast(@alignCast(h)) };
    sampler.release();
}

// Image

pub fn createImage(self: *DiligentBackend, d: desc.ImageDesc) !types.ImageHandle {
    const is_depth = switch (d.format) {
        .d24_s8, .d32 => true,
        else => false,
    };

    const stride: u64 = switch (d.format) {
        .bgra8, .rgba8, .d24_s8, .d32 => 4,
        .rgba16f => 8,
        .r8_unorm => 1,
    };

    const dynamic = is_depth or d.is_render_target;

    const tex_desc: graphics.types.TextureDesc = .{
        .name = d.name,
        .type = if (d.is_cubemap) .tex_cube else .tex_2d,
        .array_size_or_depth = .{ .array_size = if (d.is_cubemap) 6 else 1 },
        .width = d.width,
        .height = d.height,
        .mip_levels = 1,
        .format = summitPixelFormatToDiligent(d.format),
        .bind_flags = .{
            .shader_resource = true,
            .depth_stencil = is_depth,
            .render_target = d.is_render_target,
        },
        .usage = if (dynamic) .default else .immutable,
    };

    const row_stride = @as(u64, d.width) * stride;

    var subres: [6]graphics.types.TextureSubresData = undefined;

    const tex_data: ?graphics.types.TextureData = blk: {
        if (dynamic) break :blk null;
        const bytes = d.data orelse return error.MissingImageData;

        if (d.is_cubemap) {
            const face_size = row_stride * d.height;
            if (bytes.len < face_size * 6) return error.ImageDataTooSmall;

            for (&subres, 0..) |*s, face| {
                s.* = .{
                    .data = bytes.ptr + face * face_size,
                    .stride = row_stride,
                };
            }

            break :blk .{
                .sub_resources = &subres,
                .num_subresources = 6,
            };
        } else {
            if (bytes.len < row_stride * d.height) return error.ImageDataTooSmall;

            subres[0] = .{ .data = bytes.ptr, .stride = row_stride };
            break :blk .{
                .sub_resources = &subres,
                .num_subresources = 1,
            };
        }
    };

    const image = try self.device.createTexture(tex_desc, tex_data);
    return @ptrCast(image.raw);
}

pub fn destroyImage(_: DiligentBackend, h: types.ImageHandle) void {
    const texture: graphics.Texture = .{ .raw = @ptrCast(@alignCast(h)) };
    texture.release();
}

// Pipeline

pub fn createPipeline(self: *DiligentBackend, d: desc.PipelineDesc) !types.PipelineHandle {
    const allocator = self.alloc.allocator;
    if (d.index_type == .none) return error.InvalidIndexType;

    const shader: *Shader = .fromHandle(d.shader);

    var gp: graphics.types.GraphicsPipelineDesc = .{};
    gp.rasterizer_desc.cull_mode = switch (d.cull_mode) {
        .none => .none,
        .front => .front,
        .back => .back,
    };

    gp.blend_desc.render_targets[0].render_target_write_mask = .{
        .red = d.color_write_mask.red,
        .green = d.color_write_mask.green,
        .blue = d.color_write_mask.blue,
        .alpha = d.color_write_mask.alpha,
    };

    gp.depth_stencil_desc.depth_func = summitComparisonFuncToDiligent(d.comparison_func);

    if (d.depth_format) |df| {
        gp.dsv_format = summitPixelFormatToDiligent(df);
        gp.depth_stencil_desc.depth_enable = d.depth_write;
        gp.depth_stencil_desc.depth_write_enable = d.depth_write;
    } else {
        gp.dsv_format = .unknown;
        gp.depth_stencil_desc.depth_enable = false;
        gp.depth_stencil_desc.depth_write_enable = false;
    }

    if (d.color_format) |cf| {
        gp.num_render_targets = 1;
        gp.rtv_formats[0] = summitPixelFormatToDiligent(cf);
    } else {
        gp.num_render_targets = 0;
        gp.rtv_formats[0] = .unknown;
    }

    if (d.alpha_blend_enabled) {
        const rt0 = &gp.blend_desc.render_targets[0];
        rt0.blend_enable = true;
        rt0.src_blend = .src_alpha;
        rt0.dest_blend = .inv_src_alpha;
        rt0.src_blend_alpha = .src_alpha;
        rt0.dest_blend_alpha = .inv_src_alpha;
    }

    // Input layout
    const layout_elems = try allocator.alloc(graphics.types.LayoutElement, d.layout.len);
    defer allocator.free(layout_elems);

    for (d.layout, layout_elems, 0..) |attr, *elem, i| {
        elem.* = .{
            .input_index = @intCast(i),
            .buffer_slot = 0,
            .num_components = switch (attr.format) {
                .float2 => 2,
                .float3 => 3,
                .float4, .ubyte4_norm => 4,
            },
            .value_type = if (attr.format == .ubyte4_norm) .uint8 else .float32,
            .is_normalized = attr.format == .ubyte4_norm,
            .relative_offset = @intCast(attr.offset),
        };
    }

    gp.input_layout = .{
        .layout_elements = layout_elems.ptr,
        .num_elements = @intCast(layout_elems.len),
    };

    gp.primitive_topology = switch (d.topology) {
        .tris => .triangle_list,
        .lines => .line_list,
    };

    // Resource layout
    const vars = try buildResourceVars(allocator, d.resources);
    defer allocator.free(vars);

    const pso = try self.device.createGraphicsPipelineState(.{
        .base = .{
            .pso_desc = .{
                .name = d.name,
                .pipeline_type = .graphics,
                .resource_layout = .{
                    .variables = vars.ptr,
                    .num_variables = @intCast(vars.len),
                },
            },
        },
        .graphics_pipeline = gp,
        .vertex_shader = if (shader.vs) |s| s.raw else null,
        .pixel_shader = if (shader.ps) |s| s.raw else null,
    });
    errdefer pso.release();

    const srb = try pso.createShaderResourceBinding(true);
    errdefer srb.release();

    const pipeline = try allocator.create(Pipeline);
    pipeline.* = .{
        .pso = pso,
        .srb = srb,
        .index_type = switch (d.index_type) {
            .uint16 => .uint16,
            .uint32 => .uint32,
            .none => unreachable,
        },
    };

    return @ptrCast(pipeline);
}

pub fn destroyPipeline(self: *DiligentBackend, h: types.PipelineHandle) void {
    const pipeline: *Pipeline = .fromHandle(h);
    pipeline.srb.release();
    pipeline.pso.release();
    self.alloc.allocator.destroy(pipeline);
}

pub fn applyPipeline(self: *DiligentBackend, h: types.PipelineHandle) void {
    const pipeline: *Pipeline = .fromHandle(h);
    self.context.setPipelineState(pipeline.pso);
}

pub fn drawPipeline(self: *DiligentBackend, h: types.PipelineHandle, base: u32, count: u32, instances: u32) void {
    const pipeline: *Pipeline = .fromHandle(h);

    if (pipeline.has_index_buffer) {
        self.context.drawIndexed(.{
            .index_type = pipeline.index_type,
            .num_indices = count,
            .first_index_location = base,
            .num_instances = instances,
            .flags = .verify_all,
        });
    } else {
        self.context.draw(.{
            .num_vertices = count,
            .start_vertex_location = base,
            .num_instances = instances,
            .flags = .verify_all,
        });
    }
}

pub fn applyPipelineBindings(self: *DiligentBackend, h: types.PipelineHandle, bindings: desc.Bindings) void {
    const pipeline: *Pipeline = .fromHandle(h);

    var vbufs: [4]graphics.Buffer = undefined;
    var offsets: [4]u64 = @splat(0);
    var num_buffers: u32 = 0;

    for (bindings.vertex_buffers) |vb| {
        const ptr = vb orelse continue;
        vbufs[num_buffers] = .{ .raw = @ptrCast(@alignCast(ptr)) };
        num_buffers += 1;
    }

    self.context.setVertexBuffers(0, vbufs[0..num_buffers], offsets[0..num_buffers], .transition, .{ .reset = true });

    if (bindings.index_buffer) |index_buffer| {
        const ib: graphics.Buffer = .{ .raw = @ptrCast(@alignCast(index_buffer)) };
        self.context.setIndexBuffer(ib, 0, .transition);
        pipeline.has_index_buffer = true;
    } else {
        pipeline.has_index_buffer = false;
    }

    for (bindings.resources) |res| {
        const vari: graphics.ShaderResourceVariable = pipeline.srb.getVariableByName(.{ .vertex = true }, res.name) orelse
            pipeline.srb.getVariableByName(.{ .pixel = true }, res.name) orelse {
            std.log.warn("No variable named '{s}'!", .{res.name});
            continue;
        };

        switch (res.handle) {
            .uniform_buffer => |ub| {
                const buf: graphics.Buffer = .{ .raw = @ptrCast(@alignCast(ub)) };
                vari.set(buf.asDeviceObject(), .{});
            },
            .storage_buffer => |sb| {
                const buf: graphics.Buffer = .{ .raw = @ptrCast(@alignCast(sb)) };
                vari.set(buf.getDefaultView(.shader_resource).asDeviceObject(), .{});
            },
            .storage_buffer_rw => |sb| {
                const buf: graphics.Buffer = .{ .raw = @ptrCast(@alignCast(sb)) };
                vari.set(buf.getDefaultView(.unordered_access).asDeviceObject(), .{});
            },
            .texture => |tx| {
                const tex: graphics.Texture = .{ .raw = @ptrCast(@alignCast(tx)) };
                vari.set(tex.getDefaultView(.shader_resource).asDeviceObject(), .{});
            },
            .sampler => |sm| {
                const smp: graphics.Sampler = .{ .raw = @ptrCast(@alignCast(sm)) };
                vari.set(smp.asDeviceObject(), .{});
            },
        }
    }

    self.context.commitShaderResources(pipeline.srb, .transition);
}

// Compute pipeline

pub fn createComputePipeline(_: DiligentBackend, _: desc.ComputePipelineDesc) !types.ComputePipelineHandle {
    // std.debug.assert(d.resources.len <= 16);
    // var resource_buf: [16]c.SummitResourceDesc = undefined;
    // const resources = buildResourceDescs(&resource_buf, d.resources);

    // const pipe_h = c.diligent_create_compute_pipeline(self.handle, .{
    //     .name = d.name,
    //     .shader = .{ .ptr = d.shader.ptr },
    //     .resources = resources.ptr,
    //     .resources_len = resources.len,
    // });

    // return .{ .ptr = pipe_h.? };
    return @ptrFromInt(1);
}

pub fn applyComputePipeline(_: DiligentBackend, _: types.ComputePipelineHandle) void {
    // c.diligent_apply_compute_pipeline(self.handle, .{ .ptr = h });
}

pub fn dispatchCompute(_: DiligentBackend, _: types.ComputePipelineHandle, _: u32, _: u32, _: u32) void {
    // c.diligent_dispatch_compute(self.handle, .{ .ptr = h }, groups_x, groups_y, groups_z);
}

pub fn applyComputeBindings(_: DiligentBackend, _: types.ComputePipelineHandle, _: desc.Bindings) void {
    // std.debug.assert(d.resources.len <= 16);
    // var resource_buf: [16]c.SummitBoundResource = undefined;
    // const resources = buildBoundResources(&resource_buf, d.resources);

    // c.diligent_apply_compute_bindings(self.handle, .{ .ptr = h }, .{
    //     .vertex_buffers = @splat(.{ .ptr = @ptrFromInt(0) }),
    //     .index_buffer = .{ .ptr = @ptrFromInt(0) },
    //     .resources = resources.ptr,
    //     .resources_len = resources.len,
    // });
}

pub fn destroyComputePipeline(_: DiligentBackend, _: types.ComputePipelineHandle) void {
    // c.diligent_destroy_compute_pipeline(self.handle, .{ .ptr = h });
}

// Shader

pub fn createShader(self: *DiligentBackend, d: desc.ShaderDesc) !types.ShaderHandle {
    const shader = try self.alloc.allocator.create(Shader);
    errdefer self.alloc.allocator.destroy(shader);
    shader.* = .{};
    errdefer shader.release();

    for (d.stages) |stage| {
        const stage_type = summitShaderStageToDiligent(stage.stage);

        const created, const output = try self.device.createShader(.{
            .desc = .{
                .name = stage.name,
                .shader_type = stage_type,
                .use_combined_texture_samplers = false,
            },
            .source_language = .bytecode,
            .entry_point = stage.entrypoint,
            .byte_code = stage.source.ptr,
            .byte_code_size_or_source_length = .{ .byte_code_size = stage.source.len },
        });
        if (output) |o| o.release();

        if (stage_type.vertex) {
            if (shader.vs) |old| old.release();
            shader.vs = created;
        } else if (stage_type.pixel) {
            if (shader.ps) |old| old.release();
            shader.ps = created;
        } else if (stage_type.compute) {
            if (shader.cs) |old| old.release();
            shader.cs = created;
        } else {
            created.release();
            return error.UnsupportedShaderStage;
        }
    }

    return @ptrCast(shader);
}

pub fn destroyShader(self: *DiligentBackend, h: types.ShaderHandle) void {
    const shader: *Shader = .fromHandle(h);
    shader.release();
    self.alloc.allocator.destroy(shader);
}

// Pass

pub fn beginPass(_: DiligentBackend, _: desc.PassDesc) void {
    // c.diligent_begin_pass(self.handle, .{
    //     .width = d.width,
    //     .height = d.height,
    //     .clear_color = if (d.clear_color) |cc| cc.toArr() else undefined,
    //     .has_clear_color = d.clear_color != null,
    //     .clear_depth = d.clear_depth orelse undefined,
    //     .has_clear_depth = d.clear_depth != null,
    //     .depth_target = if (d.depth_target) |dt| .{ .ptr = dt.ptr } else undefined,
    //     .has_depth_target = d.depth_target != null,
    //     .color_target = if (d.color_target) |ct| .{ .ptr = ct.ptr } else undefined,
    //     .has_color_target = d.color_target != null,
    // });
}

pub fn endPass(_: DiligentBackend) void {
    // c.diligent_end_pass(self.handle);
}

// Swapchain

pub fn createSwapchain(self: DiligentBackend, d: desc.SwapchainDesc) !types.SwapchainHandle {
    // const swapchain_h = c.diligent_create_swapchain(self.handle, .{
    //     .surface_handle = d.surface_handle,
    //     .size = d.size,
    // });

    const factory: engine.Factory = .fromBase(self.factory);
    const swapchain = try factory.createSwapchain(self.device, self.context, .{
        .depth_buffer_format = .unknown,
        .width = d.size[0],
        .height = d.size[1],
    }, .init(d.surface_handle));

    // return .{ .ptr = swapchain_h.? };
    return @ptrCast(swapchain.raw);
}

pub fn resizeSwapchain(_: DiligentBackend, _: types.SwapchainHandle, _: [2]u32) void {
    // c.diligent_resize_swapchain(self.handle, .{ .ptr = h }, size[0], size[1]);
}

pub fn presentSwapchain(_: DiligentBackend, h: types.SwapchainHandle, vsync: bool) void {
    const swapchain: graphics.Swapchain = .{ .raw = @ptrCast(@alignCast(h)) };
    swapchain.present(if (vsync) 1 else 0);
}

pub fn getSwapchainBackbuffer(_: DiligentBackend, _: types.SwapchainHandle) types.RenderTargetHandle {
    // const backbuffer_h = c.diligent_get_swapchain_backbuffer(self.handle, .{ .ptr = h });
    // return .{ .ptr = backbuffer_h.? };
    return @ptrFromInt(1);
}

pub fn destroySwapchain(_: DiligentBackend, h: types.SwapchainHandle) void {
    const swapchain: graphics.Swapchain = .{ .raw = @ptrCast(@alignCast(h)) };
    swapchain.release();
}

// Misc

pub fn imageGetRtv(_: DiligentBackend, _: types.ImageHandle) types.RenderTargetHandle {
    // const rt_h = c.diligent_image_get_rtv(self.handle, .{ .ptr = h });
    // return .{ .ptr = rt_h.? };
    return @ptrFromInt(1);
}

pub fn imageGetDsv(_: DiligentBackend, _: types.ImageHandle) types.DepthTargetHandle {
    // const dt_h = c.diligent_image_get_dsv(self.handle, .{ .ptr = h });
    // return .{ .ptr = dt_h.? };
    return @ptrFromInt(1);
}

pub fn queryBackend(_: DiligentBackend) desc.Backend {
    // return switch (c.diligent_query_backend()) {
    //     c.SUMMIT_BACKEND_OPENGL => .opengl,
    //     c.SUMMIT_BACKEND_DIRECT3D11 => .direct3d11,
    //     c.SUMMIT_BACKEND_DIRECT3D12 => .direct3d12,
    //     c.SUMMIT_BACKEND_VULKAN => .vulkan,
    //     else => unreachable,
    // };
    return .vulkan;
}
