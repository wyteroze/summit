// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const helpers = @import("../helpers.zig");
const std = @import("std");

/// Device context interface.
///
/// **Remarks:** The device context keeps strong references to all objects currently bound to
/// the pipeline: buffers, states, samplers, shaders, etc. The context also keeps strong references
/// to the device and the swap chain.
const DeviceContext = @This();
raw: *c.IDeviceContext,

/// Returns the context description.
pub fn getDesc(self: *const DeviceContext) *const graphics.types.DeviceContextDesc {
    return @ptrCast(self.method("GetDesc")(self.raw));
}

/// Begins recording commands in the deferred context.
///
/// This method must be called before any command in the deferred context may be recorded.
///
/// `immediate_context_id` - The ID of the immediate context where commands from this deferred
/// context will be executed, see `Diligent::DeviceContextDesc::ContextId`.
///
/// **Warning:** A command list recorded by the context must not be submitted to any immediate
/// context other than the one identified by `immediate_context_id`.
pub fn begin(self: *DeviceContext, immediate_context_id: u32) void {
    self.method("Begin")(self.raw, immediate_context_id);
}

/// Sets the pipeline state.
///
/// `pipeline_state` - Pipeline state to bind to the context.
///
/// **Remarks:** Supported contexts for graphics and mesh pipelines: graphics.
/// Supported contexts for compute and ray tracing pipelines: graphics and compute.
pub fn setPipelineState(self: *DeviceContext, pipeline_state: graphics.PipelineState) void {
    self.method("SetPipelineState")(self.raw, pipeline_state.raw);
}

/// Transitions shader resources to the states required by a Draw or Dispatch command.
///
/// `shader_resource_binding` - Shader resource binding whose resources will be transitioned.
///
/// Explicitly transitions all resources except those in unknown state. If this method is called,
/// there is no need to use `RESOURCE_STATE_TRANSITION_MODE_TRANSITION` in `commitShaderResources()`.
///
/// **Remarks:** Resource state transitioning is **not thread-safe**. If the application intends to
/// use the same resources in other threads simultaneously, it needs to manage the states explicitly
/// using `transitionResourceStates()`.
pub fn transitionShaderResources(self: *DeviceContext, shader_resource_binding: graphics.ShaderResourceBinding) void {
    self.method("TransitionShaderResources")(self.raw, shader_resource_binding.raw);
}

/// Commits shader resources to the device context.
///
/// `shader_resource_binding` - Shader resource binding whose resources will be committed. May be
/// `null` if the pipeline state contains no shader resources.
/// `state_transition_mode` - State transition mode.
///
/// - `RESOURCE_STATE_TRANSITION_MODE_TRANSITION` transitions all shader resources to the states
///   required by the next draw or dispatch command.
/// - `RESOURCE_STATE_TRANSITION_MODE_VERIFY` reads resource states and verifies them. Only has
///   effect in debug and development builds.
/// - `RESOURCE_STATE_TRANSITION_MODE_NONE` does not access resource states.
///
/// **Remarks:** Automatic resource state transitioning is not thread-safe. If an application changes
/// the state of any resource after it has been committed, it must transition that resource back to
/// the correct state before the next draw or dispatch command.
pub fn commitShaderResources(
    self: *DeviceContext,
    shader_resource_binding: ?graphics.ShaderResourceBinding,
    state_transition_mode: graphics.types.ResourceStateTransitionMode,
) void {
    self.method("CommitShaderResources")(
        self.raw,
        if (shader_resource_binding) |srb| srb.raw else null,
        @backingInt(state_transition_mode),
    );
}

/// Sets the stencil reference value.
///
/// `stencil_ref` - Stencil reference value.
///
/// **Remarks:** Supported contexts: graphics.
pub fn setStencilRef(self: *DeviceContext, stencil_ref: u32) void {
    self.method("SetStencilRef")(self.raw, stencil_ref);
}

/// Sets the blend factors for alpha blending.
///
/// `blend_factors` - Four blend factors, one for each RGBA component. Used when the blend state
/// uses `BLEND_FACTOR_BLEND_FACTOR` or `BLEND_FACTOR_INV_BLEND_FACTOR`. If `null`, the default
/// `{1, 1, 1, 1}` is used.
///
/// **Remarks:** Supported contexts: graphics.
pub fn setBlendFactors(self: *DeviceContext, blend_factors: ?*const [4]f32) void {
    self.method("SetBlendFactors")(self.raw, if (blend_factors) |f| &f[0] else null);
}

/// Binds vertex buffers to the pipeline.
///
/// `start_slot` - The first input slot for binding. The first buffer is bound to this slot, each
/// additional buffer to the next subsequent slot.
/// `buffers` - Vertex buffers to bind. They must have been created with `BIND_VERTEX_BUFFER`.
/// `offsets` - Optional byte offsets, one per buffer, from the beginning of each buffer to the first
/// element to use. If `null`, zero offsets are used. Must have the same length as `buffers`.
/// `state_transition_mode` - State transition mode for the buffers being set.
/// `flags` - Additional flags, see `SET_VERTEX_BUFFERS_FLAGS`. Pass `SET_VERTEX_BUFFERS_FLAG_RESET`
/// whenever possible, so that no buffers from previous draw calls remain bound.
///
/// The device context keeps strong references to all bound vertex buffers, so a buffer cannot be
/// released until it is unbound from the context.
///
/// **Remarks:** When `state_transition_mode` is `RESOURCE_STATE_TRANSITION_MODE_TRANSITION`, all buffers
/// in known states are transitioned to `RESOURCE_STATE_VERTEX_BUFFER`. Resource state transitioning is
/// **not thread-safe**. Supported contexts: graphics.
pub fn setVertexBuffers(
    self: *DeviceContext,
    start_slot: u32,
    buffers: []const graphics.Buffer,
    offsets: ?[]const u64,
    state_transition_mode: graphics.types.ResourceStateTransitionMode,
    flags: graphics.types.SetVertexBuffersFlags,
) void {
    if (offsets) |o| std.debug.assert(o.len == buffers.len);
    self.method("SetVertexBuffers")(
        self.raw,
        start_slot,
        @intCast(buffers.len),
        @ptrCast(buffers.ptr),
        if (offsets) |o| o.ptr else null,
        @backingInt(state_transition_mode),
        @bitCast(flags),
    );
}

