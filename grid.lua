require("globals")
grid = {}

local scale = g_gridconfig.scale
local offset = g_gridconfig.tilesize*scale

local sprite_L = nil
local sprite_I = nil

local last_selected = nil

function grid.load()
    sprite_L = love.graphics.newImage("assets/l.png")
    sprite_I = love.graphics.newImage("assets/i.png")
    last_selected = g_selected_receiver
end

function grid.update(dt)
    if not last_selected == g_selected_receiver then
        print("refresh")
        for id,g in pairs(g_grid) do
            g.selected = false
        end
        g_recursive(mailman_locations[g_mailman_index],1)
        last_selected = g_selected_receiver
    end
end

function grid.draw()
    love.graphics.setColor(1,1,1)
    local id = 1
    for y = 1, g_gridconfig.y do
        for x = 1, g_gridconfig.x do
            local sprite = sprite_L
            --todo: if i have time
            if g_grid[id].type == "I" then
                sprite = sprite_I
            end
            if g_grid[id].selected == true then
                local r = g_receivers[g_selected_receiver]
                love.graphics.setColor(r.r,r.g,r.b)
            else
                love.graphics.setColor(1,1,1)
            end
            local div = g_gridconfig.tilesize/2
            local xpos = ((x * offset) - div*scale) + 32*scale
            local ypos = ((y * offset) - div*scale) + 16*scale
            love.graphics.draw(sprite, xpos, ypos, math.rad(g_grid[id].orientation), scale, scale, div, div)
            id = id +1
        end
    end
end


function grid.keypressed(key, scancode, isrepeat)
    if key == "space" then
        for id,g in pairs(g_grid) do
            g.selected = false
        end
        g_recursive(g_mailman_locations[g_mailman_index],1)
    end
end
