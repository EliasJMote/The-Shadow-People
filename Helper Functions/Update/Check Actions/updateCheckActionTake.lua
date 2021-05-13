local updateCheckActionTake = {}

local g = GLOBALS

function updateCheckActionTake.update()
    
    -- If the player takes the necklace, record this player state
    if(g.curLocation == loadRooms.churchInsideSecretRoom) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.necklace) then
            g.playerState.hasNecklace = true
        end

    -- If the player takes the shadow orb, record this player state and update some rooms
    elseif(g.curLocation == loadRooms.graveyardUnderground2) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.shadowOrb) then
            g.playerState.hasShadowOrb = true
            loadRooms.highway5.state = "Evil"
            loadRooms.shed.state = "Evil"
        end
        
    -- If the player takes the eclipse brooch, record this player state
    elseif(g.curLocation == loadRooms.sewer7) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.eclipseBrooch) then
            g.playerState.hasEclipseBrooch = true
        end
    
    end

    -- Pick up the item (if the selected item can be taken)
    if(g.mouse.objectPointedAt.item ~= nil) then
        
        -- Add the item to the player's inventory
        table.insert(g.items, g.mouse.objectPointedAt.item)
        g.itemCount = g.itemCount + 1
        loadSFX.pickup:play()
        
        -- Move the item offscreen
        for k,v in pairs(g.curLocation.objects) do
            if(v.name == g.mouse.objectPointedAt.name) then
                v.state = "offscreen"
                v.x = -256
                v.y = -256
                break
            end
        end
        g.mouse.objectPointedAt = nil
    end
    
end

return updateCheckActionTake