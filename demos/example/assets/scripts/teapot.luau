--[[
Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
--]]

local assets = require("@assets")
local teapot: Script = {}

function teapot.init(entity: Entity)
    print("Teapot init")
    entity:AddComponent("Position", Vec3.new(0, 0, 5))
    entity:AddComponent("Rotation", Vec3.new(0, 0, 0))
    entity:AddComponent("Mesh", assets.load("assets://models/cube.fbx"))
    entity:AddComponent("Image", assets.load("assets://images/chicken.jpg"))
    -- entity:AddComponent("Spin", Vec3.new(5, 10, 15))

    entity:AddComponent("Speaker", {
        Volume = 1,
        MinDistance = 1,
        MaxDistance = 100,
        Attenuation = "InverseSquare",
    })
end

return teapot