/// Invalidates the cached context state.
///
/// An application should call this method to invalidate the internal cached states.
pub fn invalidateState(self: *DeviceContext) void {
    self.method("InvalidateState")(self.raw);
}

/// Binds an index buffer to the pipeline.
///
/// `index_buffer` - Index buffer to bind. It must have been created with `BIND_INDEX_BUFFER`.
/// `byte_offset` - Offset from the beginning of the buffer to the start of the index data.
/// `state_transition_mode` - State transition mode for the index buffer.
///
/// The device context keeps a strong reference to the index buffer until it is unbound.
///
/// **Remarks:** When `state_transition_mode` is `RESOURCE_STATE_TRANSITION_MODE_TRANSITION`, the buffer
/// is transitioned to `RESOURCE_STATE_INDEX_BUFFER` if its state is not unknown. Resource state
/// transitioning is **not thread-safe**. Supported contexts: graphics.
pub fn setIndexBuffer(
    self: *DeviceContext,
    index_buffer: graphics.Buffer,
    byte_offset: u64,
    state_transition_mode: graphics.types.ResourceStateTransitionMode,
) void {
    self.method("SetIndexBuffer")(self.raw, index_buffer.raw, byte_offset, @backingInt(state_transition_mode));
}

/// Sets an array of viewports.
///
/// `viewports` - Viewports to bind. All viewports are set atomically; any viewports not defined by
/// the call are disabled.
/// `rt_width` - Render target width. If 0, the width of the currently bound render target is used.
/// `rt_height` - Render target height. If 0, the height of the currently bound render target is used.
///
/// DirectX uses a left-top window origin with Y pointing down, while OpenGL uses a left-bottom origin
/// with Y pointing up. The render target size is required to convert viewports to the OpenGL system.
///
/// **Remarks:** Supported contexts: graphics.
pub fn setViewports(
    self: *DeviceContext,
    viewports: []const graphics.types.Viewport,
    rt_width: u32,
    rt_height: u32,
) void {
    self.method("SetViewports")(self.raw, @intCast(viewports.len), @ptrCast(viewports.ptr), rt_width, rt_height);
}

/// Sets active scissor rects.
///
/// `rects` - Scissor rectangles to bind. All rects are set atomically; any rects not defined by the
/// call are disabled.
/// `rt_width` - Render target width. If 0, the width of the currently bound render target is used.
/// `rt_height` - Render target height. If 0, the height of the currently bound render target is used.
///
/// **Remarks:** DirectX and OpenGL use different window coordinate systems, see `setViewports()`.
/// Supported contexts: graphics.
pub fn setScissorRects(
    self: *DeviceContext,
    rects: []const graphics.types.Rect,
    rt_width: u32,
    rt_height: u32,
) void {
    self.method("SetScissorRects")(self.raw, @intCast(rects.len), @ptrCast(rects.ptr), rt_width, rt_height);
}

/// Binds one or more render targets and the depth-stencil buffer to the context. Also sets the
/// viewport to match the first non-null render target or depth-stencil buffer.
///
/// `render_targets` - Render target views to bind. Each must be `TEXTURE_VIEW_RENDER_TARGET`.
/// Render targets not defined by this call are set to `null`.
/// `depth_stencil` - Optional depth-stencil view, `TEXTURE_VIEW_DEPTH_STENCIL` or
/// `TEXTURE_VIEW_READ_ONLY_DEPTH_STENCIL`.
/// `state_transition_mode` - State transition mode of the render targets and depth-stencil buffer.
///
/// The device context keeps strong references to all bound views, so they cannot be released until
/// they are unbound.
///
/// **Remarks:** When `state_transition_mode` is `RESOURCE_STATE_TRANSITION_MODE_TRANSITION`, render targets
/// are transitioned to `RESOURCE_STATE_RENDER_TARGET` and the depth-stencil buffer to
/// `RESOURCE_STATE_DEPTH_WRITE`. Resource state transitioning is **not thread-safe**.
/// Calling with an empty `render_targets` and a `null` `depth_stencil`, using `RESOURCE_STATE_TRANSITION_MODE_NONE`,
/// explicitly ends the current render pass. Supported contexts: graphics.
pub fn setRenderTargets(
    self: *DeviceContext,
    render_targets: []const graphics.TextureView,
    depth_stencil: ?graphics.TextureView,
    state_transition_mode: graphics.types.ResourceStateTransitionMode,
) void {
    self.method("SetRenderTargets")(
        self.raw,
        @intCast(render_targets.len),
        @ptrCast(@constCast(render_targets.ptr)),
        if (depth_stencil) |ds| ds.raw else null,
        @backingInt(state_transition_mode),
    );
}

/// Binds one or more render targets, the depth-stencil buffer and the shading rate map to the context.
/// Also sets the viewport to match the first non-null render target or depth-stencil buffer.
///
/// `attribs` - Command attributes, see `Diligent::SetRenderTargetsAttribs`.
///
/// The device context keeps strong references to all bound views and the shading rate map. Render
/// targets not defined by this call are set to `null`.
///
/// **Remarks:** Supported contexts: graphics.
pub fn setRenderTargetsExt(self: *DeviceContext, attribs: *const graphics.types.SetRenderTargetsAttribs) void {
    self.method("SetRenderTargetsExt")(self.raw, @ptrCast(attribs));
}

/// Begins a new render pass.
///
/// `attribs` - Command attributes, see `Diligent::BeginRenderPassAttribs`.
///
/// **Remarks:** Supported contexts: graphics.
pub fn beginRenderPass(self: *DeviceContext, attribs: *const graphics.types.BeginRenderPassAttribs) void {
    self.method("BeginRenderPass")(self.raw, @ptrCast(attribs));
}

