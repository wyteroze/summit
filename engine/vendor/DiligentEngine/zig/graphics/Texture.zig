// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const helpers = @import("../helpers.zig");

const Texture = @This();
raw: *c.ITexture,

/// Creates a new texture view
/// \param [in] ViewDesc - View description. See Diligent::TextureViewDesc for details.
/// \param [out] ppView - Address of the memory location where the pointer to the view interface will be written to.
///
/// To create a shader resource view addressing the entire texture, set only TextureViewDesc::ViewType
/// member of the ViewDesc parameter to Diligent::TEXTURE_VIEW_SHADER_RESOURCE and leave all other
/// members in their default values. Using the same method, you can create render target or depth stencil
/// view addressing the largest mip level.
///
/// If texture view format is Diligent::TEX_FORMAT_UNKNOWN, the view format will match the texture format.
///
/// If texture view type is Diligent::TEXTURE_VIEW_UNDEFINED, the type will match the texture type.
/// If the number of mip levels is 0, and the view type is shader resource, the view will address all mip levels.
///
/// For other view types it will address one mip level.
///
/// If the number of slices is 0, all slices from FirstArraySlice or FirstDepthSlice will be referenced by the view.
/// For non-array textures, the only allowed values for the number of slices are 0 and 1.
///
/// Texture view will contain strong reference to the texture, so the texture will not be destroyed
/// until all views are released.
///
/// The function calls AddRef() for the created interface, so it must be released by
/// a call to Release() when it is no longer needed.
pub fn createView(self: Texture, view_desc: graphics.types.TextureViewDesc) !graphics.TextureView {
    const view: [*c]c.ITextureView = null;
    self.method("CreateView")(self.raw, @ptrCast(&view_desc), &view);
    if (view == null) return error.FailedToCreateView;

    return .{ .raw = view.* };
}

/// Returns the pointer to the default view.
///
/// `view_type` - Type of the requested view. See Diligent::TEXTURE_VIEW_TYPE.
/// **Returns:** Pointer to the interface
///
/// **Note:** The function does **not** increase the reference counter for the returned interface, so
/// Release() **must not** be called.
pub fn getDefaultView(self: Texture, view_type: graphics.types.TextureViewType) graphics.TextureView {
    const view = self.method("GetDefaultView")(self.raw, @bitCast(view_type));
    return .{ .raw = view.? };
}

pub const method = helpers.methodHelper(@This(), "Texture");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
pub const asDeviceObject = helpers.baseHelper(@This(), graphics.DeviceObject);
pub const asObject = helpers.baseHelper(@This(), graphics.Object);
