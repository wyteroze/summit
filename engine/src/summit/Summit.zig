// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
//! Holds the engine state of Summit.

const std = @import("std");
const builtin = @import("builtin");
const engine = @import("../engine.zig");
const Memory = @import("Memory.zig");
const Platform = engine.Platform;
const gpu = engine.gpu;
const ecs = engine.ecs;
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

const Camera = struct {
    fov: f32 = 90,
    near_plane: f32 = 0.1,
};

var instantiated: *Summit = undefined;
pub fn singleton() *Summit {
    return instantiated;
}

const Summit = @This();
io: std.Io,
allocator: std.mem.Allocator,

running: bool,
last_frame: std.Io.Timestamp,

world: ecs.World,
gpu_device: gpu.GpuDevice,
host: scripting.bind.Host,

// Subsystems
memory: Memory,
os: Os,
ui: Ui,
audio: Audio,
renderer: render.Renderer,
input: Input,
scheduler: Scheduler,
runtime: scripting.Runtime,
assets: Assets,
windowing: Windowing,
platform: Platform,

pub fn init(self: *Summit, p_init: std.process.Init) !void {
    instantiated = self;

    self.running = true;
    self.memory = try .init(p_init.gpa);

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
    try self.platform.init(try self.getAlloc("Platform"), .initSdl());
    self.ui = try .init(try self.getAlloc("Ui"));
    self.gpu_device = try .init(try self.getAlloc("Gpu"), .initDiligent());
    self.assets = try .init(try self.getAlloc("Assets"), io, &self.gpu_device, project_path);
    
    // Skybox
    const skybox_cubemap = try self.assets.load("assets://images/skybox_island.png");
    try skybox_cubemap.upload(.{ .is_cubemap = true });

    self.renderer = try .init(try self.getAlloc("Renderer"), &self.gpu_device, try skybox_cubemap.gpuGet(.image));
    try self.windowing.init(try self.getAlloc("Windowing"), &self.platform, &self.renderer, &self.ui);

    try self.input.init(try self.getAlloc("Input"), &self.platform, &self.ui, &self.windowing);

    // Create the world
    self.world = .init(try self.getAlloc("ECSWorld"));

    try self.audio.init(io, try self.getAlloc("Audio"), &self.platform);

    self.host = .{ .world = &self.world, .assets = &self.assets, .input = &self.input, .ui = &self.ui, .audio = &self.audio, .windowing = &self.windowing };
    self.runtime = try .init(try self.getAlloc("LuaRuntime"), &self.host);
    
    // Register components
    // TODO: Register these once somewhere, and access them there
    // instead of having to do world.components.id() over and over again.
    _ = try self.world.registerComponent(Ui.types.Scene, "Scene"); // For organizing collections of entities
    _ = try self.world.registerComponent(engine.Assets.AssetHandle, "Mesh"); // For giving an entity a mesh appearance
    _ = try self.world.registerComponent(engine.Assets.AssetHandle, "Image"); // For giving an entity an image appearance (or a texture, if it has a mesh)
    _ = try self.world.registerComponent(math.Vec3, "Position"); // For moving entities
    _ = try self.world.registerComponent(math.Vec3, "Rotation"); // For rotating entites (Euler)
    _ = try self.world.registerComponent(math.Vec3, "Scale"); // For scaling entities
    _ = try self.world.registerComponent(scripting.Runtime.ScriptHandle, "Script"); // For giving entities behavior
    _ = try self.world.registerComponent(render.types.Light, "Light"); // For creating sources of illumination
    _ = try self.world.registerComponent([]const u8, "Name"); // For naming an entity (we don't use it, but lua does)
    _ = try self.world.registerComponent(Audio.types.AudioListener, "AudioListener");
    _ = try self.world.registerComponent(Audio.Speaker, "Speaker");
    _ = try self.world.registerComponent(Camera, "Camera");

    // We don't need the connection, we don't disconnect the event during engine lifetime.
    _ = try self.platform.platform_event.connect(onPlatformEvent, self);

    try self.setupTestScene();
    self.last_frame = std.Io.Clock.awake.now(self.io);
}

