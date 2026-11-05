// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
//! Holds the engine state of Summit.

const std = @import("std");
const builtin = @import("builtin");
const engine = @import("../engine.zig");
const Memory = @import("Memory.zig");
const frame = @import("frame.zig");
const Platform = engine.Platform;
const gpu = engine.gpu;
const Ecs = engine.Ecs;
const math = engine.core.math;
const scripting = engine.scripting;
const Os = engine.Os;
const core = engine.core;
const toml = engine.toml;
const Scheduler = engine.Scheduler;
const render = engine.render;
const Input = engine.Input;
const Ui = engine.Ui;
const Audio = engine.Audio;
const Windowing = engine.Windowing;
const Assets = engine.Assets;
const World3D = engine.World3D;

var instantiated: *Summit = undefined;
pub fn singleton() *Summit {
    return instantiated;
}

const Summit = @This();
io: std.Io,
allocator: std.mem.Allocator,

running: bool,
last_frame: std.Io.Timestamp,

gpu_device: gpu.GpuDevice,
host: scripting.bind.Host,

// Subsystems
memory: Memory,
os: Os,
ui: Ui,
ecs: Ecs,
audio: Audio,
renderer: render.Renderer,
input: Input,
scheduler: Scheduler,
runtime: scripting.Runtime,
assets: Assets,
windowing: Windowing,
platform: Platform,
world_3d: World3D,

pub fn init(self: *Summit, p_init: std.process.Init) !void {
    instantiated = self;

    self.running = true;
    self.memory = try .init(p_init.gpa);
    errdefer self.memory.deinit();

    const io = p_init.io;
    self.io = io;

    var project_path: ?[]const u8 = null;
    const args = try p_init.minimal.args.toSlice(p_init.arena.allocator());
    for (args) |a| {
        if (std.mem.find(u8, a, "--project=") != null) {
            project_path = std.mem.trimStart(u8, a, "--project=");
            break;
        }
    }

    self.os = try .init(p_init, builtin.os.tag, "net.wyteroze.summit");
    try self.scheduler.init(try self.getAlloc("Scheduler"), io, &self.os);
    errdefer self.scheduler.deinit();
    try self.platform.init(try self.getAlloc("Platform"), .initSdl());
    errdefer self.platform.deinit();
    self.ecs = undefined;
    try self.ecs.init(try self.getAlloc("Ecs"));
    errdefer self.ecs.deinit();
    self.ui = try .init(&self.ecs, try self.getAlloc("Ui"));
    errdefer self.ui.deinit();
    self.gpu_device = try .init(try self.getAlloc("Gpu"), .initDiligent());
    errdefer self.gpu_device.deinit();
    self.assets = try .init(try self.getAlloc("Assets"), io, &self.gpu_device, project_path);
    errdefer self.assets.deinit();

    // Skybox
    const skybox_cubemap = try self.assets.load("asset://images/skybox_island.png");
    try skybox_cubemap.upload(.{ .is_cubemap = true });

    self.renderer = try .init(try self.getAlloc("Renderer"), &self.gpu_device, try skybox_cubemap.gpuGet(.image));
    errdefer self.renderer.deinit();
    try self.windowing.init(try self.getAlloc("Windowing"), &self.platform, &self.renderer, &self.ui);
    errdefer self.windowing.deinit();

    try self.input.init(try self.getAlloc("Input"), &self.platform, &self.ui, &self.windowing);
    errdefer self.input.deinit();

    // Create the world
    self.world_3d = try .init(
        io,
        try self.getAlloc("World3D"),
        try self.getAlloc("World3D.Physics"),
        &self.ecs,
    );
    errdefer self.world_3d.deinit();

    try self.audio.init(io, try self.getAlloc("Audio"), &self.platform);
    errdefer self.audio.deinit();

    self.host = .{ .ecs = &self.ecs, .assets = &self.assets, .input = &self.input, .ui = &self.ui, .audio = &self.audio, .windowing = &self.windowing };
    self.runtime = try .init(try self.getAlloc("LuaRuntime"), &self.host);
    errdefer self.runtime.deinit();

    // Register components
    // TODO: Register these once somewhere, and access them there
    // instead of having to do world.components.id() over and over again.

    // We don't need the connection, we don't disconnect the event during engine lifetime.
    _ = try self.platform.platform_event.connect(onPlatformEvent, self);

    try self.setupTestScene();
    self.last_frame = std.Io.Clock.awake.now(self.io);
}

pub fn deinit(self: *Summit) void {
    self.ecs.deinit();
    self.ui.deinit();
    self.audio.deinit();
    self.renderer.deinit();
    self.gpu_device.deinit();
    self.world_3d.deinit();
    self.input.deinit();
    self.scheduler.deinit();
    self.runtime.deinit();
    self.assets.deinit();
    self.windowing.deinit();
    self.platform.deinit();
    self.memory.deinit();
}

fn onPlatformEvent(self: *Summit, evt: Platform.desc.PlatformEvent) void {
    switch (evt) {
        .quit => self.running = false,
        .keyboard_key_down => |kb| if (kb.keycode == .Equals) self.memory.dumpCategories(),
        else => {},
    }
}

pub fn update(self: *Summit) void {
    const p = self.memory.pushMemoryPool();
    defer self.memory.popMemoryPool(p);

    const start = std.Io.Clock.awake.now(self.io);
    const dt = self.last_frame.durationTo(start);
    const dt_seconds: f32 = @floatCast(@as(f32, @floatFromInt(dt.toNanoseconds())) / std.time.ns_per_s);
    self.last_frame = start;

    self.audio.tick();
    self.input.tick();
    self.platform.poll();
    self.world_3d.update(dt_seconds);
    self.windowing.update();
    self.ui.update();
    self.ui.paint();
    frame.renderFrame(self) catch |e|
        std.log.err("Failed to render frame: {t}", .{e});
    frame.submitAudio(self);
    self.assets.tick(start);
}

