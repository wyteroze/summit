-- Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

local spin: System = {}
spin.query = { "Speaker" }

function spin.init(world: World)
    -- world:RegisterComponent("Spin", "Vec3")
end

function spin.update(entity: Entity, dt: number)
    entity.Components.Rotation += Vec3.new(dt, dt, dt) * Vec3.new(5, 10, 15)
end

return spin
