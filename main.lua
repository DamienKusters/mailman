require("globals")

local modules = {}

local time = 120;

function love.load()
    require "grid"
    require "cursor"
    require "iocolumns"
    -- require "dataviewer"

    modules = {
        cursor,
        grid,
        iocolumns,
        -- dataviewer
    }

    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setVSync(1)

    g_regen_receiver()

    for i = 1, g_gridconfig.y * g_gridconfig.x do
        local n = love.math.random(1,4)
        local e = {[1]=0, [2]=90,[3]=180,[4]=270}
        if i == 18 then
            g_grid[i] = {
                ["index"] = i,
                ["orientation"] = e[n],
                ["type"]="I"
            }
        else
            g_grid[i] = {
                ["index"] = i,
                ["orientation"] = e[n],
                ["type"]="L"
            }
        end
        g_ids = i
    end

    for k,mod in pairs(modules) do
        mod.load()
    end
end

function love.update(dt)
    time = time - dt
    if time <= 0 then
        love.event.quit()
    end
    for k,mod in pairs(modules) do
        mod.update(dt)
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score: " .. g_score, 5, 5+(15*0))
    love.graphics.print("Timer: " .. tostring(math.floor(time / 60)) .. ":" .. string.format("%02d", math.floor(time % 60)), 100, 5+(15*0))

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