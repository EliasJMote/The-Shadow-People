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
            
        elseif(g.curLocation == loadRooms.churchInside1) then
            if((g.mouse.objectPointedAt.name == "Candelabra" or g.mouse.objectPointedAt.name == "Candle")
                and g.mouse.objectPointedAt.state == "Lit") then
                g.mouse.objectPointedAt.state = "Unlit"
                g.mouse.objectPointedAt.text.use = {"It's already out."}
            end
            
        elseif(g.curLocation == loadRooms.churchBasement) then
            local function darkness()
                -- Start dark static
                g.backgroundStatic = true
                
                -- Remove ladder
                g.curLocation.objects.ladder = nil
                
                -- Mouse no longer looks at any object
                g.mouse.objectPointedAt = nil
                
                -- Start shadow lands music; stop what was playing before
                g.music:stop()
                g.music=loadMusic.shadowLands
                g.music:play()
                
                g.curLocation.objects.inscription.text.look = {"YOU SHOULDN'T HAVE DONE THAT"}
                
                g.curLocation.objects.mirror = nil
                g.curLocation.objects.shadow = {name="shadow",x=42,y=43,w=13,h=22,state="One",img={one=loadImages.churchBasementShadow,two=loadImages.churchBasementShadow2,three=loadImages.churchBasementShadow3,four=loadImages.churchBasementShadow4,five=loadImages.churchBasementShadow5},text={look={""}}}
            end
        
            if(g.curLocation.objects.wallCandelabra1.state == "Lit" and g.mouse.objectPointedAt == g.curLocation.objects.wallCandelabra1) then
                g.curLocation.objects.wallCandelabra1.state = "Unlit"
                g.curLocation.objects.wallCandelabra1.text.use = {"It's already out."}
                --loadSFX.pickup:play()
                if(g.curLocation.objects.wallCandelabra2.state == "Unlit") then
                    darkness()
                end
                
            elseif(g.curLocation.objects.wallCandelabra2.state == "Lit" and g.mouse.objectPointedAt == g.curLocation.objects.wallCandelabra2) then
                g.curLocation.objects.wallCandelabra2.state = "Unlit"
                g.curLocation.objects.wallCandelabra2.text.use = {"It's already out."}
                --loadSFX.pickup:play()
                if(g.curLocation.objects.wallCandelabra1.state == "Unlit") then
                    darkness()
                end
            end
            
        elseif(g.curLocation == loadRooms.puzzlingStone) then
            g.updatePuzzlingStonePuzzle()
            
        elseif(g.curLocation == loadRooms.altarRoom) then
            if(g.mouse.objectPointedAt == loadRooms.altarRoom.objects.altar) then
                g.timers.global = 90
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="red prince ending"}})
                g.music = loadMusic.nightmareGeometry
                g.music:play()
                
                -- For testing only
                --g.timers.endingText = g.timers.redPrinceEnding + 60 * 5
            end
            
        elseif(g.curLocation == loadRooms.shed) then
            if(g.mouse.objectPointedAt == loadRooms.shed.objects.radio) then
                -- Play the sound clip of the number radio station
                loadSFX.numberRadioStationMessage:seek(0)
                loadSFX.numberRadioStationMessage:play()
            end
            
        elseif(g.curLocation == loadRooms.shadowLands9) then
            if(loadRooms.shadowLands9.objects.statue.state == "On") then
                g.timers.global = 90
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