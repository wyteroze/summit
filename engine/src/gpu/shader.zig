// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const desc = @import("desc.zig");

// Export shader stuff
pub fn basicShaderDesc() desc.ShaderDesc {
    const source = @embedFile("shaders/src/basic.slang");
    return .{ .stages = &.{
        .{ .name = "BasicShader: vertex", .stage = .vertex, .source = source, .entrypoint = "vertexMain" },
        .{ .name = "BasicShader: pixel", .stage = .fragment, .source = source, .entrypoint = "fragmentMain" },
    } };
}

pub fn depthPrepassShaderDesc() desc.ShaderDesc {
    const source = @embedFile("shaders/src/depth_prepass.slang");
    return .{ .stages = &.{
        .{ .name = "DepthPrepassShader: vertex", .stage = .vertex, .source = source, .entrypoint = "vertexMain" },
    } };
}

pub fn lightCullShaderDesc() desc.ShaderDesc {
    const source = @embedFile("shaders/src/light_cull.slang");
    return .{ .stages = &.{
        .{ .name = "LightCullShader: compute", .stage = .compute, .source = source, .entrypoint = "computeMain" },
    } };
}

pub fn skyboxShaderDesc() desc.ShaderDesc {
    const source = @embedFile("shaders/src/skybox.slang");
    return .{ .stages = &.{
        .{ .name = "SkyboxShader: vertex", .stage = .vertex, .source = source, .entrypoint = "vertexMain" },
        .{ .name = "SkyboxShader: fragment", .stage = .fragment, .source = source, .entrypoint = "fragmentMain" },
    } };
}

pub fn uiShaderDesc() desc.ShaderDesc {
    const source = @embedFile("shaders/src/ui.slang");
    return .{ .stages = &.{
        .{ .name = "UiShader: vertex", .stage = .vertex, .source = source, .entrypoint = "vertexMain" },
        .{ .name = "UiShader: fragment", .stage = .fragment, .source = source, .entrypoint = "fragmentMain" },
    } };
}

pub fn painterShaderDesc() desc.ShaderDesc {
    const source = @embedFile("shaders/src/painter.slang");
    return .{ .stages = &.{
        .{ .name = "PainterShader: vertex", .stage = .vertex, .source = source, .entrypoint = "vertexMain" },
        .{ .name = "PainterShader: fragment", .stage = .fragment, .source = source, .entrypoint = "fragmentMain" },
    } };
}

pub fn gizmoShaderDesc() desc.ShaderDesc {
    const source = @embedFile("shaders/src/gizmo.slang");
    return .{ .stages = &.{
        .{ .name = "GizmoShader: vertex", .stage = .vertex, .source = source, .entrypoint = "vertexMain" },
        .{ .name = "GizmoShader: fragment", .stage = .fragment, .source = source, .entrypoint = "fragmentMain" },
    } };
}
