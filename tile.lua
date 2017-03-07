Tile = Class{}

function Tile:init(image, id)
    self.image = love.graphics.newImage('res/tiles/' .. image)
    self.image_name = image
    self.id = id
end

function Tile:draw(position)
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(self.image, position.x, position.y)
end
