-- Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

local input = require("@input")
local windowing = require("@windowing")

local speed = 1
local yaw, pitch = 0, 0
local RADIANS_PER_PIXEL = 0.01
local PITCH_LIMIT = math.rad(89)

local flyCam: System = {}
flyCam.query = { "FlyCam" }

-- Bool to number
local function btn(bool)
    return if bool then 1 else 0
end

function flyCam.init()
    world:registerComponent("FlyCam")

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
    print(`FPS: {1/dt}`)
    -- TODO: Why the hell does this work correctly when the `not` is missing??? Fix it.
    if windowing.mainWindow.focused then return end

    -- Big TODO: Make engine APIs not OOP-based.
    local kb = input.getKeyboard(1) :: Keyboard
    local ms = input.getMouse(1) :: Mouse

    local msDelta = if input.isCursorLocked() then ms:getMoveDelta() else Vec2.zero
    yaw += msDelta.x * RADIANS_PER_PIXEL
    pitch = math.clamp(pitch + msDelta.y * RADIANS_PER_PIXEL, -PITCH_LIMIT, PITCH_LIMIT)
    entity.Rotation = Quat.fromEuler(Vec3.new(pitch, yaw, 0))

    local move = Vec3.new(
        (btn(kb:isKeyPressed("D")) - btn(kb:isKeyPressed("A"))),
        (btn(kb:isKeyPressed("Space")) - btn(kb:isKeyPressed("LeftShift"))),
        (btn(kb:isKeyPressed("W")) - btn(kb:isKeyPressed("S")))
    ):scale(dt * speed)

    entity.Position += entity.Rotation:rotate(move)

    local result = world:raycast(entity.Position, -Vec3.yAxis);
    if result then
        print(result.entity, result.position, result.normal, result.distance)
    end
end

function flyCam.deinit()
    print("Deinit")
end

return flyCam