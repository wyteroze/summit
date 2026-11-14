// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const helpers = @import("../helpers.zig");

const Swapchain = @This();
raw: *c.ISwapChain,

/// Presents a rendered image to the user
pub fn present(self: Swapchain, sync_interval: ?u32) void {
    self.method("Present")(self.raw, sync_interval orelse 1);
}

/// Changes the swap chain size
///
/// `new_width` - New logical swap chain width (not accounting for pre-transform), in pixels.
/// `new_height` - New logical swap chain height (not accounting for pre-transform), in pixels.
/// `new_transform` - New surface transform, see Diligent::SURFACE_TRANSFORM.
///
/// **Note:** When resizing non-primary swap chains, the engine unbinds the
/// swap chain buffers from the output.
///
/// New width and height should not account for surface pre-transform. For example,
/// if the window size is 1920 x 1080, but the surface is pre-rotated by 90 degrees,
/// NewWidth should still be 1920, and NewHeight should still be 1080. It is highly
/// recommended to always use Diligent::SURFACE_TRANSFORM_OPTIMAL to let the engine select
/// the most optimal pre-transform. However Diligent::SURFACE_TRANSFORM_ROTATE_90 will also work in
/// the scenario above. After the swap chain has been resized, its actual width will be 1080,
/// actual height will be 1920, and `PreTransform` will be Diligent::SURFACE_TRANSFORM_ROTATE_90.
pub fn resize(self: Swapchain, width: u32, height: u32, new_transform: graphics.types.SurfaceTransform) void {
    self.method("Resize")(self.raw, width, height, @bitCast(new_transform));
}

/// Returns render target view of the current back buffer in the swap chain
///
/// For Direct3D12 and Vulkan backends, the function returns
/// different pointer for every offscreen buffer in the swap chain
/// (flipped by every call to ISwapChain::Present()). For Direct3D11
/// backend it always returns the same pointer. For OpenGL/GLES backends
/// the method returns null.
///
/// The method does **NOT** increment the reference counter of the returned object,
/// so Release() **must not** be called.
pub fn getCurrentBackBufferRTV(self: Swapchain) graphics.TextureView {
    const view = self.method("GetCurrentBackBufferRTV")(self.raw);
    return .{ .raw = view };
}

/// Returns depth-stencil view of the depth buffer
///
/// The method does **NOT** increment the reference counter of the returned object,
/// so Release() **must not** be called.
pub fn getDepthBufferDSV(self: Swapchain) graphics.TextureView {
    const view = self.method("GetDepthBufferDSV")(self.raw);
    return .{ .raw = view };
}

pub const method = helpers.methodHelper(@This(), "SwapChain");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
pub const asObject = helpers.baseHelper(@This(), graphics.Object);
