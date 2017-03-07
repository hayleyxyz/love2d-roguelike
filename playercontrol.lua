PlayerControl = Class{}

function PlayerControl:init(index)
    if index == 0 then
        local joysticks = love.joystick.getJoysticks()
        self.joystick = joysticks[1]
        self.deadzone = 0.25
    elseif index == 1 then
        self.keymap = {
            up = 'w',
            down = 's',
            left = 'a',
            right = 'd'
        }
    end
end

function PlayerControl:getXYAxis()
    local axis = Vector()

    if self.joystick then
        axis.x = self.joystick:getAxis(1)


        axis.y = self.joystick:getAxis(2)

        if math.abs(axis.x) + math.abs(axis.y) < self.deadzone then
            axis.x = 0
            axis.y = 0
        end
    else
        if love.keyboard.isDown(self.keymap.right) then
            axis.x = 1
        elseif love.keyboard.isDown(self.keymap.left) then
            axis.x = -1
        end

        if love.keyboard.isDown(self.keymap.down) then
            axis.y = 1
        elseif love.keyboard.isDown(self.keymap.up) then
            axis.y = -1
        end
    end

    return axis
end

function PlayerControl:isFiring()
    if self.joystick then
        return self.joystick:isGamepadDown('rightshoulder')
    else
        return love.mouse.isDown(1)
    end
end

function PlayerControl:getFireAngle(pos)
    if self.joystick then
        local axis = Vector()

        axis.x = self.joystick:getAxis(4)
        axis.y = self.joystick:getAxis(5)

        if math.abs(axis.x) + math.abs(axis.y) < self.deadzone then
            axis.x = 0
            axis.y = 0
        end

        return math.atan2(axis.y, axis.x)
    else
        local mousePosition = Vector(love.mouse.getX() + camera.position.x, love.mouse.getY() + camera.position.y)
        return math.atan2((mousePosition.y - pos.y), (mousePosition.x - pos.x))
    end
end
