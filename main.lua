require("globals")

local modules = {}

function love.load()
    require "grid"
    require "cursor"
    require "inputcolumn"
    require "outputcolumn"
    require "dataviewer"

    modules = {
        cursor,
        grid,
        inputcolumn,
        outputcolumn,
        dataviewer
    }

    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setVSync(1)

    g_regen_receiver()

    for i = 1, g_gridconfig.y * g_gridconfig.x do
        local n = love.math.random(1,4)
        local e = {[1]=0, [2]=90,[3]=180,[4]=270}
        g_grid[i] = {
            ["index"] = i,
            ["orientation"] = e[n]
        }
        g_ids = i
    end

    for k,mod in pairs(modules) do
        mod.load()
    end
end

function love.update(dt)
    for k,mod in pairs(modules) do
        mod.update(dt)
    end
end

function love.draw()
    love.graphics.setColor(1, 0, 0)

    for k,mod in pairs(modules) do
        mod.draw()
    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end

    for k,mod in pairs(modules) do
        mod.keypressed(key, scancode, isrepeat)
    end
end