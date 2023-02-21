require("globals")
inputcolumn = {}

local scale = g_gridconfig.scale
local offset = g_gridconfig.tilesize*scale

local sprite = nil
local sprite_letter = nil

function inputcolumn.load()
    sprite = love.graphics.newImage("assets/player.png")
    sprite_letter = love.graphics.newImage("assets/letter.png")
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
        love.graphics.setColor(1,1,1)
        love.graphics.draw(sprite, xpos, ypos, 0, scale, scale, div, div)
        love.graphics.setColor(0,.5,.5)
        love.graphics.draw(sprite_letter, xpos / 2, ypos, 0, scale/2, scale/2, div, div)
        id = id +1
    -- end
end
