local updateCheckActionUse = {}

local g = GLOBALS

function updateCheckActionUse.update()
    -- Operate off the light switch
    if(g.mouse.objectPointedAt.lightSwitch) then
        loadSFX.pickup:play()
        if(g.curLocation.state == "Light") then
            g.curLocation.state = "Dark"
            g.curLocation.music=loadMusic.houseDark
            createEvent.create({name="Play Music", music=loadMusic.houseDark})
        else
            g.curLocation.state = "Light"
            g.curLocation.music=loadMusic.houseLight
            createEvent.create({name="Play Music", music=loadMusic.houseLight})
        end
    else
        
        if(g.curLocation == loadRooms.gasStationOutside) then
            if(((g.mouse.objectPointedAt == loadRooms.gasStationOutside.objects.pump1 and loadRooms.gasStationOutside.objects.pump1.state == "On")
                or (g.mouse.objectPointedAt == loadRooms.gasStationOutside.objects.pump2 and loadRooms.gasStationOutside.objects.pump2.state == "On"))
                and g.playerState.hasGas == false) then
                g.playerState.hasGas = true
                g.playerCarHasGasoline()
                loadSFX.pickup:play()
            end
        
        -- If the player uses the gas station button and it's currently off, update text and states for the button and the outside pumps
        elseif(g.curLocation == loadRooms.gasStationInside) then
            if(g.mouse.objectPointedAt == loadRooms.gasStationInside.objects.button and loadRooms.gasStationInside.objects.button.state == "Off") then
                loadRooms.gasStationInside.objects.button.state = "On"
                g.activateGasPumps()
                loadSFX.pickup:play()
            end
        
        -- If the player is pressing the buttons to manipulate the clock in the clock tower second floor
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
            
        elseif(g.curLocation == loadRooms.puzzlingStone) then
            g.updatePuzzlingStonePuzzle()
            
        elseif(g.curLocation == loadRooms.altarRoom) then
            if(g.mouse.objectPointedAt == loadRooms.altarRoom.objects.altar) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="red prince ending"}})
                g.music = loadMusic.nightmareGeometry
                g.music:play()
            end
            
        elseif(g.curLocation == loadRooms.shed) then
            if(g.mouse.objectPointedAt == loadRooms.shed.objects.radio) then
                -- Play the sound clip of the number radio station
                loadSFX.numberRadioStationMessage:seek(0)
                loadSFX.numberRadioStationMessage:play()
            end
            
        elseif(g.curLocation == loadRooms.shadowLands9) then
            if(loadRooms.shadowLands9.objects.statue.state == "On") then
                g.mapTransitionIsLegal = false
                g.itemSelected = nil
                g.actionSelected = nil
                g.textBuffer = {}
                g.showMessageBox = false
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="alien ending"}})
            end
        end
    end
end

return updateCheckActionUse