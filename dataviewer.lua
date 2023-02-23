require("globals")
dataviewer = {}

function dataviewer.load()
end

function dataviewer.update(dt)
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
    love.graphics.print("Bls: " .. tostring(g_deg_to_bools(g_grid[g_index].orientation)[1]) ..
        tostring(g_deg_to_bools(g_grid[g_index].orientation)[2]) ..
        tostring(g_deg_to_bools(g_grid[g_index].orientation)[3]) ..
        tostring(g_deg_to_bools(g_grid[g_index].orientation)[4])
    , 5, 5+(15*2))
    local r = g_receivers[g_selected_receiver]
    love.graphics.setColor(r.r,r.g,r.b)
    love.graphics.print("Rec: " .. tostring(g_selected_receiver), 5, 5+(15*3))
    love.graphics.print("Mlm: " .. tostring(g_mailman_index), 5, 5+(15*4))
    
end

function dataviewer.keypressed(key, scancode, isrepeat)
end
