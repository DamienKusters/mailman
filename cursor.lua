require("globals")
cursor = {}

local sprite = nil
local sound_turn = nil
local sound_move = nil
local index = 1

function cursor.load()
    sprite = love.graphics.newImage("assets/cursor.png")
    sound_turn = love.audio.newSource("assets/turn.wav", "stream")
    sound_move = love.audio.newSource("assets/move.wav", "stream")
end

function cursor.keypressed(key, scancode, isrepeat)

    if key == "left" or key == "a" then
        if index % 5 == 1 then
            return
        end
        index = index - 1;
        love.audio.play(sound_move);
    end
    if key == "up" or key == "w" then
        if index - 5 <= 0 then
            return
        end
        index = index - 5;
        love.audio.play(sound_move);
    end
    if key == "right" or key == "d" then
        if index % 5 == 0 then
            return
        end
        index = index + 1;
        love.audio.play(sound_move);
    end
    if key == "down" or key == "s" then
        if index + 5 >= g_ids then
            return
        end
        index = index + 5;
        love.audio.play(sound_move);
    end

    if key == "space" then
        g_grid[index].orientation = g_grid[index].orientation + 90;
        love.audio.play(sound_turn)
    end
    
end

function cursor.update()
end

function cursor.draw()
    love.graphics.print("" .. g_grid[index].orientation, 30, 30)
    id = 1
    for y = 1, 5 do
        for x = 1, 5 do
            if id == index then
                love.graphics.draw(sprite, x * 16*5, y * 16*5, 0, 5, 5, 16/2, 16/2)
            end
            id = id +1
        end
    end
end
