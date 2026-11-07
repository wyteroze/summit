// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const Ecs = @import("Ecs.zig");

const EntityIterator = @This();
world: *const Ecs.World,
index: usize = 0,

pub fn next(self: *EntityIterator) ?Ecs.Entity {
    while (self.index < self.world.alive.items.len) {
        const i = self.index;
        self.index += 1;
        if (!self.world.alive.items[i]) continue;
        return .{
            .index = @intCast(i),
            .generation = self.world.generations.items[i],
            .world_id = self.world.id,
        };
    }
    return null;
}