pub fn deinit(self: *Summit) void {
    self.world.deinit();
    self.ui.deinit();
    self.audio.deinit();
    self.renderer.deinit();
    self.gpu_device.deinit();
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
        .quit => { self.running = false; return; },
        else => {}
    }
}

pub fn update(self: *Summit) void {
    const start = std.Io.Clock.awake.now(self.io);
    const dt = self.last_frame.durationTo(start);
    const dt_seconds: f32 = @floatCast(@as(f32, @floatFromInt(dt.toNanoseconds())) / std.time.ns_per_s);
    self.last_frame = start;

    self.audio.tick();
    self.input.tick();
    self.platform.poll();
    self.world.update(dt_seconds);
    self.windowing.update();
    self.ui.update();
    self.ui.paint();
    self.submitToRenderer();
    self.submitToAudio();
    self.assets.tick(start);
}

pub fn setupTestScene(self: *Summit) !void {
    const window = try self.windowing.createWindow(.{ .title = "summit", .size = .new(1280, 720) });
    const window_2 = try self.windowing.createWindow(.{ .title = "summit 2", .size = .new(854, 480) });
    self.windowing.main_window = window;
    try window.focus();

    var world = &self.world;
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
        const src = try self.assets.load("assets://systems/fly_cam.luau");
        defer src.cpuRelease();
        const script = try self.runtime.loadScript("fly_cam.luau", try src.cpuGet(.script_source));
        _ = self.runtime.instantiateSystem(script, world) catch |e| std.log.err("Failed to instantiate fly system: {t}", .{e});
    }
    {
        const src = try self.assets.load("assets://systems/spin.luau");
        defer src.cpuRelease();
        const script = try self.runtime.loadScript("spin.luau", try src.cpuGet(.script_source));
        _ = self.runtime.instantiateSystem(script, world) catch |e| std.log.err("Failed to instantiate spin system: {t}", .{e});
    }

    // Make a camera for the scene
    const camera = try world.spawnEntity();
    try world.set(camera, pos_id, math.Vec3, .new(0, 0, 0));
    try world.set(camera, rot_id, math.Vec3, .new(0, 0, 0));
    try world.set(camera, scale_id, math.Vec3, .new(1, 1, 1));
    try world.set(camera, listener_id, Audio.types.AudioListener, .{});
    try world.set(camera, camera_id, Camera, .{});

    const camera_2 = try world.spawnEntity();
    try world.set(camera_2, pos_id, math.Vec3, .new(0, 0, 0));
    try world.set(camera_2, rot_id, math.Vec3, .new(0, 0, 0));
    try world.set(camera_2, scale_id, math.Vec3, .new(1, 1, 1));
    try world.set(camera_2, camera_id, Camera, .{});

    try world.set(scene, scene_id, Ui.types.Scene, .{});

    // Spawn a new entity
    const entity = try world.spawnEntity();

    const light = try world.spawnEntity();
    try world.set(light, light_id, render.types.Light, .{
        .color = .fromRgbFloat(1.0, 1.0, 1.0, 1.0),
        .intensity = 5,
        .kind = .{ .point = .{ .radius = 10 } }
    });
    try world.set(light, pos_id, math.Vec3, .zero);
    try light.setParent(scene);

    // Parent the component under the scene
    try entity.setParent(scene);

    // Scripts
    {
        const source = try self.assets.load("assets://scripts/camera.luau");
        defer source.cpuRelease();
        const script = try self.runtime.loadScript("camera.luau", try source.cpuGet(.script_source));
        try world.set(camera, script_id, scripting.Runtime.ScriptHandle, script);
        self.runtime.instantiateEntity(script, camera) catch |e| std.log.err("Failed to instantiate camera script: {t}", .{e});
    }
    {
        const source = try self.assets.load("assets://scripts/teapot.luau");
        defer source.cpuRelease();
        const script = try self.runtime.loadScript("teapot.luau", try source.cpuGet(.script_source));
        try world.set(entity, script_id, scripting.Runtime.ScriptHandle, script);
        self.runtime.instantiateEntity(script, entity) catch |e| std.log.err("Failed to instantiate teapot script: {t}", .{ e });
    }


    // Render at logical size for 3D, while UI renders at pixel size to stay crisp.
    const view_entity = try ui.world.spawnEntity();
    try ui.world.set(view_entity, ui.component_ids.render_view, Ui.types.RenderViewOptions, .{ .camera = camera, .scene = scene });
    try ui.world.set(view_entity, ui.component_ids.position, math.Vec2, .new(0, 0));
    try ui.world.set(view_entity, ui.component_ids.size, Ui.types.SizeMode, .{ .width = .fill, .height = .fill });
    try view_entity.setParent((try window.getElement()).entity);

    const view_entity_2 = try ui.world.spawnEntity();
    try ui.world.set(view_entity_2, ui.component_ids.render_view, Ui.types.RenderViewOptions, .{ .camera = camera_2, .scene = scene });
    try ui.world.set(view_entity_2, ui.component_ids.position, math.Vec2, .new(0, 0));
    try ui.world.set(view_entity_2, ui.component_ids.size, Ui.types.SizeMode, .{ .width = .fill, .height = .fill });
    try view_entity_2.setParent((try window_2.getElement()).entity);
}

