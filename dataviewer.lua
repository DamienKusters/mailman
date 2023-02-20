require("globals")
dataviewer = {}

function dataviewer.load()
end

function dataviewer.update()
end

function dataviewer.draw()
    love.graphics.setColor(1, 0, 1)

    -- offset = 15;
    -- id = 0;
    -- for i,d in pairs(g_grid) do
    --     love.graphics.print("FPS: " .. love.timer.getFPS() .. 5, 5, offset * id)
    --     id = id + 1;
    -- end
    love.graphics.print("Idx: " .. g_index, 5, 5+(15*0))
    love.graphics.print("Ori: " .. g_grid[g_index].orientation, 5, 5+(15*1))
    love.graphics.print("Val: " .. "test", 5, 5+(15*2))
    
end
