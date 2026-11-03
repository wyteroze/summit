// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Ui = @import("../ui/Ui.zig");
const Ecs = @import("../ecs/Ecs.zig");
const Assets = @import("../assets/Assets.zig");
const Audio = @import("../audio/Audio.zig");
const core = @import("../core/core.zig");
const math = @import("../core/math/math.zig");
const scripting = @import("../scripting/scripting.zig");
const render = @import("../render/render.zig");
const gpu = @import("../gpu/gpu.zig");
pub const types = @import("types.zig");
pub const collect = @import("collect.zig");

pub const ComponentIds = struct {
    scene: Ecs.ComponentId,
    mesh: Ecs.ComponentId,
    image: Ecs.ComponentId,
    position: Ecs.ComponentId,
    rotation: Ecs.ComponentId,
    scale: Ecs.ComponentId,
    script: Ecs.ComponentId,
    light: Ecs.ComponentId,
    name: Ecs.ComponentId,
    audio_listener: Ecs.ComponentId,
    speaker: Ecs.ComponentId,
    camera: Ecs.ComponentId,
};

const World3D = @This();
allocator: std.mem.Allocator,
world: *Ecs.World,
component_ids: ComponentIds,

pub fn init(allocator: std.mem.Allocator, ecs: *Ecs) !World3D {
    var world = try ecs.createWorld();

    const scene = try world.registerComponent(types.Scene, "Scene"); // For organizing collections of entities
    const mesh = try world.registerComponent(Assets.AssetHandle, "Mesh"); // For giving an entity a mesh appearance
    const image = try world.registerComponent(Assets.AssetHandle, "Image"); // For giving an entity an image appearance (or a texture, if it has a mesh)
    const position = try world.registerComponent(math.Vec3, "Position"); // For moving entities
    const rotation = try world.registerComponent(math.Vec3, "Rotation"); // For rotating entites (Euler)
    const scale = try world.registerComponent(math.Vec3, "Scale"); // For scaling entities
    const script = try world.registerComponent(scripting.Runtime.ScriptHandle, "Script"); // For giving entities behavior
    const light = try world.registerComponent(render.types.Light, "Light"); // For creating sources of illumination
    const name = try world.registerComponent([]const u8, "Name"); // For naming an entity (we don't use it, but lua does)
    const audio_listener = try world.registerComponent(Audio.types.AudioListener, "AudioListener");
    const speaker = try world.registerComponent(Audio.Speaker, "Speaker");
    const camera = try world.registerComponent(types.Camera, "Camera");

    return .{
        .allocator = allocator,
        .world = world,
        .component_ids = .{
            .scene = scene,
            .mesh = mesh,
            .image = image,
            .position = position,
            .rotation = rotation,
            .scale = scale,
            .script = script,
            .light = light,
            .name = name,
            .audio_listener = audio_listener,
            .speaker = speaker,
            .camera = camera,
        },
    };
}

pub fn deinit(_: *World3D) void {}

pub fn update(self: *World3D, dt: f32) void {
    self.world.update(dt);
    self.world.clearChanged();
}
