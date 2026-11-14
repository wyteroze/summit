// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const c = @import("c");
const helpers = @import("../../helpers.zig");
const constants = @import("constants.zig");
const graphics = @import("../graphics.zig");

/// Version
pub const Version = extern struct {
    major: u32 = 0,
    minor: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.Version);
    }
};

/// Queue priority
pub const QueuePriority = enum(u8) {
    /// Queue priority is unknown.
    unknown = c.QUEUE_PRIORITY_UNKNOWN,

    /// Vulkan backend:     VK_QUEUE_GLOBAL_PRIORITY_LOW_EXT
    /// Direct3D12 backend: D3D12_COMMAND_QUEUE_PRIORITY_NORMAL
    low = c.QUEUE_PRIORITY_LOW,

    /// Default queue priority.
    /// Vulkan backend:     VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_EXT
    /// Direct3D12 backend: D3D12_COMMAND_QUEUE_PRIORITY_NORMAL
    medium = c.QUEUE_PRIORITY_MEDIUM,

    /// Vulkan backend:     VK_QUEUE_GLOBAL_PRIORITY_HIGH_EXT
    /// Direct3D12 backend: D3D12_COMMAND_QUEUE_PRIORITY_HIGH
    high = c.QUEUE_PRIORITY_HIGH,

    /// Additional system privileges required to use this priority, read documentation for specific platform.
    /// Vulkan backend:     VK_QUEUE_GLOBAL_PRIORITY_REALTIME_EXT
    /// Direct3D12 backend: D3D12_COMMAND_QUEUE_PRIORITY_GLOBAL_REALTIME
    realtime = c.QUEUE_PRIORITY_REALTIME,

    /// Special value that indicates the last priority in the enumeration.
    pub const last: QueuePriority = .realtime;

    pub fn toC(self: QueuePriority) c.QUEUE_PRIORITY {
        return @backingInt(self);
    }
};

pub const CommandQueueType = packed struct(u8) {
    /// Command queue that supports memory transfer operations.
    transfer: bool = false,

    /// Command queue that supports compute and ray tracing commands.
    compute_only: bool = false,

    /// Command queue that supports graphics commands.
    graphics_only: bool = false,

    /// Command queue that supports sparse binding commands.
    sparse_binding: bool = false,

    _: u4 = 0,

    /// Queue type is unknown.
    pub const unknown: CommandQueueType = .{};

    /// Command queue that supports compute, ray tracing and transfer commands.
    pub const compute: CommandQueueType = .{
        .transfer = true,
        .compute_only = true,
    };

    /// Command queue that supports graphics, compute, ray tracing and transfer commands.
    pub const graphics: CommandQueueType = .{
        .transfer = true,
        .compute_only = true,
        .graphics_only = true,
    };

    /// Mask to extract primary command queue type.
    pub const primary_mask: CommandQueueType = .graphics;

    pub const max_bit: CommandQueueType = .graphics;

    /// Checks if all bits in `other` are set in `self` (Zig helper)
    pub fn contains(self: CommandQueueType, other: CommandQueueType) bool {
        const a: u8 = @bitCast(self);
        const b: u8 = @bitCast(other);
        return (a & b) == b;
    }

    /// Combines two flag sets (Zig helper)
    pub fn merge(self: CommandQueueType, other: CommandQueueType) CommandQueueType {
        const a: u8 = @bitCast(self);
        const b: u8 = @bitCast(other);
        return @bitCast(a | b);
    }
};

/// Device feature state
pub const DeviceFeatureState = enum(u8) {
    /// Device feature is disabled.
    disabled = 0,

    /// Device feature is enabled.
    /// If a feature is requested to be enabled during the initialization through
    /// EngineCreateInfo::Features, but is not supported by the device/driver/platform,
    /// the engine will fail to initialize.
    enabled = 1,

    /// Device feature is optional.
    /// During the initialization the engine will attempt to enable the feature.
    /// If the feature is not supported by the device/driver/platform,
    /// the engine will successfully be initialized, but the feature will be disabled.
    /// The actual feature state can be queried from DeviceCaps structure.
    optional = 2,

    pub fn toC(self: DeviceFeatureState) c.DEVICE_FEATURE_STATE {
        return @fromBackingInt(self);
    }
};

/// Common validation options.
pub const ValidationFlags = packed struct(u32) {
    /// Verify that constant or structured buffer size is not smaller than what is expected by the shader.
    /// This flag only has effect in Debug/Development builds.
    /// This type of validation is never performed in Release builds.
    ///
    /// This option is currently supported by Vulkan backend only.
    check_shader_buffer_size: bool = false,

    _: u31 = 0,
};

/// Query type.
pub const QueryType = enum {
    /// Query type is undefined.
    undefined,

    /// Gets the number of samples that passed the depth and stencil tests in between IDeviceContext::BeginQuery
    /// and IDeviceContext::EndQuery. IQuery::GetData fills a Diligent::QueryDataOcclusion struct.
    occlusion,

    /// Acts like QUERY_TYPE_OCCLUSION except that it returns simply a binary true/false result: false indicates that no samples
    /// passed depth and stencil testing, true indicates that at least one sample passed depth and stencil testing.
    /// IQuery::GetData fills a Diligent::QueryDataBinaryOcclusion struct.
    binary_occlusion,

    /// Gets the GPU timestamp corresponding to IDeviceContext::EndQuery call. For this query
    /// type IDeviceContext::BeginQuery is disabled. IQuery::GetData fills a Diligent::QueryDataTimestamp struct.
    timestamp,

    /// Gets pipeline statistics, such as the number of pixel shader invocations in between IDeviceContext::BeginQuery
    /// and IDeviceContext::EndQuery. IQuery::GetData fills a Diligent::QueryDataPipelineStatistics struct.
    pipeline_statistics,

    /// Gets the number of high-frequency counter ticks between IDeviceContext::BeginQuery and
    /// IDeviceContext::EndQuery calls. IQuery::GetData fills a Diligent::QueryDataDuration struct.
    duration,

    /// The number of query types in the enum
    pub const NumTypes = 6;
};

/// OpenXR attributes
pub const OpenXRAttribs = extern struct {
    /// A pointer to the xrGetInstanceProcAddr function.
    get_instance_proc_addr: ?*anyopaque = null,

    /// OpenXR instance handle (XrInstance).
    instance: u64 = 0,

    /// OpenXR system id (XrSystemId).
    system_id: u64 = 0,

    comptime {
        helpers.ensureSame(@This(), c.OpenXRAttribs);
    }
};

/// Describes the device features
pub const DeviceFeatures = extern struct {
    /// Indicates if device supports separable shader programs.
    /// The only case when separable programs are not supported is when the engine is
    /// initialized in GLES3.0 mode. In GLES3.1+ and in all other backends, the
    /// feature is always enabled.
    /// The are two main limitations when separable programs are disabled:
    /// - If the same shader variable is present in multiple shader stages,
    ///   it will always be shared between all stages and different resources
    ///   can't be bound to different stages.
    /// - Shader resource queries will be also disabled.
    separable_programs: DeviceFeatureState = .disabled,

    /// Indicates if device supports resource queries from shader objects.
    /// This feature indicates if Shader.getResourceCount() and Shader.getResourceDesc() methods
    /// can be used to query the list of resources of individual shader objects.
    /// Shader variable queries from pipeline state and shader resource binding objects are always
    /// available.
    ///
    /// The feature is always enabled in Direct3D11, Direct3D12 and Vulkan. It is enabled in
    /// OpenGL when separable programs are available, and it is always disabled in Metal.
    shader_resource_queries: DeviceFeatureState = .disabled,

    /// Indicates if device supports wireframe fill mode
    wireframe_fill: DeviceFeatureState = .disabled,

    /// Indicates if device supports multithreaded resource creation
    multithreaded_resource_creation: DeviceFeatureState = .disabled,

    /// Indicates if device supports compute shaders
    compute_shaders: DeviceFeatureState = .disabled,

    /// Indicates if device supports geometry shaders
    geometry_shaders: DeviceFeatureState = .disabled,

    /// Indicates if device supports tessellation
    tessellation: DeviceFeatureState = .disabled,

    /// Indicates if device supports mesh and amplification shaders
    mesh_shaders: DeviceFeatureState = .disabled,

    /// Indicates if device supports ray tracing.
    /// See RayTracingProperties for more information.
    ray_tracing: DeviceFeatureState = .disabled,

    /// Indicates if device supports bindless resources
    bindless_resources: DeviceFeatureState = .disabled,

    /// Indicates if device supports occlusion queries (see QueryTypeOcclusion).
    occlusion_queries: DeviceFeatureState = .disabled,

    /// Indicates if device supports binary occlusion queries (see QueryTypeBinaryOcclusion).
    binary_occlusion_queries: DeviceFeatureState = .disabled,

    /// Indicates if device supports timestamp queries (see QueryTypeTimestamp).
    timestamp_queries: DeviceFeatureState = .disabled,

    /// Indicates if device supports pipeline statistics queries (see QueryTypePipelineStatistics).
    pipeline_statistics_queries: DeviceFeatureState = .disabled,

    /// Indicates if device supports duration queries (see QueryTypeDuration).
    duration_queries: DeviceFeatureState = .disabled,

    /// Indicates if device supports depth bias clamping
    depth_bias_clamp: DeviceFeatureState = .disabled,

    /// Indicates if device supports depth clamping
    ///
    /// By default polygon faces are clipped against the near and far planes of the view
    /// would be clipped is clamped to the near/far plane instead of discarding them.
    /// frustum. If depth clipping is disabled in the PSO, the depth of the fragments that
    /// If this feature is enabled, the DepthClipEnable member of the RasterizerStateDesc
    /// struct can be set to False. Otherwise it must always be set to True.
    depth_clamp: DeviceFeatureState = .disabled,

    /// Indicates if device supports depth clamping
    independent_blend: DeviceFeatureState = .disabled,

    /// Indicates if device supports dual-source blend
    dual_source_blend: DeviceFeatureState = .disabled,

    /// Indicates if device supports multiviewport
    multi_viewport: DeviceFeatureState = .disabled,

    /// Indicates if device supports all BC-compressed formats
    texture_compression_bc: DeviceFeatureState = .disabled,

    /// Indicates if device supports all ETC-compressed formats
    texture_compression_etc2: DeviceFeatureState = .disabled,

    /// Indicates if device supports writes to UAVs as well as atomic operations in vertex,
    /// tessellation, and geometry shader stages.
    vertex_pipeline_uav_writes_and_atomics: DeviceFeatureState = .disabled,

    /// Indicates if device supports writes to UAVs as well as atomic operations in pixel
    /// shader stage.
    pixel_uav_writes_and_atomics: DeviceFeatureState = .disabled,

    /// Specifies whether all the extended UAV texture formats are available in shader code.
    texture_uav_extended_formats: DeviceFeatureState = .disabled,

    /// Indicates if device supports native 16-bit float operations. Note that there are separate features
    /// that indicate if device supports loading 16-bit floats from buffers and passing them between shader stages.
    ///
    /// **Note:** 16-bit support is quite tricky, the following post should help understand it better:
    /// https://therealmjp.github.io/posts/shader-fp16/
    shader_float16: DeviceFeatureState = .disabled,

    /// Indicates if device supports reading and writing 16-bit floats and ints from buffers bound
    /// as shader resource or unordered access views.
    resource_buffer16_bit_access: DeviceFeatureState = .disabled,

    /// Indicates if device supports reading 16-bit floats and ints from uniform buffers.
    uniform_buffer16_bit_access: DeviceFeatureState = .disabled,

    /// Indicates if 16-bit floats and ints can be used as input/output of a shader entry point.
    shader_input_output16: DeviceFeatureState = .disabled,

    /// Indicates if device supports native 8-bit integer operations.
    shader_int8: DeviceFeatureState = .disabled,

    /// Indicates if device supports reading and writing 8-bit types from buffers bound
    /// as shader resource or unordered access views.
    resource_buffer8_bit_access: DeviceFeatureState = .disabled,

    /// Indicates if device supports reading 8-bit types from uniform buffers.
    uniform_buffer8_bit_access: DeviceFeatureState = .disabled,

    /// Indicates if device supports static-sized shader arrays.
    ///
    /// **Remarks:** This feature is always enabled in all backends,
    /// except for WebGPU.
    shader_resource_static_arrays: DeviceFeatureState = .disabled,

    /// Indicates if device supports runtime-sized shader arrays (e.g. arrays without a specific size).
    ///
    /// **Remarks:** This feature is always enabled in DirectX12 backend and
    /// can optionally be enabled in Vulkan backend.
    /// Run-time sized shader arrays are not available in other backends.
    shader_resource_runtime_arrays: DeviceFeatureState = .disabled,

    /// Indicates if device supports wave ops (Direct3D12) or subgroups (Vulkan).
    wave_op: DeviceFeatureState = .disabled,

    /// Indicates if device supports instance data step rates other than 1.
    instance_data_step_rate: DeviceFeatureState = .disabled,

    /// Indicates if device natively supports fence with Uint64 counter.
    /// Native fence can wait on GPU for a signal from CPU, can be enqueued for wait operation for any value.
    /// If not natively supported by the device, the fence is emulated where possible.
    native_fence: DeviceFeatureState = .disabled,

    /// Indicates if device supports tile shaders.
    tile_shaders: DeviceFeatureState = .disabled,

    /// Indicates if device supports timestamp and duration queries in transfer queues.
    transfer_queue_timestamp_queries: DeviceFeatureState = .disabled,

    /// Indicates if device supports variable rate shading.
    variable_rate_shading: DeviceFeatureState = .disabled,

    /// Indicates if device supports sparse (aka tiled or partially resident) resources.
    sparse_resources: DeviceFeatureState = .disabled,

    /// Indicates if device supports framebuffer fetch for input attachments.
    /// Vulkan: this feature is always supported through input attachments.
    ///
    /// Metal: this feature is always supported on iOS; on macOS it
    /// requires Apple GPU and MSL 2.3 (available in macOS 11.0+).
    /// When the feature is disabled, every new subpass
    /// of a render pass starts a new render command encoder.
    /// With this feature enabled, input attachment loads
    /// translate into MSL framebuffer fetch operations that
    /// allow implementing subpasses within a single render command
    /// encoder.
    subpass_framebuffer_fetch: DeviceFeatureState = .disabled,

    /// Indicates if device supports texture component swizzle.
    texture_component_swizzle: DeviceFeatureState = .disabled,

    /// Indicates if device supports texture subresource views.
    /// **Remarks:** This feature is always enabled in all backends except for GLES, WebGL and older
    /// OpenGL versions.
    ///
    /// When this feature is disabled, only texture views that reference the entire
    /// texture can be created.
    texture_subresource_views: DeviceFeatureState = .disabled,

    /// Indicates if device supports native multi-draw commands.
    ///
    /// When this feature is enabled, the GPU supports a dedicated command that
    /// can be used to issue multiple draw calls with a single command (e.g. `vkCmdDrawMultiEXT`,
    /// `glMultiDrawElements`, etc.). In OpenGL and Vulkan, the shader can access the draw
    /// command index using the `gl_DrawID` built-in variable.
    ///
    /// When this feature is disabled, the engine emulates multi-draw commands by issuing
    /// multiple individual draw calls. The draw command index is unavailable.
    native_multi_draw: DeviceFeatureState = .disabled,

    /// Whether the device supports asynchronous shader compilation.
    /// When this feature is enabled, the engine can create shaders and pipeline states
    /// asynchronously in a separate thread without blocking the main thread. An application
    /// can query the shader status using the Shader.getStatus() method and the pipeline
    /// state status using the PipelineState.getStatus() method.
    async_shader_compilation: DeviceFeatureState = .disabled,

    /// Indicates if device supports formatted buffers.
    formatted_buffers: DeviceFeatureState = .disabled,

    /// Indicates if device supports pipeline specialization constants.
    /// When this feature is enabled, applications can provide specialization
    /// constants when creating a pipeline state to set constant values at
    /// pipeline creation time. The driver may use these values to optimize
    /// the compiled shader code.
    ///
    /// Supported by Vulkan and WebGPU backends.
    /// Not supported by D3D11, D3D12, OpenGL, or Metal backends.
    specialization_constants: DeviceFeatureState = .disabled,

    /// Indicates if device supports native 64-bit float operations.
    shader_float64: DeviceFeatureState = .disabled,

    /// Indicates if device supports access to barycentric coordinates in the shaders
    /// during the rasterization phase.
    shader_barycentrics: DeviceFeatureState = .disabled,

    comptime {
        helpers.ensureSame(@This(), c.DeviceFeatures);
    }
};

/// Immediate device context create info
pub const ImmediateContextCreateInfo = extern struct {
    name: ?[*:0]const u8 = null,

    /// Queue index in GraphicsAdapterInfo::Queues.
    /// An immediate device context creates a software command queue for the
    /// hardware queue with id QueueId. The total number of contexts created for
    /// this queue must not exceed the value of MaxDeviceContexts member of CommandQueueInfo
    /// for this queue.
    queue_id: u8 = c.DEFAULT_QUEUE_ID,

    /// Priority of the software queue created by the context, see QueuePriority.
    /// * Direct3D12 backend: each context may use a unique queue priority.
    /// * Vulkan backend:     all contexts with the same QueueId must use the same priority.
    /// * Other backends:     queue priority is ignored.
    priority: QueuePriority = .medium,

    comptime {
        helpers.ensureSame(@This(), c.ImmediateContextCreateInfo);
    }
};

/// Common validation levels that translate to specific settings for different backends.
pub const ValidationLevel = enum(u8) {
    /// Validation is disabled.
    disabled,
    /// Standard validation options are enabled.
    level_1,
    /// All validation options are enabled.
    /// Note that enabling this level may add a significant overhead.
    level_2,
};

/// Engine creation information
pub const EngineCreateInfo = extern struct {
    /// Engine API version number.
    engine_api_version: i32 = c.DILIGENT_API_VERSION,

    /// Id of the hardware adapter the engine should use.
    /// Call EngineFactory.enumerateAdapters() to get the list of available adapters.
    adapter_id: u32 = c.DEFAULT_ADAPTER_ID,

    /// Minimum required graphics API version (feature level for Direct3D).
    graphics_api_version: Version = .{},

    /// A pointer to the array of NumImmediateContexts structs describing immediate
    /// device contexts to create. See ImmediateContextCreateInfo.
    /// Every immediate device contexts encompasses a command queue of a specific type.
    /// It may record commands directly or execute command lists recorded by deferred contexts.
    ///
    /// If not specified, single graphics context will be created.
    ///
    /// Recommended configuration:
    ///   * Modern discrete GPU:      1 graphics, 1 compute, 1 transfer context.
    ///   * Integrated or mobile GPU: 1..2 graphics contexts.
    immediate_context_info: ?*const ImmediateContextCreateInfo = null,

    /// The number of immediate contexts in pImmediateContextInfo array.
    /// **Warning:** If an application uses more than one immediate context,
    /// it must manually call DeviceContext.finishFrame for
    /// additional contexts to let the engine release stale resources.
    num_immediate_contexts: u32 = 0,

    /// The number of deferred contexts to create when initializing the engine.
    /// If non-zero number is given, pointers to the contexts are written to ppContexts array by the engine factory
    /// functions (EngineFactoryD3D11.createDeviceAndContextsD3D11,
    /// EngineFactoryD3D12.createDeviceAndContextsD3D12, and EngineFactoryVk.createDeviceAndContextsVk)
    /// starting at position `max(1, NumImmediateContexts)`.
    ///
    /// **Remarks:** Additional deferred contexts may be created later by calling RenderDevice.createDeferredContext().
    ///
    /// **Warning:** An application must manually call IDeviceContext::FinishFrame for
    /// deferred contexts to let the engine release stale resources.
    num_deferred_contexts: u32 = 0,

    /// Requested device features.
    /// If a feature is requested to be enabled, but is not supported
    /// by the device/driver/platform, the engine will fail to initialize.
    ///
    /// If a feature is requested to be optional, the engine will attempt to enable the feature.
    /// If the feature is not supported by the device/driver/platform,
    /// the engine will successfully be initialized, but the feature will be disabled.
    /// The actual feature state can be queried from DeviceCaps structure.
    ///
    /// Applications can query available device features for each graphics adapter with
    /// EngineFactory.enumerateAdapters().
    features: DeviceFeatures = .{},

    /// Enable backend-specific validation (e.g. use Direct3D11 debug device, enable Direct3D12
    /// debug layer, enable Vulkan validation layers, create debug OpenGL context, etc.).
    /// The validation is enabled by default in Debug/Development builds and disabled
    /// in release builds.
    enable_validation: bool = false,

    /// Validation options, see ValidationFlags.
    validation_flags: ValidationFlags = .{},

    /// An optional thread pool for asynchronous shader and pipeline state compilation.
    ///
    /// When AsyncShaderCompilation device feature is enabled, the engine will use
    /// the provided thread pool to compile shaders and pipeline states asynchronously.
    /// If the thread pool is not provided, the engine will create a default thread pool.
    ///
    /// **Note:** Thread pool is not used in OpenGL backend as asynchronous shader compilation
    /// is performed by the driver.
    async_shader_compilation_thread_pool: ?*anyopaque = null,

    /// When `AsyncShaderCompilation` is enabled, the maximum number of threads that can be used to compile shaders.
    /// If AsyncShaderCompilation device feature is enabled and pAsyncShaderCompilationThreadPool is null,
    /// this value is used to define the number of threads in the default thread pool.
    /// If the value is 0xFFFFFFFF, the number of threads will be determined automatically.
    ///
    /// If pAsyncShaderCompilationThreadPool is not null, the value is ignored as the user-provided
    /// thread pool is used instead.
    ///
    /// In OpenGL backend, the thread pool is not used and the value is passed to glMaxShaderCompilerThreadsKHR()
    /// function.
    num_async_shader_compilation_threads: u32 = (1 << 32) - 1,

    // The structure must be 8-byte aligned
    padding: u32 = 0,

    /// An optional pointer to the OpenXR attributes, must be set if OpenXR is used.
    /// See OpenXRAttribs.
    xr_attribs: ?*const OpenXRAttribs = null,

    comptime {
        helpers.ensureSame(@This(), c.EngineCreateInfo);
    }
};

/// Attributes of the OpenGL-based engine implementation
pub const EngineGLCreateInfo = extern struct {
    base: EngineCreateInfo = .{},

    // comptime {
    //     helpers.ensureSame(@This(), c.EngineGLCreateInfo);
    // }
};

/// Direct3D11-specific validation options.
pub const D3D11ValidationFlags = enum(u32) {
    /// Direct3D11-specific validation is disabled.
    none = 0x00,

    /// Verify that all committed context resources are relevant,
    /// i.e. they are consistent with the committed resource cache.
    /// This is very expensive and should only be used for engine debugging.
    /// This option is enabled in validation level 2 (see Diligent::VALIDATION_LEVEL).
    ///
    /// \remarks  This flag only has effect in Debug/Development builds.
    ///           This type of validation is never performed in Release builds.
    verify_committed_resource_relevance = 0x01,
};

/// Attributes specific to D3D11 engine
pub const EngineD3D11CreateInfo = extern struct {
    base: EngineCreateInfo = .{},
};

/// Direct3D12-specific validation flags.
pub const D3D12ValidationFlags = enum(u32) {
    /// Direct3D12-specific validation is disabled.
    none = 0x00,

    /// Whether to break execution when D3D12 debug layer detects an error.
    /// This flag only has effect if validation is enabled (EngineCreateInfo.EnableValidation is true).
    /// This option is disabled by default in all validation levels.
    break_on_error = 0x01,

    /// Whether to break execution when D3D12 debug layer detects a memory corruption.
    /// This flag only has effect if validation is enabled (EngineCreateInfo.EnableValidation is true).
    /// This option is enabled by default when validation is enabled.
    break_on_corruption = 0x02,

    /// Enable validation on the GPU timeline.
    /// See https://docs.microsoft.com/en-us/windows/win32/direct3d12/using-d3d12-debug-layer-gpu-based-validation
    /// This flag only has effect if validation is enabled (EngineCreateInfo.EnableValidation is true).
    /// This option is enabled in validation level 2 (see Diligent::VALIDATION_LEVEL).
    ///
    /// \note Enabling this option may slow things down a lot.
    enable_gpu_based_validation = 0x04,
};

/// Attributes specific to D3D12 engine
pub const EngineD3D12CreateInfo = extern struct {
    base: EngineCreateInfo = .{},

    // comptime {
    //     helpers.ensureSame(@This(), c.EngineD3D12CreateInfo);
    // }
};

/// Descriptor pool size
pub const VulkanDescriptorPoolSize = extern struct {
    max_descriptor_sets: u32 = 0,
    num_separate_sample_descriptors: u32 = 0,
    num_combined_sampler_descriptors: u32 = 0,
    num_sampled_image_descriptors: u32 = 0,
    num_storage_image_descriptors: u32 = 0,
    num_uniform_buffer_descriptors: u32 = 0,
    num_storage_buffer_descriptors: u32 = 0,
    num_uniform_texel_buffer_descriptors: u32 = 0,
    num_storage_texel_buffer_descriptors: u32 = 0,
    num_input_attachment_descriptors: u32 = 0,
    num_accel_struct_descriptors: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.VulkanDescriptorPoolSize);
    }
};

/// Vulkan-specific device features
pub const DeviceFeaturesVk = extern struct {
    /// Indicates whether the device supports VK_KHR_dynamic_rendering extension.
    /// If the extension is not supported, dynamic render targets are implemented
    /// using framebuffer and render pass caches.
    dynamic_rendering: DeviceFeatureState = .disabled,

    /// Indicates whether the device supports VK_EXT_host_image_copy extension.
    /// This extension is used to initialize the texture on the host.
    /// If the extension is not supported, the texture is initialized on the device.
    host_image_copy: DeviceFeatureState = .disabled,

    comptime {
        helpers.ensureSame(@This(), c.DeviceFeaturesVk);
    }
};

