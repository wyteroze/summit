--[[
Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
--]]

local assets = require("@assets")
local teapot: Script = {}

function teapot.init(entity: Entity)
    print("Teapot init")
    entity:addComponent("Position", Vec3.new(0, 0, 5))
    entity:addComponent("Rotation", Vec3.new(0, 0, 0))
    entity:addComponent("Mesh", assets.load("assets://models/cube.fbx"))
    entity:addComponent("Image", assets.load("assets://images/chicken.jpg"))
    -- entity:addComponent("Spin", Vec3.new(5, 10, 15))

    entity:addComponent("Speaker", {
        volume = 1,
        minDistance = 1,
        maxDistance = 100,
        attenuation = "inverseSquare",
    })
end

return teapot

