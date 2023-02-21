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
    from_tile_dirs = g_deg_to_bools(g_grid[from_tile_id].orientation) -- false true true false
    
    -- a: from_dir is index
    -- b: loop from_tile_dirs untill dir match is found
    for key,d in pairs(from_tile_dirs) do
        if d == true and key == from_dir then
            print('next')
            g_grid[from_tile_id].selected = true
            return
            -- g_recursive(g_get_relative_tile(from_dir, from_tile_id),g_reverse_dir(from_dir), nil,nil)
        end
    end
    g_grid[from_tile_id].selected = false
    -- question: what direction did it came from
    --todo
end

function g_get_relative_tile(direction, index) --todo change to bool table????
    if direction[1] == true then -- left
        return g_grid[index - 1];
    end
    if direction[2] == true then -- up
        return g_grid[index - g_gridconfig.x];
    end
    if direction[3] == true then -- right
        return g_grid[index + 1];
    end
    if direction[4] == true then -- down
        return g_grid[index + g_gridconfig.x];
    end
end

function g_reverse_dir(directions)
    local output = {}
    for key,d in directions do
        if d == true then
            table.insert(output,false)
        elseif d == false then
            table.insert(output,true)
        end
    end
    return output
end