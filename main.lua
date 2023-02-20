require("globals")
function love.load()
    require "grid"
    require "cursor"

    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setVSync(1)

    id = 1
    for y = 1, 5 do
        for x = 1, 5 do
            n = love.math.random(1,4)
            e = {[1]=0, [2]=90,[3]=180,[4]=270}
            g_grid[id] = {["orientation"] = e[n]}
            id = id +1
        end
    end
    g_ids = id

    grid.load()
    cursor.load()
end

function love.update(dt)

    grid.update()
    cursor.update()
end

function love.draw()

    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 0, 0, 60, 50)

    love.graphics.setColor(1, 0, 0)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 5, 5)

    grid.draw()
    cursor.draw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
    cursor.keypressed(key, scancode, isrepeat)
end