fn getAlloc(self: *Summit, category: []const u8) !std.mem.Allocator {
    return self.memory.ensureGetCategoryAllocator(category);
}

fn collectUiItems(
    ui: *Ui,
    entity: ecs.Entity,
    items: *std.ArrayList(render.types.UiItem),
    alloc: std.mem.Allocator,
) void {
    const cids = ui.component_ids;
    if (!ui.world.hasComponent(entity, cids.render_view)) {
        const pos: math.Vec2 = if (ui.world.getComponent(entity, cids.computed_position, math.Vec2)) |p| p.* else .zero;
        const size: math.Vec2 = if (ui.world.getComponent(entity, cids.computed_size, math.Vec2)) |p| p.* else .zero;
        const corners = if (ui.world.getComponent(entity, cids.corner_radii, Ui.types.CornerRadii)) |c| c.* else null;
        const borders = if (ui.world.getComponent(entity, cids.borders, Ui.types.Borders)) |b| b.* else null;
        const image = if (ui.world.getComponent(entity, cids.image, Ui.types.Image)) |i| i.* else null;
        const color: core.Color = if (ui.world.getComponent(entity, cids.color, core.Color)) |c| c.*
            else if (image != null) .fromRgbFloat(1.0, 1.0, 1.0, 1.0)
            else .fromRgbFloat(1.0, 1.0, 1.0, 0.0);

        const texture = if (image) |i| blk: { break :blk ((i.source orelse break :blk null).ensureGpuGet(.image, .{}) catch break :blk null).handle; } else null;
        const uv_pos: math.Vec2 = if (image) |i| i.crop.min else .zero;
        const uv_size: math.Vec2 = if (image) |i| i.crop.max.sub(i.crop.min) else .one;

        items.append(alloc, .{ .quad = .{
            .pos = pos.arr(),
            .size = size.arr(),
            .color = color.srgbDecode(),
            .texture = texture,
            .uv_pos = uv_pos.arr(),
            .uv_size = uv_size.arr(),
            .corners = if (corners) |c| blk: {
                const m = @min(size.x/2, size.y/2);
                break :blk .{
                    @min(c.top_left, m),
                    @min(c.top_right, m),
                    @min(c.bottom_left, m),
                    @min(c.bottom_right, m)
                };
            } else @splat(0),
            .borders = if (borders) |b| blk: {
                // Max, should probably be in a better place.
                const m = 100;
                break :blk .{
                    @min(b.top, m),
                    @min(b.bottom, m),
                    @min(b.left, m),
                    @min(b.right, m)
                };
            } else @splat(0),
            .border_color = if (borders) |b| b.color else .fromRgbFloat(0, 0, 0, 0)
        } }) catch @panic("Out of memory");

        if (ui.world.getComponent(entity, cids.text, Ui.types.Text)) |txt| {
            if (ui.world.getComponent(entity, cids.computed_text_layout, Ui.types.ComputedTextLayout)) |ct| {
                if (txt.font) |f| if (f.ensureGpuGet(.font, .{}) catch null) |atlas| {
                    for (ct.quads) |quad| {
                        items.append(alloc, .{ .quad = .{
                            .pos = quad.pos,
                            .size = quad.size,
                            .color = txt.color.srgbDecode(),
                            .uv_pos = quad.uv_pos,
                            .uv_size = quad.uv_size,
                            .sampler = atlas.sampler.handle,
                            .texture = atlas.texture.handle,
                            .is_text = true,
                        } }) catch @panic("Out of memory");
                    }
                };
            }
        }

        if (ui.world.getComponent(entity, cids.painter, Ui.Painter)) |settings| {
            if (ui.painters.get(entity.toU64())) |st| {
                if (st.mesh.indices.items.len > 0) items.append(alloc, .{ .painter = .{
                    .origin = pos.arr(),
                    .size = size.arr(),
                    .vertices = st.mesh.vertices.items,
                    .indices = st.mesh.indices.items,
                    .clip = settings.clip,
                    .antialiased = settings.antialiased,
                } }) catch @panic("Out of memory");
            }
        }
    }

    for (entity.getChildren()) |child| {
        collectUiItems(ui, child, items, alloc);
    }
}

