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
    local pitch = math.rad(rot.X)
    local yaw = math.rad(rot.Y)
    local roll = math.rad(rot.Z)

    return Vec3.new(
        math.cos(roll) * math.cos(yaw) - math.sin(roll) * math.sin(pitch) * math.sin(yaw),
        math.sin(roll) * math.cos(roll),
        -math.cos(roll) * math.sin(yaw) - math.sin(roll) * math.sin(pitch) * math.cos(yaw)
    )
end

local function rotToUpVector(rot: Vec3): Vec3
    local pitch = math.rad(rot.X)
    local yaw = math.rad(rot.Y)
    local roll = math.rad(rot.Z)

    return Vec3.new(
        math.sin(roll) * math.cos(yaw) + math.cos(roll) * math.sin(pitch) * math.sin(yaw),
        math.cos(roll) * math.cos(pitch),
        -math.sin(roll) * math.sin(yaw) + math.cos(roll) * math.sin(pitch) * math.cos(yaw)
    )
end

local function rotToForwardVector(rot: Vec3): Vec3
    local pitch = math.rad(rot.X)
    local yaw = math.rad(rot.Y)

    return Vec3.new(
        math.cos(pitch) * math.sin(yaw),
        -math.sin(pitch),
        math.cos(pitch) * math.cos(yaw)
    )
end

function flyCam.init(world: World)
    input.Keyboards.KeyPressed:Connect(function(key, consumed, win)
        if consumed or win ~= windowing.MainWindow then return end
        if key == "Escape" then
            if input.IsCursorLocked() then input.SetCursorLocked(false) end
            if not input.IsCursorVisible() then input.SetCursorVisible(true) end
        end
    end)

    input.Mice.ButtonPressed:Connect(function(btn, consumed, win)
        if consumed or win ~= windowing.MainWindow then return end
        if btn == "Left" then
            if not input.IsCursorLocked() then input.SetCursorLocked(true) end
            if input.IsCursorVisible() then input.SetCursorVisible(false) end
        end
    end)

    input.Mice.Scrolled:Connect(function(delta, consumed, win)
        speed = math.max(0, speed + delta.Y)
    end)
end

function flyCam.update(entity: Entity, dt: number)
    -- `not windowing.MainWindow` is temporary, will be removed when engine state is more organized.
    if not windowing.MainWindow or not windowing.MainWindow.Focused then return end

    local kb = input.GetKeyboard(1) :: Keyboard
    local ms = input.GetMouse(1) :: Mouse

    -- TODO: Allow vec * (or /) number 
    
    -- 5 m/s
    local moveX = (btn(kb:IsKeyPressed("D"))-btn(kb:IsKeyPressed("A")))*dt*speed
    local moveY = (btn(kb:IsKeyPressed("Space"))-btn(kb:IsKeyPressed("LeftShift")))*dt*speed
    local moveZ = (btn(kb:IsKeyPressed("W"))-btn(kb:IsKeyPressed("S")))*dt*speed

    local msDelta = if input.IsCursorLocked() then ms:GetMoveDelta() else Vec2.new(0, 0)
    local rot = entity.Components.Rotation
        + Vec3.new(msDelta.Y, msDelta.X, 0)

    entity.Components.Position +=
        rotToRightVector(rot) * Vec3.new(moveX, moveX, moveX)
        + rotToUpVector(rot) * Vec3.new(moveY, moveY, moveY)
        + rotToForwardVector(rot) * Vec3.new(moveZ, moveZ, moveZ)

    entity.Components.Rotation = rot
end

function flyCam.deinit()
    print("Deinit")
end

return flyCam