/// Transitions to the next subpass in the render pass instance.
///
/// **Remarks:** Supported contexts: graphics.
pub fn nextSubpass(self: *DeviceContext) void {
    self.method("NextSubpass")(self.raw);
}

/// Ends the current render pass.
///
/// **Remarks:** Supported contexts: graphics.
pub fn endRenderPass(self: *DeviceContext) void {
    self.method("EndRenderPass")(self.raw);
}

/// Executes a draw command.
///
/// `attribs` - Draw command attributes, see `Diligent::DrawAttribs`.
///
/// If `DRAW_FLAG_VERIFY_STATES` is set, the method reads the state of vertex buffers, so no other
/// thread may alter the states of the same resources. Reading is safe.
///
/// **Remarks:** Supported contexts: graphics.
pub fn draw(self: *DeviceContext, attribs: *const graphics.types.DrawAttribs) void {
    self.method("Draw")(self.raw, @ptrCast(attribs));
}

/// Executes an indexed draw command.
///
/// `attribs` - Draw command attributes, see `Diligent::DrawIndexedAttribs`.
///
/// If `DRAW_FLAG_VERIFY_STATES` is set, the method reads the state of vertex and index buffers.
///
/// **Remarks:** Supported contexts: graphics.
pub fn drawIndexed(self: *DeviceContext, attribs: *const graphics.types.DrawIndexedAttribs) void {
    self.method("DrawIndexed")(self.raw, @ptrCast(attribs));
}

/// Executes an indirect draw command.
///
/// `attribs` - Command attributes, see `Diligent::DrawIndirectAttribs`.
///
/// Arguments for command N are read at `DrawArgsOffset + N * DrawArgsStride`. When a counter buffer is
/// set, the number of commands is `min(CountBuffer[CounterOffset], DrawCount)`.
///
/// **Remarks:** If the attribs or counter buffer state transition mode is
/// `RESOURCE_STATE_TRANSITION_MODE_TRANSITION`, the buffer states may be changed, which is **not
/// thread-safe**. Supported contexts: graphics.
pub fn drawIndirect(self: *DeviceContext, attribs: *const graphics.types.DrawIndirectAttribs) void {
    self.method("DrawIndirect")(self.raw, @ptrCast(attribs));
}

/// Executes an indexed indirect draw command.
///
/// `attribs` - Command attributes, see `Diligent::DrawIndexedIndirectAttribs`.
///
/// Arguments for command N are read at `DrawArgsOffset + N * DrawArgsStride`. When a counter buffer is
/// set, the number of commands is `min(CountBuffer[CounterOffset], DrawCount)`.
///
/// **Remarks:** In the OpenGL backend, the index buffer offset set by `setIndexBuffer()` cannot be
/// applied to indirect draws and must be zero. Supported contexts: graphics.
pub fn drawIndexedIndirect(self: *DeviceContext, attribs: *const graphics.types.DrawIndexedIndirectAttribs) void {
    self.method("DrawIndexedIndirect")(self.raw, @ptrCast(attribs));
}

/// Executes a mesh draw command.
///
/// `attribs` - Draw command attributes, see `Diligent::DrawMeshAttribs`.
///
/// **Remarks:** Only a single work group dimension is used for compatibility between Direct3D12 and
/// Vulkan. In the shader, `numthreads` and `local_size` must define only the first dimension.
/// Supported contexts: graphics.
pub fn drawMesh(self: *DeviceContext, attribs: *const graphics.types.DrawMeshAttribs) void {
    self.method("DrawMesh")(self.raw, @ptrCast(attribs));
}

/// Executes an indirect mesh draw command.
///
/// `attribs` - Command attributes, see `Diligent::DrawMeshIndirectAttribs`.
///
/// **Remarks:** If the attribs buffer transition mode is `RESOURCE_STATE_TRANSITION_MODE_TRANSITION`, its
/// state may be changed, which is **not thread-safe**. Supported contexts: graphics.
pub fn drawMeshIndirect(self: *DeviceContext, attribs: *const graphics.types.DrawMeshIndirectAttribs) void {
    self.method("DrawMeshIndirect")(self.raw, @ptrCast(attribs));
}

/// Executes a multi-draw command.
///
/// `attribs` - Command attributes, see `Diligent::MultiDrawAttribs`.
///
/// If the device does not support `NativeMultiDraw`, the method emulates it with individual draw
/// commands. The draw command index is only available in the shader when `NativeMultiDraw` is supported.
///
/// **Remarks:** Supported contexts: graphics.
pub fn multiDraw(self: *DeviceContext, attribs: *const graphics.types.MultiDrawAttribs) void {
    self.method("MultiDraw")(self.raw, @ptrCast(attribs));
}

/// Executes an indexed multi-draw command.
///
/// `attribs` - Command attributes, see `Diligent::MultiDrawIndexedAttribs`.
///
/// If the device does not support `NativeMultiDraw`, the method emulates it with individual draw
/// commands. The draw command index is only available in the shader when `NativeMultiDraw` is supported.
///
/// **Remarks:** Supported contexts: graphics.
pub fn multiDrawIndexed(self: *DeviceContext, attribs: *const graphics.types.MultiDrawIndexedAttribs) void {
    self.method("MultiDrawIndexed")(self.raw, @ptrCast(attribs));
}

/// Executes a dispatch compute command.
///
/// `attribs` - Dispatch command attributes, see `Diligent::DispatchComputeAttribs`.
///
/// In Metal, the compute group sizes are defined by the dispatch command. With MSL shaders, the group
/// size must be provided through the `MtlThreadGroupSize*` members.
///
/// **Remarks:** Supported contexts: graphics, compute.
pub fn dispatchCompute(self: *DeviceContext, attribs: *const graphics.types.DispatchComputeAttribs) void {
    self.method("DispatchCompute")(self.raw, @ptrCast(attribs));
}