fn submitToRenderer(self: *Summit) void {
    const w = &self.world;
    const ui = &self.ui;
    const renderer = &self.renderer;
    const allocator = renderer.frame_allocator.allocator();

    const mesh_id = w.components.id("Mesh").?;
    const image_id = w.components.id("Image").?;
    const pos_id = w.components.id("Position").?;
    const rot_id = w.components.id("Rotation").?;
    const scale_id = w.components.id("Scale").?;
    const scene_id = w.components.id("Scene").?;
    const light_id = w.components.id("Light").?;
    const camera_id = w.components.id("Camera").?;

    var objects: std.ArrayList(render.types.RenderObject) = .empty;
    var lights: std.ArrayList(gpu.types.GpuLight) = .empty;

    var requests: std.ArrayList(render.types.RenderViewRequest) = .empty;

    // 3D world

    const light_query = w.query(&.{ light_id });
    var light_iter = light_query.iterator();
    while (light_iter.next()) |entity| {
        const l = w.getComponent(entity, light_id, render.types.Light).?;
        const pos: math.Vec3 = if (w.getComponent(entity, pos_id, math.Vec3)) |p| p.* else .zero;
        const rot: math.Vec3 = if (w.getComponent(entity, rot_id, math.Vec3)) |r| r.* else .zero;

        const pos_or_dir = switch (l.kind) {
            .point => pos,
            .directional => blk: {
                const rot_mat = math.Quat.fromEuler(rot.toRadians()).toMat4();
                break :blk rot_mat.transformDirection(.new(0, 0, 1)).normalize();
            }
        };

        const rgb = l.color.srgbDecode();
        lights.append(allocator, .{
            .position_or_dir = pos_or_dir.arr(),
            .kind = @intFromEnum(l.kind),
            .color = .{ rgb.r, rgb.g, rgb.b },
            .intensity = l.intensity,
            .radius = switch (l.kind) { .point => |pp| pp.radius, .directional => 0 },
        }) catch @panic("Out of memory");
    }

    // TODO: Make querying better. Quite limited right now
    const query = w.query(&.{ mesh_id, image_id });

    var iter = query.iterator();
    while (iter.next()) |entity| {
        const mesh = w.getComponent(entity, mesh_id, engine.Assets.AssetHandle);
        const image = w.getComponent(entity, image_id, engine.Assets.AssetHandle);

        // No visual appearance
        if (mesh == null and image == null) continue;

        // This is so that if you have an image with no mesh, it's like a 2d plane in 3d space.
        // Could probably be convenient for 2D games, idk
        const mesh_data = if (mesh) |m| m.ensureGpuGet(.mesh, .{}) catch continue else renderer.default_quad;
        // Mesh with no image = plain white
        const image_data = if (image) |i| i.ensureGpuGet(.image, .{}) catch continue else renderer.default_image;
        
        const rot: math.Vec3 = if (w.getComponent(entity, rot_id, math.Vec3)) |r| r.* else .zero;
        const pos: math.Vec3 = if (w.getComponent(entity, pos_id, math.Vec3)) |p| p.* else .zero;
        const scale: math.Vec3 = if (w.getComponent(entity, scale_id, math.Vec3)) |scale| scale.* else .one;
        // Not visible (or invalid), don't waste resources rendering it.
        if (scale.x <= 0 or scale.y <= 0 or scale.z <= 0) continue;
        
        const model: math.Mat4 = .fromTRS(pos, .fromEuler(rot.toRadians()), scale);
        objects.append(allocator, .{ 
            .model = model, 
            .mesh = mesh_data, 
            .material = .{ 
                .image = image_data, 
                .sampler = renderer.default_sampler 
            }
        }) catch @panic("Out of memory");
    }

    const ui_cids = ui.component_ids;

    var window_lists: std.array_hash_map.Auto(u64, struct { id: u64, entity: ecs.Entity, items: std.ArrayList(render.types.UiItem) }) = .{};
    {
        var it = ui.world.query(&.{ ui_cids.window }).iterator();
        while (it.next()) |e| {
            const win = ui.world.getComponent(e, ui_cids.window, Ui.types.Window).?;
            window_lists.put(allocator, e.toU64(), .{ .id = win.id, .entity = e, .items = .empty }) catch @panic("Out of memory");
        }
    }

    // Collect RenderViews
    {
        const q =  ui.world.query(&.{ ui_cids.render_view });

        var it = q.iterator();
        while (it.next()) |entity| {
            const rv = ui.world.getComponent(entity, ui_cids.render_view, Ui.types.RenderViewOptions).?;
            if (!rv.camera.isAlive() or !rv.scene.isAlive()) continue;

            const root = blk: {
                var r = entity;
                while (r.getParent()) |p| r = p;

                break :blk r;
            };
            const win = ui.world.getComponent(root, ui_cids.window, Ui.types.Window) orelse continue;
            const list = window_lists.getPtr(root.toU64()) orelse continue;

            const position = ui.world.getComponent(entity, ui_cids.computed_position, math.Vec2) orelse continue;
            const size = ui.world.getComponent(entity, ui_cids.computed_size, math.Vec2) orelse continue;

            const px: [2]u32 = .{
                @max(1, @as(u32, @intFromFloat(@round(size.x * win.scale)))),
                @max(1, @as(u32, @intFromFloat(@round(size.y * win.scale)))),
            };

            const view = renderer.getView(entity.toU64()) orelse
                (renderer.createView(entity.toU64(), px, rv.camera) catch |e| {
                    std.log.err("Failed to create view: {s}", .{ @errorName(e) });
                    continue;
                });

            view.resize(px) catch |e| {
                std.log.err("Failed to resize view: {s}", .{ @errorName(e) });
                continue;
            };

            const scene = w.getComponent(rv.scene, scene_id, Ui.types.Scene) orelse continue;
            const cam_settings = w.getComponent(rv.camera, camera_id, Camera) orelse continue;
            const cam_pos: math.Vec3 = if (w.getComponent(rv.camera, pos_id, math.Vec3)) |p| p.* else .zero;
            const cam_rot: math.Vec3 = if (w.getComponent(rv.camera, rot_id, math.Vec3)) |r| r.* else .zero;

            const view_mat = math.Mat4.fromTRS(cam_pos, .fromEuler(cam_rot.toRadians()), .one).invertRT();
            const proj: math.Mat4 = .perspectiveReversedZInf(
                std.math.degreesToRadians(cam_settings.fov),
                @as(f32, @floatFromInt(px[0])) / @as(f32, @floatFromInt(px[1])),
                cam_settings.near_plane,
            );

            requests.append(allocator, .{
                .frame = .{ .view_matrix = view_mat, .proj_matrix = proj, .viewport_size = px },
                .scene = .{ .ambient = scene.environment.ambient, .clear_color = scene.environment.clear_color,
                            .lights = lights.items, .objects = objects.items, .ui_items = &.{} },
                .render_view_id = entity.toU64(),
            }) catch @panic("Out of memory");

            list.items.append(allocator, .{ .quad = .{
                .pos = position.arr(),
                .size = size.arr(),
                .texture = view.target.handle,
                .sampler = renderer.default_sampler.handle,
                .uv_size = @splat(1),
                .color = .fromRgbFloat(1, 1, 1, 1),
            } }) catch @panic("Out of memory");
        }
    }

    var window_requests: std.ArrayList(render.types.RenderWindowRequest) = .empty;
    for (window_lists.values()) |*wl| {
        collectUiItems(ui, wl.entity, &wl.items, allocator);
        window_requests.append(allocator, .{ .window_id = wl.id, .ui_items = wl.items.items }) catch @panic("Out of memory");
    }

    renderer.render(requests.items, window_requests.items) catch |e| std.log.err("render() failed: {s}", .{ @errorName(e) });
}

