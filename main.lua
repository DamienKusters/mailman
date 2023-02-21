require("globals")
function love.load()
    require "grid"
    require "cursor"
    require "dataviewer"

    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setVSync(1)

    id = 1
    for y = 1, g_gridconfig.y do
        for x = 1, g_gridconfig.x do
            n = love.math.random(1,4)
            e = {[1]=0, [2]=90,[3]=180,[4]=270}
            g_grid[id] = {
                ["index"] = id,
                ["orientation"] = e[n]
            }
            id = id +1
        end
    end
    g_ids = id

    grid.load()
    cursor.load()
end

function love.update(dt)

    grid.update()--todo dt
    cursor.update()
end

function love.draw()

    love.graphics.setColor(1, 0, 0)
    -- love.graphics.print("FPS: " .. love.timer.getFPS(), 5, 5)

    grid.draw()
    cursor.draw()
    dataviewer.draw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
    --cursor must have prio
    cursor.keypressed(key, scancode, isrepeat)
    grid.keypressed(key, scancode, isrepeat)
end