/// Executes an indirect dispatch compute command.
///
/// `attribs` - Command attributes, see `Diligent::DispatchComputeIndirectAttribs`.
///
/// **Remarks:** If the attribs buffer transition mode is `RESOURCE_STATE_TRANSITION_MODE_TRANSITION`, its
/// state may be changed, which is **not thread-safe**. Supported contexts: graphics, compute.
pub fn dispatchComputeIndirect(self: *DeviceContext, attribs: *const graphics.types.DispatchComputeIndirectAttribs) void {
    self.method("DispatchComputeIndirect")(self.raw, @ptrCast(attribs));
}

/// Executes a dispatch tile command.
///
/// `attribs` - Command attributes, see `Diligent::DispatchTileAttribs`. The thread counts must not
/// exceed the tile size returned by `getTileSize()`.
pub fn dispatchTile(self: *DeviceContext, attribs: *const graphics.types.DispatchTileAttribs) void {
    self.method("DispatchTile")(self.raw, @ptrCast(attribs));
}

/// Returns the current render pass tile size.
///
/// Returns `x` and `y`, the tile size in each direction. The result is zero if there is no active
/// render pass or render targets.
pub fn getTileSize(self: *DeviceContext) struct { x: u32, y: u32 } {
    var tile_size_x: u32 = 0;
    var tile_size_y: u32 = 0;
    self.method("GetTileSize")(self.raw, &tile_size_x, &tile_size_y);
    return .{ .x = tile_size_x, .y = tile_size_y };
}

/// Clears a depth-stencil view.
///
/// `view` - Depth-stencil view to clear. Must be `TEXTURE_VIEW_DEPTH_STENCIL`.
/// `clear_flags` - Which parts of the buffer to clear, see `CLEAR_DEPTH_STENCIL_FLAGS`.
/// `depth` - Value to clear the depth part of the view with.
/// `stencil` - Value to clear the stencil part of the view with.
/// `state_transition_mode` - State transition mode of the depth-stencil buffer.
///
/// The full extent of the view is always cleared. Viewport and scissor settings are not applied.
///
/// **Note:** The depth-stencil view must be bound to the pipeline for the clear to be performed.
///
/// **Remarks:** Resource state transitioning is **not thread-safe**. Supported contexts: graphics.
pub fn clearDepthStencil(
    self: *DeviceContext,
    view: graphics.TextureView,
    clear_flags: graphics.types.ClearDepthStencilFlags,
    depth: f32,
    stencil: u8,
    state_transition_mode: graphics.types.ResourceStateTransitionMode,
) void {
    self.method("ClearDepthStencil")(
        self.raw,
        view.raw,
        @bitCast(clear_flags),
        depth,
        stencil,
        @backingInt(state_transition_mode),
    );
}

/// Clears a render target view.
///
/// `view` - Render target view to clear. Must be `TEXTURE_VIEW_RENDER_TARGET`.
/// `rgba` - Four components of the clear color. The element type depends on the view format: `f32`
/// for floating point formats, `u32` for unsigned integer formats and `i32` for signed integer formats.
/// If `null`, `{0, 0, 0, 0}` is used.
/// `state_transition_mode` - State transition mode of the texture.
///
/// The full extent of the view is always cleared. Viewport and scissor settings are not applied.
///
/// **Note:** In the OpenGL backend the render target view must be bound to the pipeline for the clear.
///
/// **Remarks:** Resource state transitioning is not thread-safe. Supported contexts: graphics.
pub fn clearRenderTarget(
    self: *DeviceContext,
    view: graphics.TextureView,
    rgba: ?*const anyopaque,
    state_transition_mode: graphics.types.ResourceStateTransitionMode,
) void {
    self.method("ClearRenderTarget")(self.raw, view.raw, rgba, @backingInt(state_transition_mode));
}

/// Finishes recording commands and generates a command list.
///
/// Returns the recorded command list. Fails if the command list could not be created.
pub fn finishCommandList(self: *DeviceContext) !graphics.CommandList {
    var list: [*c]c.ICommandList = null;
    self.method("FinishCommandList")(self.raw, &list);
    if (list == null) return error.CommandListCreationFailed;
    return .{ .raw = list.? };
}

/// Submits an array of recorded command lists for execution.
///
/// `command_lists` - Command lists to execute.
///
/// **Remarks:** After a command list is executed, it is no longer valid and must be released.
pub fn executeCommandLists(self: *DeviceContext, command_lists: []const graphics.CommandList) void {
    self.method("ExecuteCommandLists")(self.raw, @intCast(command_lists.len), @ptrCast(command_lists.ptr));
}

/// Tells the GPU to set a fence to a specified value after all previous work has completed.
///
/// `fence` - The fence to signal.
/// `value` - The value to set the fence to. Must be greater than the previously signaled value on the
/// same fence.
///
/// **Note:** The method does not flush the context, and the fence is signaled only when the context is
/// flushed next time. If an application waits for the fence in a loop, it must flush the context after
/// signaling it.
///
/// **Remarks:** In Direct3D11 the access to the fence is not thread-safe and must be externally
/// synchronized. In Direct3D12 and Vulkan it is thread-safe.
pub fn enqueueSignal(self: *DeviceContext, fence: graphics.Fence, value: u64) void {
    self.method("EnqueueSignal")(self.raw, fence.raw, value);
}

/// Waits until the specified fence reaches or exceeds the specified value, on the device.
///
/// `fence` - The fence to wait on. Must be created with `FENCE_TYPE_GENERAL`.
/// `value` - The value the context waits for the fence to reach.
///
/// If the `NativeFence` feature is not enabled, `value` must be less than or equal to the last signaled
/// or pending value. Waiting for a value greater than any pending value deadlocks. If `NativeFence` is
/// enabled, such a wait causes a GPU stall instead.
///
/// **Remarks:** Only allowed for immediate contexts.
pub fn deviceWaitForFence(self: *DeviceContext, fence: graphics.Fence, value: u64) void {
    self.method("DeviceWaitForFence")(self.raw, fence.raw, value);
}

