players = { }
map = nil
camera = nil

function love.load()
    Class = require 'hump.class'
    Vector = require 'hump.vector'
    HC = require 'HC'

    require 'util'
    require 'player'
    require 'playercontrol'
    require 'projectile'
    require 'weapon'
    require 'map'
    require 'tile'
    require 'camera'

    love.graphics.setDefaultFilter('nearest', 'nearest')

    map = Map()
    camera = Camera()
    camera.bounds = Vector(map:getPixelWidth(), map:getPixelHeight())

    --table.insert(
    --    players,
    --    Player(0)
    --)

    table.insert(
        players,
        Player(1)
    )
end

function love.update(dt)
    camera:update(dt)

    for i,player in ipairs(players) do
        player:update(dt)
    end

    map:update(dt)

    if love.keyboard.isDown('escape') then
      love.event.quit()
    end
end

function love.draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), love.graphics.getHeight())

    map:draw()

    for i,player in ipairs(players) do
        player:draw()
    end

    love.graphics.setColor(0, 255, 0, 100)
    for i,v in pairs(HC:hash():shapes()) do
        --v:draw('fill')
    end
end
