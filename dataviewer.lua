require("globals")
dataviewer = {}

local height = 15
local offset_x = 5
local offset_y = 5

local data = {}

function dataviewer.load()
end

function dataviewer.update(dt)
    data = {
        ["Idx"]=g_index,
        ["Ori"]=g_grid[g_index].orientation,
        ["Rec"]=g_selected_receiver,
        ["RId"]=g_receivers[g_selected_receiver].index,
        ["Mlm"]=g_mailman_index,
    }
end

function dataviewer.draw()
    love.graphics.setColor(1, 0, 1)

    local i = 0;
    for key,val in pairs(data) do
        love.graphics.print(key .. ": " .. val, offset_x, offset_y+(height*i))
        i = i + 1
    end
end

function dataviewer.keypressed(key, scancode, isrepeat)
end
