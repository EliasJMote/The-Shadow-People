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

        if(g.curLocation.name == "Car 1") then
            if(g.itemSelected == "Car Key") then
                if(g.mouse.objectPointedAt == loadRooms.car1.objects.steeringWheel) then
                    g.mapTransitionIsLegal = false
                    g.itemSelected = nil
                    g.actionSelected = nil
                    g.textBuffer = {}
                    g.showMessageBox = false
                    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="car transition 1"}})
                end
            end
        end
        
        if(g.curLocation.name == "House Outside") then
            g.mapTransitionIsLegal = false
            g.itemSelected = nil
            g.actionSelected = nil
            g.textBuffer = {}
            g.showMessageBox = false
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="good ending"}})
            createEvent.create({name="Play Music", music=loadMusic.undertheStars})
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