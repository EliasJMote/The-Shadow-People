local updateRoom = {}

    local g = GLOBALS

    function updateRoom.transition(roomName)
        for k,v in pairs(loadRooms) do
            if(v.name == roomName) then
                g.curLocation = v
                break
            end
        end
        g.textBuffer = {}
        
        -- Stops all sound effects when traversing between rooms (mainly for Squiggle Man and the Shadow Children)
        for k,v in pairs(loadSFX) do
            v:stop()
        end
    end
    
    function updateRoom.update()

        -- The car key is used in conjunction with the steering wheel to progress to car transition states
        if(g.itemSelected == "Car Key") then
            if(g.curLocation.name == "Car 1") then
                if(g.mouse.objectPointedAt == loadRooms.car1.objects.steeringWheel) then
                    g.fromGameToTransition("car transition 1")
                end
                
            elseif(g.curLocation.name == "Car 2") then
                if(g.mouse.objectPointedAt == loadRooms.car2.objects.steeringWheel) then
                    if(g.playerState.classOver) then
                        g.fromGameToTransition("car transition 2")
                    else
                        g.writeToTextDisplay({"You have to go to class first!"})
                    end
                end
                
            elseif(g.curLocation.name == "Car 3") then
                if(g.mouse.objectPointedAt == loadRooms.car3.objects.steeringWheel) then
                    if(g.playerState.hasGas) then
                        g.fromGameToTransition("car transition 3")
                    else
                        g.writeToTextDisplay({"You need to get gas first!"})
                    end
                end
            end
        end
        
        -- Secondary church room (with trap room)
        if(g.curLocation.name == "Church Inside 2") then
            if(g.mouse.objectPointedAt == g.curLocation.objects.trapDoor and g.actionSelected == "Move") then
                if(g.curLocation.objects.trapDoor.state == "Closed") then
                    g.mapTransitionIsLegal = false
                    g.writeToTextDisplay({"The door is closed!"})
                else
                    updateRoom.transition("Church Basement")
                    createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
                end
            else
                g.mapTransitionIsLegal = true
            end
        
        elseif(g.curLocation.name == "Church Basement") then
            if(g.curLocation.objects.ladder ~= nil and g.mouse.objectPointedAt == g.curLocation.objects.ladder and g.actionSelected == "Move") then
                updateRoom.transition("Church Inside 2")
                createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
            else
                g.mapTransitionIsLegal = false
            end
        
        -- Stop the music when entering the shed
        elseif(g.curLocation.name == "Park 3") then
            if(g.movementDirection == "North" and g.curLocation.objects.door.state == "Open") then
                if(g.music ~= nil) then
                    g.music:stop()
                    g.music = nil
                end
            end
            
        -- Stop the number radio station message
        elseif(g.curLocation.name == "Shed") then
            if(g.movementDirection == "South") then
                loadSFX.numberRadioStationMessage:stop()
            end
        
        -- Using the move action to enter the sewer pit
        elseif(g.curLocation.name == "Sewer 9") then
            if(g.mouse.objectPointedAt == g.curLocation.objects.pit and g.actionSelected == "Move") then
                updateRoom.transition("Flooded Labyrinth 1")
                createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
            end
           
        -- Using the move action to enter the puzzling stone door after it's open
        elseif(g.curLocation.name == "Puzzling Stone") then
            if(g.mouse.objectPointedAt == g.curLocation.objects.door and g.actionSelected == "Move") then
                updateRoom.transition("Altar Room")
                createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
            end
           
        -- Using the move action to enter the nightmare geometry
        elseif(g.curLocation.name == "Flooded Labyrinth 5") then
            if(g.mouse.objectPointedAt == g.curLocation.objects.pit and g.actionSelected == "Move") then
                updateRoom.transition("Nightmare Geometry 1")
                createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
            end
            
        elseif(g.curLocation.name == "Nightmare Geometry 7") then
            if(g.mouse.objectPointedAt == g.curLocation.objects.endlessHallway and (g.actionSelected == "Move" or g.actionSelected == "Look")) then
                g.mapTransitionIsLegal = false
                g.itemSelected = nil
                g.actionSelected = nil
                g.textBuffer = {}
                g.showMessageBox = false
                g.music:stop()
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="shadow child"}})
            end
            
        elseif(g.curLocation.name == "Dark Passage 1") then
            if(g.mouse.objectPointedAt == g.curLocation.objects.light and (g.actionSelected == "Move" or g.actionSelected == "Look")) then
                g.mapTransitionIsLegal = false
                g.itemSelected = nil
                g.actionSelected = nil
                g.textBuffer = {}
                g.showMessageBox = false
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="dark transition"}})
            end
        
        elseif(g.curLocation.name == "House Outside") then
            if(loadRooms.houseOutside.objects.door.state == "Open") then
                if((g.mouse.objectPointedAt == g.curLocation.objects.door and g.actionSelected == "Move")
                or (g.movementDirection == "North")) then
                    g.mapTransitionIsLegal = false
                    g.itemSelected = nil
                    g.actionSelected = nil
                    g.textBuffer = {}
                    g.showMessageBox = false
                    if(g.playerState.hasNecklace) then
                        if(g.playerState.hasShadowOrb and g.playerState.hasEclipseBrooch) then
                            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="dream transition"}})
                        else
                            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="good ending"}})
                            createEvent.create({name="Play Music", music=loadMusic.undertheStars})
                        end
                    else
                        -- Go the the night transition
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="night transition"}})
                    end
                end
            else
                if((g.mouse.objectPointedAt == g.curLocation.objects.door and g.actionSelected == "Move") or (g.movementDirection == "North")) then
                    g.mapTransitionIsLegal = false
                    g.movementDirection = nil
                    g.writeToTextDisplay({"The door is closed!"})
                end
            end
        end
        
        -- Make sure the cursor is over the map and we aren't currently in a screen transition
        if((g.actionSelected == "Move" or g.mouse.mapHover ~= nil) and g.movementDirection ~= nil and (g.screenTransition.active == false or debug)) then
            
            -- Check locks in the room (some locks like driving the car require a use action over a move action)
            updateRoomLocks.update()
            
            if(g.mapTransitionIsLegal) then
                
                -- Move in a given direction based on mouse cursor
                if(g.movementDirection == "North") then
                    updateRoom.transition(g.curLocation.exits.north)
                elseif(g.movementDirection == "West") then
                    updateRoom.transition(g.curLocation.exits.west)
                elseif(g.movementDirection == "South") then
                    updateRoom.transition(g.curLocation.exits.south)
                elseif(g.movementDirection == "East") then
                    updateRoom.transition(g.curLocation.exits.east)
                end
                
                -- Start the screen transition
                createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
            end
            
            if(g.curLocation.backgroundStatic) then
                g.backgroundStatic = true
            else
                g.backgroundStatic = false
            end
            
        end
    end
    
    

return updateRoom