/// Attributes specific to Vulkan engine
pub const EngineVkCreateInfo = extern struct {
    /// Base `EngineCreateInfo`.
    base: EngineCreateInfo = .{},

    /// Vulkan-specific device features, see Diligent::DeviceFeaturesVk.
    features_vk: DeviceFeaturesVk = .{},

    /// The number of Vulkan instance layers in ppInstanceLayerNames array.
    instance_layer_count: u32 = 0,

    /// A list of additional Vulkan instance layers to enable.
    instance_layer_names: ?[*]const [*:0]const u8 = null,

    /// The number of Vulkan instance extensions in ppInstanceExtensionNames array.
    instance_extension_count: u32 = 0,

    /// A list of additional Vulkan instance extensions to enable.
    instanace_extension_names: ?[*]const [*:0]const u8 = null,

    /// Number of Vulkan device extensions in ppDeviceExtensionNames array.
    device_extension_count: u32 = 0,

    /// A list of additional Vulkan device extensions to enable.
    device_extension_names: ?[*]const [*:0]const u8 = null,

    /// Pointer to Vulkan device extension features.
    /// Will be added to VkDeviceCreateInfo::pNext.
    device_extension_features: ?*anyopaque = null,

    /// Allocator used as pAllocator parameter in calls to Vulkan Create* functions
    vk_allocator: ?*anyopaque = null,

    /// The number of Vulkan validation messages to ignore in ppIgnoreMessageNames array.
    ignore_debug_message_count: u32 = 0,

    /// An optional list of IgnoreDebugMessageCount Vulkan validation message names to ignore.
    ignore_debug_message_names: ?[*]const [*:0]const u8 = null,

    /// Size of the main descriptor pool that is used to allocate descriptor sets
    /// for static and mutable variables. If allocation from the current pool fails,
    /// the engine creates another one.
    main_descriptor_pool_size: VulkanDescriptorPoolSize = .{
        //Max
        .max_descriptor_sets = 8192,
        //SepSm
        .num_separate_sample_descriptors = 1024,
        //CmbSm
        .num_combined_sampler_descriptors = 8192,
        //SmpImg
        .num_sampled_image_descriptors = 8192,
        //StrImg
        .num_storage_image_descriptors = 1024,
        //UB
        .num_uniform_buffer_descriptors = 4096,
        //SB
        .num_storage_buffer_descriptors = 4096,
        //UTxB
        .num_uniform_texel_buffer_descriptors = 1024,
        //StTxB
        .num_storage_texel_buffer_descriptors = 1024,
        //InptAtt
        .num_input_attachment_descriptors = 256,
        //AccelSt
        .num_accel_struct_descriptors = 256,
    },

    /// Size of the dynamic descriptor pool that is used to allocate descriptor sets
    /// for dynamic variables. Every device context has its own dynamic descriptor set allocator.
    /// The allocator requests pools from global dynamic descriptor pool manager, and then
    /// performs lock-free suballocations from the pool.
    dynamic_descriptor_pool_size: VulkanDescriptorPoolSize = .{
        //Max
        .max_descriptor_sets = 2048,
        //SepSm
        .num_separate_sample_descriptors = 256,
        //CmbSm
        .num_combined_sampler_descriptors = 2048,
        //SmpImg
        .num_sampled_image_descriptors = 2048,
        //StrImg
        .num_storage_image_descriptors = 256,
        //UB
        .num_uniform_buffer_descriptors = 1024,
        //SB
        .num_storage_buffer_descriptors = 1024,
        //UTxB
        .num_uniform_texel_buffer_descriptors = 256,
        //StTxB
        .num_storage_texel_buffer_descriptors = 256,
        //InptAtt
        .num_input_attachment_descriptors = 64,
        //AccelSt
        .num_accel_struct_descriptors = 64,
    },

    /// Allocation granularity for device-local memory.
    /// Device-local memory is used for USAGE_DEFAULT and USAGE_IMMUTABLE
    /// GPU resources, such as buffers and textures.
    ///
    /// If there is no available GPU memory, the resource will fail to be created.
    device_local_memory_page_size: u32 = 16 << 20,

    /// Allocation granularity for host-visible memory.
    /// Host-visible memory is primarily used to upload data to GPU resources.
    host_visible_memory_page_size: u32 = 16 << 20,

    /// Amount of device-local memory reserved by the engine.
    /// The engine does not pre-allocate the memory, but rather keeps free
    /// pages when resources are released.
    device_local_memory_reserve_size: u32 = 256 << 20,

    /// Amount of host-visible memory reserved by the engine.
    /// The engine does not pre-allocate the memory, but rather keeps free
    /// pages when resources are released.
    host_visible_memory_reserve_size: u32 = 256 << 20,

    /// Page size of the upload heap that is allocated by immediate/deferred
    /// contexts from the global memory manager to perform lock-free dynamic
    /// suballocations.
    /// Upload heap is used to update resources with IDeviceContext::UpdateBuffer()
    /// and IDeviceContext::UpdateTexture().
    ///
    /// Upload pages are allocated in host-visible memory. When a
    /// page becomes available, the engiene will keep it alive
    /// if the total size of the host-visible memory is less than
    /// HostVisibleMemoryReserveSize. Otherwise, the page will
    /// be released.
    ///
    /// On exit, the engine prints the number of pages that were
    /// allocated by each context to the log, for example:
    ///
    ///     Diligent Engine: Info: Upload heap of immediate context peak used/allocated frame size: 80.00 MB / 80.00 MB (80 pages)
    ///
    upload_heap_page_size: u32 = 1 << 20,

    /// Size of the dynamic heap (the buffer that is used to suballocate
    /// memory for dynamic resources) shared by all contexts.
    /// The dynamic heap is used to allocate memory for dynamic
    /// resources. Each time a dynamic buffer or dynamic texture is mapped,
    /// the engine allocates a new chunk of memory from the dynamic heap.
    /// At the end of the frame, all dynamic memory allocated for the frame
    /// is recycled. However, it may not became available again until
    /// all command buffers that reference the memory are executed by the GPU
    /// (which typically happens 1-2 frames later). If space in the dynamic
    /// heap is exhausted, the engine will wait for up to 60 ms for the
    /// space released from previous frames to become available. If the space
    /// is still not available, the engine will fail to map the resource
    /// and return null pointer.
    /// The dynamic heap is shared by all contexts and cannot be resized
    /// on the fly. The application should track the amount of dynamic memory
    /// it needs and set this variable accordingly. When the application exits,
    /// the engine prints dynamic heap statistics to the log, for example:
    ///
    ///     Diligent Engine: Info: Dynamic memory manager usage stats:
    ///     Total size: 8.00 MB. Peak allocated size: 0.50 MB. Peak utilization: 6.2%
    ///
    /// The peak allocated size (0.50 MB in the example above) is the value that
    /// should be used to guide setting this variable. An application should always
    /// allow some extra space in the dynamic heap to avoid running out of dynamic memory.
    dynamic_heap_size: u32 = 8 << 20,

    /// Size of the memory chunk suballocated by immediate/deferred context from
    /// the global dynamic heap to perform lock-free dynamic suballocations.
    ///
    /// Dynamic memory is not allocated directly from the dynamic heap.
    /// Instead, when a context needs to allocate memory for a dynamic
    /// resource, it allocates a chunk of memory from the global dynamic
    /// heap (which requires synchronization with other contexts), and
    /// then performs lock-free suballocations from the chunk.
    /// The size of this chunk is set by DynamicHeapPageSize variable.
    ///
    /// When the application exits, the engine prints dynamic heap statistics
    /// for each context to the log, for example:
    ///
    ///     Diligent Engine: Info: Dynamic heap of immediate context usage stats:
    ///                            Peak used/aligned/allocated size: 94.14 KB / 94.56 KB / 256.00 KB (1 page). Peak efficiency (used/aligned): 99.6%. Peak utilization (used/allocated): 36.8%
    ///
    /// * Peak used size is the total amount of memory required for dynamic resources
    ///   allocated by the context during the frame.
    /// * Peak aligned size is the total amount of memory required for dynamic resources
    ///   allocated by the context during the frame, accounting for necessary alignment. This
    ///   value is always greater than or equal to the peak used size.
    /// * Peak allocated size is the total amount of memory allocated from the dynamic
    ///   heap by the context during the frame. This value is always a multiple of
    ///   DynamicHeapPageSize.
    dynamic_heap_page_size: u32 = 256 << 10,

    /// Query pool size for each query type.
    ///
    /// In Vulkan, queries are allocated from the pool, and
    /// one pool may contain multiple queries of different types.
    /// QueryPoolSizes array specifies the number of queries
    /// of each type that will be allocated from a single pool.
    /// The engine will create as many pools as necessary to
    /// satisfy the requested number of queries.
    query_pool_sizes: [QueryType.NumTypes]u32 = .{
        0, // Ignored
        128, // occlusion
        128, // binary_occlusion
        512, // timestamp
        128, // pipeline_statistics
        256, // duration
    },

    /// Path to DirectX Shader Compiler, which is required to use Shader Model 6.0+
    /// features when compiling shaders from HLSL.
    dx_compiler_path: ?[*:0]const u8 = null,

    pub fn toC(self: *const @This()) *const c.EngineVkCreateInfo {
        return @ptrCast(self);
    }

    comptime {
        helpers.ensureSame(@This(), c.EngineVkCreateInfo);
    }
};

/// This enumeration describes available texture formats and generally mirrors DXGI_FORMAT enumeration.
/// The table below provides detailed information on each format. Most of the formats are widely supported
/// by all modern APIs (DX10+, OpenGL3.3+ and OpenGLES3.0+). Specific requirements are additionally indicated.
///
/// **See also:** [XGI_FORMAT enumeration on MSDN](https://docs.microsoft.com/en-us/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format"),
/// [OpenGL Texture Formats](https://www.opengl.org/wiki/Image_Format")
pub const TextureFormat = enum(u16) {
    /// Unknown format
    unknown = 0,

    /// Four-component 128-bit typeless format with 32-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R32G32B32A32_TYPELESS. OpenGL does not have direct counterpart, GL_RGBA32F is used.
    rgba32_typeless,

    /// Four-component 128-bit floating-point format with 32-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R32G32B32A32_FLOAT. OpenGL counterpart: GL_RGBA32F.
    rgba32_float,

    /// Four-component 128-bit unsigned-integer format with 32-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R32G32B32A32_UINT. OpenGL counterpart: GL_RGBA32UI.
    rgba32_uint,

    /// Four-component 128-bit signed-integer format with 32-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R32G32B32A32_SINT. OpenGL counterpart: GL_RGBA32I.
    rgba32_sint,

    /// Three-component 96-bit typeless format with 32-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R32G32B32_TYPELESS. OpenGL does not have direct counterpart, GL_RGB32F is used.
    /// **Warning:** This format has weak hardware support and is not recommended
    rgb32_typeless,

    /// Three-component 96-bit floating-point format with 32-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R32G32B32_FLOAT. OpenGL counterpart: GL_RGB32F.
    /// **Warning:** This format has weak hardware support and is not recommended
    rgb32_float,

    /// Three-component 96-bit unsigned-integer format with 32-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R32G32B32_UINT. OpenGL counterpart: GL_RGB32UI.
    /// **Warning:** This format has weak hardware support and is not recommended
    rgb32_uint,

    /// Three-component 96-bit signed-integer format with 32-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R32G32B32_SINT. OpenGL counterpart: GL_RGB32I.
    /// **Warning:** This format has weak hardware support and is not recommended
    rgb32_sint,

    /// Four-component 64-bit typeless format with 16-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R16G16B16A16_TYPELESS. OpenGL does not have direct counterpart, GL_RGBA16F is used.
    rgba16_typeless,

    /// Four-component 64-bit half-precision floating-point format with 16-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R16G16B16A16_FLOAT. OpenGL counterpart: GL_RGBA16F.
    rgba16_float,

    /// Four-component 64-bit unsigned-normalized-integer format with 16-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R16G16B16A16_UNORM. OpenGL counterpart: GL_RGBA16.
    /// [GL_EXT_texture_norm16]: https://www.khronos.org/registry/gles/extensions/EXT/EXT_texture_norm16.txt
    /// OpenGLES: [GL_EXT_texture_norm16][] extension is required
    rgba16_unorm,

    /// Four-component 64-bit unsigned-integer format with 16-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R16G16B16A16_UINT. OpenGL counterpart: GL_RGBA16UI.
    rgba16_uint,

    /// Four-component 64-bit signed-normalized-integer format with 16-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R16G16B16A16_SNORM. OpenGL counterpart: GL_RGBA16_SNORM.
    /// [GL_EXT_texture_norm16]: https://www.khronos.org/registry/gles/extensions/EXT/EXT_texture_norm16.txt
    /// OpenGLES: [GL_EXT_texture_norm16][] extension is required
    rgba16_snorm,

    /// Four-component 64-bit signed-integer format with 16-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R16G16B16A16_SINT. OpenGL counterpart: GL_RGBA16I.
    rgba16_sint,

    /// Two-component 64-bit typeless format with 32-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R32G32_TYPELESS. OpenGL does not have direct counterpart, GL_RG32F is used.
    rg32_typeless,

    /// Two-component 64-bit floating-point format with 32-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R32G32_FLOAT. OpenGL counterpart: GL_RG32F.
    rg32_float,

    /// Two-component 64-bit unsigned-integer format with 32-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R32G32_UINT. OpenGL counterpart: GL_RG32UI.
    rg32_uint,

    /// Two-component 64-bit signed-integer format with 32-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R32G32_SINT. OpenGL counterpart: GL_RG32I.
    rg32_sint,

    /// Two-component 64-bit typeless format with 32-bits for R channel and 8 bits for G channel.
    /// D3D counterpart: DXGI_FORMAT_R32G8X24_TYPELESS. OpenGL does not have direct counterpart, GL_DEPTH32F_STENCIL8 is used.
    r32g8x24_typeless,

    /// Two-component 64-bit format with 32-bit floating-point depth channel and 8-bit stencil channel.
    /// D3D counterpart: DXGI_FORMAT_D32_FLOAT_S8X24_UINT. OpenGL counterpart: GL_DEPTH32F_STENCIL8.
    d32_float_s8x24_uint,

    /// Two-component 64-bit format with 32-bit floating-point R channel and 8+24-bits of typeless data.
    /// D3D counterpart: DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS. OpenGL does not have direct counterpart, GL_DEPTH32F_STENCIL8 is used.
    r32_float_x8x24_typeless,

    /// Two-component 64-bit format with 32-bit typeless data and 8-bit G channel.
    /// D3D counterpart: DXGI_FORMAT_X32_TYPELESS_G8X24_UINT
    /// **Warning:** This format is currently not implemented in OpenGL
    x32_typeless_g8x24_uint,

    /// Four-component 32-bit typeless format with 10 bits for RGB and 2 bits for alpha channel.
    /// D3D counterpart: DXGI_FORMAT_R10G10B10A2_TYPELESS. OpenGL does not have direct counterpart, GL_RGB10_A2 is used.
    rgb10a2_typeless,

    /// Four-component 32-bit unsigned-normalized-integer format with 10 bits for each color and 2 bits for alpha channel.
    /// D3D counterpart: DXGI_FORMAT_R10G10B10A2_UNORM. OpenGL counterpart: GL_RGB10_A2.
    rgb10a2_unorm,

    /// Four-component 32-bit unsigned-integer format with 10 bits for each color and 2 bits for alpha channel.
    /// D3D counterpart: DXGI_FORMAT_R10G10B10A2_UINT. OpenGL counterpart: GL_RGB10_A2UI.
    rgb10a2_uint,

    /// Three-component 32-bit format encoding three partial precision channels using 11 bits for red and green and 10 bits for blue channel.
    /// D3D counterpart: DXGI_FORMAT_R11G11B10_FLOAT. OpenGL counterpart: GL_R11F_G11F_B10F.
    r11g11b10_float,

    /// Four-component 32-bit typeless format with 8-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R8G8B8A8_TYPELESS. OpenGL does not have direct counterpart, GL_RGBA8 is used.
    rgba8_typeless,

    /// Four-component 32-bit unsigned-normalized-integer format with 8-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R8G8B8A8_UNORM. OpenGL counterpart: GL_RGBA8.
    rgba8_unorm,

    /// Four-component 32-bit unsigned-normalized-integer sRGB format with 8-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R8G8B8A8_UNORM_SRGB. OpenGL counterpart: GL_SRGB8_ALPHA8.
    rgba8_unorm_srgb,

    /// Four-component 32-bit unsigned-integer format with 8-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R8G8B8A8_UINT. OpenGL counterpart: GL_RGBA8UI.
    rgba8_uint,

    /// Four-component 32-bit signed-normalized-integer format with 8-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R8G8B8A8_SNORM. OpenGL counterpart: GL_RGBA8_SNORM.
    rgba8_snorm,

    /// Four-component 32-bit signed-integer format with 8-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R8G8B8A8_SINT. OpenGL counterpart: GL_RGBA8I.
    rgba8_sint,

    /// Two-component 32-bit typeless format with 16-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R16G16_TYPELESS. OpenGL does not have direct counterpart, GL_RG16F is used.
    rg16_typeless,

    /// Two-component 32-bit half-precision floating-point format with 16-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R16G16_FLOAT. OpenGL counterpart: GL_RG16F.
    rg16_float,

    /// Two-component 32-bit unsigned-normalized-integer format with 16-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R16G16_UNORM. OpenGL counterpart: GL_RG16.
    /// [GL_EXT_texture_norm16]: https://www.khronos.org/registry/gles/extensions/EXT/EXT_texture_norm16.txt
    /// OpenGLES: [GL_EXT_texture_norm16][] extension is required
    rg16_unorm,

    /// Two-component 32-bit unsigned-integer format with 16-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R16G16_UINT. OpenGL counterpart: GL_RG16UI.
    rg16_uint,

    /// Two-component 32-bit signed-normalized-integer format with 16-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R16G16_SNORM. OpenGL counterpart: GL_RG16_SNORM.
    /// [GL_EXT_texture_norm16]: https://www.khronos.org/registry/gles/extensions/EXT/EXT_texture_norm16.txt
    /// OpenGLES: [GL_EXT_texture_norm16][] extension is required
    rg16_snorm,

    /// Two-component 32-bit signed-integer format with 16-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R16G16_SINT. OpenGL counterpart: GL_RG16I.
    rg16_sint,

    /// Single-component 32-bit typeless format.
    /// D3D counterpart: DXGI_FORMAT_R32_TYPELESS. OpenGL does not have direct counterpart, GL_R32F is used.
    r32_typeless,

    /// Single-component 32-bit floating-point depth format.
    /// D3D counterpart: DXGI_FORMAT_D32_FLOAT. OpenGL counterpart: GL_DEPTH_COMPONENT32F.
    d32_float,

    /// Single-component 32-bit floating-point format.
    /// D3D counterpart: DXGI_FORMAT_R32_FLOAT. OpenGL counterpart: GL_R32F.
    r32_float,

    /// Single-component 32-bit unsigned-integer format.
    /// D3D counterpart: DXGI_FORMAT_R32_UINT. OpenGL counterpart: GL_R32UI.
    r32_uint,

    /// Single-component 32-bit signed-integer format.
    /// D3D counterpart: DXGI_FORMAT_R32_SINT. OpenGL counterpart: GL_R32I.
    r32_sint,

    /// Two-component 32-bit typeless format with 24 bits for R and 8 bits for G channel.
    /// D3D counterpart: DXGI_FORMAT_R24G8_TYPELESS. OpenGL does not have direct counterpart, GL_DEPTH24_STENCIL8 is used.
    r24g8_typeless,

    /// Two-component 32-bit format with 24 bits for unsigned-normalized-integer depth and 8 bits for stencil.
    /// D3D counterpart: DXGI_FORMAT_D24_UNORM_S8_UINT. OpenGL counterpart: GL_DEPTH24_STENCIL8.
    d24_unorm_s8_uint,

    /// Two-component 32-bit format with 24 bits for unsigned-normalized-integer data and 8 bits of unreferenced data.
    /// D3D counterpart: DXGI_FORMAT_R24_UNORM_X8_TYPELESS. OpenGL does not have direct counterpart, GL_DEPTH24_STENCIL8 is used.
    r24_unorm_x8_typeless,

    /// Two-component 32-bit format with 24 bits of unreferenced data and 8 bits of unsigned-integer data.
    /// D3D counterpart: DXGI_FORMAT_X24_TYPELESS_G8_UINT
    /// **Warning:** This format is currently not implemented in OpenGL
    x24_typeless_g8_uint,

    /// Two-component 16-bit typeless format with 8-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R8G8_TYPELESS. OpenGL does not have direct counterpart, GL_RG8 is used.
    rg8_typeless,

    /// Two-component 16-bit unsigned-normalized-integer format with 8-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R8G8_UNORM. OpenGL counterpart: GL_RG8.
    rg8_unorm,

    /// Two-component 16-bit unsigned-integer format with 8-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R8G8_UINT. OpenGL counterpart: GL_RG8UI.
    rg8_uint,

    /// Two-component 16-bit signed-normalized-integer format with 8-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R8G8_SNORM. OpenGL counterpart: GL_RG8_SNORM.
    rg8_snorm,

    /// Two-component 16-bit signed-integer format with 8-bit channels.
    /// D3D counterpart: DXGI_FORMAT_R8G8_SINT. OpenGL counterpart: GL_RG8I.
    rg8_sint,

    /// Single-component 16-bit typeless format.
    /// D3D counterpart: DXGI_FORMAT_R16_TYPELESS. OpenGL does not have direct counterpart, GL_R16F is used.
    r16_typeless,

    /// Single-component 16-bit half-precision floating-point format.
    /// D3D counterpart: DXGI_FORMAT_R16_FLOAT. OpenGL counterpart: GL_R16F.
    r16_float,

    /// Single-component 16-bit unsigned-normalized-integer depth format.
    /// D3D counterpart: DXGI_FORMAT_D16_UNORM. OpenGL counterpart: GL_DEPTH_COMPONENT16.
    d16_unorm,

    /// Single-component 16-bit unsigned-normalized-integer format.
    /// D3D counterpart: DXGI_FORMAT_R16_UNORM. OpenGL counterpart: GL_R16.
    /// [GL_EXT_texture_norm16]: https://www.khronos.org/registry/gles/extensions/EXT/EXT_texture_norm16.txt
    /// OpenGLES: [GL_EXT_texture_norm16][] extension is required
    r16_unorm,

    /// Single-component 16-bit unsigned-integer format.
    /// D3D counterpart: DXGI_FORMAT_R16_UINT. OpenGL counterpart: GL_R16UI.
    r16_uint,

    /// Single-component 16-bit signed-normalized-integer format.
    /// D3D counterpart: DXGI_FORMAT_R16_SNORM. OpenGL counterpart: GL_R16_SNORM.
    /// [GL_EXT_texture_norm16]: https://www.khronos.org/registry/gles/extensions/EXT/EXT_texture_norm16.txt
    /// OpenGLES: [GL_EXT_texture_norm16][] extension is required
    r16_snorm,

    /// Single-component 16-bit signed-integer format.
    /// D3D counterpart: DXGI_FORMAT_R16_SINT. OpenGL counterpart: GL_R16I.
    r16_sint,

    /// Single-component 8-bit typeless format.
    /// D3D counterpart: DXGI_FORMAT_R8_TYPELESS. OpenGL does not have direct counterpart, GL_R8 is used.
    r8_typeless,

    /// Single-component 8-bit unsigned-normalized-integer format.
    /// D3D counterpart: DXGI_FORMAT_R8_UNORM. OpenGL counterpart: GL_R8.
    r8_unorm,

    /// Single-component 8-bit unsigned-integer format.
    /// D3D counterpart: DXGI_FORMAT_R8_UINT. OpenGL counterpart: GL_R8UI.
    r8_uint,

    /// Single-component 8-bit signed-normalized-integer format.
    /// D3D counterpart: DXGI_FORMAT_R8_SNORM. OpenGL counterpart: GL_R8_SNORM.
    r8_snorm,

    /// Single-component 8-bit signed-integer format.
    /// D3D counterpart: DXGI_FORMAT_R8_SINT. OpenGL counterpart: GL_R8I.
    r8_sint,

    /// Single-component 8-bit unsigned-normalized-integer format for alpha only.
    /// D3D counterpart: DXGI_FORMAT_A8_UNORM
    /// **Warning:** This format is not available in OpenGL
    a8_unorm,

    /// Single-component 1-bit format.
    /// D3D counterpart: DXGI_FORMAT_R1_UNORM
    /// **Warning:** This format is not available in OpenGL
    r1_unorm,

    /// Three partial-precision floating pointer numbers sharing single exponent encoded into a 32-bit value.
    /// D3D counterpart: DXGI_FORMAT_R9G9B9E5_SHAREDEXP. OpenGL counterpart: GL_RGB9_E5.
    rgb9e5_sharedexp,

    /// Four-component unsigned-normalized integer format analogous to UYVY encoding.
    /// D3D counterpart: DXGI_FORMAT_R8G8_B8G8_UNORM
    /// **Warning:** This format is not available in OpenGL
    rg8_b8g8_unorm,

    /// Four-component unsigned-normalized integer format analogous to YUY2 encoding.
    /// D3D counterpart: DXGI_FORMAT_G8R8_G8B8_UNORM
    /// **Warning:** This format is not available in OpenGL
    g8r8_g8b8_unorm,

    /// Four-component typeless block-compression format with 1:8 compression ratio.
    /// D3D counterpart: DXGI_FORMAT_BC1_TYPELESS. OpenGL does not have direct counterpart, GL_COMPRESSED_RGB_S3TC_DXT1_EXT is used.
    /// [GL_EXT_texture_compression_s3tc]: https://www.khronos.org/registry/gles/extensions/EXT/texture_compression_s3tc.txt
    /// OpenGL & OpenGLES: [GL_EXT_texture_compression_s3tc][] extension is required
    /// **See also:** [BC1 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc1), [DXT1 on OpenGL.org](https://www.opengl.org/wiki/S3_Texture_Compression#DXT1_Format)
    bc1_typeless,

    /// Four-component unsigned-normalized-integer block-compression format with 5 bits for R, 6 bits for G, 5 bits for B, and 0 or 1 bit for A channel.
    /// The pixel data is encoded using 8 bytes per 4x4 block (4 bits per pixel) providing 1:8 compression ratio against RGBA8 format.
    /// D3D counterpart: DXGI_FORMAT_BC1_UNORM. OpenGL counterpart: GL_COMPRESSED_RGB_S3TC_DXT1_EXT.
    /// [GL_EXT_texture_compression_s3tc]: https://www.khronos.org/registry/gles/extensions/EXT/texture_compression_s3tc.txt
    /// OpenGL & OpenGLES: [GL_EXT_texture_compression_s3tc][] extension is required
    /// **See also:** [BC1 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc1), [DXT1 on OpenGL.org](https://www.opengl.org/wiki/S3_Texture_Compression#DXT1_Format)
    bc1_unorm,

    /// Four-component unsigned-normalized-integer block-compression sRGB format with 5 bits for R, 6 bits for G, 5 bits for B, and 0 or 1 bit for A channel.
    /// The pixel data is encoded using 8 bytes per 4x4 block (4 bits per pixel) providing 1:8 compression ratio against RGBA8 format.
    /// D3D counterpart: DXGI_FORMAT_BC1_UNORM_SRGB. OpenGL counterpart: GL_COMPRESSED_SRGB_S3TC_DXT1_EXT.
    /// [GL_EXT_texture_compression_s3tc]: https://www.khronos.org/registry/gles/extensions/EXT/texture_compression_s3tc.txt
    /// OpenGL & OpenGLES: [GL_EXT_texture_compression_s3tc][] extension is required
    /// **See also:** [BC1 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc1), [DXT1 on OpenGL.org](https://www.opengl.org/wiki/S3_Texture_Compression#DXT1_Format)
    bc1_unorm_srgb,

    /// Four component typeless block-compression format with 1:4 compression ratio.
    /// D3D counterpart: DXGI_FORMAT_BC2_TYPELESS. OpenGL does not have direct counterpart, GL_COMPRESSED_RGBA_S3TC_DXT3_EXT is used.
    /// [GL_EXT_texture_compression_s3tc]: https://www.khronos.org/registry/gles/extensions/EXT/texture_compression_s3tc.txt
    /// OpenGL & OpenGLES: [GL_EXT_texture_compression_s3tc][] extension is required
    /// **See also:** [BC2 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc2), [DXT3 on OpenGL.org](https://www.opengl.org/wiki/S3_Texture_Compression#DXT3_Format)
    bc2_typeless,

    /// Four-component unsigned-normalized-integer block-compression format with 5 bits for R, 6 bits for G, 5 bits for B, and 4 bits for low-coherent separate A channel.
    /// The pixel data is encoded using 16 bytes per 4x4 block (8 bits per pixel) providing 1:4 compression ratio against RGBA8 format.
    /// D3D counterpart: DXGI_FORMAT_BC2_UNORM. OpenGL counterpart: GL_COMPRESSED_RGBA_S3TC_DXT3_EXT.
    /// [GL_EXT_texture_compression_s3tc]: https://www.khronos.org/registry/gles/extensions/EXT/texture_compression_s3tc.txt
    /// OpenGL & OpenGLES: [GL_EXT_texture_compression_s3tc][] extension is required
    /// **See also:** [BC2 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc2), [DXT3 on OpenGL.org](https://www.opengl.org/wiki/S3_Texture_Compression#DXT3_Format)
    bc2_unorm,

    /// Four-component signed-normalized-integer block-compression sRGB format with 5 bits for R, 6 bits for G, 5 bits for B, and 4 bits for low-coherent separate A channel.
    /// The pixel data is encoded using 16 bytes per 4x4 block (8 bits per pixel) providing 1:4 compression ratio against RGBA8 format.
    /// D3D counterpart: DXGI_FORMAT_BC2_UNORM_SRGB. OpenGL counterpart: GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT.
    /// [GL_EXT_texture_compression_s3tc]: https://www.khronos.org/registry/gles/extensions/EXT/texture_compression_s3tc.txt
    /// OpenGL & OpenGLES: [GL_EXT_texture_compression_s3tc][] extension is required
    /// **See also:** [BC2 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc2), [DXT3 on OpenGL.org](https://www.opengl.org/wiki/S3_Texture_Compression#DXT3_Format)
    bc2_unorm_srgb,

    /// Four-component typeless block-compression format with 1:4 compression ratio.
    /// D3D counterpart: DXGI_FORMAT_BC3_TYPELESS. OpenGL does not have direct counterpart, GL_COMPRESSED_RGBA_S3TC_DXT5_EXT is used.
    /// [GL_EXT_texture_compression_s3tc]: https://www.khronos.org/registry/gles/extensions/EXT/texture_compression_s3tc.txt
    /// OpenGL & OpenGLES: [GL_EXT_texture_compression_s3tc][] extension is required
    /// **See also:** [BC3 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc3), [DXT5 on OpenGL.org](https://www.opengl.org/wiki/S3_Texture_Compression#DXT5_Format)
    bc3_typeless,

    /// Four-component unsigned-normalized-integer block-compression format with 5 bits for R, 6 bits for G, 5 bits for B, and 8 bits for highly-coherent A channel.
    /// The pixel data is encoded using 16 bytes per 4x4 block (8 bits per pixel) providing 1:4 compression ratio against RGBA8 format.
    /// D3D counterpart: DXGI_FORMAT_BC3_UNORM. OpenGL counterpart: GL_COMPRESSED_RGBA_S3TC_DXT5_EXT.
    /// [GL_EXT_texture_compression_s3tc]: https://www.khronos.org/registry/gles/extensions/EXT/texture_compression_s3tc.txt
    /// OpenGL & OpenGLES: [GL_EXT_texture_compression_s3tc][] extension is required
    /// **See also:** [BC3 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc3), [DXT5 on OpenGL.org](https://www.opengl.org/wiki/S3_Texture_Compression#DXT5_Format)
    bc3_unorm,

    /// Four-component unsigned-normalized-integer block-compression sRGB format with 5 bits for R, 6 bits for G, 5 bits for B, and 8 bits for highly-coherent A channel.
    /// The pixel data is encoded using 16 bytes per 4x4 block (8 bits per pixel) providing 1:4 compression ratio against RGBA8 format.
    /// D3D counterpart: DXGI_FORMAT_BC3_UNORM_SRGB. OpenGL counterpart: GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT.
    /// [GL_EXT_texture_compression_s3tc]: https://www.khronos.org/registry/gles/extensions/EXT/texture_compression_s3tc.txt
    /// OpenGL & OpenGLES: [GL_EXT_texture_compression_s3tc][] extension is required
    /// **See also:** [BC3 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc3), [DXT5 on OpenGL.org](https://www.opengl.org/wiki/S3_Texture_Compression#DXT5_Format)
    bc3_unorm_srgb,

    /// One-component typeless block-compression format with 1:2 compression ratio.
    /// D3D counterpart: DXGI_FORMAT_BC4_TYPELESS. OpenGL does not have direct counterpart, GL_COMPRESSED_RED_RGTC1 is used.
    /// [GL_ARB_texture_compression_rgtc]: https://www.opengl.org/registry/specs/ARB/texture_compression_rgtc.txt
    /// OpenGL & OpenGLES: [GL_ARB_texture_compression_rgtc][] extension is required
    /// **See also:** [BC4 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc4), [Compressed formats on OpenGL.org](https://www.opengl.org/wiki/Image_Format#Compressed_formats)
    bc4_typeless,

    /// One-component unsigned-normalized-integer block-compression format with 8 bits for R channel.
    /// The pixel data is encoded using 8 bytes per 4x4 block (4 bits per pixel) providing 1:2 compression ratio against R8 format.
    /// D3D counterpart: DXGI_FORMAT_BC4_UNORM. OpenGL counterpart: GL_COMPRESSED_RED_RGTC1.
    /// [GL_ARB_texture_compression_rgtc]: https://www.opengl.org/registry/specs/ARB/texture_compression_rgtc.txt
    /// OpenGL & OpenGLES: [GL_ARB_texture_compression_rgtc][] extension is required
    /// **See also:** [BC4 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc4), [Compressed formats on OpenGL.org](https://www.opengl.org/wiki/Image_Format#Compressed_formats)
    bc4_unorm,

    /// One-component signed-normalized-integer block-compression format with 8 bits for R channel.
    /// The pixel data is encoded using 8 bytes per 4x4 block (4 bits per pixel) providing 1:2 compression ratio against R8 format.
    /// D3D counterpart: DXGI_FORMAT_BC4_SNORM. OpenGL counterpart: GL_COMPRESSED_SIGNED_RED_RGTC1.
    /// [GL_ARB_texture_compression_rgtc]: https://www.opengl.org/registry/specs/ARB/texture_compression_rgtc.txt
    /// OpenGL & OpenGLES: [GL_ARB_texture_compression_rgtc][] extension is required
    /// **See also:** [BC4 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc4), [Compressed formats on OpenGL.org](https://www.opengl.org/wiki/Image_Format#Compressed_formats)
    bc4_snorm,

    /// Two-component typeless block-compression format with 1:2 compression ratio.
    /// D3D counterpart: DXGI_FORMAT_BC5_TYPELESS. OpenGL does not have direct counterpart, GL_COMPRESSED_RG_RGTC2 is used.
    /// [GL_ARB_texture_compression_rgtc]: https://www.opengl.org/registry/specs/ARB/texture_compression_rgtc.txt
    /// OpenGL & OpenGLES: [GL_ARB_texture_compression_rgtc][] extension is required
    /// **See also:** [BC5 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc5), [Compressed formats on OpenGL.org](https://www.opengl.org/wiki/Image_Format#Compressed_formats)
    bc5_typeless,

    /// Two-component unsigned-normalized-integer block-compression format with 8 bits for R and 8 bits for G channel.
    /// The pixel data is encoded using 16 bytes per 4x4 block (8 bits per pixel) providing 1:2 compression ratio against RG8 format.
    /// D3D counterpart: DXGI_FORMAT_BC5_UNORM. OpenGL counterpart: GL_COMPRESSED_RG_RGTC2.
    /// [GL_ARB_texture_compression_rgtc]: https://www.opengl.org/registry/specs/ARB/texture_compression_rgtc.txt
    /// OpenGL & OpenGLES: [GL_ARB_texture_compression_rgtc][] extension is required
    /// **See also:** [BC5 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc5), [Compressed formats on OpenGL.org](https://www.opengl.org/wiki/Image_Format#Compressed_formats)
    bc5_unorm,

    /// Two-component signed-normalized-integer block-compression format with 8 bits for R and 8 bits for G channel.
    /// The pixel data is encoded using 16 bytes per 4x4 block (8 bits per pixel) providing 1:2 compression ratio against RG8 format.
    /// D3D counterpart: DXGI_FORMAT_BC5_SNORM. OpenGL counterpart: GL_COMPRESSED_SIGNED_RG_RGTC2.
    /// [GL_ARB_texture_compression_rgtc]: https://www.opengl.org/registry/specs/ARB/texture_compression_rgtc.txt
    /// OpenGL & OpenGLES: [GL_ARB_texture_compression_rgtc][] extension is required
    /// **See also:** [BC5 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc5), [Compressed formats on OpenGL.org](https://www.opengl.org/wiki/Image_Format#Compressed_formats)
    bc5_snorm,

    /// Three-component 16-bit unsigned-normalized-integer format with 5 bits for blue, 6 bits for green, and 5 bits for red channel.
    /// D3D counterpart: DXGI_FORMAT_B5G6R5_UNORM
    /// **Warning:** This format is not available until D3D11.1 and Windows 8. It is also not available in OpenGL
    b5g6r5_unorm,

    /// Four-component 16-bit unsigned-normalized-integer format with 5 bits for each color channel and 1-bit alpha.
    /// D3D counterpart: DXGI_FORMAT_B5G5R5A1_UNORM
    /// **Warning:** This format is not available until D3D11.1 and Windows 8. It is also not available in OpenGL
    b5g5r5a1_unorm,

    /// Four-component 32-bit unsigned-normalized-integer format with 8 bits for each channel.
    /// D3D counterpart: DXGI_FORMAT_B8G8R8A8_UNORM.
    /// **Warning:** This format is not available in OpenGL
    bgra8_unorm,

    /// Four-component 32-bit unsigned-normalized-integer format with 8 bits for each color channel and 8 bits unused.
    /// D3D counterpart: DXGI_FORMAT_B8G8R8X8_UNORM.
    /// **Warning:** This format is not available in OpenGL
    bgrx8_unorm,

    /// Four-component 32-bit 2.8-biased fixed-point format with 10 bits for each color channel and 2-bit alpha.
    /// D3D counterpart: DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM.
    /// **Warning:** This format is not available in OpenGL
    r10g10b10_xr_bias_a2_unorm,

    /// Four-component 32-bit typeless format with 8 bits for each channel.
    /// D3D counterpart: DXGI_FORMAT_B8G8R8A8_TYPELESS.
    /// **Warning:** This format is not available in OpenGL
    bgra8_typeless,

    /// Four-component 32-bit unsigned-normalized sRGB format with 8 bits for each channel.
    /// D3D counterpart: DXGI_FORMAT_B8G8R8A8_UNORM_SRGB.
    /// **Warning:** This format is not available in OpenGL.
    bgra8_unorm_srgb,

    /// Four-component 32-bit typeless format that with 8 bits for each color channel, and 8 bits are unused.
    /// D3D counterpart: DXGI_FORMAT_B8G8R8X8_TYPELESS.
    /// **Warning:** This format is not available in OpenGL.
    bgrx8_typeless,

    /// Four-component 32-bit unsigned-normalized sRGB format with 8 bits for each color channel, and 8 bits are unused.
    /// D3D counterpart: DXGI_FORMAT_B8G8R8X8_UNORM_SRGB.
    /// **Warning:** This format is not available in OpenGL.
    bgrx8_unorm_srgb,

    /// Three-component typeless block-compression format.
    /// D3D counterpart: DXGI_FORMAT_BC6H_TYPELESS. OpenGL does not have direct counterpart, GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT is used.
    /// [GL_ARB_texture_compression_bptc]: https://www.khronos.org/registry/OpenGL/extensions/ARB/ARB_texture_compression_bptc.txt
    /// OpenGL: [GL_ARB_texture_compression_bptc][] extension is required. Not supported in at least OpenGLES3.1
    /// **See also:** [BC6H on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d11/bc6h-format), [BPTC Texture Compression on OpenGL.org](https://www.opengl.org/wiki/BPTC_Texture_Compression)
    bc6h_typeless,

    /// Three-component unsigned half-precision floating-point format with 16 bits for each channel.
    /// D3D counterpart: DXGI_FORMAT_BC6H_UF16. OpenGL counterpart: GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT.
    /// [GL_ARB_texture_compression_bptc]: https://www.khronos.org/registry/OpenGL/extensions/ARB/ARB_texture_compression_bptc.txt
    /// OpenGL: [GL_ARB_texture_compression_bptc][] extension is required. Not supported in at least OpenGLES3.1
    /// **See also:** [BC6H on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d11/bc6h-format), [BPTC Texture Compression on OpenGL.org](https://www.opengl.org/wiki/BPTC_Texture_Compression)
    bc6h_uf16,

    /// Three-channel signed half-precision floating-point format with 16 bits per each channel.
    /// D3D counterpart: DXGI_FORMAT_BC6H_SF16. OpenGL counterpart: GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT.
    /// [GL_ARB_texture_compression_bptc]: https://www.khronos.org/registry/OpenGL/extensions/ARB/ARB_texture_compression_bptc.txt
    /// OpenGL: [GL_ARB_texture_compression_bptc][] extension is required. Not supported in at least OpenGLES3.1
    /// **See also:** [BC6H on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d11/bc6h-format), [BPTC Texture Compression on OpenGL.org](https://www.opengl.org/wiki/BPTC_Texture_Compression)
    bc6h_sf16,

    /// Three-component typeless block-compression format.
    /// D3D counterpart: DXGI_FORMAT_BC7_TYPELESS. OpenGL does not have direct counterpart, GL_COMPRESSED_RGBA_BPTC_UNORM is used.
    /// [GL_ARB_texture_compression_bptc]: https://www.khronos.org/registry/OpenGL/extensions/ARB/ARB_texture_compression_bptc.txt
    /// OpenGL: [GL_ARB_texture_compression_bptc][] extension is required. Not supported in at least OpenGLES3.1
    /// **See also:** [BC7 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d11/bc7-format), [BPTC Texture Compression on OpenGL.org](https://www.opengl.org/wiki/BPTC_Texture_Compression)
    bc7_typeless,

    /// Three-component block-compression unsigned-normalized-integer format with 4 to 7 bits per color channel and 0 to 8 bits of alpha.
    /// D3D counterpart: DXGI_FORMAT_BC7_UNORM. OpenGL counterpart: GL_COMPRESSED_RGBA_BPTC_UNORM.
    /// [GL_ARB_texture_compression_bptc]: https://www.khronos.org/registry/OpenGL/extensions/ARB/ARB_texture_compression_bptc.txt
    /// OpenGL: [GL_ARB_texture_compression_bptc][] extension is required. Not supported in at least OpenGLES3.1
    /// **See also:** [BC7 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d11/bc7-format), [BPTC Texture Compression on OpenGL.org](https://www.opengl.org/wiki/BPTC_Texture_Compression)
    bc7_unorm,

    /// Three-component block-compression unsigned-normalized-integer sRGB format with 4 to 7 bits per color channel and 0 to 8 bits of alpha.
    /// D3D counterpart: DXGI_FORMAT_BC7_UNORM_SRGB. OpenGL counterpart: GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM.
    /// [GL_ARB_texture_compression_bptc]: https://www.khronos.org/registry/OpenGL/extensions/ARB/ARB_texture_compression_bptc.txt
    /// OpenGL: [GL_ARB_texture_compression_bptc][] extension is required. Not supported in at least OpenGLES3.1
    /// **See also:** [BC7 on MSDN](https://docs.microsoft.com/en-us/windows/win32/direct3d11/bc7-format), [BPTC Texture Compression on OpenGL.org](https://www.opengl.org/wiki/BPTC_Texture_Compression)
    bc7_unorm_srgb,

    /// Three-component block-compression unsigned-normalized-integer format.
    /// OpenGL counterpart: GL_COMPRESSED_RGB8_ETC2.
    etc2_rgb8_unorm,

    /// Three-component block-compression unsigned-normalized-integer sRGB format.
    /// OpenGL counterpart: GL_COMPRESSED_SRGB8_ETC2.
    etc2_rgb8_unorm_srgb,

    /// Four-component block-compression unsigned-normalized-integer format.
    /// OpenGL counterpart: GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2.
    etc2_rgb8a1_unorm,

    /// Four-component block-compression unsigned-normalized-integer sRGB format.
    /// OpenGL counterpart: GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2.
    etc2_rgb8a1_unorm_srgb,

    /// Four-component block-compression unsigned-normalized-integer format.
    /// OpenGL counterpart: GL_COMPRESSED_RGBA8_ETC2_EAC.
    etc2_rgba8_unorm,

    /// Four-component block-compression unsigned-normalized-integer sRGB format.
    /// OpenGL counterpart: GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC.
    etc2_rgba8_unorm_srgb,

    /// Helper member containing the total number of texture formats in the enumeration
    num_formats,
};

