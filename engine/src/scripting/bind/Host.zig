// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
// TODO: Probably remove this and merge it with `Summit`. This is from
// back when you couldn't pass the engine state around, which you can do now.

const std = @import("std");
const zlua = @import("zlua");
const Ecs = @import("../../ecs/Ecs.zig");
const Assets = @import("../../assets/Assets.zig");
const Input = @import("../../input/Input.zig");
const Ui = @import("../../ui/Ui.zig");
const Audio = @import("../../audio/Audio.zig");
const Codec = @import("../../ecs/Codec.zig");
const render = @import("../../render/render.zig");
const Windowing = @import("../../windowing/Windowing.zig");
const Filesystem = @import("../../filesystem/Filesystem.zig");
const Perf = @import("../../perf/Perf.zig");

var key: u8 = 0;
const Host = @This();
ecs: *Ecs,
assets: *Assets,
input: *Input,
ui: *Ui,
audio: *Audio,
windowing: *Windowing,
gizmos: *render.Gizmos,
filesystem: *Filesystem,
perf: *Perf,
codecs: []const Codec = &.{},

pub fn attach(self: *Host, l: *zlua.Lua) void {
    l.pushLightUserdata(self);
    l.setPtrRaw(zlua.registry_index, &key);
}

pub fn fromState(l: *zlua.Lua) *Host {
    _ = l.getPtrRaw(zlua.registry_index, &key);
    defer l.pop(1);

    return l.toUserdata(Host, -1) catch unreachable;
}
