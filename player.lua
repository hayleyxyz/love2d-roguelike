Player = Class{}

function Player:init(index)
    self.index = index

    self.sprite = love.graphics.newImage('res/player-2.png')
    self.size = Vector(32, 32)
    self.position = Vector(
      (love.graphics.getWidth() - self.size.x) / 2,
      (love.graphics.getHeight() - self.size.y) / 2
    )
    self.rotation = 0

    self.control = PlayerControl(index)
    self.speed = 400

    self.shooting = false
    self.weapon = MultiShot(3)
    self.projectiles = {}

    self.collider = HC.rectangle(self.position.x, self.position.y, self.size.x, self.size.y)
end

function Player:getCenterPosition()
    pos = self.position:clone()
    pos.x = pos.x + (self.size.x / 2)
    pos.y = pos.y - (self.size.y / 2)
    return pos
end

function Player:update(dt)
    local moveVel = dt * self.speed
    move = self.control:getXYAxis() * moveVel
    move:clampInplace(moveVel)

    local newPosition = self.position + move

    --self.collider:moveTo(newPosition.x - camera.position.x, newPosition.y - camera.position.y)
    self.collider:moveTo(newPosition.x + self.size.x, newPosition.y)

    local hasWallCollided = false
    local collisions = { top = false, right = false, bottom = false, left = false }
    for shape, delta in pairs(HC.collisions(self.collider)) do
        if shape.tag == 'wall' then
            hasWallCollided = true

            if delta.x > 0 then
              collisions.left = true
              move.x = move.x + delta.x
            elseif delta.x < 0 then
              collisions.right = true
              move.x = move.x + delta.x
            end

            if delta.y > 0 then
              collisions.top = true
              move.y = move.y + delta.y
            elseif delta.y < 0 then
              collisions.bottom = true
              local oldY = move.y
              move.y = move.y + delta.y
            end
        end
    end

    self.position = self.position + move
    if camera.position.y == 0 and self.position.y < (love.graphics.getHeight() - self.size.y) / 2 then
    else
        camera.position.y = math.max(camera.position.y + move.y, 0)
    end

    if camera.position.x == 0 and self.position.x < (love.graphics.getWidth() - self.size.x) / 2 then
    else
        camera.position.x = math.max(camera.position.x + move.x, 0)
    end

    self.collider:moveTo(self.position.x + self.size.x, self.position.y)

    if self.control:isFiring() and not self.hasShot then
        local angle = self.control:getFireAngle(self.position)

        self.weapon:spawn(self.position, angle)

        self.hasShot = true
    end

    if not self.control:isFiring() and self.hasShot then
        self.hasShot = false
    end

    self.weapon:update(dt)
end

function Player:draw()
    self.weapon:draw()

    love.graphics.setColor(255, 255, 255)
    --quad = love.graphics.newQuad(0, 0, 32, 32, self.sprite:getDimensions())
    --love.graphics.draw(self.sprite, quad, self.position.x, self.position.y, 0, 1, 1, 0, 32)
    local drawPos = self:getCenterPosition()

    drawPos = drawPos - camera.position

    love.graphics.draw(self.sprite, drawPos.x, drawPos.y)
end