/// Defines allowed swap chain usage flags
///
/// **Zig Usage:** All flags being false is the same as Diligent's
/// SWAP_CHAIN_USAGE_NONE.
pub const SwapchainUsageFlags = packed struct(u32) {
    /// Swap chain images can be used as render target outputs
    render_target: bool = false,

    /// Swap chain images can be used as shader resources
    SWAP_CHAIN_USAGE_SHADER_RESOURCE: bool = false,

    /// Swap chain images can be used as input attachments
    SWAP_CHAIN_USAGE_INPUT_ATTACHMENT: bool = false,

    /// Swap chain images can be used as a source of copy operation
    SWAP_CHAIN_USAGE_COPY_SOURCE: bool = false,

    _: u28 = 0,
};

/// The transform applied to the image content prior to presentation.
pub const SurfaceTransform = enum(u32) {
    /// Uses the most optimal surface transform.
    optimal,

    /// The image content is presented without being transformed.
    identity,

    /// The image content is rotated 90 degrees clockwise.
    rotate_90,

    /// The image content is rotated 180 degrees clockwise.
    rotate_180,

    /// The image content is rotated 270 degrees clockwise.
    rotate_270,

    /// The image content is mirrored horizontally.
    horizontal_mirror,

    /// The image content is mirrored horizontally, then rotated 90 degrees clockwise.
    mirror_rotate_90,

    /// The image content is mirrored horizontally, then rotated 180 degrees clockwise.
    mirror_rotate_180,

    /// The image content is mirrored horizontally, then rotated 270 degrees clockwise.
    mirror_rotate_270,
};

/// Swap chain description
pub const SwapchainDesc = extern struct {
    /// The swap chain width. Default value is 0
    width: u32 = 0,

    /// The swap chain height. Default value is 0
    height: u32 = 0,

    /// Back buffer format. Default value is TextureFormat.rgba8_unorm_srgb
    color_buffer_format: TextureFormat = .rgba8_unorm_srgb,

    /// Depth buffer format. Default value is TextureFormat.d32_float.
    /// Use `TextureFormat.unknown` to create the swap chain without depth buffer.
    depth_buffer_format: TextureFormat = .d32_float,

    /// Swap chain usage flags. Default value is `SwapchainUsage.render_target`
    usage: SwapchainUsageFlags = .{ .render_target = true },

    /// The transform, relative to the presentation engine's natural orientation,
    /// applied to the image content prior to presentation.
    ///
    /// When default value (`SurfaceTransform.optimal`) is used, the engine will
    /// select the most optimal surface transformation. An application may request
    /// specific transform (e.g. `SurfaceTransform.identity`) and the engine will
    /// try to use that. However, if the transform is not available, the engine will
    /// select the most optimal transform.
    /// After the swap chain has been created, this member will contain the actual
    /// transform selected by the engine and can be queried through `Swapchain.getDesc()`
    /// method.
    pre_transform: SurfaceTransform = .optimal,

    /// The number of buffers in the swap chain
    buffer_count: u32 = 2,

    /// Default depth value, which is used as optimized depth clear value in D3D12
    default_depth_value: f32 = 1.0,

    /// Default stencil value, which is used as optimized stencil clear value in D3D12
    default_stencil_value: u8 = 0,

    /// Indicates if this is a primary swap chain. When `present()` is called
    /// for the primary swap chain, the engine releases stale resources.
    is_primary: bool = true,

    comptime {
        helpers.ensureSame(SwapchainDesc, c.SwapChainDesc);
    }
};

/// Device context description.
pub const DeviceContextDesc = extern struct {
    /// Device context name.
    /// This name is what was specified in ImmediateContextCreateInfo::Name when the engine was initialized.
    name: ?[*:0]const u8 = null,

    /// Command queue type that this context uses.
    /// For immediate contexts, this type matches GraphicsAdapterInfo::Queues[QueueId].QueueType.
    /// For deferred contexts, the type is only defined between IDeviceContext::Begin and IDeviceContext::FinishCommandList
    /// calls and matches the type of the immediate context where the command list will be executed.
    queue_type: CommandQueueType = .unknown,

    /// Indicates if this is a deferred context.
    is_deferred: bool = false,

    /// Device context ID. This value corresponds to the index of the device context
    /// in ppContexts array when the engine was initialized.
    /// When starting recording commands with a deferred context, the context id
    /// of the immediate context where the command list will be executed should be
    /// given to IDeviceContext::Begin() method.
    context_id: u8 = 0,

    /// Hardware queue index in GraphicsAdapterInfo::Queues array.
    /// This member is only defined for immediate contexts and matches
    /// QueueId member of ImmediateContextCreateInfo struct that was used to
    /// initialize the context.
    ///
    /// - Vulkan backend: same as queue family index.
    /// - Direct3D12 backend:
    ///   - 0 - Graphics queue
    ///   - 1 - Compute queue
    ///   - 2 - Transfer queue
    /// - Metal backend: index of the unique command queue.
    queue_id: u8 = constants.default_queue_id,

    /// Required texture granularity for copy operations, for a transfer queue.
    /// For graphics and compute queues, the granularity is always {1,1,1}.
    /// For transfer queues, an application must align the texture offsets and sizes
    /// by the granularity defined by this member.
    ///
    /// For deferred contexts, this member is only defined between IDeviceContext::Begin() and
    /// IDeviceContext::FinishCommandList() calls and matches the texture copy granularity of
    /// the immediate context where the command list will be executed.
    texture_copy_granularity: [3]u32 = .{ 0, 0, 0 },

    comptime {
        helpers.ensureSame(@This(), c.DeviceContextDesc);
    }
};

/// Defines resource state transition mode performed by various commands.
///
/// Refer to http://diligentgraphics.com/2018/12/09/resource-state-management/ for detailed explanation
/// of resource state management in Diligent Engine.
pub const ResourceStateTransitionMode = enum(u8) {
    /// Perform no state transitions and no state validation.
    /// Resource states are not accessed (either read or written) by the command.
    none = 0,

    /// Transition resources to the states required by the specific command.
    /// Resources in unknown state are ignored.
    ///
    /// Any method that uses this mode may alter the state of the resources it works with.
    /// As automatic state management is not thread-safe, no other thread is allowed to read
    /// or write the state of the resources being transitioned.
    /// If the application intends to use the same resources in other threads simultaneously, it needs to
    /// explicitly manage the states using IDeviceContext::TransitionResourceStates() method.
    ///
    /// **Note:** If a resource is used in multiple threads by multiple contexts, there will be race condition accessing
    /// internal resource state. An application should use manual resource state management in this case.
    transition,

    /// Do not transition, but verify that states are correct.
    /// No validation is performed if the state is unknown to the engine.
    /// This mode only has effect in debug and development builds. No validation
    /// is performed in release build.
    ///
    /// **Note:** Any method that uses this mode will read the state of resources it works with.
    /// As automatic state management is not thread-safe, no other thread is allowed to alter
    /// the state of resources being used by the command. It is safe to read these states.
    verify,
};

/// Defines allowed flags for IDeviceContext::SetVertexBuffers() function.
pub const SetVertexBuffersFlags = packed struct(u8) {
    /// Reset the vertex buffers to only the buffers specified in this
    /// call. All buffers previously bound to the pipeline will be unbound.
    reset: bool = false,

    _: u7 = 0,
};

/// Describes the viewport.
///
/// This structure is used by IDeviceContext::SetViewports().
pub const Viewport = extern struct {
    /// X coordinate of the left boundary of the viewport.
    top_left_x: f32 = 0.0,

    /// Y coordinate of the top boundary of the viewport.
    ///
    /// When defining a viewport, DirectX convention is used:
    /// window coordinate systems originates in the LEFT TOP corner
    /// of the screen with Y axis pointing down.
    top_left_y: f32 = 0.0,

    /// Viewport width.
    width: f32 = 0.0,

    /// Viewport Height.
    height: f32 = 0.0,

    /// Minimum depth of the viewport. Ranges between 0 and 1.
    min_depth: f32 = 0.0,

    /// Maximum depth of the viewport. Ranges between 0 and 1.
    max_depth: f32 = 1.0,

    comptime {
        helpers.ensureSame(@This(), c.Viewport);
    }
};

/// Describes the rectangle.
///
/// This structure is used by IDeviceContext::SetScissorRects().
///
/// **Remarks:** When defining a viewport, Windows convention is used:
/// window coordinate systems originates in the LEFT TOP corner
/// of the screen with Y axis pointing down.
pub const Rect = extern struct {
    /// X coordinate of the left boundary of the viewport.
    left: i32 = 0,
    /// Y coordinate of the top boundary of the viewport.
    top: i32 = 0,
    /// X coordinate of the right boundary of the viewport.
    right: i32 = 0,
    /// Y coordinate of the bottom boundary of the viewport.
    bottom: i32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.Rect);
    }
};

/// SetRenderTargetsExt command attributes.
/// This structure is used by IDeviceContext::SetRenderTargetsExt().
pub const SetRenderTargetsAttribs = extern struct {
    /// Number of render targets to bind.
    num_render_targets: u32 = 0,

    /// Array of pointers to ITextureView that represent the render
    /// targets to bind to the device. The type of each view in the
    /// array must be Diligent::TEXTURE_VIEW_RENDER_TARGET.
    render_targets: ?[*]c.ITextureView = null,

    /// Pointer to the ITextureView that represents the depth stencil to
    /// bind to the device. The view type must be
    /// Diligent::TEXTURE_VIEW_DEPTH_STENCIL or Diligent::TEXTURE_VIEW_READ_ONLY_DEPTH_STENCIL.
    depth_stencil: ?*c.ITextureView = null,

    /// Shading rate texture view. Set null to disable variable rate shading.
    shading_rate_map: ?*c.ITextureView = null,

    /// State transition mode of the render targets, depth stencil buffer
    /// and shading rate map being set (see Diligent::RESOURCE_STATE_TRANSITION_MODE).
    state_transition_mode: ResourceStateTransitionMode = .none,

    comptime {
        helpers.ensureSame(@This(), c.SetRenderTargetsAttribs);
    }
};

// ---- Flags and enums ----

/// Draw command flags.
pub const DrawFlags = packed struct(u8) {
    /// Verify the state of index and vertex buffers used by the draw command.
    /// Only performed in debug and development builds.
    verify_states: bool = false,

    /// Verify correctness of the parameters passed to the draw command.
    /// Only has effect in debug and development builds.
    verify_draw_attribs: bool = false,

    /// No dynamic resource buffers used by the draw command have been modified by the CPU since the last command.
    /// The flag has no effect in D3D11 and OpenGL backends.
    dynamic_resource_buffers_intact: bool = false,

    /// No inline constants used by the draw command have been modified by the CPU since the last command.
    inline_constants_intact: bool = false,

    _: u4 = 0,

    /// Perform all state validation checks.
    pub const verify_all: DrawFlags = .{
        .verify_states = true,
        .verify_draw_attribs = true,
    };

    /// Neither dynamic resource buffers nor inline constants have been modified since the previous command.
    pub const dynamic_buffers_and_inline_constants_intact: DrawFlags = .{
        .dynamic_resource_buffers_intact = true,
        .inline_constants_intact = true,
    };

    comptime {
        helpers.ensureSame(@This(), c.DRAW_FLAGS);
    }
};

/// Defines which parts of the depth-stencil buffer to clear.
pub const ClearDepthStencilFlags = packed struct(u32) {
    /// Clear the depth part of the buffer.
    depth: bool = false,

    /// Clear the stencil part of the buffer.
    stencil: bool = false,

    _: u30 = 0,

    comptime {
        helpers.ensureSame(@This(), c.CLEAR_DEPTH_STENCIL_FLAGS);
    }
};

/// TLAS instance flags used by BuildTLASAttribs.
pub const RaytracingInstanceFlags = packed struct(u8) {
    /// Disables face culling for this instance.
    triangle_facing_cull_disable: bool = false,

    /// The front face for culling is the face that is counter-clockwise in object space.
    triangle_front_counterclockwise: bool = false,

    /// Acts as if `RaytracingGeometryFlags.@"opaque"` were specified on all geometries of this instance.
    force_opaque: bool = false,

    /// Acts as if `RaytracingGeometryFlags.@"opaque"` were not specified on all geometries of this instance.
    force_no_opaque: bool = false,

    _: u4 = 0,

    comptime {
        helpers.ensureSame(@This(), c.RAYTRACING_INSTANCE_FLAGS);
    }
};

/// Geometry flags for ray tracing.
pub const RaytracingGeometryFlags = packed struct(u8) {
    /// The geometry does not invoke any-hit shaders, even if present in a hit group.
    @"opaque": bool = false,

    /// The any-hit shader is invoked only once per primitive in this geometry.
    no_duplicate_any_hit_invocation: bool = false,

    _: u6 = 0,

    comptime {
        helpers.ensureSame(@This(), c.RAYTRACING_GEOMETRY_FLAGS);
    }
};

/// Resource state transition flags.
pub const StateTransitionFlags = packed struct(u8) {
    /// The internal resource state is updated to the new state, and the engine takes over state management.
    /// Cannot be used when the transition type is `begin`.
    update_state: bool = false,

    /// The resource contents are discarded, when possible.
    discard_content: bool = false,

    /// Transition between aliased resources that share the same memory. Only supported for sparse resources
    /// created with the aliasing flag.
    aliasing: bool = false,

    _: u5 = 0,

    comptime {
        helpers.ensureSame(@This(), c.STATE_TRANSITION_FLAGS);
    }
};

