-- Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

local assets = require("@assets")
local floor: Script = {}

function floor.init(entity: Entity)
    print("Floor init")
    entity:addComponent("Position", Vec3.new(0, -5, 0))
    entity:addComponent("Scale", Vec3.new(10, 1, 10))
    entity:addComponent("Mesh", assets.load("asset://models/cube.fbx"))
    entity:addComponent("Image", assets.load("asset://images/chicken.jpg"))
    entity:addComponent("Collider", {})
end

function floor.contactBegan()
    print("Floor contact began")
end

function floor.contactEnded()
    print("Floor contact ended")
end

return floor