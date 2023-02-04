local updateCheckActionOpen = {}

local g = GLOBALS

function updateCheckActionOpen.update()
    
    if(g.mouse.objectPointedAt.state == "Closed" and g.mouse.objectPointedAt ~= loadRooms.livingRoom.objects.patioEntrance) then
        g.mouse.objectPointedAt.state = "Open"
        loadSFX.doorOpen:play()

    elseif(g.mouse.objectPointedAt.state == "Stuck") then
        g.writeToTextDisplay({"Although it's not locked, it", "won't open for some reason."})
    
    -- The player can't open an object that's locked
    elseif(g.mouse.objectPointedAt.state == "Locked") then
        g.writeToTextDisplay({"It's locked!"})
        loadSFX.lockedDoor:play()
    
    -- The player can't open an object that's already open
    elseif(g.mouse.objectPointedAt.state == "Open") then
        g.writeToTextDisplay({"It's already open!"})
        
    else
        g.writeToTextDisplay(g.mouse.objectPointedAt.text[g.actionSelected:lower()])
    end
    
end

return updateCheckActionOpen