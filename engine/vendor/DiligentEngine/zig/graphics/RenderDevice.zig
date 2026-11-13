// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const helpers = @import("../helpers.zig");

/// Render device interface
const RenderDevice = @This();
raw: *c.IRenderDevice,

/// Creates a new buffer object.
///
/// `buff_desc` - Buffer description, see Diligent::BufferDesc for details.
/// `buff_data` - Pointer to Diligent::BufferData structure that describes initial buffer data
///               or null if no data is provided. Immutable buffers (USAGE_IMMUTABLE) must be
///               initialized at creation time.
///
/// The returned object has one reference and must be released with `release()`.
///
/// Size of a uniform buffer (BIND_UNIFORM_BUFFER) must be multiple of 16.
///
/// Stride of a formatted buffer will be computed automatically from the format if
/// ElementByteStride member of buffer description is set to default value (0).
pub fn createBuffer(self: *RenderDevice, buff_desc: *const graphics.types.BufferDesc, buff_data: ?*const graphics.types.BufferData) !graphics.Buffer {
    var buffer: [*c]c.IBuffer = null;

    self.method("CreateBuffer")(self.raw, @ptrCast(buff_desc), @ptrCast(buff_data), &buffer);
    if (buffer == null) return error.BufferCreationFailed;

    return .{ .raw = buffer.? };
}

/// Creates a new shader object.
///
/// `shader_ci` - Shader create info, see Diligent::ShaderCreateInfo for details.
///
/// The returned shader has one reference and must be released with `release()`.
///
/// `compiler_output` is the compiler output data blob. The buffer contains two null-terminated
/// strings. The first one is the compiler output message. The second one is the full
/// shader source code including definitions added by the engine. The data blob
/// object must be released by the client.
pub fn createShader(self: *RenderDevice, shader_ci: *const graphics.types.ShaderCreateInfo) !struct { graphics.Shader, ?graphics.DataBlob } {
    var shader: [*c]c.IShader = null;
    var compiler_output: [*c]c.IDataBlob = null;

    self.method("CreateShader")(self.raw, @ptrCast(shader_ci), &shader, &compiler_output);
    if (shader == null) return error.ShaderCreationFailed;

    return .{
        .{ .raw = shader.? },
        if (compiler_output == null) null else .{ .raw = compiler_output.? },
    };
}

/// Creates a new texture object.
///
/// `tex_desc` - Texture description, see Diligent::TextureDesc for details.
/// `data` - Pointer to Diligent::TextureData structure that describes initial texture data
///          or null if no data is provided. Immutable textures (USAGE_IMMUTABLE) must be
///          initialized at creation time.
///
/// The returned texture has one reference and must be released with `release()`.
///
/// To create all mip levels, set the TexDesc.MipLevels to zero.
///
/// Multisampled resources cannot be initialized with data when they are created.
///
/// If initial data is provided, number of subresources must exactly match the number
/// of subresources in the texture (which is the number of mip levels times the number of array slices.
/// For a 3D texture, this is just the number of mip levels).
/// For example, for a 15 x 6 x 2 2D texture array, the following array of subresources should be
/// provided:
///
///     15x6, 7x3, 3x1, 1x1, 15x6, 7x3, 3x1, 1x1.
///
/// For a 15 x 6 x 4 3D texture, the following array of subresources should be provided:
///
///     15x6x4, 7x3x2, 3x1x1, 1x1x1
pub fn createTexture(self: *RenderDevice, tex_desc: *const graphics.types.TextureDesc, data: ?*const graphics.types.TextureData) !graphics.Texture {
    var texture: [*c]c.ITexture = null;
    self.method("CreateTexture")(self.raw, @ptrCast(tex_desc), @ptrCast(data), &texture);
    if (texture == null) return error.TextureCreationFailed;
    return .{ .raw = texture.? };
}

