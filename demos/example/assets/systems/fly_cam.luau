-- Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

local input = require("@input")
local windowing = require("@windowing")

local speed = 1
local flyCam: System = {}
flyCam.query = { "AudioListener" }

-- Bool to number
local function btn(bool)
    return if bool then 1 else 0
end

-- TODO: Make these engine functions in the future
-- pitch = x, yaw = y, roll = z

local function rotToRightVector(rot: Vec3): Vec3
    local pitch = math.rad(rot.x)
    local yaw = math.rad(rot.y)
    local roll = math.rad(rot.z)

    return Vec3.new(
        math.cos(roll) * math.cos(yaw) - math.sin(roll) * math.sin(pitch) * math.sin(yaw),
        math.sin(roll) * math.cos(roll),
        -math.cos(roll) * math.sin(yaw) - math.sin(roll) * math.sin(pitch) * math.cos(yaw)
    )
end

local function rotToUpVector(rot: Vec3): Vec3
    local pitch = math.rad(rot.x)
    local yaw = math.rad(rot.y)
    local roll = math.rad(rot.z)

    return Vec3.new(
        math.sin(roll) * math.cos(yaw) + math.cos(roll) * math.sin(pitch) * math.sin(yaw),
        math.cos(roll) * math.cos(pitch),
        -math.sin(roll) * math.sin(yaw) + math.cos(roll) * math.sin(pitch) * math.cos(yaw)
    )
end

local function rotToForwardVector(rot: Vec3): Vec3
    local pitch = math.rad(rot.x)
    local yaw = math.rad(rot.y)

    return Vec3.new(
        math.cos(pitch) * math.sin(yaw),
        -math.sin(pitch),
        math.cos(pitch) * math.cos(yaw)
    )
end

function flyCam.init(world: World)
    input.keyboards.keyPressed:connect(function(key, consumed, win)
        if consumed or win ~= windowing.mainWindow then return end
        if key == "Escape" then
            if input.isCursorLocked() then input.setCursorLocked(false) end
            if not input.isCursorVisible() then input.setCursorVisible(true) end
        end
    end)

    input.mice.buttonPressed:connect(function(btn, consumed, win)
        if consumed or win ~= windowing.mainWindow then return end
        if btn == "Left" then
            if not input.isCursorLocked() then input.setCursorLocked(true) end
            if input.isCursorVisible() then input.setCursorVisible(false) end
        end
    end)

    input.mice.scrolled:connect(function(delta, consumed, win)
        speed = math.max(0, speed + delta.y)
    end)
end

function flyCam.update(entity: Entity, dt: number)
    if windowing.mainWindow.focused then return end

    local kb = input.getKeyboard(1) :: Keyboard
    local ms = input.getMouse(1) :: Mouse

    -- TODO: Allow vec * (or /) number 
    
    -- 5 m/s
    local moveX = (btn(kb:isKeyPressed("D"))-btn(kb:isKeyPressed("A")))*dt*speed
    local moveY = (btn(kb:isKeyPressed("Space"))-btn(kb:isKeyPressed("LeftShift")))*dt*speed
    local moveZ = (btn(kb:isKeyPressed("W"))-btn(kb:isKeyPressed("S")))*dt*speed

    local msDelta = if input.isCursorLocked() then ms:getMoveDelta() else Vec2.new(0, 0)
    local rot = entity.components.Rotation
        + Vec3.new(msDelta.y, msDelta.x, 0)

    entity.components.Position +=
        rotToRightVector(rot) * Vec3.new(moveX, moveX, moveX)
        + rotToUpVector(rot) * Vec3.new(moveY, moveY, moveY)
        + rotToForwardVector(rot) * Vec3.new(moveZ, moveZ, moveZ)

    entity.components.Rotation = rot
end

function flyCam.deinit()
    print("Deinit")
end

return flyCam