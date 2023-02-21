g_gridconfig = {
    ["y"]=7,
    ["x"]=5
}
g_spritescale = 4;

g_grid = {}
g_index = 1
g_ids = nil

local degrees = {
    [0]={false,true,true,false},
    [90]={false,false,true,true},
    [180]={true,false,false,true},
    [270]={true,true,false,false}
}
function g_deg_to_bools(degree)
    return degrees[degree]
end

--todo
-- recursive function that loops from a start tile until it hits a corner.
-- each iteration (index) must be saved so we can change the colour of the looped tiles  
function g_recursive(from_tile_id, from_dir, entry, previous) -- from: start tile, to: to tile, entry: direction 'from' took towards 'to', previous: table of visisted tiles
    if g_grid == nil then
        print("OMG LUA NOW WHAT?")
    end
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
            print('t: ' .. from_tile_id .. " d: " .. nextdir .. " to: " .. reltile.index)
            g_grid[from_tile_id].selected = true
            g_recursive(reltile.index,nextdir, nil,nil)
            return
        end
    end
    g_grid[from_tile_id].selected = false
    -- question: what direction did it came from
    --todo
end

function g_get_relative_tile(direction, index)
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

local reversed_dirs = {2,3,4,1}
function g_reverse_dir(dir)
    return reversed_dirs[dir]
end