// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");

/// The maximum number of input buffer slots.
/// D3D11_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT == 32
pub const max_buffer_slots = c.MAX_BUFFER_SLOTS;

/// The maximum number of simultaneous render targets.
pub const max_render_targets = c.DILIGENT_MAX_RENDER_TARGETS;

/// The maximum number of viewports.
pub const max_viewports = c.DILIGENT_MAX_VIEWPORTS;

/// The maximum number of resource signatures that one pipeline can use
pub const max_resource_signatures = c.DILIGENT_MAX_RESOURCE_SIGNATURES;

/// The maximum number of queues in graphics adapter description.
pub const max_adapter_queues = c.DILIGENT_MAX_ADAPTER_QUEUES;

/// Special constant for the default adapter index.
pub const default_adapter_id = c.DILIGENT_DEFAULT_ADAPTER_ID;

/// Special constant for the default queue index.
pub const default_queue_id = c.DILIGENT_DEFAULT_QUEUE_ID;

/// The maximum number of shading rate modes.
pub const max_shading_rates = c.DILIGENT_MAX_SHADING_RATES;

/// Bit shift for the the shading X-axis rate.
pub const shading_rate_x_shift = c.DILIGENT_SHADING_RATE_X_SHIFT;

/// The maximum number of 4-byte inline constants in a pipeline state.
pub const max_inline_constants = c.DILIGENT_MAX_INLINE_CONSTANTS;