/// Creates a new sampler object.
///
/// `sam_desc` - Sampler description, see Diligent::SamplerDesc for details.
///
/// The returned sampler has one reference and must be released with `release()`.
///
/// If an application attempts to create a sampler interface with the same attributes
/// as an existing interface, the same interface will be returned.
///
/// In D3D11, 4096 unique sampler state objects can be created on a device at a time.
pub fn createSampler(self: *RenderDevice, sam_desc: *const graphics.types.SamplerDesc) !graphics.Sampler {
    var sampler: [*c]c.ISampler = null;
    self.method("CreateSampler")(self.raw, @ptrCast(sam_desc), &sampler);
    if (sampler == null) return error.SamplerCreationFailed;
    return .{ .raw = sampler.? };
}

/// Creates a new resource mapping.
///
/// `res_mapping_ci` - Resource mapping create info, see Diligent::ResourceMappingCreateInfo for details.
///
/// The returned mapping has one reference and must be released with `release()`.
pub fn createResourceMapping(self: *RenderDevice, res_mapping_ci: *const graphics.types.ResourceMappingCreateInfo) !graphics.ResourceMapping {
    var mapping: [*c]c.IResourceMapping = null;
    self.method("CreateResourceMapping")(self.raw, @ptrCast(res_mapping_ci), &mapping);
    if (mapping == null) return error.ResourceMappingCreationFailed;
    return .{ .raw = mapping.? };
}

/// Creates a new graphics pipeline state object.
///
/// `pso_create_info` - Graphics pipeline state create info, see Diligent::GraphicsPipelineStateCreateInfo for details.
///
/// The returned pipeline state has one reference and must be released with `release()`.
pub fn createGraphicsPipelineState(self: *RenderDevice, pso_create_info: *const graphics.types.GraphicsPipelineStateCreateInfo) !graphics.PipelineState {
    var pipeline_state: [*c]c.IPipelineState = null;
    self.method("CreateGraphicsPipelineState")(self.raw, @ptrCast(pso_create_info), &pipeline_state);
    if (pipeline_state == null) return error.PipelineStateCreationFailed;
    return .{ .raw = pipeline_state.? };
}

/// Creates a new compute pipeline state object.
///
/// `pso_create_info` - Compute pipeline state create info, see Diligent::ComputePipelineStateCreateInfo for details.
///
/// The returned pipeline state has one reference and must be released with `release()`.
pub fn createComputePipelineState(self: *RenderDevice, pso_create_info: *const graphics.types.ComputePipelineStateCreateInfo) !graphics.PipelineState {
    var pipeline_state: [*c]c.IPipelineState = null;
    self.method("CreateComputePipelineState")(self.raw, @ptrCast(pso_create_info), &pipeline_state);
    if (pipeline_state == null) return error.PipelineStateCreationFailed;
    return .{ .raw = pipeline_state.? };
}

/// Creates a new fence object.
///
/// `desc` - Fence description, see Diligent::FenceDesc for details.
///
/// The returned fence has one reference and must be released with `release()`.
pub fn createFence(self: *RenderDevice, desc: *const graphics.types.FenceDesc) !graphics.Fence {
    var fence: [*c]c.IFence = null;
    self.method("CreateFence")(self.raw, @ptrCast(desc), &fence);
    if (fence == null) return error.FenceCreationFailed;
    return .{ .raw = fence.? };
}

/// Creates a new query object.
///
/// `desc` - Query description, see Diligent::QueryDesc for details.
///
/// The returned query has one reference and must be released with `release()`.
pub fn createQuery(self: *RenderDevice, desc: *const graphics.types.QueryDesc) !graphics.Query {
    var query: [*c]c.IQuery = null;
    self.method("CreateQuery")(self.raw, @ptrCast(desc), &query);
    if (query == null) return error.QueryCreationFailed;
    return .{ .raw = query.? };
}

