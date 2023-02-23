g_gridconfig = {
    ["y"]=7,
    ["x"]=5,
    ['tilesize'] = 16,
    ['scale'] = 4
}

g_grid = {}
g_index = 1
g_ids = nil

g_mailman_index = 0;--top of the grid

g_selected_receiver = 1; -- receiver

g_receivers = {
    {r=0,g=.5,b=.5,index=5},--todo position of receiver
    {r=.5,g=.5,b=0,index=15},
    {r=.5,g=0,b=.5,index=25},
    {r=0,g=.5,b=0,index=35},
}

function g_regen_receiver()
    local curr = g_selected_receiver;
    while curr == g_selected_receiver do
        g_selected_receiver = love.math.random(1,4)
    end
end

local degrees = {
    [0]={false,true,true,false},
    [90]={false,false,true,true},
    [180]={true,false,false,true},
    [270]={true,true,false,false}
}
function g_deg_to_bools(degree)
    return degrees[degree]
end

function g_recursive(from_tile_id, from_dir)
    from_tile_dirs = g_deg_to_bools(g_grid[from_tile_id].orientation) -- false true true false

    for key,d in pairs(from_tile_dirs) do
        if d == true and key == from_dir then
            nextdir = nil
            for key2,d2 in pairs(from_tile_dirs) do
                if (not (key2 == from_dir)) and d2 == true then
                    nextdir = key2
                    break
                end
            end
            reltile = g_get_relative_tile(nextdir, from_tile_id)
            g_grid[from_tile_id].selected = true
            if reltile == nil then
                if g_check_mail_delivered(nextdir, from_tile_id) == true then
                    print("POINT")
                    g_regen_receiver()
                end
                break
            end
            -- print('t: ' .. from_tile_id .. " d: " .. nextdir .. " | t: " .. reltile.index .. " d: " .. g_reverse_dir(nextdir))
            print('from: ' .. from_tile_id .. " to: " .. reltile.index)
            g_recursive(reltile.index,g_reverse_dir(nextdir))
            return
        end
    end
    -- g_grid[from_tile_id].selected = false
    return print("stop recursion")
    -- question: what direction did it came from
    --todo
end

function g_get_relative_tile(direction, index)
    if g_is_allowed_grid_movement(direction, index) == false then
        return
    end

    if direction == 1 then -- left
        return g_grid[index - 1];
    end
    if direction == 2 then -- up
        return g_grid[index - g_gridconfig.x];
    end
    if direction == 3 then -- right
        return g_grid[index + 1];
    end
    if direction == 4 then -- down
        return g_grid[index + g_gridconfig.x];
    end
end

function g_is_allowed_grid_movement(direction, tile_index)
    if direction == 1 then -- left
        return not (tile_index % g_gridconfig.x == 1)
    end
    if direction == 2 then -- up
        return not (tile_index - g_gridconfig.x <= 0)
    end
    if direction == 3 then -- right
        return not (tile_index % g_gridconfig.x == 0)
    end
    if direction == 4 then -- down
        return not (tile_index + g_gridconfig.x > g_ids)
    end
end

function g_check_mail_delivered(direction, index)
    if not (direction == 1) then
        if index == g_receivers[g_selected_receiver].index then
            return true;
        end
    end
    return false
end

local reversed_dirs = {3,4,1,2}
function g_reverse_dir(dir)
    return reversed_dirs[dir]
end