pub fn setupTestScene(self: *Summit) !void {
    const window = try self.windowing.createWindow(.{ .title = "summit", .size = .new(1280, 720) });
    const window_2 = try self.windowing.createWindow(.{ .title = "summit 2", .size = .new(854, 480) });
    self.windowing.main_window = window;
    try window.focus();

    const world = self.world_3d.world;
    var ui = &self.ui;

    // Create a scene inside of the world
    const scene = try world.spawnEntity();

    const pos_id = world.components.id("Position").?;
    const rot_id = world.components.id("Rotation").?;
    const scale_id = world.components.id("Scale").?;
    const listener_id = world.components.id("AudioListener").?;
    const camera_id = world.components.id("Camera").?;
    const script_id = world.components.id("Script").?;
    const scene_id = world.components.id("Scene").?;
    const light_id = world.components.id("Light").?;

    // Systems
    {
        const src = try self.assets.load("asset://systems/fly_cam.luau");
        defer src.cpuRelease();
        const script = try self.runtime.loadScript("fly_cam.luau", try src.cpuGet(.script_source));
        _ = self.runtime.instantiateSystem(script, world) catch |e| std.log.err("Failed to instantiate fly system: {t}", .{e});
    }
    {
        const src = try self.assets.load("asset://systems/spin.luau");
        defer src.cpuRelease();
        const script = try self.runtime.loadScript("spin.luau", try src.cpuGet(.script_source));
        _ = self.runtime.instantiateSystem(script, world) catch |e| std.log.err("Failed to instantiate spin system: {t}", .{e});
    }

    // Make a camera for the scene
    const camera = try world.spawnEntity();
    try world.set(camera, pos_id, math.Vec3, .new(0, 0, 0));
    try world.set(camera, rot_id, math.Quat, .identity);
    try world.set(camera, scale_id, math.Vec3, .new(1, 1, 1));
    try world.set(camera, listener_id, Audio.types.AudioListener, .{});
    try world.set(camera, camera_id, World3D.types.Camera, .{});

    const camera_2 = try world.spawnEntity();
    try world.set(camera_2, pos_id, math.Vec3, .new(0, 0, 0));
    try world.set(camera_2, rot_id, math.Quat, .identity);
    try world.set(camera_2, scale_id, math.Vec3, .new(1, 1, 1));
    try world.set(camera_2, camera_id, World3D.types.Camera, .{});

    try world.set(scene, scene_id, World3D.types.Scene, .{});

    // Spawn a new entity
    const entity = try world.spawnEntity();

    const floor = try world.spawnEntity();

    const light = try world.spawnEntity();
    try world.set(light, light_id, render.types.Light, .{
        .color = .fromRgbFloat(1.0, 1.0, 1.0, 1.0),
        .intensity = 5,
        .kind = .{ .point = .{ .radius = 10 } },
    });
    try world.set(light, pos_id, math.Vec3, .zero);
    try world.setParent(light, scene);

    // Parent the component under the scene
    try world.setParent(entity, scene);

    // Scripts
    {
        const source = try self.assets.load("asset://scripts/camera.luau");
        defer source.cpuRelease();
        const script = try self.runtime.loadScript("camera.luau", try source.cpuGet(.script_source));
        try world.set(camera, script_id, scripting.Runtime.ScriptHandle, script);
        self.runtime.instantiateEntity(script, world, camera) catch |e| std.log.err("Failed to instantiate camera script: {t}", .{e});
    }
    {
        const source = try self.assets.load("asset://scripts/floor.luau");
        defer source.cpuRelease();
        const script = try self.runtime.loadScript("floor.luau", try source.cpuGet(.script_source));
        try world.set(floor, script_id, scripting.Runtime.ScriptHandle, script);
        self.runtime.instantiateEntity(script, world, floor) catch |e| std.log.err("Failed to instantiate floor script: {t}", .{e});
    }
    {
        const source = try self.assets.load("asset://scripts/teapot.luau");
        defer source.cpuRelease();
        const script = try self.runtime.loadScript("teapot.luau", try source.cpuGet(.script_source));
        try world.set(entity, script_id, scripting.Runtime.ScriptHandle, script);
        self.runtime.instantiateEntity(script, world, entity) catch |e| std.log.err("Failed to instantiate teapot script: {t}", .{e});
    }

    // Render at logical size for 3D, while UI renders at pixel size to stay crisp.
    const view_entity = try ui.world.spawnEntity();
    try ui.world.set(view_entity, ui.component_ids.render_view, Ui.types.RenderViewOptions, .{ .camera = camera, .scene = scene });
    try ui.world.set(view_entity, ui.component_ids.position, math.Vec2, .new(0, 0));
    try ui.world.set(view_entity, ui.component_ids.size, Ui.types.SizeMode, .{ .width = .fill, .height = .fill });
    try ui.world.setParent(view_entity, (try window.getElement()).entity);

    const view_entity_2 = try ui.world.spawnEntity();
    try ui.world.set(view_entity_2, ui.component_ids.render_view, Ui.types.RenderViewOptions, .{ .camera = camera_2, .scene = scene });
    try ui.world.set(view_entity_2, ui.component_ids.position, math.Vec2, .new(0, 0));
    try ui.world.set(view_entity_2, ui.component_ids.size, Ui.types.SizeMode, .{ .width = .fill, .height = .fill });
    try ui.world.setParent(view_entity_2, (try window_2.getElement()).entity);
}

fn getAlloc(self: *Summit, category: []const u8) !std.mem.Allocator {
    return self.memory.ensureGetCategoryAllocator(category);
}