/// Submits all outstanding commands for execution to the GPU and waits until they are complete.
///
/// **Note:** The method blocks the calling thread until the wait is complete. It implicitly flushes the
/// context, so an application must reset the PSO and rebind all shader resources after idling.
///
/// **Remarks:** Only immediate contexts can be idled.
pub fn waitForIdle(self: *DeviceContext) void {
    self.method("WaitForIdle")(self.raw);
}

/// Marks the beginning of a query.
///
/// `query` - The query object.
///
/// Vulkan requires that a query either begins and ends inside the same subpass of a render pass, or
/// begins and ends outside any render pass. In the latter case the engine ends the render pass
/// automatically when needed.
///
/// **Warning:** OpenGL and Vulkan do not support nested queries of the same type.
///
/// **Note:** On some devices, queries for a single draw or dispatch may not be supported. The query then
/// begins at the next available moment.
///
/// **Remarks:** Supported contexts for graphics queries: graphics. Supported contexts for time queries:
/// graphics, compute. Only immediate contexts can begin a query.
pub fn beginQuery(self: *DeviceContext, query: graphics.Query) void {
    self.method("BeginQuery")(self.raw, query.raw);
}

/// Marks the end of a query.
///
/// `query` - The query object. Must be ended by the same context that began it.
///
/// In Direct3D12 and Vulkan, queries other than timestamp queries cannot span command list boundaries.
/// It is an error to explicitly flush the context while a query is active. All queries must be ended
/// when `finishFrame()` is called.
///
/// **Remarks:** Supported contexts: graphics, compute.
pub fn endQuery(self: *DeviceContext, query: graphics.Query) void {
    self.method("EndQuery")(self.raw, query.raw);
}

/// Submits all pending commands in the context for execution to the command queue.
///
/// Internally resets the state of the current command list. When the next draw command is issued, the
/// engine restores all states except the pipeline state and shader resource bindings. The application
/// must explicitly reset the PSO and bind all required shader resources after flushing.
///
/// **Remarks:** Only immediate contexts can be flushed.
pub fn flush(self: *DeviceContext) void {
    self.method("Flush")(self.raw);
}

/// Updates the data in the buffer.
///
/// `buffer` - The buffer to update.
/// `offset` - Offset in bytes from the beginning of the buffer to the update region.
/// `data` - The data to write to the buffer. Its length is the size in bytes of the region to update.
/// `state_transition_mode` - Buffer state transition mode.
///
/// **Remarks:** Supported contexts: graphics, compute, transfer.
pub fn updateBuffer(
    self: *DeviceContext,
    buffer: graphics.Buffer,
    offset: u64,
    data: []const u8,
    state_transition_mode: graphics.types.ResourceStateTransitionMode,
) void {
    self.method("UpdateBuffer")(
        self.raw,
        buffer.raw,
        offset,
        @intCast(data.len),
        @ptrCast(data.ptr),
        @backingInt(state_transition_mode),
    );
}

/// Copies the data from one buffer to another.
///
/// `src_buffer` - Source buffer to copy data from.
/// `src_offset` - Offset in bytes from the beginning of the source buffer to the start of the data to copy.
/// `src_buffer_transition_mode` - State transition mode of the source buffer.
/// `dst_buffer` - Destination buffer to copy data to.
/// `dst_offset` - Offset in bytes from the beginning of the destination buffer to the destination region.
/// `size` - Size in bytes of the data to copy.
/// `dst_buffer_transition_mode` - State transition mode of the destination buffer.
///
/// **Remarks:** Supported contexts: graphics, compute, transfer.
pub fn copyBuffer(
    self: *DeviceContext,
    src_buffer: graphics.Buffer,
    src_offset: u64,
    src_buffer_transition_mode: graphics.types.ResourceStateTransitionMode,
    dst_buffer: graphics.Buffer,
    dst_offset: u64,
    size: u64,
    dst_buffer_transition_mode: graphics.types.ResourceStateTransitionMode,
) void {
    self.method("CopyBuffer")(
        self.raw,
        src_buffer.raw,
        src_offset,
        @backingInt(src_buffer_transition_mode),
        dst_buffer.raw,
        dst_offset,
        size,
        @backingInt(dst_buffer_transition_mode),
    );
}

/// Maps the buffer.
///
/// `buffer` - The buffer to map.
/// `map_type` - Type of the map operation, see `MAP_TYPE`.
/// `map_flags` - Special map flags, see `MAP_FLAGS`.
///
/// Returns the address of the mapped region.
///
/// **Remarks:** Supported contexts: graphics, compute, transfer.
pub fn mapBuffer(
    self: *DeviceContext,
    buffer: graphics.Buffer,
    map_type: graphics.types.MapType,
    map_flags: graphics.types.MapFlags,
) ?*anyopaque {
    var mapped: ?*anyopaque = null;
    self.method("MapBuffer")(self.raw, buffer.raw, @backingInt(map_type), @bitCast(map_flags), &mapped);
    return mapped;
}

/// Unmaps the previously mapped buffer.
///
/// `buffer` - The buffer to unmap.
/// `map_type` - Must match the type that was provided to `mapBuffer()`.
///
/// **Remarks:** Supported contexts: graphics, compute, transfer.
pub fn unmapBuffer(self: *DeviceContext, buffer: graphics.Buffer, map_type: graphics.types.MapType) void {
    self.method("UnmapBuffer")(self.raw, buffer.raw, @backingInt(map_type));
}

