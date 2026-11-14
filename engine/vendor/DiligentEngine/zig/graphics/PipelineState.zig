// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const graphics = @import("graphics.zig");
const primitives = @import("../primitives/primitives.zig");
const helpers = @import("../helpers.zig");

const PipelineState = @This();
raw: *c.IPipelineState,

/// Creates a shader resource binding object.
///
/// `init_static_resources` - If set to true, the method will initialize static resources in
/// the created object, which has the exact same effect as calling
/// IPipelineState::InitializeStaticSRBResources().
///
/// This method is only allowed for pipelines that use implicit resource signature
/// (e.g. shader resources are defined through ResourceLayout member of the pipeline desc).
/// For pipelines that use explicit resource signatures, use
/// IPipelineResourceSignature::CreateShaderResourceBinding() method.
pub fn createShaderResourceBinding(self: PipelineState, init_static_resources: bool) !graphics.ShaderResourceBinding {
    var srb: [*c]c.IShaderResourceBinding = null;
    self.method("CreateShaderResourceBinding")(self.raw, &srb, init_static_resources);
    if (srb == null) return error.FailedToTCreateShaderResourceBinding;

    return .{ .raw = srb };
}

pub const method = helpers.methodHelper(@This(), "PipelineState");
pub const addRef = helpers.objectMethods(@This()).addRef;
pub const release = helpers.objectMethods(@This()).release;
pub const asDeviceObject = helpers.baseHelper(@This(), graphics.DeviceObject);
pub const asObject = helpers.baseHelper(@This(), graphics.Object);
