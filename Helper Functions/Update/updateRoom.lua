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
        
        -- Make sure the cursor is over the map and we aren't currently in a screen transition
        if(g.selectedAction == "Move" and g.movementDirection ~= nil and (g.screenTransition.active == false or debug)) then
            
            -- Check locks in the room
            updateRoomLocks.update()
            
            if(g.mapTransitionIsLegal) then
            
                -- Start the screen transition
                createEvent.create(createEvent.create{name="Start Screen Transition", x=3, y=3, w=94, h=77})
                
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
            end
            
        end
    end
    
    

return updateRoom