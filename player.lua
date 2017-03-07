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
    self.speed = 200

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
            print(string.format("Colliding. Separating vector = (%s,%s)", delta.x, delta.y))

            if delta.x > 0 then
              collisions.left = true
            elseif delta.x < 0 then
              collisions.right = true
            end

            if delta.y > 0 then
              collisions.top = true
            elseif delta.y < 0 then
              collisions.bottom = true
            end
        end
    end

    if collisions.top or collisions.bottom then
        move.y = 0
    end

    if collisions.left or collisions.right then
        move.x = 0
    end

    self.position = self.position + move
    if camera.position.y == 0 and self.position.y < (love.graphics.getWidth() - self.size.x) / 2 then
    else
        camera.position = camera.position + move
    end

    self.collider:moveTo(self.position.x + self.size.x, self.position.y)

    if self.control:isFiring() and not self.hasShot then
        local angle = self.control:getFireAngle(self.position)

        self.weapon:spawn(self:getCenterPosition(), angle)

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
