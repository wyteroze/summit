// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Ui = @import("Ui.zig");
const Ecs = @import("../ecs/Ecs.zig");
const types = @import("types.zig");
const render = @import("../render/render.zig");
const core = @import("../core/core.zig");
const math = core.math;

pub fn items(
    ui: *Ui,
    entity: Ecs.Entity,
    items_list: *std.ArrayList(render.types.UiItem),
    allocator: std.mem.Allocator,
) void {
    const cids = ui.component_ids;
    if (!ui.world.hasComponentUnchecked(entity, cids.render_view)) {
        const pos: math.Vec2 = if (ui.world.getComponentUnchecked(entity, cids.computed_position, math.Vec2)) |p| p.* else .zero;
        const size: math.Vec2 = if (ui.world.getComponentUnchecked(entity, cids.computed_size, math.Vec2)) |p| p.* else .zero;
        const corners = if (ui.world.getComponentUnchecked(entity, cids.corner_radii, types.CornerRadii)) |c| c.* else null;
        const borders = if (ui.world.getComponentUnchecked(entity, cids.borders, types.Borders)) |b| b.* else null;
        const image = if (ui.world.getComponentUnchecked(entity, cids.image, types.Image)) |i| i.* else null;
        const color: core.Color = if (ui.world.getComponentUnchecked(entity, cids.color, core.Color)) |c|
            c.*
        else if (image != null)
            .fromRgbFloat(1.0, 1.0, 1.0, 1.0)
        else
            .fromRgbFloat(1.0, 1.0, 1.0, 0.0);

        const texture = if (image) |i| blk: {
            break :blk ((i.source orelse break :blk null).ensureGpuGet(.image, .{}) catch break :blk null).handle;
        } else null;
        const uv_pos: math.Vec2 = if (image) |i| i.crop.min else .zero;
        const uv_size: math.Vec2 = if (image) |i| i.crop.max.sub(i.crop.min) else .one;
        const corners_max = @min(size.x / 2, size.y / 2);

        items_list.append(allocator, .{
            .quad = .{
                .pos = pos.arr(),
                .size = size.arr(),
                .color = color.srgbDecode(),
                .texture = texture,
                .uv_pos = uv_pos.arr(),
                .uv_size = uv_size.arr(),
                .corners = if (corners) |c| .{
                    @min(c.top_left, corners_max),
                    @min(c.top_right, corners_max),
                    @min(c.bottom_left, corners_max),
                    @min(c.bottom_right, corners_max),
                } else @splat(0),
                .borders = if (borders) |b| .{
                    @min(b.top, Ui.border_max),
                    @min(b.bottom, Ui.border_max),
                    @min(b.left, Ui.border_max),
                    @min(b.right, Ui.border_max),
                } else @splat(0),
                .border_color = if (borders) |b| b.color else .fromRgbFloat(0, 0, 0, 0),
            },
        }) catch @panic("Out of memory");

        if (ui.world.getComponentUnchecked(entity, cids.text, types.Text)) |txt| {
            if (ui.world.getComponentUnchecked(entity, cids.computed_text_layout, types.ComputedTextLayout)) |ct| {
                if (txt.font) |f| if (f.ensureGpuGet(.font, .{}) catch null) |atlas| {
                    for (ct.quads) |quad| {
                        items_list.append(allocator, .{ .quad = .{
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

        if (ui.world.getComponentUnchecked(entity, cids.painter, Ui.Painter)) |settings| {
            if (ui.painters.get(entity.toU64())) |st| {
                if (st.mesh.indices.items.len > 0) items_list.append(allocator, .{ .painter = .{
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

    for (ui.world.getChildrenUnchecked(entity)) |child| {
        items(ui, child, items_list, allocator);
    }
}
