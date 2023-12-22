require("globals")
cursor = {}

local sprite = nil
local sound_turn = nil
local sound_move = nil

local scale = g_gridconfig.scale
local offset = g_gridconfig.tilesize*scale

local directions = {
    ["a"]=1, ['left']=1,
    ["w"]=2, ['up']=2,
    ["d"]=3, ['right']=3,
    ["s"]=4, ['down']=4,
}

function cursor.load()
    sprite = love.graphics.newImage("assets/cursor.png")
    sound_turn = love.audio.newSource("assets/turn.wav", "stream")
    sound_move = love.audio.newSource("assets/move.wav", "stream")
end

function cursor.keypressed(key, scancode, isrepeat)
    if g_is_allowed_grid_movement(directions[key], g_index) == false then
        return
    end 

    if directions[key] == 1 then
        g_index = g_index - 1;
        love.audio.play(sound_move);
    elseif directions[key] == 2 then
        g_index = g_index - g_gridconfig.x;
        love.audio.play(sound_move);
    elseif directions[key] == 3 then
        g_index = g_index + 1;
        love.audio.play(sound_move);
    elseif directions[key] == 4 then
        g_index = g_index + g_gridconfig.x;
        love.audio.play(sound_move);
    elseif key == "space" then
        if g_grid[g_index].orientation == 270 then
            g_grid[g_index].orientation = 0
        else
            g_grid[g_index].orientation = g_grid[g_index].orientation + 90;
        end
        love.audio.play(sound_turn)
    end
end

local mpx, mpx;
function cursor.update(dt)
    mpx, mpy = love.mouse.getPosition()
end

function cursor.draw()
    love.graphics.setColor(1,1,1)
    love.graphics.print(mpx - (g_gridconfig.x * g_gridconfig.scale), 0 ,0 )
    love.graphics.print(mpy - (g_gridconfig.y * g_gridconfig.scale), 10 ,10 )
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
