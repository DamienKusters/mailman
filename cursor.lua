require("globals")
cursor = {}

local sprite = nil
local sound_turn = nil
local sound_move = nil

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

function cursor.update()
end

function cursor.draw()
    love.graphics.setColor(1,1,1)
    id = 1
    for y = 1, g_gridconfig.y do
        for x = 1, g_gridconfig.x do
            if id == g_index then
                love.graphics.draw(sprite, x * 16*g_spritescale, y * 16*g_spritescale, 0, g_spritescale, g_spritescale, 16/2, 16/2)
                -- TODO: 16-> 8 use offset thing
            end
            id = id +1
        end
    end
end