/// Updates the data in the texture.
///
/// `texture` - The texture to update.
/// `mip_level` - Mip level of the texture subresource to update.
/// `slice` - Array slice. Should be 0 for non-array textures.
/// `dst_box` - Destination region on the texture to update.
/// `subres_data` - Source data to copy to the texture.
/// `src_buffer_transition_mode` - If `subres_data.pSrcBuffer` is not null, the state transition mode of
/// the source buffer. Otherwise ignored.
/// `texture_transition_mode` - Texture state transition mode.
///
/// **Remarks:** Supported contexts: graphics, compute, transfer.
pub fn updateTexture(
    self: *DeviceContext,
    texture: graphics.Texture,
    mip_level: u32,
    slice: u32,
    dst_box: *const graphics.types.Box,
    subres_data: *const graphics.types.TextureSubResData,
    src_buffer_transition_mode: graphics.types.ResourceStateTransitionMode,
    texture_transition_mode: graphics.types.ResourceStateTransitionMode,
) void {
    self.method("UpdateTexture")(
        self.raw,
        texture.raw,
        mip_level,
        slice,
        @ptrCast(dst_box),
        @ptrCast(subres_data),
        @backingInt(src_buffer_transition_mode),
        @backingInt(texture_transition_mode),
    );
}

/// Copies data from one texture to another.
///
/// `copy_attribs` - Copy command attributes, see `Diligent::CopyTextureAttribs`.
///
/// **Remarks:** Supported contexts: graphics, compute, transfer.
pub fn copyTexture(self: *DeviceContext, copy_attribs: *const graphics.types.CopyTextureAttribs) void {
    self.method("CopyTexture")(self.raw, @ptrCast(copy_attribs));
}

/// Maps the texture subresource.
///
/// `texture` - The texture to map.
/// `mip_level` - Mip level to map.
/// `array_slice` - Array slice to map. Must be 0 for non-array textures.
/// `map_type` - Type of the map operation, see `MAP_TYPE`.
/// `map_flags` - Special map flags, see `MAP_FLAGS`.
/// `map_region` - Optional texture region to map. If `null`, the entire subresource is mapped.
///
/// Returns the mapped texture region data.
///
/// **Remarks:** Supported in the D3D11, D3D12 and Vulkan backends. In D3D11 only the entire subresource
/// can be mapped, so `map_region` must be `null` or cover the entire subresource. In D3D11 and Vulkan,
/// dynamic textures behave the same as non-dynamic ones, and `MAP_FLAG_DISCARD` has no extra effect.
/// Supported contexts: graphics, compute, transfer.
pub fn mapTextureSubresource(
    self: *DeviceContext,
    texture: graphics.Texture,
    mip_level: u32,
    array_slice: u32,
    map_type: graphics.types.MapType,
    map_flags: graphics.types.MapFlags,
    map_region: ?*const graphics.types.Box,
) graphics.types.MappedTextureSubresource {
    var mapped: graphics.types.MappedTextureSubresource = .{};
    self.method("MapTextureSubresource")(
        self.raw,
        texture.raw,
        mip_level,
        array_slice,
        @backingInt(map_type),
        @bitCast(map_flags),
        if (map_region) |region| @ptrCast(region) else null,
        @ptrCast(&mapped),
    );
    return mapped;
}

/// Unmaps the texture subresource.
///
/// `texture` - The texture to unmap.
/// `mip_level` - Mip level to unmap.
/// `array_slice` - Array slice to unmap. Must be 0 for non-array textures.
///
/// **Remarks:** Supported contexts: graphics, compute, transfer.
pub fn unmapTextureSubresource(self: *DeviceContext, texture: graphics.Texture, mip_level: u32, array_slice: u32) void {
    self.method("UnmapTextureSubresource")(self.raw, texture.raw, mip_level, array_slice);
}

/// Generates a mipmap chain.
///
/// `texture_view` - Texture view to generate mip maps for. Must be a shader resource view.
///
/// **Remarks:** The texture must have been created with `MISC_TEXTURE_FLAG_GENERATE_MIPS`.
/// Supported contexts: graphics.
pub fn generateMips(self: *DeviceContext, texture_view: graphics.TextureView) void {
    self.method("GenerateMips")(self.raw, texture_view.raw);
}

/// Finishes the current frame and releases dynamic resources allocated by the context.
///
/// For immediate contexts this is called automatically by `ISwapChain::Present()` of the primary swap
/// chain, but can also be called explicitly. Deferred contexts must call it. It has some overhead, so
/// calling it once per frame is best.
///
/// **Note:** After the call, all dynamic resources and committed resources become invalid and must be
/// written again before use. Unless the GPU is idle, resources may be released several frames later.
/// The method does not flush the context.
pub fn finishFrame(self: *DeviceContext) void {
    self.method("FinishFrame")(self.raw);
}

/// Returns the current frame number.
///
/// **Note:** The frame number is incremented every time `finishFrame()` is called.
pub fn getFrameNumber(self: *const DeviceContext) u64 {
    return self.method("GetFrameNumber")(self.raw);
}

/// Transitions resource states.
///
/// `resource_barriers` - Resource barriers to apply.
///
/// When both old and new states are `RESOURCE_STATE_UNORDERED_ACCESS`, the engine executes a UAV barrier
/// on the resource, so all UAV accesses complete before any later UAV access begins.
///
/// Two main uses: the application knows transitions the engine cannot know (for example a single mip
/// level), or the application manages states from multiple threads. In the latter case the resource
/// should first be transitioned to `RESOURCE_STATE_UNKNOWN` to disable automatic state management.
///
/// **Remarks:** If `UpdateResourceState` is set, the method may update the internal state, which is
/// **not thread-safe**. Shader access states may map to different native states depending on the
/// context type. To synchronize compute writes with graphics reads, call this from the graphics context.
pub fn transitionResourceStates(self: *DeviceContext, resource_barriers: []const graphics.types.StateTransitionDesc) void {
    self.method("TransitionResourceStates")(self.raw, @intCast(resource_barriers.len), @ptrCast(resource_barriers.ptr));
}

