// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const helpers = @import("../helpers.zig");

const Buffer = @This();
raw: *c.IBuffer,

/// Returns the buffer description used to create the object
pub fn getDesc(self: Buffer) *const graphics.types.BufferDesc {
    return @ptrCast(self.asDeviceObject().getDesc());
}

/// Creates a new buffer view
///
/// **Remarks:** To create a view addressing the entire buffer, set only BufferViewDesc::ViewType member
/// of the ViewDesc structure and leave all other members in their default values.
///
/// Buffer view will contain strong reference to the buffer, so the buffer will not be destroyed
/// until all views are released.
///
/// The function calls AddRef() for the created interface, so it must be released by
/// a call to Release() when it is no longer needed.
pub fn createView(self: Buffer, view_desc: graphics.types.BufferViewDesc) !graphics.BufferView {
    var view: [*c]c.IBufferView = null;
    self.method("CreateView")(self.raw, @ptrCast(&view_desc), &view);
    if (view == null) return error.BufferViewCreateFailed;

    return .{ .raw = view.? };
}

/// Returns the pointer to the default view.
///
/// `view_type` - Type of the requested view. See Diligent::BUFFER_VIEW_TYPE.
/// **Returns:** Pointer to the interface
///
/// **Remarks:** Default views are only created for structured and raw buffers. As for formatted buffers
/// the view format is unknown at buffer initialization time, no default views are created.
///
/// **Note:** The function does not increase the reference counter for the returned interface, so
/// Release() must *NOT* be called.
pub fn getDefaultView(self: Buffer, view_type: graphics.types.BufferViewType) graphics.BufferView {
    const bv = self.method("GetDefaultView")(self.raw, @bitCast(view_type));
    return .{ .raw = bv.? };
}

pub const method = helpers.methodHelper(@This(), "Buffer");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
pub const asDeviceObject = helpers.baseHelper(@This(), graphics.DeviceObject);
pub const asObject = helpers.baseHelper(@This(), graphics.Object);
