-- Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
--!native

const ENTITY_COLUMNS, ENTITY_ROWS = 12, 12
local assets = require("@assets")
local spin: System = {}
spin.query = { "Spin" }

function spin.init()
    world:registerComponent("Spin")
    for c = 1, ENTITY_COLUMNS do
        for r = 1, ENTITY_ROWS do
            local entity = world:spawnEntity()
            entity:addComponent("Position", Vec3.new((r-ENTITY_ROWS/2)*1.5, (c-ENTITY_COLUMNS/2)*1.5, 5))
            entity:addComponent("Rotation", Quat.identity)
            entity:addComponent("Mesh", assets.load("asset://models/cube.fbx"))
            entity:addComponent("Image", assets.load("asset://images/chicken.jpg"))
            entity:addComponent("Spin", Vec3.new(1, 2, 3))
        end
    end
end

function spin.update(entity: Entity, dt: number)
    local delta = Quat.fromEuler(entity.Spin:scale(dt))
    entity.Rotation = (entity.Rotation * delta):normalize()
end

return spin