/// Resolves a multi-sampled texture subresource into a non-multi-sampled texture subresource.
///
/// `src_texture` - Source multi-sampled texture.
/// `dst_texture` - Destination non-multi-sampled texture.
/// `resolve_attribs` - Resolve command attributes, see `Diligent::ResolveTextureSubresourceAttribs`.
///
/// **Remarks:** Supported contexts: graphics.
pub fn resolveTextureSubresource(
    self: *DeviceContext,
    src_texture: graphics.Texture,
    dst_texture: graphics.Texture,
    resolve_attribs: *const graphics.types.ResolveTextureSubresourceAttribs,
) void {
    self.method("ResolveTextureSubresource")(self.raw, src_texture.raw, dst_texture.raw, @ptrCast(resolve_attribs));
}

/// Builds a bottom-level acceleration structure with the specified geometries.
///
/// `attribs` - Command attributes, see `Diligent::BuildBLASAttribs`.
///
/// **Note:** Do not call build or copy operations on the same BLAS from different contexts. The BLAS has
/// CPU-side data that would not match the GPU-side data, and shader binding would be incorrect.
///
/// **Remarks:** Supported contexts: graphics, compute.
pub fn buildBLAS(self: *DeviceContext, attribs: *const graphics.types.BuildBLASAttribs) void {
    self.method("BuildBLAS")(self.raw, @ptrCast(attribs));
}

/// Builds a top-level acceleration structure with the specified instances.
///
/// `attribs` - Command attributes, see `Diligent::BuildTLASAttribs`.
///
/// **Note:** Do not call build or copy operations on the same TLAS from different contexts. The TLAS has
/// CPU-side data that would not match the GPU-side data, and shader binding would be incorrect.
///
/// **Remarks:** Supported contexts: graphics, compute.
pub fn buildTLAS(self: *DeviceContext, attribs: *const graphics.types.BuildTLASAttribs) void {
    self.method("BuildTLAS")(self.raw, @ptrCast(attribs));
}

/// Copies data from one bottom-level acceleration structure to another.
///
/// `attribs` - Command attributes, see `Diligent::CopyBLASAttribs`.
///
/// **Note:** Do not call build or copy operations on the same BLAS from different contexts.
///
/// **Remarks:** Supported contexts: graphics, compute.
pub fn copyBLAS(self: *DeviceContext, attribs: *const graphics.types.CopyBLASAttribs) void {
    self.method("CopyBLAS")(self.raw, @ptrCast(attribs));
}

/// Copies data from one top-level acceleration structure to another.
///
/// `attribs` - Command attributes, see `Diligent::CopyTLASAttribs`.
///
/// **Note:** Do not call build or copy operations on the same TLAS from different contexts.
///
/// **Remarks:** Supported contexts: graphics, compute.
pub fn copyTLAS(self: *DeviceContext, attribs: *const graphics.types.CopyTLASAttribs) void {
    self.method("CopyTLAS")(self.raw, @ptrCast(attribs));
}

/// Writes the memory size a bottom-level acceleration structure needs for compaction to a buffer.
///
/// `attribs` - Command attributes, see `Diligent::WriteBLASCompactedSizeAttribs`.
///
/// **Remarks:** Supported contexts: graphics, compute.
pub fn writeBLASCompactedSize(self: *DeviceContext, attribs: *const graphics.types.WriteBLASCompactedSizeAttribs) void {
    self.method("WriteBLASCompactedSize")(self.raw, @ptrCast(attribs));
}

/// Writes the memory size a top-level acceleration structure needs for compaction to a buffer.
///
/// `attribs` - Command attributes, see `Diligent::WriteTLASCompactedSizeAttribs`.
///
/// **Remarks:** Supported contexts: graphics, compute.
pub fn writeTLASCompactedSize(self: *DeviceContext, attribs: *const graphics.types.WriteTLASCompactedSizeAttribs) void {
    self.method("WriteTLASCompactedSize")(self.raw, @ptrCast(attribs));
}

/// Executes a trace rays command.
///
/// `attribs` - Command attributes, see `Diligent::TraceRaysAttribs`.
///
/// **Note:** The method is not thread-safe. The application must externally synchronize access to the
/// shader binding table (SBT). The function does not modify the SBT and can run in parallel with other
/// functions that do not modify it.
///
/// **Remarks:** Supported contexts: graphics, compute.
pub fn traceRays(self: *DeviceContext, attribs: *const graphics.types.TraceRaysAttribs) void {
    self.method("TraceRays")(self.raw, @ptrCast(attribs));
}

/// Executes an indirect trace rays command.
///
/// `attribs` - Command attributes, see `Diligent::TraceRaysIndirectAttribs`.
///
/// **Note:** The method is not thread-safe. The application must externally synchronize access to the
/// shader binding table (SBT). The function does not modify the SBT.
///
/// **Remarks:** Supported contexts: graphics, compute.
pub fn traceRaysIndirect(self: *DeviceContext, attribs: *const graphics.types.TraceRaysIndirectAttribs) void {
    self.method("TraceRaysIndirect")(self.raw, @ptrCast(attribs));
}

/// Updates the SBT with the pending data recorded in `IShaderBindingTable::Bind***` calls.
///
/// `sbt` - Shader binding table to update, if it has pending data.
/// `update_indirect_buffer_attribs` - Optional attributes for writing indirect ray tracing arguments to
/// a buffer for use with `traceRaysIndirect()`.
///
/// In the Direct3D12 backend, the attribs buffer is initialized with the `D3D12_DISPATCH_RAYS_DESC`
/// layout, with GPU addresses in the first 88 bytes. In the Vulkan backend the attribs buffer is not
/// modified.
///
/// **Remarks:** The method is not thread-safe. It modifies the SBT data and must not run in parallel
/// with any other command that uses the same SBT. Supported contexts: graphics, compute, transfer.
pub fn updateSBT(
    self: *DeviceContext,
    sbt: graphics.ShaderBindingTable,
    update_indirect_buffer_attribs: ?*const graphics.types.UpdateIndirectRTBufferAttribs,
) void {
    self.method("UpdateSBT")(
        self.raw,
        sbt.raw,
        if (update_indirect_buffer_attribs) |a| @ptrCast(a) else null,
    );
}

