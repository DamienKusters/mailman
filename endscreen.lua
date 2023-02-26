require("globals")
endscreen = {}

local sprite_m, sprite_a, sprite_i, sprite_l, sprite_n;
local sprites

local offset_x = (((16*9)*4)/2) - 210
local offset_y = 16
local scale = 3

function endscreen.load()
    sprite_m = love.graphics.newImage("assets/logo_m.png")
    sprite_a = love.graphics.newImage("assets/logo_a.png")
    sprite_i = love.graphics.newImage("assets/logo_i.png")
    sprite_l = love.graphics.newImage("assets/logo_l.png")
    sprite_n = love.graphics.newImage("assets/logo_n.png")

    sprites = {
        sprite_m,
        sprite_a,
        sprite_i,
        sprite_l,
        sprite_m,
        sprite_a,
        sprite_n,
    }
end

function endscreen.update(dt)
end

function endscreen.draw()
    love.graphics.setColor(1, 1, 1)

    for key,val in pairs(sprites) do
        love.graphics.draw(val, offset_x + (16*key-1) * scale, offset_y, 0, scale, scale, div, div)
    end

    love.graphics.print("Score: " .. g_score, ((16*9)*3)/2, 100)
    love.graphics.print("Time: 2:00", ((16*9)*3)/2, 115)
    love.graphics.print("Press 'space' to restart.", ((16*9)*3)/2, 145)
end

function endscreen.keypressed(key, scancode, isrepeat)
end
