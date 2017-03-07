Map = Class{}

function Map:init()
    self.tilemap = require 'levels.level-2'

    self.tiles = {}

    for i,tileset in ipairs(self.tilemap.tilesets) do
        for i,tile in ipairs(tileset.tiles) do
            s,e,str = tile.image:find("tiles/(.+)")
            table.insert(self.tiles, Tile(str, tile.id))
        end
    end

    -- set up wall collision objects
    local wallLayer = self:getLayer('objectgroup', 'wall')
    self.wallColliders = {}
    for i,object in ipairs(wallLayer.objects) do
        if object.shape == 'rectangle' then
            local rect = HC.rectangle(object.x, object.y, object.width, object.height)
            rect.originalPosition = Vector(object.x, object.y)
            rect.tag = 'wall'
            table.insert(self.wallColliders, rect)
        elseif object.shape == 'polyline' then
            local points = {}

            for i,p in ipairs(object.polyline) do
                table.insert(points, p.x + object.x)
                table.insert(points, p.y + object.y)
            end

            local polygon = HC.polygon(unpack(points))
            table.insert(self.wallColliders, polygon)
        end
    end
end

function Map:getPixelWidth()
  return self.tilemap.width * self.tilemap.tilewidth
end

function Map:getPixelHeight()
  return self.tilemap.height * self.tilemap.tileheight
end

function Map:getLayer(type, name)
    for i,layer in ipairs(self.tilemap.layers) do
        if layer.name == name and layer.type == type then
            return layer
        end
    end
end

function Map:getTileForCoord(coord)
    local tileLayer = self:getLayer('tilelayer', 'tiles')

    local id = tileLayer.data[(coord.y * self.tilemap.width) + coord.x + 1] - 1

    for i,tile in ipairs(self.tiles) do
        if tile.id == id then
            return tile
        end
    end
end

function Map:coordToPosition(coord)
    local pos = coord:clone()
    pos.x = pos.x * self.tilemap.tilewidth
    pos.y = pos.y * self.tilemap.tileheight

    return pos
end

function Map:update(dt)
    for i,o in ipairs(self.wallColliders) do
        if o.originalPosition then
            --o:moveTo(o.originalPosition.x, o.originalPosition.y)
        end
    end
end

function Map:draw()
    local startX = math.floor(camera.position.x / self.tilemap.tilewidth)
    local startY = math.floor(camera.position.y / self.tilemap.tileheight)
    local endX = math.min(startX + (math.ceil(love.graphics.getWidth() / self.tilemap.tilewidth)), self.tilemap.width - 1)
    local endY = math.min(startY + (math.ceil(love.graphics.getHeight() / self.tilemap.tileheight)), self.tilemap.height - 1)

    for y=startY,endY do
        for x=startX,endX do
            local coord = Vector(x, y)
            local tile = self:getTileForCoord(coord)

            if tile then
                local drawPos = self:coordToPosition(coord)
                drawPos = drawPos - camera.position
                tile:draw(drawPos)
            end
        end
    end
end
