local updateCheckActionPush = {}

local g = GLOBALS

function updateCheckActionPush.update()
    
    if(g.curLocation == loadRooms.gasStationInside) then
        if(g.mouse.objectPointedAt == loadRooms.gasStationInside.objects.button and loadRooms.gasStationInside.objects.button.state == "Off") then
            loadRooms.gasStationInside.objects.button.state = "On"
            g.activateGasPumps()
            loadSFX.pickup:play()
        end
    
    -- Pushing the grave at the graveyard
    elseif(g.curLocation == loadRooms.graveyard) then
        if(g.mouse.objectPointedAt == loadRooms.graveyard.objects.grave) then
            if(loadRooms.graveyard.objects.grave.state == "normal") then
                
                g.updateGrave()
                
                loadSFX.pickup:play()
            end
        end
        
    
    elseif(g.curLocation == loadRooms.clockTowerInsideSecondFloor) then
        
        -- If the player pushes the button for the hour hand, advance the clock by one hour
        if(g.mouse.objectPointedAt == loadRooms.clockTowerInsideSecondFloor.objects.hourButton) then
            if(loadRooms.clockTowerInsideFirstFloor.objects.cogHole.state == "Full") then
                local r = loadRooms.clockTowerInsideSecondFloor.objects.hourHand.rot.r
                loadRooms.clockTowerInsideSecondFloor.objects.hourHand.rot.r = (r - math.rad(360/12)) % (2 * math.pi)
            else
                g.writeToTextDisplay({"Nothing happens."})
            end
                
        elseif(g.mouse.objectPointedAt == loadRooms.clockTowerInsideSecondFloor.objects.minuteButton) then
            if(loadRooms.clockTowerInsideFirstFloor.objects.cogHole.state == "Full") then
                local r = loadRooms.clockTowerInsideSecondFloor.objects.minuteHand.rot.r
                loadRooms.clockTowerInsideSecondFloor.objects.minuteHand.rot.r = (r - math.rad(360/12)) % (2 * math.pi)
            else
                g.writeToTextDisplay({"Nothing happens."})
            end
        end
        
        -- Check if it is the correct time (8:35). If so, open the secret panel.
        if(loadRooms.clockTowerInsideFirstFloor.objects.cogHole.state == "Full") then
            g.checkClock()
        end
        
    -- Stone puzzle room
    elseif(g.curLocation == loadRooms.puzzlingStone) then
        g.updatePuzzlingStonePuzzle()
    end
    
end

return updateCheckActionPush