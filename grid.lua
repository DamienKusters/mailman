require("globals")
grid = {}

local scale = g_gridconfig.scale
local offset = g_gridconfig.tilesize*scale

local sprite_L = nil
local sprite_I = nil
local sprite_T = nil

function grid.load()
    sprite_L = love.graphics.newImage("assets/l.png")
    sprite_I = love.graphics.newImage("assets/i.png")
end

function grid.update()
end

function grid.draw()
    love.graphics.setColor(1,1,1)
    id = 1
    for y = 1, g_gridconfig.y do
        for x = 1, g_gridconfig.x do
            sprite = sprite_L
            --todo: if i have time
            -- if id == 8 or id == 18 or id == 28 then
            --     sprite = sprite_I
            -- end
            if g_grid[id].selected == true then
                love.graphics.setColor(0,.5,.5)
            else
                love.graphics.setColor(1,1,1)
            end
            div = g_gridconfig.tilesize/2
            xpos = ((x * offset) - div*scale) + 32*scale
            ypos = ((y * offset) - div*scale) + 16*scale
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

        g_recursive(g_gridconfig.x*3 + 1,1)
    end
end
