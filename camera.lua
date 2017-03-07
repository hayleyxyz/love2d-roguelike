Camera = Class{}

function Camera:init()
    self.position = Vector()
    --self.size = Vector(love.graphics.getWidth(), love.graphics.getHeight())
    self.bounds = Vector()
end

function Camera:update(dt)
    self.position.y = clamp(0, self.position.y, self.bounds.y - love.graphics.getHeight())
    self.position.x = clamp(0, self.position.x, self.bounds.x - love.graphics.getWidth())
end
