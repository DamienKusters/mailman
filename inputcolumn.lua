require("globals")
inputcolumn = {}

local scale = g_gridconfig.scale
local offset = g_gridconfig.tilesize*scale

local sprite = nil

function inputcolumn.load()
    sprite = love.graphics.newImage("assets/player.png")
end

function inputcolumn.update()
end

function inputcolumn.draw()
    love.graphics.setColor(1,1,1)
    id = 4
    -- for y = 1, g_gridconfig.y do
        div = g_gridconfig.tilesize/2
        xpos = ((1 * offset) - div*scale) + 16*scale
        ypos = ((id * offset) - div*scale) + 16*scale
        love.graphics.draw(sprite, xpos, ypos, 0, scale, scale, div, div)
        id = id +1
    -- end
end