/// Acceleration structure copy mode.
pub const CopyAsMode = enum(u8) {
    /// Direct copy. The destination must have been created with the same parameters as the source.
    clone = 0,

    /// Compacted copy. The destination must have been created with a `CompactedSize`
    /// returned by `writeBLASCompactedSize()` or `writeTLASCompactedSize()`.
    compact = 1,
};

// ---- Draw and dispatch attributes ----

/// Draw command attributes. Used by `DeviceContext.draw()`.
pub const DrawAttribs = extern struct {
    /// The number of vertices to draw.
    num_vertices: u32 = 0,

    /// Additional flags.
    flags: DrawFlags = .{},

    /// The number of instances to draw. If more than one, an instanced draw call is performed.
    num_instances: u32 = 1,

    /// Location (index, not byte offset) of the first vertex in the vertex buffer to start reading from.
    start_vertex_location: u32 = 0,

    /// Location (index, not byte offset) in the vertex buffer to start reading instance data from.
    first_instance_location: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.DrawAttribs);
    }
};

/// Indexed draw command attributes. Used by `DeviceContext.drawIndexed()`.
pub const DrawIndexedAttribs = extern struct {
    /// The number of indices to draw.
    num_indices: u32 = 0,

    /// The type of elements in the index buffer. Allowed values: `uint16` and `uint32`.
    index_type: graphics.types.ValueType = .undefined,

    /// Additional flags.
    flags: DrawFlags = .{},

    /// The number of instances to draw. If more than one, an instanced draw call is performed.
    num_instances: u32 = 1,

    /// Location (not byte offset) of the first index in the index buffer to start reading from.
    first_index_location: u32 = 0,

    /// A constant added to each index before accessing the vertex buffer.
    base_vertex: u32 = 0,

    /// Location (index, not byte offset) in the vertex buffer to start reading instance data from.
    first_instance_location: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.DrawIndexedAttribs);
    }
};

/// Indirect draw command attributes. Used by `DeviceContext.drawIndirect()`.
pub const DrawIndirectAttribs = extern struct {
    /// Buffer from which indirect draw arguments are read. It must contain, at the specified offset:
    /// `num_vertices`, `num_instances`, `start_vertex_location`, `first_instance_location` as `u32`.
    attribs_buffer: ?*c.IBuffer = null,

    /// Offset from the beginning of the buffer to the draw command arguments.
    draw_args_offset: u64 = 0,

    /// Additional flags.
    flags: DrawFlags = .{},

    /// The number of draw commands to execute. If a counter buffer is set, this is the maximum number of commands.
    /// Must be less than `DrawCommandProperties.max_draw_indirect_count`.
    draw_count: u32 = 1,

    /// When `draw_count > 1`, the byte stride between successive sets of draw parameters.
    /// Must be a multiple of 4 and at least 16 bytes.
    draw_args_stride: u32 = 16,

    /// State transition mode for the indirect draw arguments buffer.
    attribs_buffer_state_transition_mode: graphics.types.ResourceStateTransitionMode = .none,

    /// Optional buffer from which a `u32` draw count is read.
    counter_buffer: ?*c.IBuffer = null,

    /// When `counter_buffer` is not null, offset from the beginning of the buffer to the command counter.
    counter_offset: u64 = 0,

    /// State transition mode for the counter buffer.
    counter_buffer_state_transition_mode: graphics.types.ResourceStateTransitionMode = .none,

    comptime {
        helpers.ensureSame(@This(), c.DrawIndirectAttribs);
    }
};

/// Indexed indirect draw command attributes. Used by `DeviceContext.drawIndexedIndirect()`.
pub const DrawIndexedIndirectAttribs = extern struct {
    /// The type of elements in the index buffer. Allowed values: `uint16` and `uint32`.
    index_type: graphics.types.ValueType = .undefined,

    /// Buffer from which indirect draw arguments are read. It must contain, at the specified offset:
    /// `num_indices`, `num_instances`, `first_index_location`, `base_vertex`, `first_instance_location` as `u32`.
    attribs_buffer: ?*c.IBuffer = null,

    /// Offset from the beginning of the buffer to the draw command arguments.
    draw_args_offset: u64 = 0,

    /// Additional flags.
    flags: DrawFlags = .{},

    /// The number of draw commands to execute. If a counter buffer is set, this is the maximum number of commands.
    /// Must be less than `DrawCommandProperties.max_draw_indirect_count`.
    draw_count: u32 = 1,

    /// When `draw_count > 1`, the byte stride between successive sets of draw parameters.
    /// Must be a multiple of 4 and at least 20 bytes.
    draw_args_stride: u32 = 20,

    /// State transition mode for the indirect draw arguments buffer.
    attribs_buffer_state_transition_mode: graphics.types.ResourceStateTransitionMode = .none,

    /// Optional buffer from which a `u32` draw count is read.
    counter_buffer: ?*c.IBuffer = null,

    /// When `counter_buffer` is not null, offset from the beginning of the counter buffer to the command counter.
    counter_offset: u64 = 0,

    /// State transition mode for the counter buffer.
    counter_buffer_state_transition_mode: graphics.types.ResourceStateTransitionMode = .none,

    comptime {
        helpers.ensureSame(@This(), c.DrawIndexedIndirectAttribs);
    }
};

/// Metal-specific mesh draw command attributes. Ignored by all other backends.
pub const DrawMeshAttribsMtl = extern struct {
    /// Object thread group X size.
    object_thread_group_size_x: u32 = 0,

    /// Object thread group Y size.
    object_thread_group_size_y: u32 = 0,

    /// Object thread group Z size.
    object_thread_group_size_z: u32 = 0,

    /// Mesh thread group X size.
    mesh_thread_group_size_x: u32 = 0,

    /// Mesh thread group Y size.
    mesh_thread_group_size_y: u32 = 0,

    /// Mesh thread group Z size.
    mesh_thread_group_size_z: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.DrawMeshAttribsMtl);
    }
};

/// Mesh draw command attributes. Used by `DeviceContext.drawMesh()`.
pub const DrawMeshAttribs = extern struct {
    /// The number of groups dispatched in the X direction.
    thread_group_count_x: u32 = 1,

    /// The number of groups dispatched in the Y direction.
    thread_group_count_y: u32 = 1,

    /// The number of groups dispatched in the Z direction.
    thread_group_count_z: u32 = 1,

    /// Additional flags.
    flags: DrawFlags = .{},

    /// Metal-specific attributes. Only used by the Metal backend.
    mtl_attribs: ?*const DrawMeshAttribsMtl = null,

    comptime {
        helpers.ensureSame(@This(), c.DrawMeshAttribs);
    }
};

/// Indirect mesh draw command attributes. Used by `DeviceContext.drawMeshIndirect()`.
pub const DrawMeshIndirectAttribs = extern struct {
    /// Buffer from which indirect draw arguments are read. Direct3D12 reads three `u32` thread group counts;
    /// Vulkan reads `task_count` and `first_task` as `u32`.
    attribs_buffer: ?*c.IBuffer = null,

    /// Offset from the beginning of the attribs buffer to the draw command arguments.
    draw_args_offset: u64 = 0,

    /// Additional flags.
    flags: DrawFlags = .{},

    /// When `counter_buffer` is null, the number of commands to run. Otherwise the maximum number of
    /// commands that will be read from the count buffer.
    command_count: u32 = 1,

    /// State transition mode for the indirect draw arguments buffer.
    attribs_buffer_state_transition_mode: graphics.types.ResourceStateTransitionMode = .none,

    /// Optional buffer from which a `u32` draw count is read.
    counter_buffer: ?*c.IBuffer = null,

    /// When `counter_buffer` is not null, offset from the beginning of the buffer to the command counter.
    counter_offset: u64 = 0,

    /// State transition mode for the counter buffer.
    counter_buffer_state_transition_mode: graphics.types.ResourceStateTransitionMode = .none,

    /// Metal-specific attributes. Only used by the Metal backend.
    mtl_attribs: ?*const DrawMeshAttribsMtl = null,

    comptime {
        helpers.ensureSame(@This(), c.DrawMeshIndirectAttribs);
    }
};

/// Multi-draw command item.
pub const MultiDrawItem = extern struct {
    /// The number of vertices to draw.
    num_vertices: u32 = 0,

    /// Location (index, not byte offset) of the first vertex in the vertex buffer to start reading from.
    start_vertex_location: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.MultiDrawItem);
    }
};

/// Multi-draw command attributes. Used by `DeviceContext.multiDraw()`.
pub const MultiDrawAttribs = extern struct {
    /// The number of draw items in `draw_items`.
    draw_count: u32 = 0,

    /// Array of `draw_count` draw command items.
    draw_items: ?[*]const MultiDrawItem = null,

    /// Additional flags.
    flags: DrawFlags = .{},

    /// The number of instances to draw. If more than one, an instanced draw call is performed.
    num_instances: u32 = 1,

    /// Location (index, not byte offset) in the vertex buffer to start reading instance data from.
    first_instance_location: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.MultiDrawAttribs);
    }
};

/// Indexed multi-draw command item.
pub const MultiDrawIndexedItem = extern struct {
    /// The number of indices to draw.
    num_indices: u32 = 0,

    /// Location (not byte offset) of the first index in the index buffer to start reading from.
    first_index_location: u32 = 0,

    /// A constant added to each index before accessing the vertex buffer.
    base_vertex: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.MultiDrawIndexedItem);
    }
};

/// Indexed multi-draw command attributes. Used by `DeviceContext.multiDrawIndexed()`.
pub const MultiDrawIndexedAttribs = extern struct {
    /// The number of draw items in `draw_items`.
    draw_count: u32 = 0,

    /// Array of `draw_count` draw command items.
    draw_items: ?[*]const MultiDrawIndexedItem = null,

    /// The type of elements in the index buffer. Allowed values: `uint16` and `uint32`.
    index_type: graphics.types.ValueType = .undefined,

    /// Additional flags.
    flags: DrawFlags = .{},

    /// The number of instances to draw. If more than one, an instanced draw call is performed.
    num_instances: u32 = 1,

    /// Location (index, not byte offset) in the vertex buffer to start reading instance data from.
    first_instance_location: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.MultiDrawIndexedAttribs);
    }
};

/// Dispatch compute command attributes. Used by `DeviceContext.dispatchCompute()`.
pub const DispatchComputeAttribs = extern struct {
    /// The number of groups dispatched in the X direction.
    thread_group_count_x: u32 = 1,

    /// The number of groups dispatched in the Y direction.
    thread_group_count_y: u32 = 1,

    /// The number of groups dispatched in the Z direction.
    thread_group_count_z: u32 = 1,

    /// Compute group X size. Only used by the Metal backend.
    mtl_thread_group_size_x: u32 = 0,

    /// Compute group Y size. Only used by the Metal backend.
    mtl_thread_group_size_y: u32 = 0,

    /// Compute group Z size. Only used by the Metal backend.
    mtl_thread_group_size_z: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.DispatchComputeAttribs);
    }
};

/// Indirect dispatch compute command attributes. Used by `DeviceContext.dispatchComputeIndirect()`.
pub const DispatchComputeIndirectAttribs = extern struct {
    /// Buffer that contains the `u32` thread group counts X, Y and Z at the specified offset.
    attribs_buffer: ?*c.IBuffer = null,

    /// State transition mode for the indirect dispatch attributes buffer.
    attribs_buffer_state_transition_mode: graphics.types.ResourceStateTransitionMode = .none,

    /// Offset from the beginning of the buffer to the dispatch command arguments.
    dispatch_args_byte_offset: u64 = 0,

    /// Compute group X size. Only used by the Metal backend.
    mtl_thread_group_size_x: u32 = 0,

    /// Compute group Y size. Only used by the Metal backend.
    mtl_thread_group_size_y: u32 = 0,

    /// Compute group Z size. Only used by the Metal backend.
    mtl_thread_group_size_z: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.DispatchComputeIndirectAttribs);
    }
};

/// Dispatch tile command attributes. Used by `DeviceContext.dispatchTile()`.
pub const DispatchTileAttribs = extern struct {
    /// The number of threads in one tile in the X direction. Must not exceed the tile size from `getTileSize()`.
    threads_per_tile_x: u32 = 1,

    /// The number of threads in one tile in the Y direction. Must not exceed the tile size from `getTileSize()`.
    threads_per_tile_y: u32 = 1,

    /// Additional flags.
    flags: DrawFlags = .{},

    comptime {
        helpers.ensureSame(@This(), c.DispatchTileAttribs);
    }
};

// ---- Copy, resolve and render pass attributes ----

/// Multi-sampled texture resolve command attributes. Used by `DeviceContext.resolveTextureSubresource()`.
pub const ResolveTextureSubresourceAttribs = extern struct {
    /// Mip level of the source multi-sampled texture to resolve.
    src_mip_level: u32 = 0,

    /// Array slice of the source multi-sampled texture to resolve.
    src_slice: u32 = 0,

    /// State transition mode of the source texture.
    src_texture_transition_mode: ResourceStateTransitionMode = .none,

    /// Mip level of the destination non-multi-sampled texture.
    dst_mip_level: u32 = 0,

    /// Array slice of the destination non-multi-sampled texture.
    dst_slice: u32 = 0,

    /// State transition mode of the destination texture.
    dst_texture_transition_mode: ResourceStateTransitionMode = .none,

    /// Type of the typeless texture, if one or both textures are typeless. Otherwise `unknown` or matching format.
    format: TextureFormat = .unknown,

    comptime {
        helpers.ensureSame(@This(), c.ResolveTextureSubresourceAttribs);
    }
};

/// Copy texture command attributes. Used by `DeviceContext.copyTexture()`.
pub const CopyTextureAttribs = extern struct {
    /// Source texture to copy data from.
    src_texture: ?*c.ITexture = null,

    /// Mip level of the source texture to copy data from.
    src_mip_level: u32 = 0,

    /// Array slice of the source texture. Must be 0 for non-array textures.
    src_slice: u32 = 0,

    /// Source region to copy. `null` copies the entire subresource.
    src_box: ?*const graphics.types.Box = null,

    /// State transition mode of the source texture.
    src_texture_transition_mode: ResourceStateTransitionMode = .none,

    /// Destination texture.
    dst_texture: ?*c.ITexture = null,

    /// Destination mip level.
    dst_mip_level: u32 = 0,

    /// Destination array slice. Must be 0 for non-array textures.
    dst_slice: u32 = 0,

    /// X offset on the destination subresource.
    dst_x: u32 = 0,

    /// Y offset on the destination subresource.
    dst_y: u32 = 0,

    /// Z offset on the destination subresource.
    dst_z: u32 = 0,

    /// State transition mode of the destination texture.
    dst_texture_transition_mode: ResourceStateTransitionMode = .none,

    comptime {
        helpers.ensureSame(@This(), c.CopyTextureAttribs);
    }
};

/// Begin render pass command attributes. Used by `DeviceContext.beginRenderPass()`.
pub const BeginRenderPassAttribs = extern struct {
    /// Render pass to begin.
    render_pass: ?*c.IRenderPass = null,

    /// Framebuffer containing the attachments used by the render pass.
    framebuffer: ?*c.IFramebuffer = null,

    /// The number of elements in `clear_values`.
    clear_value_count: u32 = 0,

    /// Clear values for the attachments, indexed by attachment number. Only elements of cleared attachments are used.
    clear_values: ?[*]graphics.types.OptimizedClearValue = null,

    /// Framebuffer attachment state transition mode before the render pass begins. Also controls whether the
    /// internal attachment state variables are updated across subpasses and at the end of the pass.
    state_transition_mode: ResourceStateTransitionMode = .none,

    comptime {
        helpers.ensureSame(@This(), c.BeginRenderPassAttribs);
    }
};

// ---- Ray tracing ----

/// Triangle geometry data description, used by `BuildBLASAttribs`.
pub const BLASBuildTriangleData = extern struct {
    /// Geometry name used to map a geometry to a hit group in the shader binding table.
    geometry_name: ?[*:0]const u8 = null,

    /// Triangle vertex data source. Triangles are inactive if the x component of each vertex is NaN.
    vertex_buffer: ?*c.IBuffer = null,

    /// Byte offset of the vertex data in `vertex_buffer`.
    vertex_offset: u64 = 0,

    /// Byte stride between vertices.
    vertex_stride: u32 = 0,

    /// The number of triangle vertices.
    vertex_count: u32 = 0,

    /// The type of the vertex components. Optional, must be undefined or match `BLASTriangleDesc`.
    vertex_value_type: graphics.types.ValueType = .undefined,

    /// The number of vertex components. Optional, must be 0 or match `BLASTriangleDesc`.
    vertex_component_count: u8 = 0,

    /// The number of triangles.
    primitive_count: u32 = 0,

    /// Triangle index data source. Must be null if the index type is undefined.
    index_buffer: ?*c.IBuffer = null,

    /// Byte offset of the index data in `index_buffer`.
    index_offset: u64 = 0,

    /// The type of triangle indices. Optional, must be undefined or match `BLASTriangleDesc`.
    index_type: graphics.types.ValueType = .undefined,

    /// Geometry transformation data source, a row-major 4x3 `InstanceMatrix`.
    transform_buffer: ?*c.IBuffer = null,

    /// Byte offset of the transform data in `transform_buffer`.
    transform_buffer_offset: u64 = 0,

    /// Geometry flags.
    flags: RaytracingGeometryFlags = .{},

    comptime {
        helpers.ensureSame(@This(), c.BLASBuildTriangleData);
    }
};

/// Axis-aligned bounding box geometry data description, used by `BuildBLASAttribs`.
pub const BLASBuildBoundingBoxData = extern struct {
    /// Geometry name used to map a geometry to a hit group in the shader binding table.
    geometry_name: ?[*:0]const u8 = null,

    /// AABB data source. Each AABB is `{ float3 min; float3 max }`. An AABB is inactive if `min.x` is NaN.
    box_buffer: ?*c.IBuffer = null,

    /// Byte offset of the AABB data in `box_buffer`.
    box_offset: u64 = 0,

    /// Byte stride between AABBs.
    box_stride: u32 = 0,

    /// The number of AABBs.
    box_count: u32 = 0,

    /// Geometry flags.
    flags: RaytracingGeometryFlags = .{},

    comptime {
        helpers.ensureSame(@This(), c.BLASBuildBoundingBoxData);
    }
};

/// Build bottom-level acceleration structure command attributes. Used by `DeviceContext.buildBLAS()`.
pub const BuildBLASAttribs = extern struct {
    /// Target bottom-level acceleration structure. Access must be externally synchronized.
    blas: ?*c.IBottomLevelAS = null,

    /// BLAS state transition mode.
    blas_transition_mode: ResourceStateTransitionMode = .none,

    /// Geometry data source buffers state transition mode.
    geometry_transition_mode: ResourceStateTransitionMode = .none,

    /// Array of `triangle_data_count` triangle geometry descriptions.
    triangle_data: ?[*]const BLASBuildTriangleData = null,

    /// The number of triangle geometries. When `update` is true, must match the count used to build the BLAS.
    triangle_data_count: u32 = 0,

    /// Array of `box_data_count` AABB geometry descriptions.
    box_data: ?[*]const BLASBuildBoundingBoxData = null,

    /// The number of AABB geometries. When `update` is true, must match the count used to build the BLAS.
    box_data_count: u32 = 0,

    /// Buffer used for acceleration structure building. Use `ScratchBufferSizes.build` for the minimal size.
    scratch_buffer: ?*c.IBuffer = null,

    /// Byte offset from the beginning of the scratch buffer.
    scratch_buffer_offset: u64 = 0,

    /// Scratch buffer state transition mode.
    scratch_buffer_transition_mode: ResourceStateTransitionMode = .none,

    /// If false, the BLAS is built from scratch. If true, the previous content is updated, which is faster.
    /// The BLAS must have been created with `RAYTRACING_BUILD_AS_ALLOW_UPDATE`.
    update: bool = false,

    comptime {
        helpers.ensureSame(@This(), c.BuildBLASAttribs);
    }
};

/// Row-major 4x3 transformation matrix. Rotation occupies columns 0..2, translation occupies column 3.
pub const InstanceMatrix = extern struct {
    /// Matrix data stored in row-major order.
    data: [3][4]f32 = .{
        .{ 0, 0, 0, 0 },
        .{ 0, 0, 0, 0 },
        .{ 0, 0, 0, 0 },
    },

    comptime {
        helpers.ensureSame(@This(), c.InstanceMatrix);
    }
};

/// Top-level acceleration structure instance data, used by `BuildTLASAttribs`.
pub const TLASBuildInstanceData = extern struct {
    /// Instance name used to map an instance to a hit group in the shader binding table.
    instance_name: ?[*:0]const u8 = null,

    /// Bottom-level acceleration structure that represents the instance geometry.
    /// The TLAS keeps a strong reference to it until the next build or copy.
    blas: ?*c.IBottomLevelAS = null,

    /// Instance to world transformation.
    transform: InstanceMatrix = .{},

    /// User-defined value accessible in shaders. Only the lower 24 bits are used.
    custom_id: u32 = 0,

    /// Instance flags.
    flags: RaytracingInstanceFlags = .{},

    /// Visibility mask. The instance may be hit only if `rayMask & mask != 0`.
    mask: u8 = 0xFF,

    /// Index used to calculate the hit group location in the shader binding table.
    /// Must be `TLAS_INSTANCE_OFFSET_AUTO` unless the binding mode is user-defined. Only the lower 24 bits are used.
    contribution_to_hit_group_index: u32 = c.TLAS_INSTANCE_OFFSET_AUTO,

    comptime {
        helpers.ensureSame(@This(), c.TLASBuildInstanceData);
    }
};

/// Build top-level acceleration structure command attributes. Used by `DeviceContext.buildTLAS()`.
pub const BuildTLASAttribs = extern struct {
    /// Target top-level acceleration structure. Access must be externally synchronized.
    tlas: ?*c.ITopLevelAS = null,

    /// TLAS state transition mode.
    tlas_transition_mode: ResourceStateTransitionMode = .none,

    /// Bottom-level acceleration structure state transition mode.
    blas_transition_mode: ResourceStateTransitionMode = .none,

    /// Array of `instance_count` instance descriptions.
    instances: ?[*]const TLASBuildInstanceData = null,

    /// The number of instances. When `update` is true, must match the count used to build the TLAS.
    instance_count: u32 = 0,

    /// Buffer used to store instance data during building. Must be at least `TLAS_INSTANCE_DATA_SIZE * instance_count`.
    instance_buffer: ?*c.IBuffer = null,

    /// Byte offset of the instance data in `instance_buffer`.
    instance_buffer_offset: u64 = 0,

    /// Instance buffer state transition mode.
    instance_buffer_transition_mode: ResourceStateTransitionMode = .none,

    /// The number of hit shaders that can be bound for a single geometry or instance, depending on `binding_mode`.
    hit_group_stride: u32 = 1,

    /// Base offset for the hit group location. Used to bind hit shaders for multiple acceleration structures.
    base_contribution_to_hit_group_index: u32 = 0,

    /// Hit shader binding mode.
    binding_mode: graphics.types.HitGroupBindingMode = .per_geometry,

    /// Buffer used for acceleration structure building. Use `ScratchBufferSizes.build` for the minimal size.
    scratch_buffer: ?*c.IBuffer = null,

    /// Byte offset from the beginning of the scratch buffer.
    scratch_buffer_offset: u64 = 0,

    /// Scratch buffer state transition mode.
    scratch_buffer_transition_mode: ResourceStateTransitionMode = .none,

    /// If false, the TLAS is built from scratch. If true, the previous content is updated, which is faster.
    /// The TLAS must have been created with `RAYTRACING_BUILD_AS_ALLOW_UPDATE`.
    update: bool = false,

    comptime {
        helpers.ensureSame(@This(), c.BuildTLASAttribs);
    }
};

/// Copy bottom-level acceleration structure command attributes. Used by `DeviceContext.copyBLAS()`.
pub const CopyBLASAttribs = extern struct {
    /// Source bottom-level acceleration structure.
    src: ?*c.IBottomLevelAS = null,

    /// Destination bottom-level acceleration structure.
    dst: ?*c.IBottomLevelAS = null,

    /// Copy mode.
    mode: CopyAsMode = .clone,

    /// Source state transition mode.
    src_transition_mode: ResourceStateTransitionMode = .none,

    /// Destination state transition mode.
    dst_transition_mode: ResourceStateTransitionMode = .none,

    comptime {
        helpers.ensureSame(@This(), c.CopyBLASAttribs);
    }
};

/// Copy top-level acceleration structure command attributes. Used by `DeviceContext.copyTLAS()`.
pub const CopyTLASAttribs = extern struct {
    /// Source top-level acceleration structure.
    src: ?*c.ITopLevelAS = null,

    /// Destination top-level acceleration structure.
    dst: ?*c.ITopLevelAS = null,

    /// Copy mode.
    mode: CopyAsMode = .clone,

    /// Source state transition mode.
    src_transition_mode: ResourceStateTransitionMode = .none,

    /// Destination state transition mode.
    dst_transition_mode: ResourceStateTransitionMode = .none,

    comptime {
        helpers.ensureSame(@This(), c.CopyTLASAttribs);
    }
};

/// Write bottom-level acceleration structure compacted size command attributes.
/// Used by `DeviceContext.writeBLASCompactedSize()`.
pub const WriteBLASCompactedSizeAttribs = extern struct {
    /// Bottom-level acceleration structure.
    blas: ?*c.IBottomLevelAS = null,

    /// Destination buffer that receives the compacted size as a `u64` (`u32` in Metal).
    dest_buffer: ?*c.IBuffer = null,

    /// Byte offset of the compacted size in `dest_buffer`.
    dest_buffer_offset: u64 = 0,

    /// BLAS state transition mode.
    blas_transition_mode: ResourceStateTransitionMode = .none,

    /// Destination buffer state transition mode.
    buffer_transition_mode: ResourceStateTransitionMode = .none,

    comptime {
        helpers.ensureSame(@This(), c.WriteBLASCompactedSizeAttribs);
    }
};

/// Write top-level acceleration structure compacted size command attributes.
/// Used by `DeviceContext.writeTLASCompactedSize()`.
pub const WriteTLASCompactedSizeAttribs = extern struct {
    /// Top-level acceleration structure.
    tlas: ?*c.ITopLevelAS = null,

    /// Destination buffer that receives the compacted size as a `u64` (`u32` in Metal).
    dest_buffer: ?*c.IBuffer = null,

    /// Byte offset of the compacted size in `dest_buffer`.
    dest_buffer_offset: u64 = 0,

    /// TLAS state transition mode.
    tlas_transition_mode: ResourceStateTransitionMode = .none,

    /// Destination buffer state transition mode.
    buffer_transition_mode: ResourceStateTransitionMode = .none,

    comptime {
        helpers.ensureSame(@This(), c.WriteTLASCompactedSizeAttribs);
    }
};

/// Trace rays command attributes. Used by `DeviceContext.traceRays()`.
pub const TraceRaysAttribs = extern struct {
    /// Shader binding table.
    sbt: ?*const c.IShaderBindingTable = null,

    /// The number of rays dispatched in the X direction.
    dimension_x: u32 = 1,

    /// The number of rays dispatched in the Y direction.
    dimension_y: u32 = 1,

    /// The number of rays dispatched in the Z direction.
    dimension_z: u32 = 1,

    comptime {
        helpers.ensureSame(@This(), c.TraceRaysAttribs);
    }
};

/// Indirect trace rays command attributes. Used by `DeviceContext.traceRaysIndirect()`.
pub const TraceRaysIndirectAttribs = extern struct {
    /// Shader binding table.
    sbt: ?*const c.IShaderBindingTable = null,

    /// Buffer that contains the trace rays arguments at the specified offset. Direct3D12 reserves the first
    /// 88 bytes for the shader binding table, which `DeviceContext.updateSBT()` initializes.
    /// The three `u32` dimensions follow.
    attribs_buffer: ?*c.IBuffer = null,

    /// State transition mode for the indirect trace rays arguments buffer.
    attribs_buffer_state_transition_mode: ResourceStateTransitionMode = .none,

    /// Byte offset from the beginning of the buffer to the trace rays arguments.
    args_byte_offset: u64 = 0,

    comptime {
        helpers.ensureSame(@This(), c.TraceRaysIndirectAttribs);
    }
};

