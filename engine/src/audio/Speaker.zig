// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Ecs = @import("../ecs/Ecs.zig");
const bind = @import("../scripting/bind/bind.zig");
const Assets = @import("../assets/Assets.zig");
const types = @import("types.zig");
const Audio = @import("Audio.zig");

const min_volume = 0.0;
const max_volume = 10.0;

const Speaker = @This();
volume: f32 = 1,
min_distance: f32 = 1,
max_distance: f32 = 100,
attenuation: types.Attenuation = .inverse_square,

pub const sub_api = bind.record(Speaker, .{ .handle = SpeakerHandle });

pub const SpeakerHandle = struct {
    entity: Ecs.Entity,
    audio: *Audio,

    pub fn get(self: SpeakerHandle, ecs: *Ecs) !?*Speaker {
        // TODO!!!!!!!!!!!!!!!!!!! Stop querying `id` so often, create it once then save it somewhere
        // like a struct instead of having to do this so often (plus it looks ugly)
        const w = try ecs.getWorld(self.entity.world_id);
        const id = w.componentId("Speaker") orelse unreachable;
        return try w.getComponent(self.entity, id, Speaker);
    }

    pub fn require(self: SpeakerHandle, ecs: *Ecs) !*Speaker {
        return (try self.get(ecs)) orelse error.SpeakerRemoved;
    }

    pub fn isAlive(self: SpeakerHandle, ecs: *Ecs) bool {
        return (self.get(ecs) catch return false) != null;
    }

    pub fn load(self: SpeakerHandle, asset: Assets.AssetHandle, ecs: *Ecs) !Audio.track.TrackHandle {
        _ = try self.require(ecs);
        return self.audio.create(asset, self.entity);
    }

    pub fn play(self: SpeakerHandle, asset: Assets.AssetHandle, ecs: *Ecs) !Audio.track.TrackHandle {
        const t = try self.load(asset, ecs);
        try self.audio.start(t, .{});

        return t;
    }

    pub fn fromComponent(host: anytype, e: Ecs.Entity) SpeakerHandle {
        return .{ .entity = e, .audio = host.audio };
    }

    pub const sub_api = bind.handle(SpeakerHandle, .{
        .name = "Speaker",
        .alive = bind.func("isAlive", SpeakerHandle.isAlive),
        .methods = &.{
            bind.func("play", SpeakerHandle.play),
        },
        .props = &.{
            bind.prop("volume", struct {
                fn get(self: SpeakerHandle, ecs: *Ecs) !f32 {
                    return (try self.require(ecs)).volume;
                }
            }.get, struct {
                fn set(self: SpeakerHandle, volume: f32, ecs: *Ecs) !void {
                    (try self.require(ecs)).volume = std.math.clamp(volume, min_volume, max_volume);
                }
            }.set),
            bind.prop("minDistance", struct {
                fn get(self: SpeakerHandle, ecs: *Ecs) !f32 {
                    return (try self.require(ecs)).min_distance;
                }
            }.get, struct {
                fn set(self: SpeakerHandle, distance: f32, ecs: *Ecs) !void {
                    (try self.require(ecs)).min_distance = @max(distance, 0);
                }
            }.set),
            bind.prop("maxDistance", struct {
                fn get(self: SpeakerHandle, ecs: *Ecs) !f32 {
                    return (try self.require(ecs)).max_distance;
                }
            }.get, struct {
                fn set(self: SpeakerHandle, distance: f32, ecs: *Ecs) !void {
                    (try self.require(ecs)).max_distance = @max(distance, 0);
                }
            }.set),
            bind.prop("attenuation", struct {
                fn get(self: SpeakerHandle, ecs: *Ecs) !Audio.types.Attenuation {
                    return (try self.require(ecs)).attenuation;
                }
            }.get, struct {
                fn set(self: SpeakerHandle, attenuation: Audio.types.Attenuation, ecs: *Ecs) !void {
                    (try self.require(ecs)).attenuation = attenuation;
                }
            }.set),
        },
    });
};
