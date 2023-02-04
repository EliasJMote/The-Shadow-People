local updateCheckWordAction = {}

local g = GLOBALS

function updateCheckWordAction.update()
    
    -- TODO: Split this up among each action case. Currently it appears the display text is being overwritten, rather than displaying just once.
    if(g.actionSelected ~= "Move") then
        if((g.actionSelected == "Open" or g.actionSelected == "Pull") and g.mouse.objectPointedAt.state ~= "Closed") then
            if(g.mouse.objectPointedAt.state == "Open") then
                g.writeToTextDisplay({"It's already open!"})
            elseif(g.mouse.objectPointedAt.state == "Locked") then
                g.writeToTextDisplay({"It's locked!"})
                loadSFX.lockedDoor:play()
            end
        elseif (g.actionSelected == "Push" and (g.mouse.objectPointedAt.state == "Open" or g.mouse.objectPointedAt.state == "Locked")) then
            if(g.mouse.objectPointedAt.state == "Open") then
                g.writeToTextDisplay({"It's already open!"})
            elseif(g.mouse.objectPointedAt.state == "Locked") then
                g.writeToTextDisplay({"It's locked!"})
                loadSFX.lockedDoor:play()
            end
        elseif (g.actionSelected == "Close" and g.mouse.objectPointedAt.state ~= "Open") then
            if(g.mouse.objectPointedAt.state == "Closed") then
                g.writeToTextDisplay({"It's already closed!"})
            elseif(g.mouse.objectPointedAt.state == "Locked") then
                g.writeToTextDisplay({"It's locked!"})
                loadSFX.lockedDoor:play()
            elseif(g.mouse.objectPointedAt.state == "Broken") then
                if(g.mouse.objectPointedAt == loadRooms.street5.objects.sewerGate) then
                    g.writeToTextDisplay({"The gate is already cut open,","it can no longer be closed."})
                else
                    g.writeToTextDisplay(g.mouse.objectPointedAt.text[g.actionSelected:lower()])
                end
            end
        else
            g.writeToTextDisplay(g.mouse.objectPointedAt.text[g.actionSelected:lower()])
        end
    end
    
    -- Open the object if it's closed
    --if(g.actionSelected == "Open") then
    if(g.actionSelected == "Open" or g.actionSelected == "Pull") then
        updateCheckActionOpen.update()
        
    -- Try to close the object if possible
    elseif(g.actionSelected == "Close") then
        if(g.mouse.objectPointedAt.state == "Open" and g.mouse.objectPointedAt ~= loadRooms.livingRoom.objects.patioEntrance) then
            g.mouse.objectPointedAt.state = "Closed"
            loadSFX.doorClose:play()
        end
    
    -- If the player is using an object
    elseif(g.actionSelected == "Use") then
        updateCheckActionUse.update()
    
    -- Push actions
    elseif(g.actionSelected == "Push") then
        updateCheckActionPush.update()
    
    elseif(g.actionSelected == "Take") then
        updateCheckActionTake.update()
    
    elseif(g.actionSelected == "Move") then
        g.movementDirection = g.mouse.objectPointedAt.move
    
    elseif(g.actionSelected == "Put") then
        updateCheckActionPut.update()
    
    elseif(g.actionSelected == "Look") then
        updateCheckActionLook.update()
    end
end

return updateCheckWordAction