/// Indirect ray tracing buffer update attributes. Used by `DeviceContext.updateSBT()`.
pub const UpdateIndirectRTBufferAttribs = extern struct {
    /// Indirect buffer that can be used by `DeviceContext.traceRaysIndirect()`.
    attribs_buffer: ?*c.IBuffer = null,

    /// Byte offset from the beginning of the buffer where the SBT data will be written.
    attribs_buffer_offset: u64 = 0,

    /// State transition mode of the attribs buffer.
    transition_mode: ResourceStateTransitionMode = .none,

    comptime {
        helpers.ensureSame(@This(), c.UpdateIndirectRTBufferAttribs);
    }
};

// ---- Sparse resources ----

/// Sparse buffer memory binding range.
pub const SparseBufferMemoryBindRange = extern struct {
    /// Offset in the buffer address space where memory will be bound or unbound.
    buffer_offset: u64 = 0,

    /// Offset in the memory object where the range starts.
    memory_offset: u64 = 0,

    /// Size of the memory range to bind or unbind.
    memory_size: u64 = 0,

    /// Memory object. If null, the range is unbound.
    memory: ?*c.IDeviceMemory = null,

    comptime {
        helpers.ensureSame(@This(), c.SparseBufferMemoryBindRange);
    }
};

/// Sparse buffer memory binding information. Used by `BindSparseResourceMemoryAttribs`.
pub const SparseBufferMemoryBindInfo = extern struct {
    /// Buffer that the sparse binding command applies to.
    buffer: ?*c.IBuffer = null,

    /// Array of `num_ranges` ranges to bind or unbind.
    ranges: ?[*]const SparseBufferMemoryBindRange = null,

    /// The number of elements in `ranges`.
    num_ranges: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.SparseBufferMemoryBindInfo);
    }
};

/// Sparse texture memory binding range.
pub const SparseTextureMemoryBindRange = extern struct {
    /// Mip level that contains the region to bind.
    mip_level: u32 = 0,

    /// Texture array slice index.
    array_slice: u32 = 0,

    /// Region in pixels to bind or unbind. Ignored if `mip_level` is the first mip in the tail, see `offset_in_mip_tail`.
    region: graphics.types.Box = .{},

    /// Offset in the mip tail in bytes, used instead of `region` for mip levels in the tail.
    offset_in_mip_tail: u64 = 0,

    /// Size of the memory bound to this region. Ignored in Metal.
    memory_size: u64 = 0,

    /// Offset in the memory object. Ignored in Metal.
    memory_offset: u64 = 0,

    /// Memory object. If null, the region is unbound.
    memory: ?*c.IDeviceMemory = null,

    comptime {
        helpers.ensureSame(@This(), c.SparseTextureMemoryBindRange);
    }
};

/// Sparse texture memory binding information. Used by `BindSparseResourceMemoryAttribs`.
pub const SparseTextureMemoryBindInfo = extern struct {
    /// Texture that the sparse binding command applies to.
    texture: ?*c.ITexture = null,

    /// Array of `num_ranges` ranges to bind or unbind.
    ranges: ?[*]const SparseTextureMemoryBindRange = null,

    /// The number of elements in `ranges`.
    num_ranges: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.SparseTextureMemoryBindInfo);
    }
};

/// Bind sparse resource memory command attributes. Used by `DeviceContext.bindSparseResourceMemory()`.
pub const BindSparseResourceMemoryAttribs = extern struct {
    /// Array of `num_buffer_binds` sparse buffer bind commands. Not supported in Metal.
    buffer_binds: ?[*]const SparseBufferMemoryBindInfo = null,

    /// The number of elements in `buffer_binds`.
    num_buffer_binds: u32 = 0,

    /// Array of `num_texture_binds` sparse texture bind commands.
    texture_binds: ?[*]const SparseTextureMemoryBindInfo = null,

    /// The number of elements in `texture_binds`.
    num_texture_binds: u32 = 0,

    /// Array of `num_wait_fences` fences to wait on.
    wait_fences: ?[*]?*c.IFence = null,

    /// Array of `num_wait_fences` values the context waits for the fences to reach.
    wait_fence_values: ?[*]const u64 = null,

    /// The number of elements in `wait_fences` and `wait_fence_values`.
    num_wait_fences: u32 = 0,

    /// Array of `num_signal_fences` fences to signal.
    signal_fences: ?[*]?*c.IFence = null,

    /// Array of `num_signal_fences` values to set the fences to.
    signal_fence_values: ?[*]const u64 = null,

    /// The number of elements in `signal_fences` and `signal_fence_values`.
    num_signal_fences: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.BindSparseResourceMemoryAttribs);
    }
};

// ---- Resource state transitions ----

/// Resource state transition barrier description.
pub const StateTransitionDesc = extern struct {
    /// Previous resource for an aliasing transition. Only used when the aliasing flag is set, otherwise ignored.
    /// Null means any sparse or normal resource could cause aliasing.
    resource_before: ?*c.IDeviceObject = null,

    /// Resource to transition. Can be a texture, buffer, BLAS or TLAS.
    /// For aliasing transitions, null means any sparse or normal resource could cause aliasing.
    resource: ?*c.IDeviceObject = null,

    /// When transitioning a texture, the first mip level of the subresource range.
    first_mip_level: u32 = 0,

    /// When transitioning a texture, the number of mip levels of the subresource range.
    mip_levels_count: u32 = c.REMAINING_MIP_LEVELS,

    /// When transitioning a texture, the first array slice of the subresource range.
    first_array_slice: u32 = 0,

    /// When transitioning a texture, the number of array slices of the subresource range.
    array_slice_count: u32 = c.REMAINING_ARRAY_SLICES,

    /// Resource state before the transition. If unknown, the internal resource state is used, which must be defined.
    old_state: graphics.types.ResourceState = .unknown,

    /// Resource state after the transition. Must not be `unknown` or `undefined`.
    new_state: graphics.types.ResourceState = .unknown,

    /// State transition type. Must be `immediate` when issuing a UAV barrier.
    transition_type: graphics.types.StateTransitionType = .immediate,

    /// State transition flags.
    flags: StateTransitionFlags = .{},

    comptime {
        helpers.ensureSame(@This(), c.StateTransitionDesc);
    }
};

// ---- Statistics ----

/// Device context command counters.
pub const DeviceContextCommandCounters = extern struct {
    /// The total number of `setPipelineState` calls.
    set_pipeline_state: u32 = 0,

    /// The total number of `commitShaderResources` calls.
    commit_shader_resources: u32 = 0,

    /// The total number of `setVertexBuffers` calls.
    set_vertex_buffers: u32 = 0,

    /// The total number of `setIndexBuffer` calls.
    set_index_buffer: u32 = 0,

    /// The total number of `setRenderTargets` calls.
    set_render_targets: u32 = 0,

    /// The total number of `setBlendFactors` calls.
    set_blend_factors: u32 = 0,

    /// The total number of `setStencilRef` calls.
    set_stencil_ref: u32 = 0,

    /// The total number of `setViewports` calls.
    set_viewports: u32 = 0,

    /// The total number of `setScissorRects` calls.
    set_scissor_rects: u32 = 0,

    /// The total number of `clearRenderTarget` calls.
    clear_render_target: u32 = 0,

    /// The total number of `clearDepthStencil` calls.
    clear_depth_stencil: u32 = 0,

    /// The total number of `draw` calls.
    draw: u32 = 0,

    /// The total number of `drawIndexed` calls.
    draw_indexed: u32 = 0,

    /// The total number of `drawIndirect` calls.
    draw_indirect: u32 = 0,

    /// The total number of `drawIndexedIndirect` calls.
    draw_indexed_indirect: u32 = 0,

    /// The total number of `multiDraw` calls.
    multi_draw: u32 = 0,

    /// The total number of `multiDrawIndexed` calls.
    multi_draw_indexed: u32 = 0,

    /// The total number of `dispatchCompute` calls.
    dispatch_compute: u32 = 0,

    /// The total number of `dispatchComputeIndirect` calls.
    dispatch_compute_indirect: u32 = 0,

    /// The total number of `dispatchTile` calls.
    dispatch_tile: u32 = 0,

    /// The total number of `drawMesh` calls.
    draw_mesh: u32 = 0,

    /// The total number of `drawMeshIndirect` calls.
    draw_mesh_indirect: u32 = 0,

    /// The total number of `buildBLAS` calls.
    build_blas: u32 = 0,

    /// The total number of `buildTLAS` calls.
    build_tlas: u32 = 0,

    /// The total number of `copyBLAS` calls.
    copy_blas: u32 = 0,

    /// The total number of `copyTLAS` calls.
    copy_tlas: u32 = 0,

    /// The total number of `writeBLASCompactedSize` calls.
    write_blas_compacted_size: u32 = 0,

    /// The total number of `writeTLASCompactedSize` calls.
    write_tlas_compacted_size: u32 = 0,

    /// The total number of `traceRays` calls.
    trace_rays: u32 = 0,

    /// The total number of `traceRaysIndirect` calls.
    trace_rays_indirect: u32 = 0,

    /// The total number of `updateSBT` calls.
    update_sbt: u32 = 0,

    /// The total number of `updateBuffer` calls.
    update_buffer: u32 = 0,

    /// The total number of `copyBuffer` calls.
    copy_buffer: u32 = 0,

    /// The total number of `mapBuffer` calls.
    map_buffer: u32 = 0,

    /// The total number of `updateTexture` calls.
    update_texture: u32 = 0,

    /// The total number of `copyTexture` calls.
    copy_texture: u32 = 0,

    /// The total number of `mapTextureSubresource` calls.
    map_texture_subresource: u32 = 0,

    /// The total number of `beginQuery` calls.
    begin_query: u32 = 0,

    /// The total number of `generateMips` calls.
    generate_mips: u32 = 0,

    /// The total number of `resolveTextureSubresource` calls.
    resolve_texture_subresource: u32 = 0,

    /// The total number of `bindSparseResourceMemory` calls.
    bind_sparse_resource_memory: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.DeviceContextCommandCounters);
    }
};

/// Device context statistics.
pub const DeviceContextStats = extern struct {
    /// The total number of primitives rendered, for each primitive topology.
    primitive_counts: [c.PRIMITIVE_TOPOLOGY_NUM_TOPOLOGIES]u32 = @splat(0),

    /// Command counters.
    command_counters: DeviceContextCommandCounters = .{},

    comptime {
        helpers.ensureSame(@This(), c.DeviceContextStats);
    }
};

/// Resource binding flags
///
/// [D3D11_BIND_FLAG]: https://docs.microsoft.com/en-us/windows/win32/api/d3d11/ne-d3d11-d3d11_bind_flag
///
/// This enumeration describes which parts of the pipeline a resource can be bound to.
/// It generally mirrors [D3D11_BIND_FLAG][] enumeration. It is used by
/// - BufferDesc to describe bind flags for a buffer
/// - TextureDesc to describe bind flags for a texture
pub const BindFlags = packed struct(u32) {
    /// A buffer can be bound as a vertex buffer.
    vertex_buffer: bool = false,

    /// A buffer can be bound as an index buffer.
    index_buffer: bool = false,

    /// A buffer can be bound as a uniform buffer.
    ///
    /// **Warning:** This flag may not be combined with any other bind flag.
    uniform_buffer: bool = false,

    /// A buffer or a texture can be bound as a shader resource.
    shader_resource: bool = false,

    /// A buffer can be bound as a target for stream output stage.
    stream_output: bool = false,

    /// A texture can be bound as a render target.
    render_target: bool = false,

    /// A texture can be bound as a depth-stencil target.
    depth_stencil: bool = false,

    /// A buffer or a texture can be bound as an unordered access view.
    unordered_access: bool = false,

    /// A buffer can be bound as the source buffer for indirect draw commands.
    indirect_draw_args: bool = false,

    /// A texture can be used as render pass input attachment.
    input_attachment: bool = false,

    /// A buffer can be used as a scratch buffer or as the source of primitive data
    /// for acceleration structure building.
    ray_tracing: bool = false,

    /// A texture can be used as shading rate texture.
    shading_rate: bool = false,

    _: u20 = 0,
};

/// Resource usage
///
/// [D3D11_USAGE]: https://docs.microsoft.com/en-us/windows/win32/api/d3d11/ne-d3d11-d3d11_usage
/// This enumeration describes expected resource usage. It generally mirrors [D3D11_USAGE] enumeration.
/// The enumeration is used by
/// - BufferDesc to describe usage for a buffer
/// - TextureDesc to describe usage for a texture
pub const Usage = enum(u8) {
    /// A resource that can only be read by the GPU. It cannot be written by the GPU,
    /// and cannot be accessed at all by the CPU. This type of resource must be initialized
    /// when it is created, since it cannot be changed after creation.
    ///
    /// D3D11 Counterpart: D3D11_USAGE_IMMUTABLE. OpenGL counterpart: GL_STATIC_DRAW
    ///
    /// **Remarks:** Static buffers do not allow CPU access and must use CPU_ACCESS_NONE flag.
    immutable,

    /// A resource that requires read and write access by the GPU and can also be occasionally
    /// written by the CPU.
    ///
    /// D3D11 Counterpart: D3D11_USAGE_DEFAULT. OpenGL counterpart: GL_STREAM_DRAW.
    ///
    /// **Remarks:** Default buffers do not allow CPU access and must use CPU_ACCESS_NONE flag.
    default,

    /// A resource that can be read by the GPU and written at least once per frame by the CPU.
    ///
    /// D3D11 Counterpart: D3D11_USAGE_DYNAMIC. OpenGL counterpart: GL_DYNAMIC_DRAW
    ///
    /// **Remarks:** Dynamic buffers must use CPU_ACCESS_WRITE flag.
    dynamic,

    /// A resource that facilitates transferring data between GPU and CPU.
    ///
    /// D3D11 Counterpart: D3D11_USAGE_STAGING. OpenGL counterpart: GL_STREAM_READ or
    /// GL_STREAM_DRAW depending on the CPU access flags.
    ///
    /// **Remarks:** Staging buffers must use exactly one of CPU_ACCESS_WRITE or CPU_ACCESS_READ flags.
    staging,

    /// A resource residing in a unified memory (e.g. memory shared between CPU and GPU),
    /// that can be read and written by GPU and can also be directly accessed by CPU.
    ///
    /// An application should check if unified memory is available on the device by querying
    /// the adapter info (see Diligent::IRenderDevice::GetAdapterInfo().Memory and Diligent::AdapterMemoryInfo).
    /// If there is no unified memory, an application should choose another usage type (typically, USAGE_DEFAULT).
    ///
    /// Unified resources must use at least one of CPU_ACCESS_WRITE or CPU_ACCESS_READ flags.
    /// An application should check supported unified memory CPU access types by querying the device caps.
    /// (see Diligent::AdapterMemoryInfo::UnifiedMemoryCPUAccess).
    unified,

    /// A resource that can be partially committed to physical memory.
    sparse,
};

/// Allowed CPU access mode flags when mapping a resource
///
/// The enumeration is used by
/// - BufferDesc to describe CPU access mode for a buffer
/// - TextureDesc to describe CPU access mode for a texture
///
/// **Note:** Only `Usage.dynamic` resources can be mapped
///
/// **Zig Usage:** The default value of CPUAccessFlags is equivalent to CPU_ACCESS_NONE in Diligent.
pub const CPUAccessFlags = packed struct(u8) {
    /// A resource can be mapped for reading
    read: bool = false,
    /// A resource can be mapped for writing
    write: bool = false,

    _: u6 = 0,
};

/// Describes the buffer access mode.
///
/// This enumeration is used by BufferDesc structure.
pub const BufferMode = enum(u8) {
    /// Undefined mode.
    undefined,

    /// Formatted buffer. Access to the buffer will use format conversion operations.
    /// In this mode, ElementByteStride member of BufferDesc defines the buffer element size.
    /// Buffer views can use different formats, but the format size must match ElementByteStride.
    formatted,

    /// Structured buffer.
    /// In this mode, ElementByteStride member of BufferDesc defines the structure stride.
    structured,

    /// Raw buffer.
    /// In this mode, the buffer is accessed as raw bytes. Formatted views of a raw
    /// buffer can also be created similar to formatted buffer. If formatted views
    /// are to be created, the ElementByteStride member of BufferDesc must specify the
    /// size of the format.
    raw,
};

/// Miscellaneous buffer flags.
pub const MiscBufferFlags = packed struct(u8) {
    /// For a sparse buffer, allow binding the same memory region in different buffer ranges
    /// or in different sparse buffers.
    sparse_aliasing: bool = false,

    _: u7 = 0,
};

/// Buffer description
pub const BufferDesc = extern struct {
    /// Object name
    name: ?[*:0]const u8 = null,

    /// Size of the buffer, in bytes. For a uniform buffer, this must be a multiple of 16.
    size: u64 = 0,

    /// Buffer bind flags, see Diligent::BIND_FLAGS for details
    /// The following bind flags are allowed:
    /// Diligent::BIND_VERTEX_BUFFER, Diligent::BIND_INDEX_BUFFER, Diligent::BIND_UNIFORM_BUFFER,
    /// Diligent::BIND_SHADER_RESOURCE, Diligent::BIND_STREAM_OUTPUT, Diligent::BIND_UNORDERED_ACCESS,
    /// Diligent::BIND_INDIRECT_DRAW_ARGS, Diligent::BIND_RAY_TRACING.
    /// Use SparseResourceProperties::BufferBindFlags to get allowed bind flags for a sparse buffer.
    bind_flags: BindFlags = .{},

    /// Buffer usage, see Diligent::USAGE for details
    usage: Usage = .default,

    /// CPU access flags or 0 if no CPU access is allowed, see Diligent::CPU_ACCESS_FLAGS for details.
    cpu_access_flags: CPUAccessFlags = .{},

    /// Buffer mode, see Diligent::BUFFER_MODE
    buffer_mode: BufferMode = .undefined,

    /// Miscellaneous flags, see Diligent::MISC_BUFFER_FLAGS for details.
    misc_buffer_flags: MiscBufferFlags = .{},

    /// Buffer element stride, in bytes.
    /// For a structured buffer (BufferDesc::Mode equals Diligent::BUFFER_MODE_STRUCTURED) this member
    /// defines the size of each buffer element. For a formatted buffer
    /// (BufferDesc::Mode equals Diligent::BUFFER_MODE_FORMATTED) and optionally for a raw buffer
    /// (Diligent::BUFFER_MODE_RAW), this member defines the size of the format that will be used for views
    /// created for this buffer.
    element_byte_stride: u32 = 0,

    /// Defines which immediate contexts are allowed to execute commands that use this buffer.
    /// When ImmediateContextMask contains a bit at position n, the buffer may be
    /// used in the immediate context with index n directly (see DeviceContextDesc::ContextId).
    /// It may also be used in a command list recorded by a deferred context that will be executed
    /// through that immediate context.
    ///
    /// \remarks    Only specify these bits that will indicate those immediate contexts where the buffer
    ///             will actually be used. Do not set unnecessary bits as this will result in extra overhead.
    immediate_context_mask: u64 = 1,

    comptime {
        helpers.ensureSame(@This(), c.BufferDesc);
    }
};

/// Describes the buffer initial data
pub const BufferData = extern struct {
    /// Pointer to the data
    data: ?*const anyopaque = null,

    /// Data size, in bytes
    data_size: u64 = 0,

    /// The buffer will be in write state after the initialization.
    /// If an application uses the buffer in another context afterwards, it
    /// must synchronize the access to the buffer using fence.
    /// When null is provided, the first context enabled by ImmediateContextMask
    /// will be used.
    context: ?*c.IDeviceContext = null,

    comptime {
        helpers.ensureSame(@This(), c.BufferData);
    }
};

/// Resource mapping type
///
/// Describes how a mapped resource will be accessed. This enumeration generally
/// mirrors [D3D11_MAP](https://docs.microsoft.com/en-us/windows/win32/api/d3d11/ne-d3d11-d3d11_map) enumeration. It is used by
/// - IBuffer::Map to describe buffer mapping type
/// - ITexture::Map to describe texture mapping type
pub const MapType = enum(u8) {
    /// The resource is mapped for reading.
    ///
    /// D3D11 counterpart: D3D11_MAP_READ. OpenGL counterpart: GL_MAP_READ_BIT
    read = 0x01,

    /// The resource is mapped for writing.
    ///
    /// D3D11 counterpart: D3D11_MAP_WRITE. OpenGL counterpart: GL_MAP_WRITE_BIT
    write = 0x02,

    /// The resource is mapped for reading and writing.
    ///
    /// D3D11 counterpart: D3D11_MAP_READ_WRITE. OpenGL counterpart: GL_MAP_WRITE_BIT | GL_MAP_READ_BIT
    read_write = 0x03,
};

/// Special map flags
///
/// Describes special arguments for a map operation.
/// This enumeration is used by
/// - IBuffer::Map to describe buffer mapping flags
/// - ITexture::Map to describe texture mapping flags
///
/// **Zig Usage:** The default value of MapFlags is equivalent to `MAP_FLAG_NONE`.
pub const MapFlags = packed struct(u8) {
    /// Specifies that map operation should not wait until previous command that
    /// using the same resource completes. Map returns null pointer if the resource
    /// is still in use.
    /// D3D11 counterpart:  D3D11_MAP_FLAG_DO_NOT_WAIT
    ///
    /// **Note:** OpenGL does not have corresponding flag, so a buffer will always be mapped
    do_not_wait: bool = false,

    /// Previous contents of the resource will be undefined. This flag is only compatible with MAP_WRITE
    ///
    /// D3D11 counterpart: D3D11_MAP_WRITE_DISCARD. OpenGL counterpart: GL_MAP_INVALIDATE_BUFFER_BIT
    ///
    /// **Note:** OpenGL implementation may orphan a buffer instead
    discard: bool = false,

    /// The system will not synchronize pending operations before mapping the buffer. It is responsibility
    /// of the application to make sure that the buffer contents is not overwritten while it is in use by
    /// the GPU.
    ///
    /// D3D11 counterpart:  D3D11_MAP_WRITE_NO_OVERWRITE. OpenGL counterpart: GL_MAP_UNSYNCHRONIZED_BIT
    no_overwrite: bool = false,

    _: u5 = 0,
};

/// Filter type
///
/// This enumeration defines filter type. It is used by SamplerDesc structure to define min, mag and mip filters.
///
/// **Note:** On D3D11, comparison filters only work with textures that have the following formats:
/// R32_FLOAT_X8X24_TYPELESS, R32_FLOAT, R24_UNORM_X8_TYPELESS, R16_UNORM.
pub const FilterType = enum(u8) {
    /// Unknown filter type
    unknown,
    /// Point filtering
    point,
    /// Linear filtering
    linear,
    /// Anisotropic filtering
    anisotropic,
    /// Comparison-point filtering
    comparison_point,
    /// Comparison-linear filtering
    comparison_linear,
    /// Comparison-anisotropic filtering
    comparison_anisotropic,
    /// Minimum-point filtering (DX12 only)
    minimum_point,
    /// Minimum-linear filtering (DX12 only)
    minimum_linear,
    /// Minimum-anisotropic filtering (DX12 only)
    minimum_anisotropic,
    /// Maximum-point filtering (DX12 only)
    maximum_point,
    /// Maximum-linear filtering (DX12 only)
    maximum_linear,
    /// Maximum-anisotropic filtering (DX12 only)
    maximum_anisotropic,
};

/// Texture address mode
///
/// Defines a technique for resolving texture coordinates that are outside of
/// the boundaries of a texture. The enumeration generally mirrors [D3D11_TEXTURE_ADDRESS_MODE](https://docs.microsoft.com/en-us/windows/win32/api/d3d11/ne-d3d11-d3d11_texture_address_mode)/[D3D12_TEXTURE_ADDRESS_MODE](https://docs.microsoft.com/en-us/windows/win32/api/d3d12/ne-d3d12-d3d12_texture_address_mode) enumeration.
/// It is used by SamplerDesc structure to define the address mode for U,V and W texture coordinates.
pub const TextureAddressMode = enum(u8) {
    /// Unknown mode
    unknown = 0,

    /// Tile the texture at every integer junction.
    ///
    /// Direct3D Counterpart: D3D11_TEXTURE_ADDRESS_WRAP/D3D12_TEXTURE_ADDRESS_MODE_WRAP. OpenGL counterpart: GL_REPEAT
    wrap = 1,

    /// Flip the texture at every integer junction.
    ///
    /// Direct3D Counterpart: D3D11_TEXTURE_ADDRESS_MIRROR/D3D12_TEXTURE_ADDRESS_MODE_MIRROR. OpenGL counterpart: GL_MIRRORED_REPEAT
    mirror = 2,

    /// Texture coordinates outside the range [0.0, 1.0] are set to the
    /// texture color at 0.0 or 1.0, respectively.
    ///
    /// Direct3D Counterpart: D3D11_TEXTURE_ADDRESS_CLAMP/D3D12_TEXTURE_ADDRESS_MODE_CLAMP. OpenGL counterpart: GL_CLAMP_TO_EDGE
    clamp = 3,

    /// Texture coordinates outside the range [0.0, 1.0] are set to the border color
    /// specified in SamplerDesc structure.
    ///
    /// Direct3D Counterpart: D3D11_TEXTURE_ADDRESS_BORDER/D3D12_TEXTURE_ADDRESS_MODE_BORDER. OpenGL counterpart: GL_CLAMP_TO_BORDER
    border = 4,

    /// Similar to TEXTURE_ADDRESS_MIRROR and TEXTURE_ADDRESS_CLAMP. Takes the absolute
    /// value of the texture coordinate (thus, mirroring around 0), and then clamps to
    /// the maximum value.
    ///
    /// Direct3D Counterpart: D3D11_TEXTURE_ADDRESS_MIRROR_ONCE/D3D12_TEXTURE_ADDRESS_MODE_MIRROR_ONCE. OpenGL counterpart: GL_MIRROR_CLAMP_TO_EDGE
    /// **Note:** GL_MIRROR_CLAMP_TO_EDGE is only available in OpenGL4.4+, and is not available until at least OpenGLES3.1
    mirror_once = 5,
};

/// Sampler flags
///
/// **Zig Usage:** The default value of SamplerFlags is equivalent to `SAMPLER_FLAG_NONE`.
pub const SamplerFlags = packed struct(u8) {
    /// Specifies that the sampler will read from a subsampled texture created with MISC_TEXTURE_FLAG_SUBSAMPLED flag.
    /// Requires SHADING_RATE_CAP_FLAG_SUBSAMPLED_RENDER_TARGET capability.
    subsampled: bool = false,

    /// Specifies that the GPU is allowed to use fast approximation when reconstructing full-resolution value from
    /// the subsampled texture accessed by the sampler.
    /// Requires SHADING_RATE_CAP_FLAG_SUBSAMPLED_RENDER_TARGET capability.
    subsampled_coarse_reconstruction: bool = false,

    _: u6 = 0,
};

