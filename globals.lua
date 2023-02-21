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
function g_recursive(from, to, entry, previous) -- from: start tile, to: to tile, entry: direction 'from' took towards 'to', previous: table of visisted tiles
    from_dirs = g_deg_to_bools(from.orientation)
    --todo
end

function g_get_relative_tile(direction) --todo change to bool table????
    if direction == "left" then
        return g_grid[g_index - 1];
    end
    if direction == "up" then
        return g_grid[g_index - g_gridconfig.x];
    end
    if direction == "right" then
        return g_grid[g_index + 1];
    end
    if direction == "down" then
        return g_grid[g_index + g_gridconfig.x];
    end
end