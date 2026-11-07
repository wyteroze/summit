-- Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
--!native

const ENTITY_COLUMNS, ENTITY_ROWS = 1, 1
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
            entity:addComponent("Collider", {})
            entity:addComponent("RigidBody", {})
        end
    end

    local sensor = world:spawnEntity()
    sensor:addComponent("Position", Vec3.new(0, -4, 0))
    sensor:addComponent("Scale", Vec3.new(10, 1, 10))
    sensor:addComponent("Collider", { sensor = true })
end

function spin.update(entity: Entity, dt: number)
    --local delta = Quat.fromEuler(entity.Spin:scale(dt))
    --entity.Rotation = (entity.Rotation * delta):normalize()
end

function spin.contactBegan(entity: Entity, other: Entity, contact: Contact)
    print(`Collision began: entity = {entity}, other = {other}, contact.normal = {contact.normal}, contact.position = {contact.position}`)
end

function spin.contactEnded(entity: Entity, other: Entity)
    print(`Collision ended: entity = {entity}, other = {other}`)
end

function spin.sensorEntered(entity: Entity, other: Entity)
    print(`Sensor entered: entity = {entity}, other = {other}`)
end

function spin.sensorExited(entity: Entity, other: Entity)
    print(`Sensor exited: entity = {entity}, other = {other}`)
end

return spin