/// Comparison function
///
/// This enumeration defines a comparison function. It generally mirrors [D3D11_COMPARISON_FUNC](https://docs.microsoft.com/en-us/windows/win32/api/d3d11/ne-d3d11-d3d11_comparison_func)/[D3D12_COMPARISON_FUNC](https://docs.microsoft.com/en-us/windows/win32/api/d3d12/ne-d3d12-d3d12_comparison_func) enum and is used by
/// - SamplerDesc to define a comparison function if one of the comparison mode filters is used
/// - StencilOpDesc to define a stencil function
/// - DepthStencilStateDesc to define a depth function
pub const ComparisonFunction = enum(u8) {
    /// Unknown comparison function
    unknown = 0,

    /// Comparison never passes.
    ///
    /// Direct3D counterpart: D3D11_COMPARISON_NEVER/D3D12_COMPARISON_FUNC_NEVER. OpenGL counterpart: GL_NEVER.
    never,

    /// Comparison passes if the source data is less than the destination data.
    ///
    /// Direct3D counterpart: D3D11_COMPARISON_LESS/D3D12_COMPARISON_FUNC_LESS. OpenGL counterpart: GL_LESS.
    less,

    /// Comparison passes if the source data is equal to the destination data.
    ///
    /// Direct3D counterpart: D3D11_COMPARISON_EQUAL/D3D12_COMPARISON_FUNC_EQUAL. OpenGL counterpart: GL_EQUAL.
    equal,

    /// Comparison passes if the source data is less than or equal to the destination data.
    ///
    /// Direct3D counterpart: D3D11_COMPARISON_LESS_EQUAL/D3D12_COMPARISON_FUNC_LESS_EQUAL. OpenGL counterpart: GL_LEQUAL.
    less_equal,

    /// Comparison passes if the source data is greater than the destination data.
    ///
    /// Direct3D counterpart: 3D11_COMPARISON_GREATER/D3D12_COMPARISON_FUNC_GREATER. OpenGL counterpart: GL_GREATER.
    greater,

    /// Comparison passes if the source data is not equal to the destination data.
    ///
    /// Direct3D counterpart: D3D11_COMPARISON_NOT_EQUAL/D3D12_COMPARISON_FUNC_NOT_EQUAL. OpenGL counterpart: GL_NOTEQUAL.
    not_equal,

    /// Comparison passes if the source data is greater than or equal to the destination data.
    ///
    /// Direct3D counterpart: D3D11_COMPARISON_GREATER_EQUAL/D3D12_COMPARISON_FUNC_GREATER_EQUAL. OpenGL counterpart: GL_GEQUAL.
    greater_equal,

    /// Comparison always passes.
    ///
    /// Direct3D counterpart: D3D11_COMPARISON_ALWAYS/D3D12_COMPARISON_FUNC_ALWAYS. OpenGL counterpart: GL_ALWAYS.
    always,
};

/// Sampler description
///
/// This structure describes the sampler state which is used in a call to
/// IRenderDevice::CreateSampler() to create a sampler object.
///
/// To create an anisotropic filter, all three filters must either be Diligent::FILTER_TYPE_ANISOTROPIC
/// or Diligent::FILTER_TYPE_COMPARISON_ANISOTROPIC.
///
/// `MipFilter` cannot be comparison filter except for Diligent::FILTER_TYPE_ANISOTROPIC if all
/// three filters have that value.
///
/// Both `MinFilter` and `MagFilter` must either be regular filters or comparison filters.
/// Mixing comparison and regular filters is an error.
pub const SamplerDesc = extern struct {
    /// Object name
    name: ?[*:0]const u8 = null,

    /// Texture minification filter, see Diligent::FILTER_TYPE for details.
    ///
    /// Default value: Diligent::FILTER_TYPE_LINEAR.
    min_filter: FilterType = .linear,

    /// Texture magnification filter, see Diligent::FILTER_TYPE for details.
    /// Default value: Diligent::FILTER_TYPE_LINEAR.
    mag_filter: FilterType = .linear,

    /// Mip filter, see Diligent::FILTER_TYPE for details.
    /// Only FILTER_TYPE_POINT, FILTER_TYPE_LINEAR, FILTER_TYPE_ANISOTROPIC, and
    /// FILTER_TYPE_COMPARISON_ANISOTROPIC are allowed.
    /// Default value: Diligent::FILTER_TYPE_LINEAR.
    mip_filter: FilterType = .linear,

    /// Texture address mode for U coordinate, see Diligent::TEXTURE_ADDRESS_MODE for details
    /// Default value: Diligent::TEXTURE_ADDRESS_CLAMP.
    address_u: TextureAddressMode = .clamp,

    /// Texture address mode for V coordinate, see Diligent::TEXTURE_ADDRESS_MODE for details
    /// Default value: Diligent::TEXTURE_ADDRESS_CLAMP.
    address_v: TextureAddressMode = .clamp,

    /// Texture address mode for W coordinate, see Diligent::TEXTURE_ADDRESS_MODE for details
    /// Default value: Diligent::TEXTURE_ADDRESS_CLAMP.
    address_w: TextureAddressMode = .clamp,

    /// Sampler flags, see Diligent::SAMPLER_FLAGS for details.
    flags: SamplerFlags = .{},

    /// Indicates whether to use unnormalized texture coordinates.
    /// When set to `True`, the range of the image coordinates used to lookup
    /// the texel is in the range of 0 to the image size in each dimension.
    /// When set to `False`, the range of image coordinates is 0.0 to 1.0.
    ///
    /// Unnormalized coordinates are only supported in Vulkan and Metal.
    unnormalized_coords: bool = false,

    /// Offset from the calculated mipmap level.
    /// For example, if a sampler calculates that a texture should be sampled at mipmap
    /// level 1.2 and MipLODBias is 2.3, then the texture will be sampled at
    /// mipmap level 3.5.
    ///
    /// Default value: 0.
    mip_lod_bias: f32 = 0,

    /// Maximum anisotropy level for the anisotropic filter. Default value: 0.
    max_anisotropy: u32 = 0,

    /// A function that compares sampled data against existing sampled data when comparison filter is used.
    /// Default value: Diligent::COMPARISON_FUNC_NEVER.
    comparison_func: ComparisonFunction = .never,

    /// Border color to use if TEXTURE_ADDRESS_BORDER is specified for `AddressU`, `AddressV`, or `AddressW`.
    /// Default value: `{0, 0, 0, 0}`
    border_color: [4]f32 = @splat(0),

    /// Specifies the minimum value that LOD is clamped to before accessing the texture MIP levels.
    /// Must be less than or equal to `MaxLOD`.
    ///
    /// Default value: 0.
    min_lod: f32 = 0,

    /// Specifies the maximum value that LOD is clamped to before accessing the texture MIP levels.
    /// Must be greater than or equal to `MinLOD`.
    /// Default value: `+FLT_MAX`.
    max_lod: f32 = std.math.floatMax(f32),

    comptime {
        helpers.ensureSame(@This(), c.SamplerDesc);
    }
};

/// Describes resource dimension
///
/// This enumeration is used by
/// - TextureDesc to describe texture type
/// - TextureViewDesc to describe texture view type
pub const ResourceDimension = enum(u8) {
    /// Texture type undefined
    undefined,
    /// Buffer
    buffer,
    /// One-dimensional texture
    tex_1d,
    /// One-dimensional texture array
    tex_1d_array,
    /// Two-dimensional texture
    tex_2d,
    /// Two-dimensional texture array
    tex_2d_array,
    /// Three-dimensional texture
    tex_3d,
    /// Cube-map texture
    tex_cube,
    /// Cube-map array texture
    tex_cube_array,
};

/// Miscellaneous texture flags
///
/// The enumeration is used by TextureDesc to describe misc texture flags
/// **Zig Usage:** Default is equivalent to `MISC_TEXTURE_FLAG_NONE`.
pub const MiscTextureFlags = packed struct(u8) {
    /// Allow automatic mipmap generation with IDeviceContext::GenerateMips()
    ///
    /// **Note:** A texture must be created with BIND_RENDER_TARGET bind flag.
    generate_mips: bool = false,

    /// The texture will be used as a transient framebuffer attachment.
    ///
    /// Memoryless textures may only be used within a render pass in a framebuffer;
    /// the corresponding subpass load operation must be CLEAR or DISCARD, and the
    /// subpass store operation must be DISCARD.
    memoryless: bool = false,

    /// For sparse textures, allow binding the same memory range in different texture
    /// regions or in different sparse textures.
    sparse_aliasing: bool = false,

    /// The texture will be used as an intermediate render target for rendering with
    /// texture-based variable rate shading.
    /// Requires SHADING_RATE_CAP_FLAG_SUBSAMPLED_RENDER_TARGET capability.
    ///
    /// **Note:** Copy operations are not supported for subsampled textures.
    subsampled: bool = false,

    _: u4 = 0,
};

/// Defines optimized depth-stencil clear value.
pub const DepthStencilClearValue = extern struct {
    /// Depth clear value
    depth: f32 = 1.0,

    /// Stencil clear value
    stencil: u8 = 0,

    comptime {
        helpers.ensureSame(@This(), c.DepthStencilClearValue);
    }
};

/// Defines optimized clear value.
pub const OptimizedClearValue = extern struct {
    /// Format
    format: TextureFormat = .unknown,

    /// Render target clear value
    color: [4]f32 = @splat(0),

    /// Depth stencil clear value
    depth_stencil: DepthStencilClearValue = .{},

    comptime {
        helpers.ensureSame(@This(), c.OptimizedClearValue);
    }
};

/// Texture description
pub const TextureDesc = extern struct {
    /// Object name
    name: ?[*:0]const u8 = null,

    /// Texture type. See Diligent::RESOURCE_DIMENSION for details.
    type: ResourceDimension = .undefined,

    /// Texture width, in pixels.
    width: u32 = 0,

    /// Texture height, in pixels.
    height: u32 = 0,

    array_size_or_depth: extern union {
        /// For a 1D array or 2D array, number of array slices.
        ///
        /// For cube maps and cube map arrays, this value must be a multiple of 6.
        /// The number of cube maps in the texture is ArraySize / 6.
        array_size: u32,

        /// For a 3D texture, number of depth slices
        depth: u32,
    } = .{ .array_size = 1 },

    /// Texture format, see Diligent::TEXTURE_FORMAT.
    ///
    /// Use IRenderDevice::GetTextureFormatInfo() to check if format is supported.
    format: TextureFormat = .unknown,

    /// Number of Mip levels in the texture. Multisampled textures can only have 1 Mip level.
    ///
    /// Specify 0 to create full mipmap chain.
    mip_levels: u32 = 1,

    /// The number of samples.
    ///
    /// Only 2D textures or 2D texture arrays can be multisampled.
    sample_count: u32 = 1,

    /// Bind flags, see Diligent::BIND_FLAGS for details.
    ///
    /// Use IRenderDevice::GetTextureFormatInfoExt() to check which bind flags are supported.
    bind_flags: BindFlags = .{},

    /// Texture usage. See Diligent::USAGE for details.
    usage: Usage = .default,

    /// CPU access flags or 0 if no CPU access is allowed,
    ///
    /// see Diligent::CPU_ACCESS_FLAGS for details.
    cpu_access_flags: CPUAccessFlags = .{},

    /// Miscellaneous flags, see Diligent::MISC_TEXTURE_FLAGS for details.
    misc_flags: MiscTextureFlags = .{},

    /// Optimized clear value
    clear_value: OptimizedClearValue = .{},

    /// Defines which immediate contexts are allowed to execute commands that use this texture.
    ///
    /// When `ImmediateContextMask` contains a bit at position n, the texture may be
    /// used in the immediate context with index n directly (see DeviceContextDesc::ContextId).
    /// It may also be used in a command list recorded by a deferred context that will be executed
    /// through that immediate context.
    ///
    /// **Remarks:** Only specify these bits that will indicate those immediate contexts where the texture
    /// will actually be used. Do not set unnecessary bits as this will result in extra overhead.
    immediate_context_mask: u64 = 1,

    comptime {
        helpers.ensureSame(@This(), c.TextureDesc);
    }
};

/// Describes data for one subresource
pub const TextureSubresData = extern struct {
    /// Pointer to the subresource data in CPU memory.
    ///
    /// If provided, `pSrcBuffer` must be null.
    data: ?*const anyopaque = null,

    /// Pointer to the GPU buffer that contains the subresource data.
    ///
    /// If provided, `pData` must be null.
    src_buffer: ?*c.IBuffer = null,

    /// If `pSrcBuffer` is not null, offset, in bytes, from the beginning of the source
    /// buffer to the subresource data.
    ///
    /// This value must be a multiple of `BufferProperties::TextureUpdateOffsetAlignment`,
    /// which can be queried through `IRenderDevice::GetAdapterInfo()`.
    src_offset: u64 = 0,

    /// Row stride, in bytes, for 2D and 3D textures.
    ///
    /// When `pSrcBuffer` is not null, this value must be a multiple of
    /// `BufferProperties::TextureUpdateStrideAlignment`, which can be queried through
    /// `IRenderDevice::GetAdapterInfo()`.
    stride: u64 = 0,

    /// Depth slice stride, in bytes, for 3D textures.
    ///
    /// On OpenGL, this value must be a multiple of `Stride`.
    depth_stride: u64 = 0,

    comptime {
        helpers.ensureSame(@This(), c.TextureSubResData);
    }
};

/// Describes the initial data to store in the texture
pub const TextureData = extern struct {
    /// A pointer to the array of the TextureSubResData elements containing
    /// information about each subresource.
    sub_resources: ?[*]TextureSubresData = null,

    /// The number of elements in `pSubResources` array.
    ///
    /// `NumSubresources` must exactly match the number
    /// of subresources in the texture. Otherwise an error
    /// occurs.
    num_subresources: u32 = 0,

    /// Defines which device context will be used to initialize the texture.
    /// The texture will be in write state after the initialization.
    /// If an application uses the texture in another context afterwards, it
    /// must synchronize the access to the texture using fence.
    /// When null is provided, the first context enabled by ImmediateContextMask
    /// will be used.
    context: ?*c.IDeviceContext = null,

    comptime {
        helpers.ensureSame(@This(), c.TextureData);
    }
};

/// Blend factors
/// [D3D11_BLEND]: https://msdn.microsoft.com/en-us/library/windows/desktop/ff476086(v=vs.85).aspx
/// [D3D12_BLEND]: https://msdn.microsoft.com/en-us/library/windows/desktop/dn770338(v=vs.85).aspx
/// [glBlendFuncSeparate]: https://www.opengl.org/wiki/GLAPI/glBlendFuncSeparate
/// This enumeration defines blend factors for alpha-blending.
/// It generally mirrors [D3D11_BLEND][] and [D3D12_BLEND][] enumerations and is used by RenderTargetBlendDesc structure
/// to define source and destination blend factors for color and alpha channels.
/// \sa [D3D11_BLEND on MSDN][D3D11_BLEND], [D3D12_BLEND on MSDN][D3D12_BLEND], [glBlendFuncSeparate on OpenGL.org][glBlendFuncSeparate]
pub const BlendFactor = enum(i8) {
    /// Undefined blend factor
    undefined = 0,

    /// The blend factor is zero.\n
    /// Direct3D counterpart: D3D11_BLEND_ZERO/D3D12_BLEND_ZERO. OpenGL counterpart: GL_ZERO.
    zero,

    /// The blend factor is one.\n
    /// Direct3D counterpart: D3D11_BLEND_ONE/D3D12_BLEND_ONE. OpenGL counterpart: GL_ONE.
    one,

    /// The blend factor is RGB data from a pixel shader.\n
    /// Direct3D counterpart: D3D11_BLEND_SRC_COLOR/D3D12_BLEND_SRC_COLOR. OpenGL counterpart: GL_SRC_COLOR.
    src_color,

    /// The blend factor is 1-RGB, where RGB is the data from a pixel shader.\n
    /// Direct3D counterpart: D3D11_BLEND_INV_SRC_COLOR/D3D12_BLEND_INV_SRC_COLOR. OpenGL counterpart: GL_ONE_MINUS_SRC_COLOR.
    inv_src_color,

    /// The blend factor is alpha (A) data from a pixel shader.\n
    /// Direct3D counterpart: D3D11_BLEND_SRC_ALPHA/D3D12_BLEND_SRC_ALPHA. OpenGL counterpart: GL_SRC_ALPHA.
    src_alpha,

    /// The blend factor is 1-A, where A is alpha data from a pixel shader.\n
    /// Direct3D counterpart: D3D11_BLEND_INV_SRC_ALPHA/D3D12_BLEND_INV_SRC_ALPHA. OpenGL counterpart: GL_ONE_MINUS_SRC_ALPHA.
    inv_src_alpha,

    /// The blend factor is alpha (A) data from a render target.\n
    /// Direct3D counterpart: D3D11_BLEND_DEST_ALPHA/D3D12_BLEND_DEST_ALPHA. OpenGL counterpart: GL_DST_ALPHA.
    dest_alpha,

    /// The blend factor is 1-A, where A is alpha data from a render target.\n
    /// Direct3D counterpart: D3D11_BLEND_INV_DEST_ALPHA/D3D12_BLEND_INV_DEST_ALPHA. OpenGL counterpart: GL_ONE_MINUS_DST_ALPHA.
    inv_dest_alpha,

    /// The blend factor is RGB data from a render target.\n
    /// Direct3D counterpart: D3D11_BLEND_DEST_COLOR/D3D12_BLEND_DEST_COLOR. OpenGL counterpart: GL_DST_COLOR.
    dest_color,

    /// The blend factor is 1-RGB, where RGB is the data from a render target.\n
    /// Direct3D counterpart: D3D11_BLEND_INV_DEST_COLOR/D3D12_BLEND_INV_DEST_COLOR. OpenGL counterpart: GL_ONE_MINUS_DST_COLOR.
    inv_dest_color,

    /// The blend factor is (f,f,f,1), where f = min(As, 1-Ad),
    /// As is alpha data from a pixel shader, and Ad is alpha data from a render target.\n
    /// Direct3D counterpart: D3D11_BLEND_SRC_ALPHA_SAT/D3D12_BLEND_SRC_ALPHA_SAT. OpenGL counterpart: GL_SRC_ALPHA_SATURATE.
    src_alpha_sat,

    /// The blend factor is the constant blend factor set with IDeviceContext::SetBlendFactors().\n
    /// Direct3D counterpart: D3D11_BLEND_BLEND_FACTOR/D3D12_BLEND_BLEND_FACTOR. OpenGL counterpart: GL_CONSTANT_COLOR.
    blend_factor,

    /// The blend factor is one minus constant blend factor set with IDeviceContext::SetBlendFactors().\n
    /// Direct3D counterpart: D3D11_BLEND_INV_BLEND_FACTOR/D3D12_BLEND_INV_BLEND_FACTOR. OpenGL counterpart: GL_ONE_MINUS_CONSTANT_COLOR.
    inv_blend_factor,

    /// The blend factor is the second RGB data output from a pixel shader.\n
    /// Direct3D counterpart: D3D11_BLEND_SRC1_COLOR/D3D12_BLEND_SRC1_COLOR. OpenGL counterpart: GL_SRC1_COLOR.
    src1_color,

    /// The blend factor is 1-RGB, where RGB is the second RGB data output from a pixel shader.\n
    /// Direct3D counterpart: D3D11_BLEND_INV_SRC1_COLOR/D3D12_BLEND_INV_SRC1_COLOR. OpenGL counterpart: GL_ONE_MINUS_SRC1_COLOR.
    inv_src1_color,

    /// The blend factor is the second alpha (A) data output from a pixel shader.\n
    /// Direct3D counterpart: D3D11_BLEND_SRC1_ALPHA/D3D12_BLEND_SRC1_ALPHA. OpenGL counterpart: GL_SRC1_ALPHA.
    src1_alpha,

    /// The blend factor is 1-A, where A is the second alpha data output from a pixel shader.\n
    /// Direct3D counterpart: D3D11_BLEND_INV_SRC1_ALPHA/D3D12_BLEND_INV_SRC1_ALPHA. OpenGL counterpart: GL_ONE_MINUS_SRC1_ALPHA.
    inv_src1_alpha,
};

/// Blending operation
/// [D3D11_BLEND_OP]: https://msdn.microsoft.com/en-us/library/windows/desktop/ff476088(v=vs.85).aspx
/// [D3D12_BLEND_OP]: https://msdn.microsoft.com/en-us/library/windows/desktop/dn770340(v=vs.85).aspx
/// [glBlendEquationSeparate]: https://www.opengl.org/wiki/GLAPI/glBlendEquationSeparate
/// This enumeration describes blending operation for RGB or Alpha channels and generally mirrors
/// [D3D11_BLEND_OP][] and [D3D12_BLEND_OP][] enums. It is used by RenderTargetBlendDesc structure to define RGB and Alpha
/// blending operations
/// \sa [D3D11_BLEND_OP on MSDN][D3D11_BLEND_OP], [D3D12_BLEND_OP on MSDN][D3D12_BLEND_OP], [glBlendEquationSeparate on OpenGL.org][glBlendEquationSeparate]
pub const BlendOperation = enum(i8) {
    /// Undefined blend operation
    undefined,

    /// Add source and destination color components.\n
    /// Direct3D counterpart: D3D11_BLEND_OP_ADD/D3D12_BLEND_OP_ADD. OpenGL counterpart: GL_FUNC_ADD.
    add,

    /// Subtract destination color components from source color components.\n
    /// Direct3D counterpart: D3D11_BLEND_OP_SUBTRACT/D3D12_BLEND_OP_SUBTRACT. OpenGL counterpart: GL_FUNC_SUBTRACT.
    subtract,

    /// Subtract source color components from destination color components.\n
    /// Direct3D counterpart: D3D11_BLEND_OP_REV_SUBTRACT/D3D12_BLEND_OP_REV_SUBTRACT. OpenGL counterpart: GL_FUNC_REVERSE_SUBTRACT.
    rev_subtract,

    /// Compute the minimum of source and destination color components.\n
    /// Direct3D counterpart: D3D11_BLEND_OP_MIN/D3D12_BLEND_OP_MIN. OpenGL counterpart: GL_MIN.
    min,

    /// Compute the maximum of source and destination color components.\n
    /// Direct3D counterpart: D3D11_BLEND_OP_MAX/D3D12_BLEND_OP_MAX. OpenGL counterpart: GL_MAX.
    max,
};

/// Logic operation
/// [D3D12_LOGIC_OP]: https://msdn.microsoft.com/en-us/library/windows/desktop/dn770379(v=vs.85).aspx
/// This enumeration describes logic operation and generally mirrors [D3D12_LOGIC_OP][] enum.
/// It is used by RenderTargetBlendDesc structure to define logic operation.
/// Only available on D3D12 engine
/// \sa [D3D12_LOGIC_OP on MSDN][D3D12_LOGIC_OP]
pub const LogicOperation = enum(i8) {
    /// Clear the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_CLEAR.
    clear = 0,

    /// Set the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_SET.
    set,

    /// Copy the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_COPY.
    copy,

    /// Perform an inverted-copy of the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_COPY_INVERTED.
    copy_inverted,

    /// No operation is performed on the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_NOOP.
    noop,

    /// Invert the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_INVERT.
    invert,

    /// Perform a logical AND operation on the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_AND.
    @"and",

    /// Perform a logical NAND operation on the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_NAND.
    nand,

    /// Perform a logical OR operation on the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_OR.
    @"or",

    /// Perform a logical NOR operation on the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_NOR.
    nor,

    /// Perform a logical XOR operation on the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_XOR.
    xor,

    /// Perform a logical equal operation on the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_EQUIV.
    equiv,

    /// Perform a logical AND and reverse operation on the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_AND_REVERSE.
    and_reverse,

    /// Perform a logical AND and invert operation on the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_AND_INVERTED.
    and_inverted,

    /// Perform a logical OR and reverse operation on the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_OR_REVERSE.
    or_reverse,

    /// Perform a logical OR and invert operation on the render target.\n
    /// Direct3D12 counterpart: D3D12_LOGIC_OP_OR_INVERTED.
    or_inverted,

    /// Helper value that stores the total number of logical operations in the enumeration.
    num_operations,
};

/// Color component write flags
///
/// These flags are used by RenderTargetBlendDesc structure to define
/// writable components of the render target
///
/// **Zig Usage:** Default value is equivalent to `COLOR_MASK_NONE`.
pub const ColorMask = packed struct(u8) {
    /// Allow data to be stored in the red component.
    red: bool = false,

    /// Allow data to be stored in the green component.
    green: bool = false,

    /// Allow data to be stored in the blue component.
    blue: bool = false,

    /// Allow data to be stored in the alpha component.
    alpha: bool = false,

    _: u4 = 0,

    pub const rgb: ColorMask = .{ .red = true, .green = true, .blue = true };
    pub const all: ColorMask = .{ .red = true, .green = true, .blue = true, .alpha = true };
};

/// Describes a blend state for a single render target
///
/// This structure is used by BlendStateDesc to describe
/// blend states for render targets
pub const RenderTargetBlendDesc = extern struct {
    /// Enable or disable blending for this render target. Default value: False.
    blend_enable: bool = false,

    /// Enable or disable a logical operation for this render target. Default value: False.
    logic_operation_enable: bool = false,

    /// Specifies the blend factor to apply to the RGB value output from the pixel shader
    /// Default value: Diligent::BLEND_FACTOR_ONE.
    src_blend: BlendFactor = .one,

    /// Specifies the blend factor to apply to the RGB value in the render target
    /// Default value: Diligent::BLEND_FACTOR_ZERO.
    dest_blend: BlendFactor = .zero,

    /// Defines how to combine the source and destination RGB values
    /// after applying the SrcBlend and DestBlend factors.
    /// Default value: Diligent::BLEND_OPERATION_ADD.
    blend_op: BlendOperation = .add,

    /// Specifies the blend factor to apply to the alpha value output from the pixel shader.
    /// Blend factors that end in _COLOR are not allowed.
    /// Default value: Diligent::BLEND_FACTOR_ONE.
    src_blend_alpha: BlendFactor = .one,

    /// Specifies the blend factor to apply to the alpha value in the render target.
    /// Blend factors that end in _COLOR are not allowed.
    /// Default value: Diligent::BLEND_FACTOR_ZERO.
    dest_blend_alpha: BlendFactor = .zero,

    /// Defines how to combine the source and destination alpha values
    /// after applying the SrcBlendAlpha and DestBlendAlpha factors.
    /// Default value: Diligent::BLEND_OPERATION_ADD.
    blend_op_alpha: BlendOperation = .add,

    /// Defines logical operation for the render target.
    /// Default value: Diligent::LOGIC_OP_NOOP.
    logic_op: LogicOperation = .noop,

    /// Render target write mask.
    /// Default value: Diligent::COLOR_MASK_ALL.
    render_target_write_mask: ColorMask = .all,

    comptime {
        helpers.ensureSame(@This(), c.RenderTargetBlendDesc);
    }
};

/// Blend state description
///
/// This structure describes the blend state and is part of the GraphicsPipelineDesc.
pub const BlendStateDesc = extern struct {
    /// Specifies whether to use alpha-to-coverage as a multisampling technique
    /// when setting a pixel to a render target. Default value: False.
    alpha_to_coverage_enable: bool = false,

    /// Specifies whether to enable independent blending in simultaneous render targets.
    /// If set to False, only RenderTargets[0] is used. Default value: False.
    independent_blend_enable: bool = false,

    /// An array of RenderTargetBlendDesc structures that describe the blend
    /// states for render targets
    render_targets: [c.DILIGENT_MAX_RENDER_TARGETS]RenderTargetBlendDesc = @splat(.{}),

    comptime {
        helpers.ensureSame(@This(), c.BlendStateDesc);
    }
};

/// Fill mode
///
/// [D3D11_FILL_MODE]: https://msdn.microsoft.com/en-us/library/windows/desktop/ff476131(v=vs.85).aspx
/// [D3D12_FILL_MODE]: https://msdn.microsoft.com/en-us/library/windows/desktop/dn770366(v=vs.85).aspx
/// This enumeration determines the fill mode to use when rendering triangles and mirrors the
/// [D3D11_FILL_MODE][]/[D3D12_FILL_MODE][] enum. It is used by RasterizerStateDesc structure to define the fill mode.
pub const FillMode = enum(i8) {
    /// Undefined fill mode.
    undefined,

    /// Rasterize triangles using wireframe fill. \n
    /// Direct3D counterpart: D3D11_FILL_WIREFRAME/D3D12_FILL_MODE_WIREFRAME. OpenGL counterpart: GL_LINE.
    wireframe,

    /// Rasterize triangles using solid fill. \n
    /// Direct3D counterpart: D3D11_FILL_SOLID/D3D12_FILL_MODE_SOLID. OpenGL counterpart: GL_FILL.
    solid,
};

