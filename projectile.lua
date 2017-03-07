Projectile = Class{}

function Projectile:init(from, angle)
    self.from = from
    self.position = from:clone()
    self.angle = angle
    self.speed = 250
end

function Projectile:update(dt)
    move = Vector()
    move.x = math.cos(self.angle) * dt * self.speed
    move.y = math.sin(self.angle) * dt * self.speed

    self.position = (self.position + move) - camera.position
end

function Projectile:draw()
    love.graphics.setColor(255, 0, 0)
    love.graphics.circle("line", self.position.x + camera.position.x, self.position.y + camera.position.y, 5)
end
