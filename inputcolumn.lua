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

function inputcolumn.update(dt)
end

function inputcolumn.draw()
    love.graphics.setColor(1,1,1)
    local id = 4
    -- for y = 1, g_gridconfig.y do
        local div = g_gridconfig.tilesize/2
        local xpos = ((1 * offset) - div*scale) + 16*scale
        local ypos = ((g_mailman_index * offset) - div*scale) + 16*scale
        love.graphics.setColor(1,1,1)
        love.graphics.draw(sprite, xpos, ypos, 0, scale, scale, div, div)
        local r = g_receivers[g_selected_receiver]
        love.graphics.setColor(r.r,r.g,r.b)
        love.graphics.draw(sprite_letter, xpos / 2, ypos, 0, scale/2, scale/2, div, div)
        id = id +1
    -- end
end

function inputcolumn.keypressed(key, scancode, isrepeat)
end