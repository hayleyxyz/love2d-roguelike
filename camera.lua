Camera = Class{}

function Camera:init()
    self.position = Vector()
    self.size = Vector(love.graphics.getWidth(), love.graphics.getHeight())
end

function Camera:update(dt)
    local moveSpeed = 30
    if love.keyboard.isDown('down') then
        self.position.y = self.position.y + (moveSpeed * dt)
    end

    if love.keyboard.isDown('up') then
        self.position.y = self.position.y - (moveSpeed * dt)
    end

    if love.keyboard.isDown('left') then
        self.position.x = self.position.x - (moveSpeed * dt)
    end

    if love.keyboard.isDown('right') then
        self.position.x = self.position.x + (moveSpeed * dt)
    end

    if self.position.x < 0 then
        self.position.x = 0
    end

    if self.position.y < 0 then
        self.position.y = 0
    end
end
