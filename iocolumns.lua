require("globals")
iocolumns = {}

local scale = g_gridconfig.scale
local offset = g_gridconfig.tilesize*scale

local sprite = nil
local sprite_letter = nil

function iocolumns.load()
    sprite = love.graphics.newImage("assets/player.png")
    sprite_letter = love.graphics.newImage("assets/letter.png")
end

function iocolumns.update(dt)
end

function iocolumns.draw()
    love.graphics.setColor(1,1,1)
    local id = 4
    local div = g_gridconfig.tilesize/2
    local xpos = ((1 * offset) - div*scale) + 16*scale
    local ypos = ((g_mailman_index * offset) - div*scale) + 16*scale
    love.graphics.setColor(1,1,1)
    love.graphics.draw(sprite, xpos, ypos, 0, scale, scale, div, div)
    local r = g_receivers[g_selected_receiver]
    love.graphics.setColor(r.r,r.g,r.b)
    love.graphics.draw(sprite_letter, xpos / 2, ypos, 0, scale/2, scale/2, div, div)
    id = id +1
    
    --Render receivers
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

function iocolumns.keypressed(key, scancode, isrepeat)
end