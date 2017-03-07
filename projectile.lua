Projectile = Class{}

function Projectile:init(from, angle)
    self.from = from:clone()
    self.position = from:clone()
    self.cameraPosition = camera.position:clone()
    self.angle = angle
    self.speed = 250
end

function Projectile:update(dt)
    move = Vector()
    move.x = math.cos(self.angle) * dt * self.speed
    move.y = math.sin(self.angle) * dt * self.speed

    self.position = (self.position + move)
end

function Projectile:draw()
    love.graphics.setColor(255, 0, 0)
    local drawPos = self.position - self.cameraPosition
    love.graphics.circle("line", drawPos.x, drawPos.y, 5)
    love.graphics.circle("fill", self.from.x - self.cameraPosition.x, self.from.y - self.cameraPosition.y, 5)
end
