// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const gpu = @import("gpu.zig");
pub const BufferHandle = *opaque {};
pub const ImageHandle = *opaque {};
pub const ShaderHandle = *opaque {};
pub const PipelineHandle = *opaque {};
pub const ComputePipelineHandle = *opaque {};
pub const SamplerHandle = *opaque {};
pub const SwapchainHandle = *opaque {};
pub const RenderTargetHandle = *opaque {};
pub const DepthTargetHandle = *opaque {};

pub const BufferUsage = enum { default, immutable, dynamic, stream, readback };
pub const BufferType = enum { vertex, index, uniform, storage };
pub const ComparisonFunc = enum { less, less_equal, greater, greater_equal, always, never, equal, not_equal };

pub const PixelFormat = enum {
    /// 4 channels, 8 bits each, 32 total.
    rgba8,
    /// 4 channels, 16 bits each, 64 total.
    rgba16f,
    /// Depth stencil
    /// 2 channels. 24 bits for depth, 8 bits for stencil, 32 total.
    d24_s8,
    d32,
    r8_unorm,
    bgra8,
};

pub const IndexType = enum { none, uint16, uint32 };
pub const WrapType = enum { repeat, clamp };
pub const FilterType = enum { linear, nearest };

pub const ShaderSet = struct {
    vertex_shader: ?*ShaderHandle = null,
    pixel_shader: ?*ShaderHandle = null,
    compute_shader: ?*ShaderHandle = null,
};

pub const Vertex = extern struct {
    position: [3]f32,
    normal: [3]f32,
    uv: [2]f32,
};

pub const GpuLight = extern struct {
    position_or_dir: [3]f32,
    kind: u32, // 0 = point, 1 = directional
    color: [3]f32,
    intensity: f32,
    radius: f32,
    _pad: [3]f32 = undefined,
};

pub const GpuLightParams = extern struct {
    ambient: [3]f32,
    _pad: f32 = undefined,
    screen_size: [2]u32,
    tile_count: [2]u32,
};

pub const GpuMesh = struct {
    vertex_buffer: gpu.GpuDevice.GpuBuffer,
    index_buffer: gpu.GpuDevice.GpuBuffer,
    vertex_count: u32,
    index_count: u32,

    pub fn deinit(self: GpuMesh) void {
        self.vertex_buffer.deinit();
        self.index_buffer.deinit();
    }
};