/// Creates a render pass object.
///
/// `desc` - Render pass description, see Diligent::RenderPassDesc for details.
///
/// The returned render pass has one reference and must be released with `release()`.
pub fn createRenderPass(self: *RenderDevice, desc: *const graphics.types.RenderPassDesc) !graphics.RenderPass {
    var render_pass: [*c]c.IRenderPass = null;
    self.method("CreateRenderPass")(self.raw, @ptrCast(desc), &render_pass);
    if (render_pass == null) return error.RenderPassCreationFailed;
    return .{ .raw = render_pass.? };
}

/// Creates a framebuffer object.
///
/// `desc` - Framebuffer description, see Diligent::FramebufferDesc for details.
///
/// The returned framebuffer has one reference and must be released with `release()`.
pub fn createFramebuffer(self: *RenderDevice, desc: *const graphics.types.FramebufferDesc) !graphics.Framebuffer {
    var framebuffer: [*c]c.IFramebuffer = null;
    self.method("CreateFramebuffer")(self.raw, @ptrCast(desc), &framebuffer);
    if (framebuffer == null) return error.FramebufferCreationFailed;
    return .{ .raw = framebuffer.? };
}

/// Creates a pipeline resource signature object.
///
/// `desc` - Resource signature description, see Diligent::PipelineResourceSignatureDesc for details.
///
/// The returned signature has one reference and must be released with `release()`.
pub fn createPipelineResourceSignature(self: *RenderDevice, desc: *const graphics.types.PipelineResourceSignatureDesc) !graphics.PipelineResourceSignature {
    var signature: [*c]c.IPipelineResourceSignature = null;
    self.method("CreatePipelineResourceSignature")(self.raw, @ptrCast(desc), &signature);
    if (signature == null) return error.PipelineResourceSignatureCreationFailed;
    return .{ .raw = signature.? };
}

/// Creates a device memory object.
///
/// `create_info` - Device memory create info, see Diligent::DeviceMemoryCreateInfo for details.
///
/// The returned device memory has one reference and must be released with `release()`.
pub fn createDeviceMemory(self: *RenderDevice, create_info: *const graphics.types.DeviceMemoryCreateInfo) !graphics.DeviceMemory {
    var memory: [*c]c.IDeviceMemory = null;
    self.method("CreateDeviceMemory")(self.raw, @ptrCast(create_info), &memory);
    if (memory == null) return error.DeviceMemoryCreationFailed;
    return .{ .raw = memory.? };
}

/// Creates a pipeline state cache object.
///
/// `create_info` - Pipeline state cache create info, see Diligent::PiplineStateCacheCreateInfo for details.
///
/// The returned cache has one reference and must be released with `release()`.
///
/// On devices that don't support pipeline state caches (e.g. Direct3D11, OpenGL),
/// the method will silently do nothing, and this function returns null.
pub fn createPipelineStateCache(self: *RenderDevice, create_info: *const graphics.types.PipelineStateCacheCreateInfo) !?graphics.PipelineStateCache {
    var pso_cache: [*c]c.IPipelineStateCache = null;
    self.method("CreatePipelineStateCache")(self.raw, @ptrCast(create_info), &pso_cache);
    if (pso_cache == null) return null;
    return .{ .raw = pso_cache.? };
}

/// Creates a deferred context.
///
/// The returned context has one reference and must be released with `release()`.
///
/// **Remarks:** Deferred contexts are not supported in OpenGL and WebGPU backends.
pub fn createDeferredContext(self: *RenderDevice) !graphics.DeviceContext {
    var context: [*c]c.IDeviceContext = null;
    self.method("CreateDeferredContext")(self.raw, &context);
    if (context == null) return error.DeviceContextCreationFailed;
    return .{ .raw = context.? };
}

/// Returns the device information, see Diligent::RenderDeviceInfo for details.
pub fn getDeviceInfo(self: *const RenderDevice) *const graphics.types.RenderDeviceInfo {
    return @ptrCast(self.method("GetDeviceInfo")(self.raw));
}

