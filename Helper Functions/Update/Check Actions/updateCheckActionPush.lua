local updateCheckActionPush = {}

local g = GLOBALS

function updateCheckActionPush.update()
    
    if(g.curLocation == loadRooms.gasStationInside) then
        if(g.mouse.objectPointedAt == loadRooms.gasStationInside.objects.button and loadRooms.gasStationInside.objects.button.state == "Off") then
            loadRooms.gasStationInside.objects.button.state = "On"
            g.activateGasPumps()
            loadSFX.pickup:play()
        end
    
    elseif(g.curLocation == loadRooms.graveyard) then
        if(g.mouse.objectPointedAt == loadRooms.graveyard.objects.grave) then
            if(loadRooms.graveyard.objects.grave.state == "normal") then
                loadRooms.graveyard.objects.stairs = {name="stairs",x=37,y=67,w=25,h=11,text={look={"Stairs. They lead down into the", "the earth. But what hides", "there?"},move=""},img=loadImages.graveStairs,move=""}
                loadRooms.graveyard.objects.grave.state = "Pushed"
                
                -- Move the grave and update the map
                loadRooms.graveyard.objects.grave.y = loadRooms.graveyard.objects.grave.y - 12
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