/// Cull mode
///
/// [D3D11_CULL_MODE]: https://msdn.microsoft.com/en-us/library/windows/desktop/ff476108(v=vs.85).aspx
/// [D3D12_CULL_MODE]: https://msdn.microsoft.com/en-us/library/windows/desktop/dn770354(v=vs.85).aspx
/// This enumeration defines which triangles are not drawn during the rasterization and mirrors
/// [D3D11_CULL_MODE][]/[D3D12_CULL_MODE][] enum. It is used by RasterizerStateDesc structure to define the polygon cull mode.
pub const CullMode = enum(i8) {
    /// Undefined cull mode.
    undefined,

    /// Draw all triangles.
    ///
    /// Direct3D counterpart: D3D11_CULL_NONE/D3D12_CULL_MODE_NONE. OpenGL counterpart: glDisable( GL_CULL_FACE ).
    none,

    /// Do not draw triangles that are front-facing. Front- and back-facing triangles are determined
    /// by the RasterizerStateDesc::FrontCounterClockwise member.
    ///
    /// Direct3D counterpart: D3D11_CULL_FRONT/D3D12_CULL_MODE_FRONT. OpenGL counterpart: GL_FRONT.
    front,

    /// Do not draw triangles that are back-facing. Front- and back-facing triangles are determined
    /// by the RasterizerStateDesc::FrontCounterClockwise member.
    ///
    /// Direct3D counterpart: D3D11_CULL_BACK/D3D12_CULL_MODE_BACK. OpenGL counterpart: GL_BACK.
    back,
};

/// Rasterizer state description
/// This structure describes the rasterizer state and is part of the GraphicsPipelineDesc.
pub const RasterizerStateDesc = extern struct {
    /// Determines triangle fill mode, see FillMode for details.
    ///
    /// Default value: .solid.
    fill_mode: FillMode = .solid,

    /// Determines triangle cull mode, see CullMode for details.
    ///
    /// Default value: .back.
    cull_mode: CullMode = .back,

    /// Determines if a triangle is front- or back-facing.
    ///
    /// If this parameter is true, a triangle will be considered front-facing if
    /// its vertices are counter-clockwise
    /// on the render target and considered back-facing if they are clockwise.
    /// If this parameter is false, the opposite is true.
    /// Default value: false.
    front_counter_clockwise: bool = false,

    /// Enable clipping against near and far clip planes.
    ///
    /// Default value: true.
    ///
    /// By default polygon faces are clipped against the near and far planes of the view
    /// frustum. If depth clipping is disabled, the depth of the fragments that would be
    /// clipped is clamped to the near/far plane instead of discarding them.
    ///
    /// To check if the device supports depth clamping, use the DepthClamp device feature.
    /// If it is not supported, the value of this member must be true.
    depth_clip_enable: bool = true,

    /// Enable scissor-rectangle culling. All pixels outside an active scissor rectangle are culled.
    ///
    /// Default value: false.
    scissor_enable: bool = false,

    /// Specifies whether to enable line antialiasing.
    ///
    /// Default value: false.
    antialiased_line_enable: bool = false,

    /// Constant value added to the depth of a given pixel.
    ///
    /// Default value: 0.
    depth_bias: i32 = 0,

    /// Maximum depth bias of a pixel.
    ///
    /// **Warning:** Depth bias clamp is not available in OpenGL
    ///
    /// Default value: 0.
    depth_bias_clamp: f32 = 0.0,

    /// Scalar that scales the given pixel's slope before adding to the pixel's depth.
    ///
    /// Default value: 0.
    slope_scaled_depth_bias: f32 = 0.0,

    comptime {
        helpers.ensureSame(@This(), c.RasterizerStateDesc);
    }
};

/// Stencil operation
///
/// [D3D11_STENCIL_OP]: https://msdn.microsoft.com/en-us/library/windows/desktop/ff476219(v=vs.85).aspx
/// [D3D12_STENCIL_OP]: https://msdn.microsoft.com/en-us/library/windows/desktop/dn770409(v=vs.85).aspx
/// This enumeration describes the stencil operation and generally mirrors
/// [D3D11_STENCIL_OP][]/[D3D12_STENCIL_OP][] enumeration.
/// It is used by Diligent::StencilOpDesc structure to describe the stencil fail, depth fail
/// and stencil pass operations
pub const StencilOp = enum(i8) {
    /// Undefined operation.
    undefined,

    /// Keep the existing stencil data.\n
    /// Direct3D counterpart: D3D11_STENCIL_OP_KEEP/D3D12_STENCIL_OP_KEEP. OpenGL counterpart: GL_KEEP.
    keep,

    /// Set the stencil data to 0.\n
    /// Direct3D counterpart: D3D11_STENCIL_OP_ZERO/D3D12_STENCIL_OP_ZERO. OpenGL counterpart: GL_ZERO.
    zero,

    /// Set the stencil data to the reference value set by calling IDeviceContext::SetStencilRef().\n
    /// Direct3D counterpart: D3D11_STENCIL_OP_REPLACE/D3D12_STENCIL_OP_REPLACE. OpenGL counterpart: GL_REPLACE.
    replace,

    /// Increment the current stencil value, and clamp to the maximum representable unsigned value.\n
    /// Direct3D counterpart: D3D11_STENCIL_OP_INCR_SAT/D3D12_STENCIL_OP_INCR_SAT. OpenGL counterpart: GL_INCR.
    incr_sat,

    /// Decrement the current stencil value, and clamp to 0.\n
    /// Direct3D counterpart: D3D11_STENCIL_OP_DECR_SAT/D3D12_STENCIL_OP_DECR_SAT. OpenGL counterpart: GL_DECR.
    decr_sat,

    /// Bitwise invert the current stencil buffer value.\n
    /// Direct3D counterpart: D3D11_STENCIL_OP_INVERT/D3D12_STENCIL_OP_INVERT. OpenGL counterpart: GL_INVERT.
    invert,

    /// Increment the current stencil value, and wrap the value to zero when incrementing
    /// the maximum representable unsigned value. \n
    /// Direct3D counterpart: D3D11_STENCIL_OP_INCR/D3D12_STENCIL_OP_INCR. OpenGL counterpart: GL_INCR_WRAP.
    incr_wrap,

    /// Decrement the current stencil value, and wrap the value to the maximum representable
    /// unsigned value when decrementing a value of zero.\n
    /// Direct3D counterpart: D3D11_STENCIL_OP_DECR/D3D12_STENCIL_OP_DECR. OpenGL counterpart: GL_DECR_WRAP.
    decr_wrap,
};

/// Describes stencil operations that are performed based on the results of depth test.
///
/// [D3D11_DEPTH_STENCILOP_DESC]: https://msdn.microsoft.com/en-us/library/windows/desktop/ff476109(v=vs.85).aspx
/// [D3D12_DEPTH_STENCILOP_DESC]: https://msdn.microsoft.com/en-us/library/windows/desktop/dn770355(v=vs.85).aspx
/// The structure generally mirrors [D3D11_DEPTH_STENCILOP_DESC][]/[D3D12_DEPTH_STENCILOP_DESC][] structure.
/// It is used by Diligent::DepthStencilStateDesc structure to describe the stencil
/// operations for the front and back facing polygons.
pub const StencilOpDesc = extern struct {
    /// The stencil operation to perform when stencil testing fails.
    /// Default value: Diligent::STENCIL_OP_KEEP.
    stencil_fail_op: StencilOp = .keep,

    /// The stencil operation to perform when stencil testing passes and depth testing fails.
    /// Default value: Diligent::STENCIL_OP_KEEP.
    stencil_depth_fail_op: StencilOp = .keep,

    /// The stencil operation to perform when stencil testing and depth testing both pass.
    /// Default value: Diligent::STENCIL_OP_KEEP.
    stencil_pass_op: StencilOp = .keep,

    /// A function that compares stencil data against existing stencil data.
    /// Default value: Diligent::COMPARISON_FUNC_ALWAYS. See Diligent::COMPARISON_FUNCTION.
    stencil_func: ComparisonFunction = .always,

    comptime {
        helpers.ensureSame(@This(), c.StencilOpDesc);
    }
};

/// Depth stencil state description
///
/// [D3D11_DEPTH_STENCIL_DESC]: https://msdn.microsoft.com/en-us/library/windows/desktop/ff476110(v=vs.85).aspx
/// [D3D12_DEPTH_STENCIL_DESC]: https://msdn.microsoft.com/en-us/library/windows/desktop/dn770356(v=vs.85).aspx
/// This structure describes the depth stencil state and is part of the GraphicsPipelineDesc.
/// The structure generally mirrors [D3D11_DEPTH_STENCIL_DESC][]/[D3D12_DEPTH_STENCIL_DESC][]
/// structure.
pub const DepthStencilStateDesc = extern struct {
    /// Enable depth-stencil operations. When it is set to False,
    /// depth test always passes, depth writes are disabled,
    /// and no stencil operations are performed. Default value: True.
    depth_enable: bool = true,

    /// Enable or disable writes to a depth buffer. Default value: True.
    depth_write_enable: bool = true,

    /// A function that compares depth data against existing depth data.
    /// See Diligent::COMPARISON_FUNCTION for details.
    /// Default value: Diligent::COMPARISON_FUNC_LESS.
    depth_func: ComparisonFunction = .less,

    /// Enable stencil operations. Default value: False.
    stencil_enable: bool = false,

    /// Identify which bits of the depth-stencil buffer are accessed when reading stencil data.
    /// Default value: 0xFF.
    stencil_read_mask: u8 = 0xFF,

    /// Identify which bits of the depth-stencil buffer are accessed when writing stencil data.
    /// Default value: 0xFF.
    stencil_write_mask: u8 = 0xFF,

    /// Identify stencil operations for the front-facing triangles, see Diligent::StencilOpDesc.
    front_face: StencilOpDesc = .{},

    /// Identify stencil operations for the back-facing triangles, see Diligent::StencilOpDesc.
    back_face: StencilOpDesc = .{},

    comptime {
        helpers.ensureSame(@This(), c.DepthStencilStateDesc);
    }
};

/// Input frequency
pub const InputElementFrequency = enum(u8) {
    /// Frequency is undefined.
    undefined,

    /// Input data is per-vertex data.
    per_vertex,

    /// Input data is per-instance data.
    per_instance,
};

/// Value type
///
/// This enumeration describes value type. It is used by
/// - BufferDesc structure to describe value type of a formatted buffer
/// - DrawAttribs structure to describe index type for an indexed draw call
pub const ValueType = enum(u8) {
    /// Undefined type
    undefined,
    /// Signed 8-bit integer
    int8,
    /// Signed 16-bit integer
    int16,
    /// Signed 32-bit integer
    int32,
    /// Unsigned 8-bit integer
    uint8,
    /// Unsigned 16-bit integer
    uint16,
    /// Unsigned 32-bit integer
    uint32,
    /// Half-precision 16-bit floating point
    float16,
    /// Full-precision 32-bit floating point
    float32,
    /// Double-precision 64-bit floating point
    float64,
};

/// Description of a single element of the input layout
pub const LayoutElement = extern struct {
    /// HLSL semantic.
    /// Default value (`"ATTRIB"`) allows HLSL shaders to be converted
    /// to GLSL and used in OpenGL backend as well as compiled to SPIRV and used
    /// in Vulkan backend.
    /// Any value other than default will only work in Direct3D11 and Direct3D12 backends.
    hlsl_semantic: [*:0]const u8 = "ATTRIB",

    /// Input index of the element that is specified in the vertex shader.
    /// In Direct3D11 and Direct3D12 backends this is the semantic index.
    input_index: u32 = 0,

    /// Buffer slot index that this element is read from.
    buffer_slot: u32 = 0,

    /// Number of components in the element. Allowed values are 1, 2, 3, and 4.
    num_components: u32 = 0,

    /// Type of the element components, see Diligent::VALUE_TYPE for details.
    value_type: ValueType = .float32,

    /// Indicates if the value should be normalized.
    /// For signed and unsigned integer value types
    /// (`VT_INT8`, `VT_INT16`, `VT_INT32`, `VT_UINT8`, `VT_UINT16`, `VT_UINT32`)
    /// indicates if the value should be normalized to [-1,+1] or
    /// [0, 1] range respectively.
    ///
    /// For floating point types (`VT_FLOAT16` and `VT_FLOAT32`), this member is ignored.
    is_normalized: bool = true,

    /// Relative offset, in bytes, to the element bits.
    /// If this value is set to `LAYOUT_ELEMENT_AUTO_OFFSET` (default value), the offset will
    /// be computed automatically by placing the element right after the previous one.
    relative_offset: u32 = c.LAYOUT_ELEMENT_AUTO_OFFSET,

    /// Stride, in bytes, between two elements, for this buffer slot.
    /// If this value is set to `LAYOUT_ELEMENT_AUTO_STRIDE`, the stride will be
    /// computed automatically assuming that all elements in the same buffer slot are
    /// packed one after another. If the buffer slot contains multiple layout elements,
    /// they all must specify the same stride or use LAYOUT_ELEMENT_AUTO_STRIDE value.
    stride: u32 = c.LAYOUT_ELEMENT_AUTO_STRIDE,

    /// Frequency of the input data, see Diligent::INPUT_ELEMENT_FREQUENCY for details.
    frequency: InputElementFrequency = .per_vertex,

    /// The number of instances to draw using the same per-instance data before advancing
    /// in the buffer by one element.
    instance_data_step_rate: u32 = 1,

    comptime {
        helpers.ensureSame(@This(), c.LayoutElement);
    }
};

/// Layout description
///
/// This structure is used by IRenderDevice::CreateGraphicsPipelineState().
pub const InputLayoutDesc = extern struct {
    /// Array of layout elements.
    layout_elements: ?[*]const LayoutElement = null,

    /// The number of layout elements in `LayoutElements` array.
    num_elements: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.InputLayoutDesc);
    }
};

/// Input primitive topology.
///
/// This enumeration is used by GraphicsPipelineDesc structure to define input primitive topology.
pub const PrimitiveTopology = enum(u8) {
    /// Undefined topology
    undefined,

    /// Interpret the vertex data as a list of triangles.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST. OpenGL counterpart: GL_TRIANGLES.
    triangle_list,

    /// Interpret the vertex data as a triangle strip.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP. OpenGL counterpart: GL_TRIANGLE_STRIP.
    triangle_strip,

    /// Interpret the vertex data as a list of points.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_POINTLIST. OpenGL counterpart: GL_POINTS.
    point_list,

    /// Interpret the vertex data as a list of lines.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_LINELIST. OpenGL counterpart: GL_LINES.
    line_list,

    /// Interpret the vertex data as a line strip.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_LINESTRIP. OpenGL counterpart: GL_LINE_STRIP.
    line_strip,

    /// Interpret the vertex data as a list of triangles with adjacency data.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ. OpenGL counterpart: GL_TRIANGLES_ADJACENCY.
    triangle_list_adj,

    /// Interpret the vertex data as a triangle strip with adjacency data.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ. OpenGL counterpart: GL_TRIANGLE_STRIP_ADJACENCY.
    triangle_strip_adj,

    /// Interpret the vertex data as a list of lines with adjacency data.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_LINELIST_ADJ. OpenGL counterpart: GL_LINES_ADJACENCY.
    line_list_adj,

    /// Interpret the vertex data as a line strip with adjacency data.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ. OpenGL counterpart: GL_LINE_STRIP_ADJACENCY.
    line_strip_adj,

    /// Interpret the vertex data as a list of one control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_1_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"1_control_point_patchlist",

    /// Interpret the vertex data as a list of two control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_2_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"2_control_point_patchlist",

    /// Interpret the vertex data as a list of three control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_3_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"3_control_point_patchlist",

    /// Interpret the vertex data as a list of four control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_4_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"4_control_point_patchlist",

    /// Interpret the vertex data as a list of five control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_5_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"5_control_point_patchlist",

    /// Interpret the vertex data as a list of six control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_6_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"6_control_point_patchlist",

    /// Interpret the vertex data as a list of seven control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_7_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"7_control_point_patchlist",

    /// Interpret the vertex data as a list of eight control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_8_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"8_control_point_patchlist",

    /// Interpret the vertex data as a list of nine control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_9_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"9_control_point_patchlist",

    /// Interpret the vertex data as a list of ten control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_10_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"10_control_point_patchlist",

    /// Interpret the vertex data as a list of 11 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_11_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"11_control_point_patchlist",

    /// Interpret the vertex data as a list of 12 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_12_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"12_control_point_patchlist",

    /// Interpret the vertex data as a list of 13 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_13_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"13_control_point_patchlist",

    /// Interpret the vertex data as a list of 14 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_14_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"14_control_point_patchlist",

    /// Interpret the vertex data as a list of 15 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_15_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"15_control_point_patchlist",

    /// Interpret the vertex data as a list of 16 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_16_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"16_control_point_patchlist",

    /// Interpret the vertex data as a list of 17 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_17_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"17_control_point_patchlist",

    /// Interpret the vertex data as a list of 18 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_18_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"18_control_point_patchlist",

    /// Interpret the vertex data as a list of 19 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_19_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"19_control_point_patchlist",

    /// Interpret the vertex data as a list of 20 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_20_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"20_control_point_patchlist",

    /// Interpret the vertex data as a list of 21 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_21_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"21_control_point_patchlist",

    /// Interpret the vertex data as a list of 22 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_22_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"22_control_point_patchlist",

    /// Interpret the vertex data as a list of 23 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_23_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"23_control_point_patchlist",

    /// Interpret the vertex data as a list of 24 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_24_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"24_control_point_patchlist",

    /// Interpret the vertex data as a list of 25 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_25_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"25_control_point_patchlist",

    /// Interpret the vertex data as a list of 26 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_26_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"26_control_point_patchlist",

    /// Interpret the vertex data as a list of 27 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_27_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"27_control_point_patchlist",

    /// Interpret the vertex data as a list of 28 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_28_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"28_control_point_patchlist",

    /// Interpret the vertex data as a list of 29 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_29_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"29_control_point_patchlist",

    /// Interpret the vertex data as a list of 30 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_30_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"30_control_point_patchlist",

    /// Interpret the vertex data as a list of 31 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_31_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"31_control_point_patchlist",

    /// Interpret the vertex data as a list of 32 control point patches.
    ///
    /// D3D counterpart: D3D_PRIMITIVE_TOPOLOGY_32_CONTROL_POINT_PATCHLIST. OpenGL counterpart: GL_PATCHES.
    @"32_control_point_patchlist",
};

/// Pipeline state shading rate flags.
/// **Zig Usage:** Default value is equivalent to `PIPELINE_SHADING_RATE_FLAG_NONE`
pub const PipelineShadingRateFlags = packed struct(u8) {
    /// Indicates that the pipeline state will be used with per draw or per primitive shading rate.
    /// See IDeviceContext::SetShadingRate().
    per_primitive: bool = false,

    /// Indicates that the pipeline state will be used with texture-based shading rate.
    /// See IDeviceContext::SetShadingRate() and IDeviceContext::SetRenderTargetsExt().
    texture_based: bool = false,

    _: u6 = 0,
};

/// Sample description
///
/// This structure is used by GraphicsPipelineDesc to describe multisampling parameters
pub const SampleDesc = extern struct {
    /// Sample count
    count: u8 = 1,

    /// Quality
    quality: u8 = 0,

    comptime {
        helpers.ensureSame(@This(), c.SampleDesc);
    }
};

/// Graphics pipeline state description
///
/// This structure describes the graphics pipeline state and is part of the GraphicsPipelineStateCreateInfo structure.
pub const GraphicsPipelineDesc = extern struct {
    /// Blend state description.
    blend_desc: BlendStateDesc = .{},

    /// Sample mask.
    /// 32-bit sample mask that determines which samples get updated
    /// in all the active render targets. A sample mask is always applied;
    /// it is independent of whether multisampling is enabled, and does not
    /// depend on whether an application uses multisample render targets.
    sample_mask: u32 = 0xFFFFFFFF,

    /// Rasterizer state description.
    rasterizer_desc: RasterizerStateDesc = .{},

    /// Depth-stencil state description.
    depth_stencil_desc: DepthStencilStateDesc = .{},

    /// Input layout, ignored in a mesh pipeline.
    input_layout: InputLayoutDesc = .{},

    /// Primitive topology type, ignored in a mesh pipeline.
    primitive_topology: PrimitiveTopology = .triangle_list,

    /// The number of viewports used by this pipeline
    num_viewports: u8 = 1,

    /// The number of render targets in the RTVFormats array.
    /// Must be 0 when `pRenderPass` is not `null`.
    num_render_targets: u8 = 0,

    /// When `pRenderPass` is not `null`, the subpass
    /// index within the render pass.
    /// When `pRenderPass` is `null`, this member must be 0.
    subpass_index: u8 = 0,

    /// Shading rate flags that specify which type of the shading rate will be used with this pipeline.
    shading_rate_flags: PipelineShadingRateFlags = .{},

    /// Render target formats.
    /// All formats must be Diligent::TEX_FORMAT_UNKNOWN when `pRenderPass` is not `null`.
    rtv_formats: [c.DILIGENT_MAX_RENDER_TARGETS]TextureFormat = @splat(.unknown),

    /// Depth-stencil format.
    /// Must be Diligent::TEX_FORMAT_UNKNOWN when `pRenderPass` is not `null`.
    dsv_format: TextureFormat = .unknown,

    /// Indicates that the pipeline will be used with read-only depth-stencil buffer.
    /// Must be `false` when `pRenderPass` is not `null`.
    read_only_dsv: bool = false,

    /// Multisampling parameters.
    sample_desc: SampleDesc = .{},

    /// Pointer to the render pass object.
    /// When non-null render pass is specified, `NumRenderTargets` must be 0,
    /// and all RTV formats as well as DSV format must be Diligent::TEX_FORMAT_UNKNOWN.
    render_pass: ?*c.IRenderPass = null,

    /// Node mask.
    node_mask: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.GraphicsPipelineDesc);
    }
};

/// Pipeline type
pub const PipelineType = enum(u8) {
    /// Graphics pipeline, which is used by IDeviceContext::Draw(), IDeviceContext::DrawIndexed(),
    /// IDeviceContext::DrawIndirect(), IDeviceContext::DrawIndexedIndirect().
    graphics,

    /// Compute pipeline, which is used by IDeviceContext::DispatchCompute(), IDeviceContext::DispatchComputeIndirect().
    compute,

    /// Mesh pipeline, which is used by IDeviceContext::DrawMesh(), IDeviceContext::DrawMeshIndirect().
    mesh,

    /// Ray tracing pipeline, which is used by IDeviceContext::TraceRays().
    ray_tracing,

    /// Tile pipeline, which is used by IDeviceContext::DispatchTile().
    tile,

    _,

    pub const invalid: PipelineType = @fromBackingInt(0xFF);
};

/// Pipeline layout description
pub const PipelineResourceLayoutDesc = extern struct {
    /// Default shader resource variable type.
    /// This type will be used if shader variable description is not found in the `Variables` array
    /// or if `Variables == nullptr`
    default_variable_type: ShaderResourceVariableType = .static,

    /// Default shader variable merge stages.
    ///
    /// By default, all variables not found in the Variables array define separate resources.
    /// For example, if there is resource `"g_Texture"` in the vertex and pixel shader stages, there
    /// will be two separate resources in both stages. This member defines shader stages
    /// in which default variables will be combined.
    /// For example, if `DefaultVariableMergeStages == SHADER_TYPE_VERTEX | SHADER_TYPE_PIXEL`,
    /// then both resources in the example above will be combined into a single one.
    /// If there is another `"g_Texture"` in geometry shader, it will be separate from combined
    /// vertex-pixel "g_Texture".
    /// This member has no effect on variables defined in Variables array.
    default_variable_merge_stages: ShaderType = .{},

    /// Number of elements in Variables array
    num_variables: u32 = 0,

    /// Array of shader resource variable descriptions
    ///
    /// There may be multiple variables with the same name that use different shader stages,
    /// but the stages must not overlap.
    variables: ?[*]const ShaderResourceVariableDesc = null,

    /// Number of immutable samplers in ImmutableSamplers array
    num_immutable_samplers: u32 = 0,

    /// Array of immutable sampler descriptions
    immutable_samplers: ?[*]const c.ImmutableSamplerDesc = null,

    comptime {
        helpers.ensureSame(@This(), c.PipelineResourceLayoutDesc);
    }
};

/// Pipeline state description
pub const PipelineStateDesc = extern struct {
    /// Object name
    name: ?[*:0]const u8 = null,

    /// Pipeline type
    pipeline_type: PipelineType = .graphics,

    /// Shader resource binding allocation granularity
    /// This member defines allocation granularity for internal resources required by the shader resource
    /// binding object instances.
    /// Has no effect if the PSO is created with explicit pipeline resource signature(s).
    srb_allocation_granularity: u32 = 1,

    /// Defines which immediate contexts are allowed to execute commands that use this pipeline state.
    ///
    /// When `ImmediateContextMask` contains a bit at position n, the pipeline state may be
    /// used in the immediate context with index n directly (see DeviceContextDesc::ContextId).
    /// It may also be used in a command list recorded by a deferred context that will be executed
    /// through that immediate context.
    ///
    /// **Remarks:** Only specify those bits that will indicate the immediate contexts where the PSO
    /// will actually be used. Do not set unnecessary bits as this will result in extra overhead.
    immediate_context_mask: u64 = 1,

    /// Pipeline layout description
    resource_layout: PipelineResourceLayoutDesc = .{},

    comptime {
        helpers.ensureSame(@This(), c.PipelineStateDesc);
    }
};

/// Pipeline state creation flags
/// **Zig Usage:** Default is equivalent to PSO_CREATE_FLAG_NONE
pub const PSOCreateFlags = packed struct(u32) {
    /// Ignore missing variables.
    /// By default, the engine outputs a warning for every variable
    /// provided as part of the pipeline resource layout description
    /// that is not found in any of the designated shader stages.
    /// Use this flag to silence these warnings.
    ignore_missing_variables: bool = false,

    /// Ignore missing immutable samplers.
    /// By default, the engine outputs a warning for every immutable sampler
    /// provided as part of the pipeline resource layout description
    /// that is not found in any of the designated shader stages.
    /// Use this flag to silence these warnings.
    ignore_missing_immutable_samplers: bool = false,

    /// Do not remap shader resources when creating the pipeline.
    /// Resource bindings in all shaders must match the bindings expected
    /// by the PSO's resource signatures.
    dont_remap_shader_resources: bool = false,

    /// Create the pipeline state asynchronously.
    /// When this flag is set to true and if the devices supports
    /// AsyncShaderCompilation feature, the pipeline will be created
    /// asynchronously in the background. An application should use
    /// the IPipelineState::GetStatus() method to check the pipeline status.
    /// If the device does not support asynchronous shader compilation,
    /// the flag is ignored and the pipeline is created synchronously.
    asynchronous: bool = false,

    _: u28 = 0,
};

pub const PipelineStateCreateInfo = extern struct {
    /// Pipeline state description
    pso_desc: PipelineStateDesc = .{},

    /// Pipeline state creation flags, see Diligent::PSO_CREATE_FLAGS.
    flags: PSOCreateFlags = .{},

    /// The number of elements in `ppResourceSignatures` array.
    resource_signatures_count: u32 = 0,

    /// An array of `ResourceSignaturesCount` shader resource signatures that
    /// define the layout of shader resources in this pipeline state object.
    /// See Diligent::IPipelineResourceSignature.
    ///
    /// When this member is null, the pipeline resource layout will be defined
    /// by `PSODesc.ResourceLayout` member. In this case the PSO will implicitly
    /// create a resource signature that can be queried through IPipelineState::GetResourceSignature()
    /// method.
    /// When `ppResourceSignatures` is not null, `PSODesc.ResourceLayout` is ignored and
    /// should be in it default state.
    resource_signatures: ?[*]*c.IPipelineResourceSignature = null,

    /// The number of specialization constants.
    num_specialization_constants: u32 = 0,

    /// Pointer to an array of NumSpecializationConstants SpecializationConstant
    /// elements that define the values of specialization constants for the pipeline.
    /// Specialization constants allow applications to set constant values at pipeline
    /// creation time, enabling the driver to optimize the compiled shader code.
    ///
    /// This feature requires DeviceFeatures.SpecializationConstants to be enabled.
    /// If the device does not support specialization constants, non-empty arrays
    /// will be rejected during pipeline creation.
    ///
    /// **See also:** SpecializationConstant
    specialization_constants: ?[*]const c.SpecializationConstant = null,

    /// Optional pipeline state cache that is used to accelerate
    /// PSO creation. If `PSODesc.Name` is found in the cache, the cache
    /// data is used to create the PSO. Otherwise, the PSO
    /// is added to the cache.
    pso_cache: ?*c.IPipelineStateCache = null,

    /// For internal use only. Must always be `null`.
    internal_data: ?*anyopaque = null,

    comptime {
        helpers.ensureSame(@This(), c.PipelineStateCreateInfo);
    }
};

