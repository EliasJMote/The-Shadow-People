local updateCheckAction = {}

    local g = GLOBALS

    -- If the player clicks on something in the room, perform a click update
    function updateCheckAction.update()
        if(g.curLocation ~= nil) then

            -- If the cursor is pointing to an object
            if(g.mouse.objectPointedAt ~= nil) then

                -- Check if the player is selecting an action
                if(g.actionSelected ~= nil) then

                    -- If it's an illegal action
                    if(g.mouse.objectPointedAt.text[g.actionSelected:lower()] == nil) then
                        if(g.curLocation.state == "Dark" and not g.mouse.objectPointedAt.visibleInDark and not debug) then
                            g.writeToTextDisplay({"It's too dark to see!"})
                        else
                            if(g.actionSelected == "Close") then
                                g.writeToTextDisplay({"You can't close that!"})
                            elseif(g.actionSelected == "Look") then
                                g.writeToTextDisplay({"You can't look at that!"})
                            elseif(g.actionSelected == "Move") then
                                g.writeToTextDisplay({"You can't move there!"})
                            elseif(g.actionSelected == "Open") then
                                g.writeToTextDisplay({"You can't open that!"})
                            elseif(g.actionSelected == "Pull") then
                                g.writeToTextDisplay({"You can't pull that!"})
                            elseif(g.actionSelected == "Push") then
                                g.writeToTextDisplay({"You can't push that!"})
                            elseif(g.actionSelected == "Put") then
                                g.writeToTextDisplay({"You can't put that there!"})
                            elseif(g.actionSelected == "Take") then
                                g.writeToTextDisplay({"You can't take that!"})
                            elseif(g.actionSelected == "Talk") then
                                g.writeToTextDisplay({"You can't talk to that!"})
                            elseif(g.actionSelected == "Use") then
                                g.writeToTextDisplay({"You can't use that!"})
                            else
                                g.writeToTextDisplay({"You can't do that!"})
                            end
                        end
                        
                    -- If it's an legal action
                    else

                        -- If the player is currently in the dark or the object is not visible in the dark
                        --if(g.curLocation.state == "Dark" and not g.mouse.objectPointedAt.visibleInDark and not debug) then
                            --g.writeToTextDisplay({"It's too dark to see!"})
                            
                        -- If the player is currently in the light
                        --else
                        
                            if(g.actionSelected ~= "Move") then
                                if (g.actionSelected == "Open" and g.mouse.objectPointedAt.state ~= "Closed") then
                                    if(g.mouse.objectPointedAt.state == "Open") then
                                        g.writeToTextDisplay({"It's already open!"})
                                    elseif(g.mouse.objectPointedAt.state == "Locked") then
                                        g.writeToTextDisplay({"It's locked!"})
                                    end
                                elseif (g.actionSelected == "Close" and g.mouse.objectPointedAt.state == "Closed") then
                                    g.writeToTextDisplay({"It's already closed!"})
                                else
                                    g.writeToTextDisplay(g.mouse.objectPointedAt.text[g.actionSelected:lower()])
                                end
                            end
                            
                            -- Try to open the object if possible
                            --if(g.actionSelected == "Open" and g.mouse.objectPointedAt.state == "Closed" and g.mouse.objectPointedAt.state ~= "Locked") then
                            if(g.actionSelected == "Open" and g.mouse.objectPointedAt.state == "Closed") then
                                g.mouse.objectPointedAt.state = "Open"
                                loadSFX.pickup:play()
                            end
                            
                            if(g.actionSelected == "Open" and g.mouse.objectPointedAt.state == "Stuck") then
                                g.writeToTextDisplay({"Although it's not locked, it", "won't open for some reason..."})
                            end
                            
                            -- Try to close the object if possible
                            if(g.actionSelected == "Close" and g.mouse.objectPointedAt.state == "Open") then
                                g.mouse.objectPointedAt.state = "Closed"
                            end
                            
                            -- If the player is using an object
                            if(g.actionSelected == "Use") then
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
                                    
                                    -- If the player is pressing the buttons to manipulate the clock in the clock tower second floor
                                    if(g.curLocation == loadRooms.clockTowerInsideSecondFloor) then
                                        
                                        -- If the player pushes the button for the hour hand, advance the clock by one hour
                                        if(g.mouse.objectPointedAt == loadRooms.clockTowerInsideSecondFloor.objects.hourButton) then
                                            local r = loadRooms.clockTowerInsideSecondFloor.objects.hourHand.rot.r
                                            loadRooms.clockTowerInsideSecondFloor.objects.hourHand.rot.r = (r - math.rad(360/12)) % (2 * math.pi)
                                        elseif(g.mouse.objectPointedAt == loadRooms.clockTowerInsideSecondFloor.objects.minuteButton) then
                                            local r = loadRooms.clockTowerInsideSecondFloor.objects.minuteHand.rot.r
                                            loadRooms.clockTowerInsideSecondFloor.objects.minuteHand.rot.r = (r - math.rad(360/12)) % (2 * math.pi)
                                        end
                                        
                                        -- Check if it is the correct time (8:35). If so, open the secret panel.
                                        g.checkClock()
                                        
                                    elseif(g.curLocation == loadRooms.puzzlingStone) then
                                        g.showMessageBox = false
                                        g.textBuffer = {}
                                        for i=0,8 do
                                            if(g.mouse.objectPointedAt == loadRooms.puzzlingStone.objects["button" .. (i+1)]) then 
                                                if(loadRooms.puzzlingStone.objects["button" .. (i+1)].state == "Off") then
                                                    loadRooms.puzzlingStone.objects["button" .. (i+1)].state = "On"
                                                else
                                                    loadRooms.puzzlingStone.objects["button" .. (i+1)].state = "Off"
                                                end
                                            end
                                        end
                                        
                                        if(loadRooms.puzzlingStone.objects.button1.state == "On"
                                            and loadRooms.puzzlingStone.objects.button2.state == "Off"
                                            and loadRooms.puzzlingStone.objects.button3.state == "Off"
                                            and loadRooms.puzzlingStone.objects.button4.state == "Off"
                                            and loadRooms.puzzlingStone.objects.button5.state == "On"
                                            and loadRooms.puzzlingStone.objects.button6.state == "Off"
                                            and loadRooms.puzzlingStone.objects.button7.state == "On"
                                            and loadRooms.puzzlingStone.objects.button8.state == "On"
                                            and loadRooms.puzzlingStone.objects.button9.state == "Off"
                                            and loadRooms.puzzlingStone.objects.door.state == "Stuck") then
                                            g.showMessageBox = true
                                            g.writeToTextDisplay({"The door suddenly opens."})
                                            loadRooms.puzzlingStone.objects.door.state = "Open"
                                        end
                                        
                                    elseif(g.curLocation == loadRooms.altarRoom) then
                                        if(g.mouse.objectPointedAt == loadRooms.altarRoom.objects.altar) then
                                            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="red prince ending"}})
                                            g.music = loadMusic.nightmareGeometry
                                            g.music:play()
                                        end
                                        
                                    elseif(g.curLocation == loadRooms.shed) then
                                        if(g.mouse.objectPointedAt == loadRooms.shed.objects.radio) then
                                            -- Play the sound clip of the number radio station
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
                            
                            -- Push actions
                            if(g.actionSelected == "Push") then
                                if(g.curLocation == loadRooms.graveyard) then
                                    if(g.mouse.objectPointedAt == loadRooms.graveyard.objects.grave) then
                                        if(loadRooms.graveyard.objects.grave.state == "normal") then
                                            loadRooms.graveyard.objects.stairs = {name="stairs",x=37,y=67,w=25,h=11,text={look={"Stairs. They lead down into the", "the earth. But what hides", "there?"},move=""},img=loadImages.graveStairs,move=""}
                                            loadRooms.graveyard.objects.grave.state = "Pushed"
                                            loadRooms.graveyard.objects.grave.y = loadRooms.graveyard.objects.grave.y - 12
                                            loadGameText.graveyard.grave.pull = {"It has already been moved!"}
                                            loadGameText.graveyard.grave.push = {"It has already been moved!"}
                                            loadSFX.pickup:play()
                                        end
                                    end
                                    
                                
                                elseif(g.curLocation == loadRooms.clockTowerInsideSecondFloor) then
                                    
                                    -- If the player pushes the button for the hour hand, advance the clock by one hour
                                    if(g.mouse.objectPointedAt == loadRooms.clockTowerInsideSecondFloor.objects.hourButton) then
                                        local r = loadRooms.clockTowerInsideSecondFloor.objects.hourHand.rot.r
                                        loadRooms.clockTowerInsideSecondFloor.objects.hourHand.rot.r = (r - math.rad(360/12)) % (2 * math.pi)
                                    elseif(g.mouse.objectPointedAt == loadRooms.clockTowerInsideSecondFloor.objects.minuteButton) then
                                        local r = loadRooms.clockTowerInsideSecondFloor.objects.minuteHand.rot.r
                                        loadRooms.clockTowerInsideSecondFloor.objects.minuteHand.rot.r = (r - math.rad(360/12)) % (2 * math.pi)
                                    end
                                    
                                    -- Check if it is the correct time (8:35). If so, open the secret panel.
                                    g.checkClock()
                                    
                                -- Stone puzzle room
                                elseif(g.curLocation == loadRooms.puzzlingStone) then
                                    g.showMessageBox = false
                                    g.textBuffer = {}
                                    for i=0,8 do
                                        if(g.mouse.objectPointedAt == loadRooms.puzzlingStone.objects["button" .. (i+1)]) then 
                                            if(loadRooms.puzzlingStone.objects["button" .. (i+1)].state == "Off") then
                                                loadRooms.puzzlingStone.objects["button" .. (i+1)].state = "On"
                                            else
                                                loadRooms.puzzlingStone.objects["button" .. (i+1)].state = "Off"
                                            end
                                        end
                                    end
                                    if(loadRooms.puzzlingStone.objects.button1.state == "On"
                                        and loadRooms.puzzlingStone.objects.button2.state == "Off"
                                        and loadRooms.puzzlingStone.objects.button3.state == "Off"
                                        and loadRooms.puzzlingStone.objects.button4.state == "Off"
                                        and loadRooms.puzzlingStone.objects.button5.state == "On"
                                        and loadRooms.puzzlingStone.objects.button6.state == "Off"
                                        and loadRooms.puzzlingStone.objects.button7.state == "On"
                                        and loadRooms.puzzlingStone.objects.button8.state == "On"
                                        and loadRooms.puzzlingStone.objects.button9.state == "Off"
                                        and loadRooms.puzzlingStone.objects.door.state == "Stuck") then
                                        g.showMessageBox = true
                                        g.writeToTextDisplay({"The door suddenly opens."})
                                        loadRooms.puzzlingStone.objects.door.state = "Open"
                                    end
                                end
                            end
                            
                            if(g.actionSelected == "Take") then
                                if(g.curLocation == loadRooms.gasStationInside) then
                                    if(g.mouse.objectPointedAt == g.curLocation.objects.gasCanister) then
                                        g.playerState.hasGasCan = true
                                    end
                                    
                                elseif(g.curLocation == loadRooms.churchInsideSecretRoom) then
                                    if(g.mouse.objectPointedAt == g.curLocation.objects.necklace) then
                                        g.playerState.hasNecklace = true
                                    end

                                elseif(g.curLocation == loadRooms.graveyardUnderground2) then
                                    if(g.mouse.objectPointedAt == g.curLocation.objects.shadowOrb) then
                                        g.playerState.hasShadowOrb = true
                                        loadRooms.highway5.state = "Evil"
                                    end
                                    
                                elseif(g.curLocation == loadRooms.sewer7) then
                                    if(g.mouse.objectPointedAt == g.curLocation.objects.eclipseBrooch) then
                                        g.playerState.hasEclipseBrooch = true
                                    end
                                
                                end
                            end
                            
                            if(g.actionSelected == "Move") then
                                g.movementDirection = g.mouse.objectPointedAt.move
                            end
                            
                            if(g.actionSelected == "Put") then
                                if(g.curLocation == loadRooms.shadowLands9) then
                                    if(g.itemSelected == "Shadow Orb" and g.mouse.objectPointedAt == g.curLocation.objects.statue and g.curLocation.objects.statue.state == "Off") then
                                        g.curLocation.objects.statue.state = "On"
                                        g.writeToTextDisplay({"You place the Shadow Orb into", "the hands of the statue. It", "pulses with a strange energy.", "Somehow, in your head, you hear", "the words: THE RITUAL IS READY.", "LIE DOWN ON THE ALTAR TO BEGIN", "THE TRANSMOGRIFICATION."})
                                        g.curLocation.objects.statue.text.put = {"The orb has already been", "placed."}
                                        
                                        for k,v in ipairs(g.items) do
                                            if(v.name =="Shadow Orb") then
                                                table.remove(g.items,k)
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                            
                            if(g.actionSelected == "Look") then
                                
                                -- Easter Egg Ending (looking at the sun on the patio and go blind)
                                if(g.curLocation == loadRooms.patio) then
                                    if(g.mouse.objectPointedAt == loadRooms.patio.objects.sun) then
                                        g.playerState.numOfTimesLookedAtSun = g.playerState.numOfTimesLookedAtSun + 1
                                        if(g.playerState.numOfTimesLookedAtSun >= 5) then
                                            g.actionSelected = nil
                                            g.textBuffer = {}
                                            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="easter egg ending"}})
                                            createEvent.create({name="Play Music", music=loadMusic.darkStreets})
                                        end
                                    end
                                    
                                -- Classroom transition from day to night
                                elseif(g.curLocation == loadRooms.classroom) then
                                    if(g.mouse.objectPointedAt == loadRooms.classroom.objects.chalkboard1
                                        or g.mouse.objectPointedAt == loadRooms.classroom.objects.chalkboard2
                                        or g.mouse.objectPointedAt == loadRooms.classroom.objects.chalkboard3) then
                                        g.actionSelected = nil
                                        g.textBuffer = {}
                                        g.showMessageBox = false
                                        g.playerState.classOver = true
                                        loadRooms.school1.backgrounds.light = loadImages.school1Night
                                        loadRooms.school1.music = loadMusic.houseDark
                                        loadRooms.car2.backgrounds.light = loadImages.carNight
                                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="class transition"}})
                                    end
                                   
                                -- Staring at the Imperfect
                                elseif(g.curLocation == loadRooms.nightmareGeometry2) then
                                
                                    -- Play audio clips for deep breathing, screaming, crawling (1x, 2x, 3x)
                                    if(g.mouse.objectPointedAt == loadRooms.nightmareGeometry2.objects.beast) then
                                        if(loadRooms.nightmareGeometry2.backgrounds.light==loadImages.nightmareGeometry2) then
                                            loadRooms.nightmareGeometry2.backgrounds.light=loadImages.nightmareGeometry2_2
                                            loadRooms.nightmareGeometry2.objects.beast={name="Beast",x=25,y=9,w=58,h=57,text={look={"..."}}}
                                        elseif(loadRooms.nightmareGeometry2.backgrounds.light==loadImages.nightmareGeometry2_2) then
                                            loadRooms.nightmareGeometry2.backgrounds.light=loadImages.nightmareGeometry2_3
                                            loadRooms.nightmareGeometry2.objects.beast={name="Beast",x=25,y=3,w=58,h=63,text={look={"Just run."}}}
                                        --elseif(loadRooms.nightmareGeometry2.backgrounds.light==loadImages.nightmareGeometry2_3) then
                                            --loadRooms.nightmareGeometry2.objects.beast={name="Beast",x=25,y=3,w=58,h=63,text={look={"Please run, I'm scared."}}}
                                        end
                                    end
                                    
                                -- Squiggle Man
                                elseif(g.curLocation == loadRooms.nightmareGeometry3) then
                                
                                    -- Play audio clips for deep breathing, screaming, crawling (1x, 2x, 3x)
                                    if(g.mouse.objectPointedAt == loadRooms.nightmareGeometry3.objects.humanHoleInWall) then
                                        loadSFX.squiggleManScream:stop()
                                        loadSFX.squiggleManScream:setVolume(0.1)
                                        loadSFX.squiggleManScream:setPitch(0.8)
                                        loadSFX.squiggleManScream:play()
                                    end
                                
                                -- Staring at the snaking wall
                                elseif(g.curLocation == loadRooms.nightmareGeometry4) then
                                
                                    -- Play audio clips for deep breathing, screaming, crawling (1x, 2x, 3x)
                                    if(g.mouse.objectPointedAt == loadRooms.nightmareGeometry4.objects.squiggleHoleInWall and g.playerState.numOfTimesLookedAtWallHole < 5) then
                                        g.playerState.numOfTimesLookedAtWallHole = g.playerState.numOfTimesLookedAtWallHole + 1
                                        
                                        if(g.playerState.numOfTimesLookedAtWallHole == 1) then
                                            loadRooms.nightmareGeometry4.objects.squiggleHoleInWall.text.look={"You hear crawling and", "screaming."}
                                            loadSFX.squiggleManScream:stop()
                                            loadSFX.squiggleManScream:setVolume(0.2)
                                            loadSFX.squiggleManScream:play()
                                            
                                        elseif(g.playerState.numOfTimesLookedAtWallHole == 2) then
                                            loadRooms.nightmareGeometry4.objects.squiggleHoleInWall.text.look={"The crawling draws near..."}
                                            loadSFX.squiggleManScream:stop()
                                            loadSFX.squiggleManScream:setVolume(0.4)
                                            loadSFX.squiggleManScream:play()
                                        
                                        -- If the player looks 4 times, monster eyes will appear
                                        elseif(g.playerState.numOfTimesLookedAtWallHole == 3) then
                                            loadRooms.nightmareGeometry4.objects.squiggleHoleInWall.text.look=
                                            {"Something is in the wall", "looking at you..."}
                                            loadSFX.squiggleManScream:stop()
                                            loadSFX.squiggleManScream:setVolume(0.6)
                                            loadSFX.squiggleManScream:play()
                                        
                                        elseif(g.playerState.numOfTimesLookedAtWallHole == 4) then
                                            loadRooms.nightmareGeometry4.backgrounds.light = loadImages.nightmareGeometry4WithCreature
                                            loadRooms.nightmareGeometry4.objects.squiggleHoleInWall.text.look={""}
                                            loadSFX.squiggleManScream:stop()
                                            loadSFX.squiggleManScream:setVolume(0.8)
                                            loadSFX.squiggleManScream:play()
                                            
                                        -- If the player looks at least 5 times, the monster will appear and shriek (jump scare!!!)
                                        elseif(g.playerState.numOfTimesLookedAtWallHole == 5) then 
                                            loadRooms.nightmareGeometry4.backgrounds.light = loadImages.nightmareGeometry4
                                            g.showMessageBox = false
                                            loadSFX.squiggleManScream:stop()
                                            loadSFX.squiggleManScream:setVolume(1)
                                            loadSFX.squiggleManScream:setPitch(2.5)
                                            loadSFX.squiggleManScream:play()
                                            g.mouse.objectHover = nil
                                            g.mouse.objectPointedAt = nil
                                            loadRooms.nightmareGeometry4.objects.squiggleHoleInWall = nil
                                            g.mouse.x = -128
                                            g.mouse.y = -128
                                        end
                                    end
                                
                                --[[elseif(g.curLocation == loadRooms.nightmareGeometry5) then
                                
                                    -- Play audio of children laughing (1x - 4x)
                                    if(g.mouse.objectPointedAt == loadRooms.nightmareGeometry5.objects.endlessHallway) then
                                        g.playerState.numOfTimesLookedAtHallway = g.playerState.numOfTimesLookedAtHallway + 1
                                        
                                        -- If the player looks 4 times, a shadow child will appear
                                        if(g.playerState.numOfTimesLookedAtWallHole == 4) then
                                            
                                            -- Disable the north exit after looking/moving 4 times
                                            loadRooms.nightmareGeometry5.exits.north = nil
                                        
                                        -- If the player looks at least 5 times, the shadow child slowly walks towards the screen (Chara Undertale style; jump scare!!!)
                                        elseif(g.playerState.numOfTimesLookedAtWallHole >= 5) then
                                        end
                                    end]]
                                    
                                elseif(g.curLocation == loadRooms.puzzlingStone) then
                                    --[[if(g.mouse.objectPointedAt == loadRooms.puzzlingStone.objects.button1) then
                                        if(loadRooms.puzzlingStone.objects.button1.state == "Off") then
                                            
                                        end
                                    end]]
                                end
                            end
                            
                            -- Pick up the item (if the selected item can be taken)
                            if(g.actionSelected == "Take" and g.mouse.objectPointedAt.item ~= nil) then
                                
                                -- Add the item to the player's inventory
                                table.insert(g.items, g.mouse.objectPointedAt.item)
                                g.itemCount = g.itemCount + 1
                                loadSFX.pickup:play()
                                
                                -- Move the item offscreen
                                for k,v in pairs(g.curLocation.objects) do
                                    if(v.name == g.mouse.objectPointedAt.name) then
                                        
                                        v.x = -256
                                        v.y = -256
                                        break
                                    end
                                end
                                g.mouse.objectPointedAt = nil
                            end
                        --end
                    end
                
                -- Check if the player is selecting an item
                elseif(g.itemSelected ~= nil) then
                    -- The bolt cutters are used to cut the chain at the park
                    if(g.itemSelected == "B. Cutters") then
                        if(g.curLocation == loadRooms.park1) then
                            if(g.curLocation.objects.parkGate.state == "Locked" and g.mouse.objectPointedAt == g.curLocation.objects.parkGate) then
                                g.curLocation.objects.parkGate.state = "Closed"
                                g.writeToTextDisplay({"You cut the chain with the bolt", "cutters."})
                                g.curLocation.objects.parkGate.text.look={"It's a gate to a park."}
                                loadSFX.pickup:play()
                            else
                                g.writeToTextDisplay({"You can't use the bolt cutters", "here."})
                            end
                        else
                            if(g.mouse.objectPointedAt ~= nil) then
                                g.writeToTextDisplay({"You can't use the bolt cutters", "here."})
                            end
                        end
                        
                    elseif(g.itemSelected == "Car Key") then
                        if not((g.curLocation == loadRooms.car1 or g.curLocation == loadRooms.car2 or g.curLocation == loadRooms.car3)
                            and g.mouse.objectPointedAt == g.curLocation.objects.steeringWheel) then
                            g.writeToTextDisplay({"You can't use the car key", "here."})
                        end
                        
                    elseif(g.itemSelected == "E. Brooch") then
                        g.writeToTextDisplay({"You can't use the eclipse brooch", "here."})
                    elseif(g.itemSelected == "Gas Can") then
                        g.writeToTextDisplay({"You can't use the gas can here."})
                    -- The gas station key unlocks the front door of the gas station
                    elseif(g.itemSelected == "G.S. Key") then
                        if(g.curLocation == loadRooms.gasStationOutside) then
                            if(g.curLocation.objects.door.state == "Locked" and g.mouse.objectPointedAt == g.curLocation.objects.door) then
                                g.curLocation.objects.door.state = "Closed"
                                g.writeToTextDisplay({"You unlock the door with", "the key."})
                                loadSFX.pickup:play()
                            else
                                g.writeToTextDisplay({"You can't use the gas station", "key here."})
                            end
                        else
                            if(g.mouse.objectPointedAt ~= nil) then
                                g.writeToTextDisplay({"You can't use the gas station", "key here."})
                            end
                        end
                        
                    -- The hacksaw is used to cut the sewer gate
                    elseif(g.itemSelected == "Hacksaw") then
                        if(g.curLocation == loadRooms.street7) then
                            if(g.curLocation.objects.sewerGate.state == "Locked" and g.mouse.objectPointedAt == g.curLocation.objects.sewerGate) then
                                g.curLocation.objects.sewerGate.state = "Broken"
                                g.writeToTextDisplay({"You cut the bars with the", "hacksaw."})
                                loadSFX.pickup:play()
                            else
                                g.writeToTextDisplay({"You can't use the hacksaw here."})
                            end
                        else
                            if(g.mouse.objectPointedAt ~= nil) then
                                g.writeToTextDisplay({"You can't use the hacksaw here."})
                            end
                        end
                        
                    -- The hammer is used to smash the mirrors in the mirror room
                    elseif(g.itemSelected == "Hammer") then
                        if(g.curLocation == loadRooms.mirrorRoom) then
                            if(g.curLocation.objects.mirror1.state == "Unbroken" and g.mouse.objectPointedAt == g.curLocation.objects.mirror1) then
                                g.curLocation.objects.mirror1.state = "Broken"
                                g.writeToTextDisplay({"You smash the mirror to pieces."})
                                loadSFX.glassShattering:play()
                            elseif(g.curLocation.objects.mirror2.state == "Unbroken" and g.mouse.objectPointedAt == g.curLocation.objects.mirror2) then
                                g.curLocation.objects.mirror2.state = "Closed"
                                g.curLocation.objects.mirror2.text.close = {"You close the secret door."}
                                g.curLocation.objects.mirror2.text.open = {"You open the secret door."}
                                g.curLocation.objects.mirror2.text.move=""
                                g.curLocation.objects.mirror2.move=""
                                g.writeToTextDisplay({"You smash the mirror to pieces,", "revealing a hidden door behind", "it."})
                                loadSFX.glassShattering:play()
                            elseif(g.curLocation.objects.mirror3.state == "Unbroken" and g.mouse.objectPointedAt == g.curLocation.objects.mirror3) then
                                g.curLocation.objects.mirror3.state = "Broken"
                                g.writeToTextDisplay({"You smash the mirror to pieces."})
                                loadSFX.glassShattering:play()
                            else
                                g.writeToTextDisplay({"You can't use the hammer here."})
                            end
                        elseif(g.curLocation == loadRooms.dreamMirrorRoom) then
                            if(g.curLocation.objects.mirror1.state == "Unbroken" and g.mouse.objectPointedAt == g.curLocation.objects.mirror1) then
                                g.curLocation.objects.mirror1.state = "Broken"
                                g.writeToTextDisplay({"You smash the mirror to pieces."})
                                loadSFX.glassShattering:play()
                            elseif(g.curLocation.objects.mirror2.state == "Unbroken" and g.mouse.objectPointedAt == g.curLocation.objects.mirror2) then
                                g.curLocation.objects.mirror2.state = "Broken"
                                g.writeToTextDisplay({"You smash the mirror to pieces."})
                                loadSFX.glassShattering:play()
                            elseif(g.curLocation.objects.mirror3.state == "Unbroken" and g.mouse.objectPointedAt == g.curLocation.objects.mirror3) then
                                g.curLocation.objects.mirror3.state = "Broken"
                                g.writeToTextDisplay({"You smash the mirror to pieces.", "A strange sight lies before", "you. It looks to be a portal to", "deep space. There is a planet", "covered in darkness, barely lit", "by a total eclipse of a nearby", "star."})
                                g.curLocation.objects.mirror3.text.move=""
                                g.curLocation.objects.mirror3.move=""
                                loadSFX.glassShattering:play()
                            else
                                g.writeToTextDisplay({"You can't use the hammer here."})
                            end
                        else
                            if(g.mouse.objectPointedAt ~= nil) then
                                g.writeToTextDisplay({"You can't use the hammer here."})
                            end
                        end
                        
                    elseif(g.itemSelected == "Lighter") then
                        if(g.curLocation == loadRooms.churchInside1) then
                            if(g.mouse.objectPointedAt ~= nil) then
                                if((g.mouse.objectPointedAt.name == "Candle" or g.mouse.objectPointedAt.name == "Candelabra") and g.mouse.objectPointedAt.state == "Unlit") then
                                    g.mouse.objectPointedAt.state = "Lit"
                                    local textArray = {"You light the " .. string.lower(g.mouse.objectPointedAt.name) .. "."}
                                    if(g.curLocation.objects.candle1.state == "Lit"
                                        and g.curLocation.objects.candle2.state == "Lit"
                                        and g.curLocation.objects.wallCandelabra1.state == "Lit") then
                                        
                                        -- The inside door in the church appears after lighting the candles
                                        g.curLocation.objects.churchInsideDoor={name="Door",x=13,y=30,w=10,h=37,img={closed=loadImages.churchDoorInsideClosed,open=loadImages.churchDoorInsideOpen},state="Closed",move="",text={close={"You close the door."},look={"It's a narrow door hidden in", "the wall."},open={"You open the door."},move="",}}
                                        table.insert(textArray, "Lighting the candles has")
                                        table.insert(textArray, "revealed a hidden door in the")
                                        table.insert(textArray, "wall.")
                                        loadSFX.pickup:play()
                                    end
                                    g.writeToTextDisplay(textArray)
                                else
                                    g.writeToTextDisplay({"You can't use the lighter here."})
                                end
                            end
                            
                        else
                            if(g.mouse.objectPointedAt ~= nil) then
                                g.writeToTextDisplay({"You can't use the lighter here."})
                            end
                        end
                        
                    -- The mirror is used in the statue room light puzzle
                    elseif(g.itemSelected == "Mirror") then
                        if(g.curLocation == loadRooms.graveyardUnderground1) then
                            if(g.mouse.objectPointedAt == g.curLocation.objects.statueEmittingLight) then
                                if(g.curLocation.objects.statueHoldingDarkCrystalBall.state ~= "Lit") then
                                    g.curLocation.objects.statueHoldingDarkCrystalBall.state = "Lit"
                                    g.curLocation.objects.statueHoldingDarkCrystalBall.text.look = {"A statue holding a lit crystal", "ball."}
                                    g.writeToTextDisplay({"You hold the mirror up,", "reflecting light back at the", "dim orb. The orb fills with", "shining light. You hear a panel", "slide in the wall, revealing a", "hidden door."})
                                    g.curLocation.objects.door = {name="Door",x=45,y=30,w=10,h=37,img={closed=loadImages.graveyardDoorClosed,open=loadImages.graveyardDoorOpen},state="Closed",move="",text={close={"You close the door."},look={"It's a narrow door hidden in", "the wall."},open={"You open the door."},move="",}}
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
                    
                    elseif(g.itemSelected == "Necklace") then
                        g.writeToTextDisplay({"You can't use the necklace", "here."})
                    elseif(g.itemSelected == "Shadow Orb") then
                        g.writeToTextDisplay({"You can't use the shadow orb", "here."})
                    end
                else
                    g.writeToTextDisplay({"You must select an action", "or item first!"})
                end
            end
        end
    end

return updateCheckAction