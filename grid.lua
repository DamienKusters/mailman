require("globals")
grid = {}

local offset = 16*g_spritescale

local sprite_L = nil
local sprite_I = nil
local sprite_T = nil

function grid.load()
    sprite_L = love.graphics.newImage("assets/l.png")
    sprite_I = love.graphics.newImage("assets/i.png")
    sprite_T = love.graphics.newImage("assets/t.png")
end

function grid.update()
end

function grid.draw()
    love.graphics.setColor(1,1,1)
    id = 1
    for y = 1, g_gridconfig.y do
        for x = 1, g_gridconfig.x do
            sprite = sprite_L
            if id == 8 or id == 28 then
                sprite = sprite_I
            end
            if id == 18 then
                sprite = sprite_T
            end
            love.graphics.draw(sprite, x * offset, y * offset, math.rad(g_grid[id].orientation), g_spritescale, g_spritescale, 16/2, 16/2)
            id = id +1
        end
    end
end
