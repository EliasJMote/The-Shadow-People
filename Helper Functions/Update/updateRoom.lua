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
    end
    
    function updateRoom.update()

        if(g.itemSelected == "Car Key") then
            if(g.curLocation.name == "Car 1") then
            
                if(g.mouse.objectPointedAt == loadRooms.car1.objects.steeringWheel) then
                    g.mapTransitionIsLegal = false
                    g.itemSelected = nil
                    g.actionSelected = nil
                    g.textBuffer = {}
                    g.showMessageBox = false
                    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="car transition 1"}})
                end
                
            elseif(g.curLocation.name == "Car 2") then
                if(g.mouse.objectPointedAt == loadRooms.car2.objects.steeringWheel) then
                    if(g.playerState.classOver) then
                        g.mapTransitionIsLegal = false
                        g.itemSelected = nil
                        g.actionSelected = nil
                        g.textBuffer = {}
                        g.showMessageBox = false
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="car transition 2"}})
                    else
                        g.writeToTextDisplay({"You have to go to class first!"})
                    end
                end
                
            elseif(g.curLocation.name == "Car 3") then
                if(g.mouse.objectPointedAt == loadRooms.car3.objects.steeringWheel) then
                    if(g.playerState.hasGasCan) then
                        g.mapTransitionIsLegal = false
                        g.itemSelected = nil
                        g.actionSelected = nil
                        g.textBuffer = {}
                        g.showMessageBox = false
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="car transition 3"}})
                    else
                        g.writeToTextDisplay({"You need to get gas first!"})
                    end
                end
            end
        end
        
        if(g.curLocation.name == "Sewer 9") then
            if(g.mouse.objectPointedAt == g.curLocation.objects.pit and g.actionSelected == "Move") then
                updateRoom.transition("Flooded Labyrinth 1")
                createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
            end
        
        elseif(g.curLocation.name == "House Outside") then
            g.mapTransitionIsLegal = false
            g.itemSelected = nil
            g.actionSelected = nil
            g.textBuffer = {}
            g.showMessageBox = false
            if(g.playerState.hasNecklace) then
                if(g.playerState.hasShadowOrb and g.playerState.hasEclipseBrooch) then
                    --createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="dream transition"}})
                    updateRoom.transition("Shadow Lands 1")
                    createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
                else
                    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="good ending"}})
                    createEvent.create({name="Play Music", music=loadMusic.undertheStars})
                end
            else
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="bad ending"}})
                createEvent.create({name="Play Music", music=loadMusic.darkStreets})
            end
            
        elseif(g.curLocation.name == "Shadow Lands 3") then
            g.mapTransitionIsLegal = false
            g.itemSelected = nil
            g.actionSelected = nil
            g.textBuffer = {}
            g.showMessageBox = false
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="alien ending"}})
            createEvent.create({name="Play Music", music=loadMusic.darkStreets})
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
            
        end
    end
    
    

return updateRoom