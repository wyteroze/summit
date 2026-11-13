// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const std = @import("std");
const types = @import("types.zig");

/// Direct3D11-specific validation options.
pub const ValidationFlags = packed struct(u32) {
    /// Verify that all committed context resources are relevant,
    /// i.e. they are consistent with the committed resource cache.
    /// This is very expensive and should only be used for engine debugging.
    /// This option is enabled in validation level 2 (see DiligentValidationLevel).
    ///
    /// This flag only has effect in Debug/Development builds.
    /// This type of validation is never performed in Release builds.
    verify_comitted_resource_relevance: bool = false,
};

/// Attributes specific to D3D11 engine
pub const CreateInfo = extern struct {
    base: types.EngineCreateInfo = .{},
    validation_flags: ValidationFlags = .{},

    pub fn setValidationLevel(self: *CreateInfo, level: types.ValidationLevel) void {
        self.base.setValidationLevel(level);
        self.validation_flags = .{};

        if (@backingInt(level) >= @backingInt(types.ValidationLevel.level_2)) {
            self.validation_flags.verify_comitted_resource_relevance = true;
        }
    }

    pub fn toC(self: *const CreateInfo) *const c.EngineD3D11CreateInfo {
        return @ptrCast(self);
    }

    comptime {
        if (@sizeOf(CreateInfo) != @sizeOf(c.EngineD3D11CreateInfo)) @compileError("size mismatch");
        if (@offsetOf(CreateInfo, "validation_flags") != @offsetOf(c.EngineD3D11CreateInfo, "D3D11ValidationFlags")) @compileError("offset mismatch");
    }
};
