// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const engine = @import("engine");
const Summit = engine.Summit;

pub fn main(init: std.process.Init) !void {
    engine.core.panic.setupPanic();

    var summit: Summit = undefined;
    try summit.init(init);
    defer summit.deinit();

    while (summit.running) summit.update();
}
