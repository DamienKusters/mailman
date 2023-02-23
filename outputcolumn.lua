require("globals")
outputcolumn = {}

local scale = g_gridconfig.scale
local offset = g_gridconfig.tilesize*scale

local sprite = nil

function outputcolumn.load()
    sprite = love.graphics.newImage("assets/player.png")
end

function outputcolumn.update(dt)
end

function outputcolumn.draw()
    love.graphics.setColor(1,1,1)
    local recId = 1
    for y = 1, g_gridconfig.y do
        if y % 2 == 1 then
            local div = g_gridconfig.tilesize/2
            local xpos = (((g_gridconfig.x + 2) * offset) - div*scale) + 16*scale
            local ypos = ((y * offset) - div*scale) + 16*scale
            local r = g_receivers[recId]
            love.graphics.setColor(r.r,r.g,r.b)
            love.graphics.draw(sprite, xpos, ypos, 0, scale, scale, div, div)
            recId = recId +1
        end
    end
end

function outputcolumn.keypressed(key, scancode, isrepeat)
end