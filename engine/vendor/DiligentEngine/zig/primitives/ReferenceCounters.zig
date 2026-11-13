// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const helpers = @import("../helpers.zig");
const primitives = @import("primitives.zig");

const ReferenceCounters = @This();
raw: *c.IReferenceCounters,

/// Increments the number of strong references by 1.
///
/// **Returns:** The number of strong references after incrementing the counter.
///
/// **Remark:** The counter update is thread-safe, but the caller must already
/// own a strong reference or otherwise externally guarantee object
/// lifetime. AddStrongRef() must not be used to promote a weak
/// reference because another thread may be releasing the final strong
/// reference at the same time. Use QueryObject() or RefCntWeakPtr::Lock()
/// for weak-to-strong promotion.
///
/// **Note:** In a multithreaded environment, the returned number may not be reliable
/// as other threads may simultaneously change the actual value of the counter.
pub fn addStrongRef(self: *ReferenceCounters) i32 {
    return self.method("AddStrongRef")(self.raw);
}

/// Decrements the number of strong references by 1 and destroys the referenced object
/// when the counter reaches zero. If there are no more weak references, destroys the
/// reference counters object itself.
///
/// **Returns:** The number of strong references after decrementing the counter.
/// **Remark:** The referenced object is destroyed when the last strong reference is released.
/// RefCountedObject keeps an implicit weak reference while the object is alive,
/// so the reference counters object remains alive until after the object
/// destructor returns.
///
/// If there are no more weak references after that, the reference counters
/// object itself is also destroyed.
///
/// The method is thread-safe and does not require explicit synchronization.
///
/// **Note:**  In a multithreaded environment, the returned number may not be reliable
/// as other threads may simultaneously change the actual value of the counter.
/// The only reliable value is 0 as the object is destroyed when the last
/// strong reference is released.
pub fn releaseStrongRef(self: *ReferenceCounters) i32 {
    return self.method("ReleaseStrongRef")(self.raw);
}

/// Increments the number of weak references by 1.
///
/// **Returns:** The number of weak references after incrementing the counter.
///
/// **Remark:** The counter update is thread-safe, but the caller must already
/// own a strong reference, own a weak reference, or otherwise
/// externally guarantee that the reference counters object is still alive.
///
/// **Note:** In a multithreaded environment, the returned number may not be reliable
/// as other threads may simultaneously change the actual value of the counter.
pub fn addWeakRef(self: *ReferenceCounters) i32 {
    return self.method("AddWeakRef")(self.raw);
}

/// Decrements the number of weak references by 1. If there are no more strong and weak
/// references, destroys the reference counters object itself.
///
/// **Returns:** The number of weak references after decrementing the counter.
///
/// **Remark:** The method is thread-safe and does not require explicit synchronization.
///
/// **Note:** In a multithreaded environment, the returned number may not be reliable
/// as other threads may simultaneously change the actual value of the counter.
pub fn releaseWeakRef(self: *ReferenceCounters) i32 {
    return self.method("ReleaseWeakRef")(self.raw);
}

/// Queries a pointer to the IUnknown interface of the referenced object.
///
/// **Returns:** Memory address where the pointer to the object
/// will be stored.
///
/// **Remark:** If the object was destroyed, the function returns an `ObjectDestroyed` error.
/// If the object was not released, the pointer to the object's IUnknown interface
/// will be stored. In this case, the number of strong references to the object
/// will be incremented by 1.
///
/// This method is a safe way to promote a weak reference to a strong reference.
/// Direct AddStrongRef() on a raw pointer does not provide the required lifetime
/// synchronization.
///
/// The method is thread-safe and does not require explicit synchronization.
pub fn queryObject(self: *ReferenceCounters) error{ObjectDestroyed}!primitives.Object {
    var object: [*c]c.IObject = null;
    self.method("QueryObject")(self.raw, &object);
    if (object == null) return error.ObjectDestroyed;

    return .{ .raw = object };
}

/// Returns the number of outstanding strong references.
///
/// **Returns:** The number of strong references.
///
/// **Note:**   In a multithreaded environment, the returned number may not be reliable
/// as other threads may simultaneously change the actual value of the counter.
/// The only reliable value is 0 as the object is destroyed when the last
/// strong reference is released.
pub fn getNumStrongRefs(self: *const ReferenceCounters) i32 {
    return self.method("GetNumStrongRefs")(self.raw);
}

/// Returns the number of outstanding weak references.
//
/// **Returns:** The number of weak references.
///
/// **Remark:** Diligent's RefCountedObject implementation keeps one implicit
/// weak reference while the referenced object is alive. The returned
/// value includes this implicit weak reference, so one external weak
/// pointer to a live object is reported as two weak references.
///
/// **Note:** In a multithreaded environment, the returned number may not be reliable
/// as other threads may simultaneously change the actual value of the counter.
pub fn getNumWeakRefs(self: *const ReferenceCounters) i32 {
    return self.method("GetNumWeakRefs")(self.raw);
}

pub const method = helpers.methodHelper(@This(), "ReferenceCounters");