fn submitToAudio(self: *Summit) void {
    const w = &self.world;
    const audio = &self.audio;

    const speaker_id = w.components.id("Speaker").?;
    const listener_id = w.components.id("AudioListener").?;
    const pos_id = w.components.id("Position").?;
    const rot_id = w.components.id("Rotation").?;

    const listener = blk: {
        var it = w.query(&.{ listener_id }).iterator();
        break :blk if (it.next()) |e| e else null;
    };
    const listener_pos: math.Vec3 = if (listener) |l| if (w.getComponent(l, pos_id, math.Vec3)) |p| p.* else .zero else .zero;
    const listener_rot: math.Vec3 = if (listener) |l| if (w.getComponent(l, rot_id, math.Vec3)) |r| r.* else .zero else .zero;
    const right = math.Quat.fromEuler(listener_rot.toRadians()).toMat4().transformDirection(.new(1, 0, 0)).normalize();
    audio.setListener(.{ .position = listener_pos, .right = right });

    for (0..Audio.max_voices) |i| {
        const index: u16 = @intCast(i);
        const state = audio.slot_state[index];
        if (state != .active and state != .reserved) continue;

        const t = &audio.tracks[index];
        const owner = t.owner orelse continue;
        const id = audio.getHandle(index).id;

        if (!owner.isAlive()) { audio.destroy(id); continue; }
        const speaker = w.getComponent(owner, speaker_id, Audio.Speaker) orelse {
            audio.destroy(id);
            continue;
        };

        if (state != .active) continue;

        audio.setParams(id, .{
            .position = if (w.getComponent(owner, pos_id, math.Vec3)) |p| p.* else null,
            .volume = t.volume * speaker.volume,
            .pitch = t.pitch,
            .loops = t.loops,
            .min_distance = speaker.min_distance,
            .max_distance = speaker.max_distance,
            .attenuation = speaker.attenuation,
        });
    }
}
