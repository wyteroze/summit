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
pub const Physics = @import("physics/Physics.zig");

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
    collider: Ecs.ComponentId,
    rigid_body: Ecs.ComponentId,
    physics_body: Ecs.ComponentId,
};

const World3D = @This();
allocator: std.mem.Allocator,
world: *Ecs.World,
component_ids: ComponentIds,
physics: Physics,

pub fn init(
    self: *World3D,
    io: std.Io,
    allocator: std.mem.Allocator,
    physics_allocator: std.mem.Allocator,
    ecs: *Ecs,
) !void {
    var world = try ecs.createWorld();
    world.user_data = self;
    self.world = world;
    self.allocator = allocator;

    const scene = try world.registerComponent(types.Scene, "Scene"); // For organizing collections of entities
    const mesh = try world.registerComponent(Assets.AssetHandle, "Mesh"); // For giving an entity a mesh appearance
    const image = try world.registerComponent(Assets.AssetHandle, "Image"); // For giving an entity an image appearance (or a texture, if it has a mesh)
    const position = try world.registerComponent(math.Vec3, "Position"); // For moving entities
    const rotation = try world.registerComponent(math.Quat, "Rotation"); // For rotating entites (Euler)
    const scale = try world.registerComponent(math.Vec3, "Scale"); // For scaling entities
    const script = try world.registerComponent(scripting.Runtime.ScriptHandle, "Script"); // For giving entities behavior
    const light = try world.registerComponent(render.types.Light, "Light"); // For creating sources of illumination
    const name = try world.registerComponent([]const u8, "Name"); // For naming an entity (we don't use it, but lua does)
    const audio_listener = try world.registerComponent(Audio.types.AudioListener, "AudioListener");
    const speaker = try world.registerComponent(Audio.Speaker, "Speaker");
    const camera = try world.registerComponent(types.Camera, "Camera");
    const collider = try world.registerComponent(types.Collider, "Collider");
    const rigid_body = try world.registerComponent(types.RigidBody, "RigidBody");
    const physics_body = try world.registerComponent(types.PhysicsBody, "PhysicsBody");

    self.component_ids = .{
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
        .collider = collider,
        .rigid_body = rigid_body,
        .physics_body = physics_body,
    };
    self.physics = try .init(io, physics_allocator);
}

pub fn deinit(self: *World3D) void {
    self.physics.deinit();
}

pub fn update(self: *World3D, dt: f32) void {
    self.physics.reconcile(dt) catch |e|
        std.log.err("Physics.reconcile() failed: {t}", .{e});
    self.physics.step(dt);
    self.physics.pull() catch |e|
        std.log.err("Physics.pull() failed: {t}", .{e});
    self.world.clearChanged();
    self.world.update(dt);
}

pub fn raycast(self: *World3D, origin: math.Vec3, dir: math.Vec3, opts: Physics.RaycastOptions) ?Physics.RaycastHit {
    return self.physics.raycast(origin, dir, opts);
}

pub fn getContacts(self: *const World3D) []const Physics.Contact {
    return self.physics.contacts.items;
}

const bind = @import("../scripting/bind/bind.zig");
pub const World3DHandle = struct {
    id: u8,
    ecs: *Ecs,

    const ToWorldHandle = bind.Via(World3DHandle, Ecs.World.WorldHandle, struct {
        fn f(h: World3DHandle) Ecs.World.WorldHandle {
            return .{ .id = h.id, .ecs = h.ecs };
        }
    }.f);

    pub fn isAlive(self: World3DHandle) bool {
        return self.ecs.isWorldAlive(self.id);
    }

    pub fn eql(self: World3DHandle, other: World3DHandle) bool {
        return self.id == other.id;
    }

    pub fn get(self: World3DHandle) !*World3D {
        const w = try self.ecs.getWorld(self.id);
        const ud = w.user_data orelse return error.NoWorld3D;
        return @ptrCast(@alignCast(ud));
    }

    // Opts anonymous struct is temporary until Lua can pass slices
    pub fn raycast(
        self: World3DHandle,
        origin: math.Vec3,
        dir: math.Vec3,
        opts: struct {
            max_distance: ?f32 = null,
            //ignore: []const Ecs.Entity = &.{},
            include_sensors: bool = false,
        },
    ) !?Physics.RaycastHit {
        return (try self.get()).raycast(origin, dir, .{ .max_distance = opts.max_distance, .include_sensors = opts.include_sensors });
    }

    pub const sub_api = bind.handle(World3DHandle, .{
        .alive = bind.func("isAlive", World3DHandle.isAlive),
        .inherit = bind.inherit(World3DHandle.ToWorldHandle, Ecs.World.WorldHandle.sub_api.impl.recipe),
        .methods = &.{
            bind.func("raycast", World3DHandle.raycast),
        },
        .ops = .{
            .eq = .{ .member = bind.func("eql", World3DHandle.eql) },
        },
    });
};

pub const api = bind.module("world3d", .{
    .members = &.{
        World3DHandle.sub_api,
        bind.record(types.Collider, .{}),
        bind.record(types.RigidBody, .{}),
        bind.record(types.Axes, .{}),
        bind.record(types.LockedAxes, .{}),
        bind.record(types.PhysicsMaterial, .{}),
        // bind.record(Physics.RaycastOptions, .{}),
    },
});
