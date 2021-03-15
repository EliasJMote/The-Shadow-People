local createRooms = {}

function createRooms.create()
    local g = GLOBALS
    
    loadRooms = g.deepCopy(g.loadRooms)
end

return createRooms