local updateRoomLocks = {}

function updateRoomLocks.update()
    
    local g = GLOBALS
    
    -- For each room, check the locks
    if(g.curLocation.name == "Bedroom") then
        if(g.curLocation.objects[1].state == "Closed") then
            g.mapTransitionIsLegal = false
            g.writeToTextDisplay({"The door is closed!"})
        elseif(g.curLocation.objects[1].state == "Open") then
            g.mapTransitionIsLegal = true
        end
    elseif(g.curLocation.name == "Church Outside") then
        if(g.curLocation.objects[1].state == "Closed" and g.movementDirection == "North") then
            g.mapTransitionIsLegal = false
            g.writeToTextDisplay({"The door is closed!"})
        else
            g.mapTransitionIsLegal = true
        end
    else
        g.mapTransitionIsLegal = true
    end
end

return updateRoomLocks