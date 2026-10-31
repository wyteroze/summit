// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
//! A `Ui` component used for drawing shapes on-screen.
//!
//! Drawing in a `Painter` is different from using regular elements
//! because it allows you to draw things that don't make sense as individual `Ui` elements, like bezier curves.
//!
//! It also doesn't require its layout to be processed and has less customizability, sacrificing expressiveness for being much faster.

const std = @import("std");
const ecs = @import("../ecs/ecs.zig");
const core = @import("../core/core.zig");
const Ui = @import("Ui.zig");
const types = @import("types.zig");
const render = @import("../render/render.zig");
const PainterMesh = render.types.PainterMesh;
const math = core.math;

/// The type of the `Painter.on_paint` event.
pub const OnPaintEvent = core.signal.Signal(.{});

pub const PainterState = struct {
    entity: ecs.Entity,
    /// The commands that this `Painter` has accumulated.
    /// These control what the `Painter` actually draws when it is rendered.
    commands: std.ArrayList(types.PainterCommand) = .empty,
    /// Holds the mesh for this Painter. During tessellation, items like lines,
    /// rectangles, and curves get turned into vertices that the GPU can actually render.
    mesh: render.types.PainterMesh = .{},
    /// Fired when `invalidate` is called manually, or when this `Painter`'s size has changed.
    on_paint: ?*OnPaintEvent = null,
    /// The last size that this Painter has drawn for. If the parent UI element's
    /// size is different from this, all commands are cleared and `on_paint` is fired.
    drawn_size: core.math.Vec2 = .zero,
    /// Whether this `Painter` has been updated since the last time it was rendered.
    dirty: bool = true,
    /// Whether this `Painter`'s commands need to be rebuilt, which means firing the `on_paint` event.
    /// This is set to true when the size has changed, or `invalidate` was called.
    /// This exists instead of calling `on_paint` directly to avoid calling it unnecessarily.
    needs_paint: bool = true,

    pub fn deinit(self: *PainterState, alloc: std.mem.Allocator) void {
        self.commands.deinit(alloc);
        self.mesh.deinit(alloc);
        if (self.on_paint) |s| s.retire();
    }
};

const Painter = @This();
/// Whether items outside of the `Painter` are visible outside of its extents.
clip: bool = true,
/// Whether the `Painter`'s contents are anti-aliased. Disabling this can be
/// useful for some things, like keeping pixel art crisp.
antialiased: bool = true,

const bind = @import("../scripting/bind/bind.zig");
pub const sub_api = bind.record(Painter, .{ .handle = PainterHandle });

pub const PainterHandle = struct {
    ui: *Ui,
    entity: ecs.Entity,

    pub fn fromComponent(host: anytype, e: ecs.Entity) PainterHandle {
        return .{ .ui = host.ui, .entity = e };
    }

    fn get(self: PainterHandle) ?*Painter {
        if (!self.entity.isAlive()) return null;
        return self.entity.getComponent(self.ui.component_ids.painter, Painter);
    }

    pub fn isAlive(self: PainterHandle) bool {
        return self.get() != null;
    }

    fn state(self: PainterHandle) !*PainterState {
        if (self.get() == null) return error.PainterRemoved;
        return self.ui.painterState(self.entity);
    }

    /// Draws a line with the given settings.
    pub fn drawLine(self: PainterHandle, start: math.Vec2, end: math.Vec2, thickness: f32, color: core.Color) !void {
        const s = try self.state();
        try s.commands.append(self.ui.allocator, .{ .line = .{ .start = start, .end = end, .thickness = thickness, .color = color } });
        s.dirty = true;
    }

    /// Draws a rectangle with the given settings.
    pub fn drawRectangle(self: PainterHandle, position: math.Vec2, size: math.Vec2, color: core.Color) !void {
        const s = try self.state();
        try s.commands.append(self.ui.allocator, .{ .rectangle = .{ .position = position, .size = size, .color = color } });
        s.dirty = true;
    }

    pub fn clear(self: PainterHandle) !void {
        const s = try self.state();
        s.commands.clearRetainingCapacity();
        s.dirty = true;
    }

    /// Invalidates this `Painter`, clearing all commands from this `Painter` and firing the `on_paint` event.
    pub fn invalidate(self: PainterHandle) !void {
        (try self.state()).needs_paint = true;
    }

    fn onPaint(self: PainterHandle) !*OnPaintEvent {
        const s = try self.state();
        if (s.on_paint == null)
            s.on_paint = try OnPaintEvent.create(self.ui.allocator, &self.ui.world.dispatcher);
        return s.on_paint.?;
    }

    pub const sub_api = bind.handle(PainterHandle, .{
        .name = "Painter",
        .alive = bind.func("IsAlive", PainterHandle.isAlive),
        .signals = &.{bind.signal("OnPaint", PainterHandle.onPaint)},
        .methods = &.{
            bind.func("DrawLine", PainterHandle.drawLine),
            bind.func("DrawRectangle", PainterHandle.drawRectangle),
            bind.func("Clear", PainterHandle.clear),
            bind.func("Invalidate", PainterHandle.invalidate),
        },
        .props = &.{
            bind.prop("Clip", struct {
                fn get(self: PainterHandle) !bool {
                    return (self.get() orelse return error.PainterRemoved).clip;
                }
            }.get, struct {
                fn set(self: PainterHandle, v: bool) !void {
                    (self.get() orelse return error.PainterRemoved).clip = v;
                }
            }.set),
            bind.prop("Antialiased", struct {
                fn get(self: PainterHandle) !bool {
                    return (self.get() orelse return error.PainterRemoved).antialiased;
                }
            }.get, struct {
                fn set(self: PainterHandle, v: bool) !void {
                    (self.get() orelse return error.PainterRemoved).antialiased = v;
                }
            }.set),
        },
    });
};
