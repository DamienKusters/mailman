require("globals")
grid = {}

local height = 5
local width = 5
local multiplier = 5
local offset = 16*multiplier

function grid.load()
    sprite = love.graphics.newImage("assets/l.png")
end

function grid.update()
end

function grid.draw()
    love.graphics.setColor(1,1,1)
    id = 1
    for y = 1, height do
        for x = 1, width do
            love.graphics.draw(sprite, x * offset, y * offset, math.rad(g_grid[id].orientation), multiplier, multiplier, 16/2, 16/2)
            id = id +1
        end
    end
end
