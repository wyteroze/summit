// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const engine = @import("../engine.zig");
const Summit = @import("Summit.zig");
const Ecs = engine.Ecs;
const Ui = engine.Ui;
const Audio = engine.Audio;
const World3D = engine.World3D;
const render = engine.render;
const math = engine.core.math;
const gpu = engine.gpu;

const WindowList = struct {
    id: u64,
    entity: Ecs.Entity,
    items: std.ArrayList(render.types.UiItem),
};
const SceneData = struct {
    lights: []const gpu.types.GpuLight,
    objects: []const render.types.RenderObject,
};

const WindowLists = std.AutoHashMap(u64, WindowList);

// Rendering

pub fn renderFrame(summit: *Summit) !void {
    const world_3d = &summit.world_3d;
    const ui = &summit.ui;
    const renderer = &summit.renderer;
    const allocator = renderer.frame_allocator.allocator();

    const defaults: World3D.collect.Defaults = .{
        .quad = renderer.default_quad,
        .image = renderer.default_image,
        .sampler = renderer.default_sampler,
    };
    const lights = try World3D.collect.lights(world_3d, allocator);
    const objects = try World3D.collect.objects(world_3d, allocator, defaults);

    var window_lists = try collectWindows(ui, allocator);
    var requests: std.ArrayList(render.types.RenderViewRequest) = .empty;
    try collectRenderViews(world_3d, ui, renderer, allocator, .{
        .lights = lights,
        .objects = objects,
    }, &window_lists, &requests);

    var window_requests: std.ArrayList(render.types.RenderWindowRequest) = .empty;
    var iter = window_lists.valueIterator();
    while (iter.next()) |wl| {
        Ui.collect.items(ui, wl.entity, &wl.items, allocator);
        try window_requests.append(allocator, .{ .window_id = wl.id, .ui_items = wl.items.items });
    }

    try renderer.render(requests.items, window_requests.items);
}

fn collectWindows(ui: *Ui, allocator: std.mem.Allocator) !WindowLists {
    const ids = ui.component_ids;

    var lists: WindowLists = .init(allocator);
    var it = ui.world.queryUnchecked(&.{ids.window}).iterator();
    while (it.next()) |e| {
        const win = ui.world.getComponentUnchecked(e, ids.window, Ui.types.Window).?;
        try lists.put(e.toU64(), .{ .id = win.id, .entity = e, .items = .empty });
    }

    return lists;
}

fn collectRenderViews(
    world_3d: *World3D,
    ui: *Ui,
    renderer: *render.Renderer,
    allocator: std.mem.Allocator,
    shared: SceneData,
    window_lists: *WindowLists,
    requests: *std.ArrayList(render.types.RenderViewRequest),
) !void {
    const ids = ui.component_ids;

    var it = ui.world.queryUnchecked(&.{ids.render_view}).iterator();
    while (it.next()) |entity| {
        const rv = ui.world.getComponentUnchecked(entity, ids.render_view, Ui.types.RenderViewOptions).?;
        // The camera and scene live in the 3D world, not the ui world.
        if (!world_3d.world.isEntityAlive(rv.camera) or !world_3d.world.isEntityAlive(rv.scene)) continue;

        const root = rootOf(ui, entity);
        const win = ui.world.getComponentUnchecked(root, ids.window, Ui.types.Window) orelse continue;
        const list = window_lists.getPtr(root.toU64()) orelse continue;

        const position = ui.world.getComponentUnchecked(entity, ids.computed_position, math.Vec2) orelse continue;
        const size = ui.world.getComponentUnchecked(entity, ids.computed_size, math.Vec2) orelse continue;

        // Render at logical size for 3D, while UI renders at pixel size to stay crisp.
        const px: [2]u32 = .{
            @max(1, @as(u32, @intFromFloat(@round(size.x * win.scale)))),
            @max(1, @as(u32, @intFromFloat(@round(size.y * win.scale)))),
        };

        const view = renderer.getView(entity.toU64()) orelse
            (renderer.createView(entity.toU64(), px, rv.camera) catch |e| {
                std.log.err("Failed to create view: {s}", .{@errorName(e)});
                continue;
            });

        view.resize(px) catch |e| {
            std.log.err("Failed to resize view: {s}", .{@errorName(e)});
            continue;
        };

        const scene = World3D.collect.scene(world_3d, rv.scene) orelse continue;
        const cam = World3D.collect.camera(world_3d, rv.camera, px) orelse continue;

        try requests.append(allocator, .{
            .frame = .{ .view_matrix = cam.view, .proj_matrix = cam.proj, .viewport_size = px },
            .scene = .{
                .ambient = scene.environment.ambient,
                .clear_color = scene.environment.clear_color,
                .lights = shared.lights,
                .objects = shared.objects,
                .ui_items = &.{},
            },
            .render_view_id = entity.toU64(),
        });

        try list.items.append(allocator, .{ .quad = .{
            .pos = position.arr(),
            .size = size.arr(),
            .texture = view.target.handle,
            .sampler = renderer.default_sampler.handle,
            .uv_size = @splat(1),
            .color = .fromRgbFloat(1, 1, 1, 1),
        } });
    }
}

fn rootOf(ui: *Ui, entity: Ecs.Entity) Ecs.Entity {
    var r = entity;
    while (ui.world.getParentUnchecked(r)) |p| r = p;
    return r;
}

// Audio

pub fn submitAudio(summit: *Summit) void {
    const world_3d = &summit.world_3d;
    const audio = &summit.audio;
    const cids = world_3d.component_ids;
    const w = world_3d.world;

    // Listener
    const listener = blk: {
        var it = w.queryUnchecked(&.{cids.audio_listener}).iterator();
        break :blk it.next();
    };
    const listener_pos: math.Vec3 = if (listener) |l| orZero(w, l, cids.position) else .zero;
    const listener_rot: math.Vec3 = if (listener) |l| orZero(w, l, cids.rotation) else .zero;
    const right = math.Quat.fromEuler(listener_rot.toRadians()).toMat4().transformDirection(.new(1, 0, 0)).normalize();
    audio.setListener(.{ .position = listener_pos, .right = right });

    // Voices
    for (0..Audio.max_voices) |i| {
        const index: u16 = @intCast(i);
        const state = audio.slot_state[index];
        if (state != .active and state != .reserved) continue;

        const t = &audio.tracks[index];
        const owner = t.owner orelse continue;
        const id = audio.getHandle(index).id;

        if (!w.isEntityAlive(owner)) {
            audio.destroy(id);
            continue;
        }
        const speaker = w.getComponentUnchecked(owner, cids.speaker, Audio.Speaker) orelse {
            audio.destroy(id);
            continue;
        };

        if (state != .active) continue;
        audio.setParams(id, .{
            .position = if (w.getComponentUnchecked(owner, cids.position, math.Vec3)) |p| p.* else null,
            .volume = t.volume * speaker.volume,
            .pitch = t.pitch,
            .loops = t.loops,
            .min_distance = speaker.min_distance,
            .max_distance = speaker.max_distance,
            .attenuation = speaker.attenuation,
        });
    }
}

fn orZero(w: *Ecs.World, e: Ecs.Entity, cid: Ecs.ComponentId) math.Vec3 {
    return if (w.getComponentUnchecked(e, cid, math.Vec3)) |v| v.* else .zero;
}
