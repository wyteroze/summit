// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const primitives = @import("../primitives/primitives.zig");
const helpers = @import("../helpers.zig");

const EngineFactory = @This();
raw: *c.IEngineFactory,

/// Sets the memory allocator to be used by the engine.
///
/// `allocator` - Pointer to the memory allocator.
///
/// The allocator is a global setting that applies to the entire execution unit
/// (executable or shared library that contains the engine implementation).
///
/// The allocator should be set before any other factory method is called and
/// should not be changed afterwards.
/// The allocator object must remain valid for the lifetime of the
/// engine until all engine objects are destroyed.
pub fn setMemoryAllocator(self: *const EngineFactory, allocator: primitives.MemoryAllocator) void {
    self.method("SetMemoryAllocator")(self.raw, allocator.raw);
}

const method = helpers.methodHelper(@This(), "EngineFactory");