/// Stores a pointer to the user-provided data object.
///
/// `user_data` - The user data object to store. Pass `null` to release the stored object.
///
/// The method keeps a strong reference to the object. To release it, call `setUserData(null)`.
///
/// **Note:** The method is not thread-safe, and the application must externally synchronize access.
pub fn setUserData(self: *DeviceContext, user_data: ?graphics.Object) void {
    self.method("SetUserData")(self.raw, if (user_data) |u| u.raw else null);
}

/// Returns the user data object previously set with `setUserData()`.
///
/// **Remarks:** The method does not call `AddRef()` on the returned object.
pub fn getUserData(self: *const DeviceContext) ?graphics.Object {
    const p = self.method("GetUserData")(self.raw);
    if (p == null) return null;
    return .{ .raw = p.? };
}

/// Begins a debug group with name and color.
///
/// `name` - Group name.
/// `color` - Optional region color, four components.
///
/// External debug tools may use this information when displaying context commands.
///
/// **Remarks:** Supported contexts: graphics, compute, transfer.
pub fn beginDebugGroup(self: *DeviceContext, name: [:0]const u8, color: ?*const [4]f32) void {
    self.method("BeginDebugGroup")(self.raw, name.ptr, if (color) |col| &col[0] else null);
}

/// Ends a debug group that was previously started with `beginDebugGroup()`.
pub fn endDebugGroup(self: *DeviceContext) void {
    self.method("EndDebugGroup")(self.raw);
}

/// Inserts a debug label with name and color.
///
/// `label` - Label name.
/// `color` - Optional label color, four components.
///
/// External debug tools may use this information when displaying context commands.
///
/// **Remarks:** Supported contexts: graphics, compute, transfer. Not supported in the Metal backend.
pub fn insertDebugLabel(self: *DeviceContext, label: [:0]const u8, color: ?*const [4]f32) void {
    self.method("InsertDebugLabel")(self.raw, label.ptr, if (color) |col| &col[0] else null);
}

/// Locks the internal mutex and returns the command queue associated with this device context.
///
/// Only immediate device contexts have an associated command queue. The engine holds the lock until
/// `unlockCommandQueue()` is called, and no command list can be submitted in the meantime. Nested
/// calls are not allowed. The queue pointer does not change while the context is alive. The engine
/// manages the queue lifetime, so the application must not call `AddRef`/`Release` on it.
pub fn lockCommandQueue(self: *DeviceContext) ?graphics.CommandQueue {
    const p = self.method("LockCommandQueue")(self.raw);
    if (p == null) return null;
    return .{ .raw = p.? };
}

/// Unlocks the command queue that was previously locked by `lockCommandQueue()`.
pub fn unlockCommandQueue(self: *DeviceContext) void {
    self.method("UnlockCommandQueue")(self.raw);
}

/// Sets the shading base rate and combiners.
///
/// `base_rate` - Base shading rate used for combiner operations.
/// `primitive_combiner` - Combiner for the per-primitive shading rate (vertex or geometry shader output).
/// `texture_combiner` - Combiner for the texture-based shading rate, see `SetRenderTargetsAttribs::pShadingRateMap`.
///
/// The final shading rate is computed as follows:
///
///     PrimitiveRate = ApplyCombiner(primitive_combiner, base_rate, PerPrimitiveRate)
///     FinalRate     = ApplyCombiner(texture_combiner, PrimitiveRate, TextureRate)
///
/// Combiners are `PASSTHROUGH` (keep original), `OVERRIDE` (use new), `MIN`, `MAX`, `SUM` and `MUL`.
/// If per-primitive shading rate is not supported, `primitive_combiner` must be `PASSTHROUGH`. If
/// texture-based shading rate is not supported, `texture_combiner` must be `PASSTHROUGH`.
///
/// **Remarks:** Supported contexts: graphics.
pub fn setShadingRate(
    self: *DeviceContext,
    base_rate: graphics.types.ShadingRate,
    primitive_combiner: graphics.types.ShadingRateCombiner,
    texture_combiner: graphics.types.ShadingRateCombiner,
) void {
    self.method("SetShadingRate")(
        self.raw,
        @backingInt(base_rate),
        @backingInt(primitive_combiner),
        @backingInt(texture_combiner),
    );
}

/// Binds or unbinds memory objects to sparse buffers and sparse textures.
///
/// `attribs` - Command attributes, see `Diligent::BindSparseResourceMemoryAttribs`.
///
/// **Note:** The Metal backend uses a single preallocated memory storage, so memory offsets are ignored
/// and any free block is acquired from the storage. If no memory is free, the region stays unbound.
/// Direct3D12, Vulkan and Metal require explicit synchronization with fences or `waitForIdle()` for
/// access to the resource. This command implicitly calls `flush()`.
///
/// **Remarks:** Only executed by an immediate context whose queue supports
/// `COMMAND_QUEUE_TYPE_SPARSE_BINDING`.
pub fn bindSparseResourceMemory(self: *DeviceContext, attribs: *const graphics.types.BindSparseResourceMemoryAttribs) void {
    self.method("BindSparseResourceMemory")(self.raw, @ptrCast(attribs));
}

/// Clears the device context statistics.
pub fn clearStats(self: *DeviceContext) void {
    self.method("ClearStats")(self.raw);
}

/// Returns the device context statistics, see `Diligent::DeviceContextStats`.
///
/// The returned pointer is valid for the lifetime of the context.
pub fn getStats(self: *const DeviceContext) *const graphics.types.DeviceContextStats {
    return @ptrCast(self.method("GetStats")(self.raw));
}

pub const method = helpers.methodHelper(@This(), "DeviceContext");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;

comptime {
    helpers.ensureHandle(@This());
    helpers.ensureMethodsImplemented(@This(), "DeviceContext", &.{});
}