/// Returns the graphics adapter information, see Diligent::GraphicsAdapterInfo for details.
pub fn getAdapterInfo(self: *const RenderDevice) *const graphics.types.GraphicsAdapterInfo {
    return @ptrCast(self.method("GetAdapterInfo")(self.raw));
}

/// Returns the basic texture format information.
///
/// See Diligent::TextureFormatInfo for details on the provided information.
///
/// `tex_format` - Texture format for which to provide the information.
///
/// **Returns:** Const pointer to the TextureFormatInfo structure containing the
/// texture format description.
///
/// **Remarks:** This method must be externally synchronized.
pub fn getTextureFormatInfo(self: *const RenderDevice, tex_format: graphics.types.TextureFormat) *const graphics.types.TextureFormatInfo {
    return @ptrCast(self.method("GetTextureFormatInfo")(self.raw, @backingInt(tex_format)));
}

/// Returns the extended texture format information.
///
/// See Diligent::TextureFormatInfoExt for details on the provided information.
///
/// `tex_format` - Texture format for which to provide the information.
///
/// **Returns:** Const pointer to the TextureFormatInfoExt structure containing the
/// extended texture format description.
///
/// The first time this method is called for a particular format, it may be
/// considerably slower than getTextureFormatInfo(). If you do not require
/// extended information, call getTextureFormatInfo() instead.
///
/// **Remarks:** This method must be externally synchronized.
pub fn getTextureFormatInfoExt(self: *RenderDevice, tex_format: graphics.types.TextureFormat) *const graphics.types.TextureFormatInfoExt {
    return @ptrCast(self.method("GetTextureFormatInfoExt")(self.raw, @backingInt(tex_format)));
}

/// Purges device release queues and releases all stale resources.
///
/// This method is automatically called by ISwapChain::Present() of the primary swap chain.
///
/// `force_release` - Forces release of all objects. Use this option with
/// great care only if you are sure the resources are not in use by the GPU (such as when the
/// device has just been idled).
pub fn releaseStaleResources(self: *RenderDevice, force_release: bool) void {
    self.method("ReleaseStaleResources")(self.raw, force_release);
}

/// Waits until all outstanding operations on the GPU are complete.
///
/// **Note:** The method blocks the execution of the calling thread until the GPU is idle.
///
/// The method does not flush immediate contexts, so it only waits for commands that
/// have already been submitted. An application should call IDeviceContext::Flush() on
/// the contexts it needs to flush before calling this method, so that all recorded commands
/// are complete when the method returns.
pub fn idleGPU(self: *RenderDevice) void {
    self.method("IdleGPU")(self.raw);
}

/// Returns engine factory this device was created from.
///
/// The reference counter of the returned interface is not incremented,
/// so the caller must not call `release()` on it.
pub fn getEngineFactory(self: *const RenderDevice) ?graphics.EngineFactory {
    const p = self.method("GetEngineFactory")(self.raw);
    if (p == null) return null;
    return .{ .raw = p.? };
}

/// Returns a pointer to the shader compilation thread pool.
///
/// The reference counter of the returned interface is not incremented,
/// so the caller must not call `release()` on it.
pub fn getShaderCompilationThreadPool(self: *const RenderDevice) ?graphics.ThreadPool {
    const p = self.method("GetShaderCompilationThreadPool")(self.raw);
    if (p == null) return null;
    return .{ .raw = p.? };
}

pub const method = helpers.methodHelper(@This(), "RenderDevice");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;

comptime {
    helpers.ensureHandle(@This());
    helpers.ensureMethodsImplemented(@This(), "RenderDevice", &.{
        "CreateRayTracingPipelineState", "CreateTilePipelineState",
        "CreateBLAS",                    "CreateTLAS",
        "CreateSBT",                     "GetSparseTextureFormatInfo",
    });
}
