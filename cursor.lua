require("globals")
cursor = {}

local sprite = nil
local sound_turn = nil
local sound_move = nil

local scale = g_gridconfig.scale
local offset = g_gridconfig.tilesize*scale

function cursor.load()
    sprite = love.graphics.newImage("assets/cursor.png")
    sound_turn = love.audio.newSource("assets/turn.wav", "stream")
    sound_move = love.audio.newSource("assets/move.wav", "stream")
end

function cursor.keypressed(key, scancode, isrepeat)
    if key == "left" or key == "a" then
        if g_index % g_gridconfig.x == 1 then
            return
        end
        g_index = g_index - 1;
        love.audio.play(sound_move);
    end
    if key == "up" or key == "w" then
        if g_index - g_gridconfig.x <= 0 then
            return
        end
        g_index = g_index - g_gridconfig.x;
        love.audio.play(sound_move);
    end
    if key == "right" or key == "d" then
        if g_index % g_gridconfig.x == 0 then
            return
        end
        g_index = g_index + 1;
        love.audio.play(sound_move);
    end
    if key == "down" or key == "s" then
        if g_index + g_gridconfig.x >= g_ids then
            return
        end
        g_index = g_index + g_gridconfig.x;
        love.audio.play(sound_move);
    end

    if key == "space" then
        if g_grid[g_index].orientation == 270 then
            g_grid[g_index].orientation = 0
        else
            g_grid[g_index].orientation = g_grid[g_index].orientation + 90;
        end
        love.audio.play(sound_turn)
    end
    
end

function cursor.update(dt)
end

function cursor.draw()
    love.graphics.setColor(1,1,1)
    local id = 1
    for y = 1, g_gridconfig.y do
        for x = 1, g_gridconfig.x do
            if id == g_index then
                local div = g_gridconfig.tilesize/2
                local xpos = ((x * offset) - div*scale) + 32*scale
                local ypos = ((y * offset) - div*scale) + 16*scale
                love.graphics.draw(sprite, xpos, ypos, 0, scale, scale, div, div)
            end
            id = id +1
        end
    end
end
