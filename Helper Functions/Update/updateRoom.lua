local updateRoom = {}

    local g = GLOBALS

    function updateRoom.transition(roomName)
        for k,v in pairs(loadRooms) do
            if(v.name == roomName) then
                g.curLocation = v
                break
            end
        end
        g.textBuffer = {}
    end
    
    function updateRoom.update()
        if(g.cursorOverMap ~= nil) then

            if(g.cursorOverMap == "North") then
                updateRoom.transition(g.curLocation.exits.north)
            elseif(g.cursorOverMap == "West") then
                updateRoom.transition(g.curLocation.exits.west)
            elseif(g.cursorOverMap == "South") then
                updateRoom.transition(g.curLocation.exits.south)
            elseif(g.cursorOverMap == "East") then
                updateRoom.transition(g.curLocation.exits.east)
            end
            
        end
    end
    
    

return updateRoom