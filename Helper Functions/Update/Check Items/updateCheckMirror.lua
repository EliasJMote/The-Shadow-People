local updateCheckMirror = {}

local g = GLOBALS

function updateCheckMirror.update()
    
    -- In the first underground graveyard location
    if(g.curLocation == loadRooms.graveyardUnderground1) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.statueEmittingLight) then
            if(g.curLocation.objects.statueHoldingDarkCrystalBall.state ~= "Lit") then
                
                -- Light up the dark crystal ball
                g.curLocation.objects.statueHoldingDarkCrystalBall.state = "Lit"
                
                -- Tell the player that the dark crystal ball is now illuminated, revealing a secret door
                g.writeToTextDisplay({"You hold the mirror up,", "reflecting light back at the", "dim orb. The orb fills with", "shining light. You hear a panel", "slide in the wall, revealing a", "hidden door."})
                
                -- Put the secret door on the map
                g.revealStatueRoomHiddenDoorOnMap()
                
                loadSFX.pickup:play()
            else
                g.writeToTextDisplay({"The orb is already lit!"})
            end
        else
            g.writeToTextDisplay({"You can't use the mirror here."})
        end
    else
        if(g.mouse.objectPointedAt ~= nil) then
            g.writeToTextDisplay({"You can't use the mirror here."})
        end
    end
end

return updateCheckMirror