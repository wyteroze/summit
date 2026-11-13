// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
//! Base interface for all dynamic objects in the engine

const c = @import("c");
const primitives = @import("primitives.zig");
const helpers = @import("../helpers.zig");

const Object = @This();
raw: *c.IObject,

/// Queries the specific interface.
///
/// `interface_id` - Unique identifier of the requested interface.
///
/// **Returns:** Memory address where the pointer to the requested interface will be written.
/// If the interface is not supported, the function returns an `InterfaceNotSupported` error.
///
/// **Remark:** The method increments the number of strong references by 1. The interface must be
/// released by a call to Release() method when it is no longer needed.
pub fn queryInterface(self: *Object, interface_id: *const primitives.InterfaceID) error{InterfaceNotSupported}!Object {
    var interface: [*c]c.IObject = null;
    self.method("QueryInterface")(self.raw, @ptrCast(interface_id), &interface);
    if (interface == null) return error.InterfaceNotSupported;

    return .{ .raw = interface.? };
}

/// Increments the number of strong references by 1.
///
/// **Remark:** This method is equivalent to GetReferenceCounters()->AddStrongRef().
///
/// The method is thread-safe and does not require explicit synchronization.
///
/// **Returns:** The number of strong references after incrementing the counter.
///
/// **Note:** In a multithreaded environment, the returned number may not be reliable
/// as other threads may simultaneously change the actual value of the counter.
pub fn addRef(self: *Object) i32 {
    return self.method("AddRef")(self.raw);
}

/// Decrements the number of strong references by 1 and destroys the object when the
/// counter reaches zero.
///
/// **Remark:** This method is equivalent to `GetReferenceCounters()->ReleaseStrongRef()`.
///
/// The method is thread-safe and does not require explicit synchronization.
///
/// **Returns:** The number of strong references after decrementing the counter.
///
/// **Note:** In a multithreaded environment, the returned number may not be reliable
/// as other threads may simultaneously change the actual value of the counter.
/// The only reliable value is 0 as the object is destroyed when the last
/// strong reference is released.
pub fn release(self: *Object) i32 {
    return self.method("Release")(self.raw);
}

/// Returns the pointer to IReferenceCounters interface of the associated
/// reference counters object. The method does **NOT** increment
/// the number of strong references to the returned object.
pub fn getReferenceCounters(self: *const Object) *primitives.ReferenceCounters {
    return .{ .raw = self.method("GetReferenceCounters")(self.raw) };
}

pub const method = helpers.methodHelper(@This(), "Object");