/// Graphics pipeline state initialization information.
pub const GraphicsPipelineStateCreateInfo = extern struct {
    base: PipelineStateCreateInfo = .{},

    /// Graphics pipeline state description.
    graphics_pipeline: GraphicsPipelineDesc = .{},

    /// Vertex shader to be used with the pipeline.
    vertex_shader: ?*c.IShader = null,

    /// Pixel shader to be used with the pipeline.
    pixel_shader: ?*c.IShader = null,

    /// Domain shader to be used with the pipeline.
    domain_shader: ?*c.IShader = null,

    /// Hull shader to be used with the pipeline.
    hull_shader: ?*c.IShader = null,

    /// Geometry shader to be used with the pipeline.
    geometry_shader: ?*c.IShader = null,

    /// Amplification shader to be used with the pipeline.
    amplification_shader: ?*c.IShader = null,

    /// Mesh shader to be used with the pipeline.
    mesh_shader: ?*c.IShader = null,

    comptime {
        helpers.ensureSame(@This(), c.GraphicsPipelineStateCreateInfo);
    }
};

/// Describes the shader type
/// **Zig Usage:** Default value is equivalent to `SHADER_TYPE_UNKNOWN`.
pub const ShaderType = packed struct(u32) {
    /// Vertex shader
    vertex: bool = false,
    /// Pixel (fragment) shader
    pixel: bool = false,
    /// Geometry shader
    geometry: bool = false,
    /// Hull (tessellation control) shader
    hull: bool = false,
    /// Domain (tessellation evaluation) shader
    domain: bool = false,
    /// Compute shader
    compute: bool = false,
    /// Amplification (task) shader
    amplification: bool = false,
    /// Mesh shader
    mesh: bool = false,
    /// Ray generation shader
    ray_gren: bool = false,
    /// Ray miss shader
    ray_miss: bool = false,
    /// Ray closest hit shader
    ray_closest_hit: bool = false,
    /// Ray any hit shader
    ray_any_hit: bool = false,
    /// Ray intersection shader
    ray_intersection: bool = false,
    /// Callable shader
    callable: bool = false,
    /// Tile shader (Only for Metal backend)
    tile: bool = false,

    _: u17 = 0,

    /// Vertex and pixel shader stages
    pub const vs_ps: ShaderType = .{ .vertex = true, .pixel = true };

    /// All graphics pipeline shader stages
    pub const all_graphics: ShaderType = .{
        .vertex = true,
        .pixel = true,
        .geometry = true,
        .hull = true,
        .domain = true,
    };

    /// All mesh shading pipeline stages
    pub const all_mesh: ShaderType = .{
        .amplification = true,
        .mesh = true,
        .pixel = true,
    };

    /// All ray-tracing pipeline shader stages
    pub const all_ray_tracing: ShaderType = .{
        .ray_gen = true,
        .ray_miss = true,
        .ray_closest_hit = true,
        .ray_any_hit = true,
        .ray_intersection = true,
        .callable = true,
    };
};

/// Describes the type of the shader resource variable
pub const ShaderResourceVariableType = enum(u8) {
    /// Shader resource bound to the variable is the same for all SRB instances.
    /// It must be set *once* directly through Pipeline State object.
    static = 0,

    /// Shader resource bound to the variable is specific to the shader resource binding
    /// instance (see Diligent::IShaderResourceBinding). It must be set *once* through
    /// Diligent::IShaderResourceBinding interface. It cannot be set through Diligent::IPipelineState
    /// interface and cannot be change once bound.
    mutable,

    /// Shader variable binding is dynamic. It can be set multiple times for every instance of shader resource
    /// binding (see Diligent::IShaderResourceBinding). It cannot be set through Diligent::IPipelineState interface.
    dynamic,
};

/// Shader variable property flags.
/// **Zig Usage:** Default is equivalent to `SHADER_VARIABLE_FLAG_NONE`.
pub const ShaderVariableFlags = packed struct(u8) {
    /// Indicates that dynamic buffers will never be bound to the resource
    /// variable. Applies to Diligent::SHADER_RESOURCE_TYPE_CONSTANT_BUFFER,
    /// Diligent::SHADER_RESOURCE_TYPE_BUFFER_UAV, Diligent::SHADER_RESOURCE_TYPE_BUFFER_SRV resources.
    ///
    /// **Remarks:** This flag directly translates to the Diligent::PIPELINE_RESOURCE_FLAG_NO_DYNAMIC_BUFFERS
    /// flag in the internal pipeline resource signature.
    no_dynamic_buffers: bool = false,

    /// Indicates that the resource consists of inline constants
    /// (also known as push constants in Vulkan or root constants in Direct3D12).
    /// Applies to Diligent::SHADER_RESOURCE_TYPE_CONSTANT_BUFFER only.
    ///
    /// **Remarks:** This flag directly translates to the Diligent::PIPELINE_RESOURCE_FLAG_INLINE_CONSTANTS
    /// flag in the internal pipeline resource signature.
    ///
    /// See Diligent::PIPELINE_RESOURCE_FLAG_INLINE_CONSTANTS for more details.
    inline_constants: bool = false,

    /// Indicates that the resource is an input attachment in general layout, which allows simultaneously
    /// reading from the resource through the input attachment and writing to it via color or depth-stencil
    /// attachment.
    ///
    /// **Note:** This flag is only valid in Vulkan.
    general_input_attachment_vk: bool = false,

    /// Indicates that the resource is an unfilterable-float texture.
    ///
    /// **Note:** This flag is only valid in WebGPU and ignored in other backends.
    unfilterable_float_texture_webgpu: bool = false,

    /// Indicates that the resource is a non-filtering sampler.
    ///
    /// **Note:** This flag is only valid in WebGPU and ignored in other backends.
    non_filtering_sampler_webgpu: bool = false,

    _: u3 = 0,
};

/// Describes shader variable
pub const ShaderResourceVariableDesc = extern struct {
    /// Shader variable name
    name: ?[*:0]const u8 = null,

    /// Shader stages this resources variable applies to.
    ///
    /// If more than one shader stage is specified, the variable will be shared between these stages.
    /// Shader stages used by different variables with the same name must not overlap.
    shader_stages: ShaderType = .{},

    /// Shader variable type. See Diligent::SHADER_RESOURCE_VARIABLE_TYPE for a list of allowed types
    type: ShaderResourceVariableType = .static,

    flags: ShaderVariableFlags = .{},

    comptime {
        helpers.ensureSame(@This(), c.ShaderResourceVariableDesc);
    }
};

/// Flags used by IShaderResourceVariable::Set, IShaderResourceVariable::SetArray,
/// and IShaderResourceVariable::SetBufferRange methods.
///
/// **Zig Usage:** Default value is equivalent to `SET_SHADER_RESOURCE_FLAG_NONE`.
pub const SetShaderResourceFlags = packed struct(u32) {
    /// Allow overwriting static and mutable variable bindings.
    ///
    /// By default, static and mutable variables can't be changed once
    /// initialized to a non-null resource. This flag is required
    /// to explicitly allow overwriting the binding.
    ///
    /// Overwriting static variables does not require synchronization
    /// with GPU and does not have effect on shader resource binding
    /// objects already created from the pipeline state or resource signature.
    ///
    /// When overwriting a mutable variable binding in Direct3D12 and Vulkan,
    /// an application must ensure that the GPU is not accessing the SRB.
    /// This can be achieved using synchronization tools such as fences.
    /// Synchronization with GPU is not required in OpenGL, Direct3D11,
    /// and Metal backends.
    allow_overwrite: bool = false,

    _: u31 = 0,
};

/// Buffer view type
///
/// This enumeration describes allowed view types for a buffer view. It is used by BufferViewDesc
/// structure.
pub const BufferViewType = enum(u8) {
    /// Undefined view type
    undefined,

    /// A buffer view will define a shader resource view that will be used
    /// as the source for the shader read operations
    shader_resource,

    /// A buffer view will define an unordered access view that will be used
    /// for unordered read/write operations from the shaders
    unordered_access,
};

/// Buffer format description
pub const BufferFormat = extern struct {
    /// Type of components. For a formatted buffer views, this value cannot be VT_UNDEFINED
    value_type: ValueType = .undefined,

    /// Number of components. Allowed values: 1, 2, 3, 4.
    /// For a formatted buffer, this value cannot be 0
    num_components: u8 = 0,

    /// For signed and unsigned integer value types
    /// (VT_INT8, VT_INT16, VT_INT32, VT_UINT8, VT_UINT16, VT_UINT32)
    /// indicates if the value should be normalized to [-1,+1] or
    /// [0, 1] range respectively. For floating point types
    /// (VT_FLOAT16 and VT_FLOAT32), this member is ignored.
    is_normalized: bool = false,

    comptime {
        helpers.ensureSame(@This(), c.BufferFormat);
    }
};

/// Buffer view description
pub const BufferViewDesc = extern struct {
    /// Object name
    name: ?[*:0]const u8 = null,

    /// View type. See Diligent::BUFFER_VIEW_TYPE for details.
    view_type: BufferViewType = .undefined,

    /// Format of the view. This member is only used for formatted and raw buffers.
    /// To create raw view of a raw buffer, set Format.ValueType member to VT_UNDEFINED
    /// (default value).
    format: BufferFormat = .{},

    /// Offset in bytes from the beginning of the buffer to the start of the
    /// buffer region referenced by the view.
    byte_offset: u64 = 0,

    /// Size in bytes of the referenced buffer region.
    byte_width: u64 = 0,

    comptime {
        helpers.ensureSame(@This(), c.BufferViewDesc);
    }
};

/// Texture view type
///
/// This enumeration describes allowed view types for a texture view. It is used by TextureViewDesc
/// structure.
pub const TextureViewType = enum(u8) {
    /// Undefined view type
    undefined,

    /// A texture view will define a shader resource view that will be used
    /// as the source for the shader read operations
    shader_resource,

    /// A texture view will define a render target view that will be used
    /// as the target for rendering operations
    render_target,

    /// A texture view will define a depth stencil view that will be used
    /// as the target for rendering operations
    depth_stencil,

    /// A texture view will define a read-only depth stencil view that will be used
    /// as depth stencil source for rendering operations, but can also be simultaneously
    /// read from shaders.
    read_only_depth_stencil,

    /// A texture view will define an unordered access view that will be used
    /// for unordered read/write operations from the shaders
    unordered_access,

    /// A texture view will define a variable shading rate view that will be used
    /// as the shading rate source for rendering operations
    shading_rate,
};

/// Describes allowed unordered access view mode
///
/// **Zig Usage:** Default value is equivalent to `UAV_ACCESS_UNSPECIFIED`.
pub const UAVAccessFlags = packed struct(u8) {
    /// Allow read operations on the UAV
    read: bool = false,

    /// Allow write operations on the UAV
    write: bool = false,

    _: u6 = 0,

    pub const read_write: UAVAccessFlags = .{ .read = true, .write = true };
};

/// Texture view flags
///
/// **Zig Usage:** Default value is equivalent to `TEXTURE_VIEW_FLAG_NONE`.
pub const TextureViewFlags = packed struct(u8) {
    /// Allow automatic mipmap generation for this view.
    /// This flag is only allowed for TEXTURE_VIEW_SHADER_RESOURCE view type.
    /// The texture must be created with MISC_TEXTURE_FLAG_GENERATE_MIPS flag.
    allow_mip_map_generation: bool = false,

    _: u7 = 0,
};

/// Texture component swizzle
pub const TextureComponentSwizzle = enum(u8) {
    /// Identity swizzle (e.g. `R->R`, `G->G`, `B->B`, `A->A`).
    identity,

    /// The component is set to zero.
    zero,

    /// The component is set to one.
    one,

    /// The component is set to the value of the red channel of the texture.
    red,

    /// The component is set to the value of the green channel of the texture.
    green,

    /// The component is set to the value of the blue channel of the texture.
    blue,

    /// The component is set to the value of the alpha channel of the texture.
    alpha,
};

/// Defines the per-channel texutre component mapping.
pub const TextureComponentMapping = extern struct {
    /// Defines the component placed in the red component of the output vector.
    r: TextureComponentSwizzle = .identity,
    /// Defines the component placed in the green component of the output vector.
    g: TextureComponentSwizzle = .identity,
    /// Defines the component placed in the blue component of the output vector.
    b: TextureComponentSwizzle = .identity,
    /// Defines the component placed in the alpha component of the output vector.
    a: TextureComponentSwizzle = .identity,

    comptime {
        helpers.ensureSame(@This(), c.TextureComponentMapping);
    }
};

/// Texture view description
pub const TextureViewDesc = extern struct {
    /// Describes the texture view type, see Diligent::TEXTURE_VIEW_TYPE for details.
    view_type: TextureViewType = .undefined,

    /// View interpretation of the original texture.
    ///
    /// For instance, one slice of a 2D texture array can be viewed as a 2D texture.
    /// See Diligent::RESOURCE_DIMENSION for a list of texture types.
    /// If default value Diligent::RESOURCE_DIM_UNDEFINED is provided,
    /// the view type will match the type of the referenced texture.
    texture_dim: ResourceDimension = .undefined,

    /// View format.
    ///
    /// If default value Diligent::TEX_FORMAT_UNKNOWN is provided,
    /// the view format will match the referenced texture format.
    format: TextureFormat = .unknown,

    /// Most detailed mip level to use
    most_detailed_mip: u32 = 0,

    /// Total number of mip levels for the view of the texture.
    ///
    /// Render target and depth stencil views can address only one mip level.
    /// If 0 is provided, then for a shader resource view all mip levels will be
    /// referenced, and for a render target or a depth stencil view, one mip level
    /// will be referenced.
    num_mip_levels: u32 = 0,

    first_array_or_depth_slice: extern union {
        /// For a texture array, first array slice to address in the view
        first_array_slice: u32,

        /// For a 3D texture, first depth slice to address the view
        first_depth_slice: u32,
    } = .{ .first_array_slice = 0 },

    num_array_or_depth_slices: extern union {
        /// For a texture array, number of array slices to address in the view.
        ///
        /// Set to 0 to address all array slices.
        num_array_slices: u32,
        /// For a 3D texture, number of depth slices to address in the view
        ///
        /// Set to 0 to address all depth slices.
        num_depth_slices: u32,
    } = .{ .num_array_slices = 0 },

    /// For an unordered access view, allowed access flags.
    ///
    /// See Diligent::UAV_ACCESS_FLAG for details.
    access_flags: UAVAccessFlags = .{},

    /// Texture view flags, see Diligent::TEXTURE_VIEW_FLAGS.
    flags: TextureViewFlags = .{},

    /// Texture component swizzle, see Diligent::TextureComponentMapping.
    swizzle: TextureComponentMapping,

    comptime {
        helpers.ensureSame(@This(), c.TextureViewDesc);
    }
};

/// Shader Macro
pub const ShaderMacro = extern struct {
    /// Macro name
    name: ?[*:0]const u8 = null,

    /// Macro definition
    definition: ?[*:0]const u8 = null,

    comptime {
        helpers.ensureSame(@This(), c.ShaderMacro);
    }
};

/// Shader macro array
pub const ShaderMacroArray = extern struct {
    /// A pointer to the array elements
    elements: ?[*]const ShaderMacro = null,

    /// The number of elements in the array
    count: u32 = 0,

    comptime {
        helpers.ensureSame(@This(), c.ShaderMacroArray);
    }
};

/// Shader description
pub const ShaderDesc = extern struct {
    /// Object name:
    name: ?[*:0]const u8 = null,

    /// Shader type. See Diligent::SHADER_TYPE.
    shader_type: ShaderType = .{},

    /// Whether to use combined texture samplers.
    ///
    /// If set to `true`, textures will be combined with texture samplers.
    /// The `CombinedSamplerSuffix` member defines the suffix added to the texture
    /// variable name to get corresponding sampler name. When using combined samplers,
    /// the sampler assigned to the shader resource view is automatically set when
    /// the view is bound. Otherwise, samplers need to be explicitly set similar to other
    /// shader variables.
    ///
    /// This member has no effect if the shader is used in the PSO that uses pipeline resource signature(s).
    use_combined_texture_samplers: bool = false,

    /// Combined sampler suffix.
    /// If `UseCombinedTextureSamplers` is `true`, defines the suffix added to the
    /// texture variable name to get corresponding sampler name.  For example,
    /// for default value `"_sampler"`, a texture named `"tex"` will be combined
    /// with the sampler named `"tex_sampler"`.
    /// If `UseCombinedTextureSamplers` is `false`, this member is ignored.
    ///
    /// This member has no effect if the shader is used in the PSO that uses pipeline resource signature(s).
    combined_sampler_suffix: [*:0]const u8 = "_sampler",

    comptime {
        helpers.ensureSame(@This(), c.ShaderDesc);
    }
};

/// Describes the shader source code language
pub const ShaderSourceLanguage = enum(u8) {
    /// Default language (GLSL for OpenGL/OpenGLES/Vulkan devices, HLSL for Direct3D11/Direct3D12 devices)
    default,

    /// The source language is HLSL
    hlsl,

    /// The source language is GLSL
    glsl,

    /// The source language is GLSL that should be compiled verbatim
    ///
    /// By default the engine prepends GLSL shader source code with platform-specific
    /// definitions. For instance it adds appropriate #version directive (e.g. `#version 430 core` or
    /// `#version 310 es`) so that the same source will work on different versions of desktop OpenGL and OpenGLES.
    /// When `SHADER_SOURCE_LANGUAGE_GLSL_VERBATIM` is used, the source code will be compiled as is.
    /// Note that shader macros are ignored when compiling GLSL verbatim in OpenGL backend, and an application
    /// should add the macro definitions to the source code.
    glsl_verbatim,

    /// The source language is Metal shading language (MSL)
    msl,

    /// The source language is Metal shading language (MSL) that should be compiled verbatim
    ///
    /// Note that shader macros are ignored when compiling MSL verbatim, and an application
    /// should add the macro definitions to the source code.
    msl_verbatim,

    /// The source language is Metal bytecode
    mtlb,

    /// The source language is WebGPU shading language (WGSL)
    wgsl,

    /// The shader source is provided as device-specific bytecode
    /// (e.g. DXBC or DXIL for Direct3D11/Direct3D12, SPIRV for Vulkan, etc.).
    /// The bytecode is used verbatim and no compilation is performed.
    ///
    /// This option is similar to providing the byte code via `ShaderCreateInfo::ByteCode`.
    bytecode,
};

/// Describes the shader compiler that will be used to compile the shader source code
pub const ShaderCompiler = enum(u32) {
    /// Default compiler for specific language and API that is selected as follows:
    ///
    ///     - Direct3D11:      legacy HLSL compiler (FXC)
    ///     - Direct3D12:      legacy HLSL compiler (FXC)
    ///     - OpenGL(ES) GLSL: native compiler
    ///     - OpenGL(ES) HLSL: HLSL2GLSL converter and native compiler
    ///     - Vulkan GLSL:     built-in glslang
    ///     - Vulkan HLSL:     built-in glslang (with limited support for Shader Model 6.x)
    ///     - Metal GLSL/HLSL: built-in glslang (HLSL with limited support for Shader Model 6.x)
    ///     - Metal MSL:       native compiler
    default,

    /// Built-in glslang compiler for GLSL and HLSL.
    glslang,

    /// Modern HLSL compiler (DXC) for Direct3D12 and Vulkan with Shader Model 6.x support.
    dxc,

    /// Legacy HLSL compiler (FXC) for Direct3D11 and Direct3D12 supporting shader models up to 5.1.
    fxc,
};

/// Shader compilation flags
///
/// **Zig usage:** Default value is equivalent to `SHADER_COMPILE_FLAG_NONE`
pub const ShaderCompileFlags = packed struct(u32) {
    /// Enable unbounded resource arrays (e.g. `Texture2D g_Texture[]`).
    enable_unbounded_arrays: bool = false,

    /// Don't load shader reflection.
    skip_reflection: bool = false,

    /// Compile the shader asynchronously.
    ///
    /// When this flag is set to true and if the devices supports
    /// AsyncShaderCompilation feature, the shader will be compiled
    /// asynchronously in the background. An application should use
    /// the IShader::GetStatus() method to check the shader status.
    /// If the device does not support asynchronous shader compilation,
    /// the flag is ignored and the shader is compiled synchronously.
    asynchronous: bool = false,

    /// Pack matrices in row-major order.
    ///
    /// By default, matrices are laid out in GPU memory in column-major order,
    /// which means that the first four values in a 4x4 matrix represent
    /// the first column, the next four values represent the second column,
    /// and so on.
    ///
    /// If this flag is set, matrices are packed in row-major order, i.e.
    /// they are laid out in memory row-by-row.
    pack_matrix_row_major: bool = false,

    /// Convert HLSL to GLSL when compiling HLSL shaders to SPIRV.
    ///
    /// HLSL shaders can be compiled to SPIRV directly using either DXC or glslang.
    /// While glslang supports most HLSL 5.1 features, some Vulkan-specific functionality
    /// is missing. Notably, glslang does not support UAV texture format annotations
    /// (see https://github.com/KhronosGroup/glslang/issues/3790), for example:
    /// ```hlsl
    /// [[vk::image_format("rgba8")]] RWTexture2D<float4> g_rwTexture;
    /// ```
    /// This flag provides a workaround by converting HLSL to GLSL before compiling it
    /// to SPIRV. The converter supports specially formatted comments to specify UAV
    /// texture formats:
    /// ```hlsl
    /// RWTexture2D<float4 /*format = rgba8*/> g_rwTexture;
    /// ```
    /// Another use case for this flag is to leverage GLSL-specific keywords in HLSL
    /// shaders, such as `gl_DrawID` for multi-draw or manually setting `gl_PointSize`.
    ///
    /// This flag only takes effect when compiling HLSL to SPIRV with glslang.
    /// Since DXC does not support GLSL, this flag is ignored when SHADER_COMPILER_DXC is used.
    hlsl_to_spirv_via_glsl: bool = false,

    _: u27 = 0,
};

/// Describes the shader optimization level.
pub const ShaderOptimizationLevel = enum(u8) {
    /// Default optimization level.
    ///
    /// Each backend uses its historical default optimization behavior.
    default,

    /// Optimization is explicitly disabled regardless of build configuration
    /// (DXC `-Od`, FXC `D3DCOMPILE_SKIP_OPTIMIZATION`, no SPIR-V performance pass).
    disabled,

    /// Optimization level 0 (DXC `-O0`, FXC optimization level 0, SPIR-V performance pass).
    level_0,

    /// Optimization level 1 (DXC `-O1`, FXC optimization level 1, SPIR-V performance pass).
    level_1,

    /// Optimization level 2 (DXC `-O2`, FXC optimization level 2, SPIR-V performance pass).
    level_2,

    /// Optimization level 3 (DXC `-O3`, FXC optimization level 3, SPIR-V performance pass).
    level_3,
};

pub const ShaderVersion = Version;
/// Shader creation attributes
pub const ShaderCreateInfo = extern struct {
    /// Source file path
    ///
    /// If source file path is provided, `Source` and `ByteCode` members must be null
    name: ?[*:0]const u8 = null,

    /// Pointer to the shader source input stream factory.
    ///
    /// The factory is used to load the shader source file if FilePath is not null.
    /// It is also used to create additional input streams for shader include files
    shader_source_stream_factory: ?*c.IShaderSourceInputStreamFactory = null,

    /// Shader source
    ///
    /// If shader source is provided, FilePath and ByteCode members must be null
    source: ?[*:0]const u8 = null,

    /// Compiled shader bytecode.
    ///
    /// If shader byte code is provided, FilePath and Source members must be null
    ///
    /// This option is supported for D3D11, D3D12, Vulkan and Metal backends.
    /// For D3D11 and D3D12 backends, DXBC should be provided.
    /// Vulkan backend expects SPIRV bytecode.
    /// Metal backend supports .metallib bytecode to create MTLLibrary
    /// or SPIRV to translate it to MSL and compile (may be slow).
    ///
    /// If SHADER_COMPILE_FLAG_SKIP_REFLECTION flag is not used, the bytecode
    /// must contain reflection information. If shaders were compiled
    /// using fxc, make sure that `/Qstrip_reflect` option is **not** specified.
    /// HLSL shaders need to be compiled against 4.0 profile or higher.
    byte_code: ?*const anyopaque = null,

    byte_code_size_or_source_length: extern union {
        /// Length of the source code, when `Source` is not null.
        /// When Source is not null and is not a null-terminated string, this member
        /// should be used to specify the length of the source code.
        /// If `SourceLength` is zero, the source code string is assumed to be
        /// null-terminated.
        source_length: usize,

        /// Size of the compiled shader byte code, when `ByteCode` is not null.
        /// Byte code size (in bytes) must not be zero if `ByteCode` is not null.
        byte_code_size: usize,
    } = .{ .source_length = 0 },

    /// Shader entry point
    /// This member is ignored if ByteCode is not null
    entry_point: [*:0]const u8 = "main",

    /// Shader macros (see Diligent::ShaderMacroArray)
    macros: ShaderMacroArray = .{},

    /// Shader description. See Diligent::ShaderDesc.
    desc: ShaderDesc,

    /// Shader source language. See Diligent::SHADER_SOURCE_LANGUAGE.
    source_language: ShaderSourceLanguage = .default,

    /// Shader compiler. See Diligent::SHADER_COMPILER.
    shader_compiler: ShaderCompiler = .default,

    /// HLSL shader model to use when compiling the shader.
    /// When default value is given (0, 0), the engine will attempt to use the highest HLSL shader model
    /// supported by the device. If the shader is created from the byte code, this value
    /// has no effect.
    ///
    /// \note When HLSL source is converted to GLSL, corresponding GLSL/GLESSL version will be used.
    hlsl_version: ShaderVersion = .{},

    /// GLSL version to use when creating the shader.
    /// When default value is given (0, 0), the engine will attempt to use the highest GLSL version
    /// supported by the device.
    glsl_version: ShaderVersion = .{},

    /// GLES shading language version to use when creating the shader.
    /// When default value is given (0, 0), the engine will attempt to use the highest GLESSL version
    /// supported by the device.
    glessl_version: ShaderVersion = .{},

    /// Metal shading language version to use when creating the shader.
    /// When default value is given (0, 0), the engine will attempt to use the highest MSL version
    /// supported by the device.
    msl_version: ShaderVersion = .{},

    /// Shader compile flags (see Diligent::SHADER_COMPILE_FLAGS).
    compile_flags: ShaderCompileFlags = .{},

    /// Shader optimization level. See Diligent::SHADER_OPTIMIZATION_LEVEL.
    shader_optimization_level: ShaderOptimizationLevel = .default,

    /// Whether to load constant buffer reflection information.
    /// The reflection information can be queried through
    /// IShader::GetConstantBufferDesc() method.
    /// **Note:** Loading constant buffer reflection introduces some overhead,
    /// and should be disabled when it is not needed.
    load_constant_buffer_reflection: bool = false,

    /// An optional list of GLSL extensions to enable when compiling GLSL source code.
    glsl_extension: ?[*:0]const u8 = null,

    /// Emulated array index suffix for WebGPU backend.
    ///
    /// An optional suffix to append to the name of emulated array variables to get
    /// the indexed array element name.
    ///
    /// Since WebGPU does not support arrays of resources, Diligent Engine
    /// emulates them by appending an index to the resource name.
    /// For instance, if the suffix is set to `"_"`, resources named
    /// `"g_Tex2D_0"`, `"g_Tex2D_1"`, `"g_Tex2D_2"` will be grouped into an array
    /// of 3 textures named `"g_Tex2D"`. All resources must be the same type
    /// to be grouped into an array.
    ///
    /// When suffix is null or empty, no array emulation is performed.
    ///
    /// \remarks    This member is ignored when compiling shaders for backends other than WebGPU.
    webgpu_emulated_array_index_suffix: ?[*:0]const u8 = null,

    comptime {
        helpers.ensureSame(@This(), c.ShaderCreateInfo);
    }
};
