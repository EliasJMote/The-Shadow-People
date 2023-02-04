local updateRoomLocks = {}

function updateRoomLocks.update()
    
    local g = GLOBALS
    
    -- Debug mode lets you move around the game unhindered
    -- This code assumes the player is attempting to move in a cardinal direction.
    -- For movement outside of this, use "updateRoom.lua" instead.
    if not (debug) then
    
        -- For each room, check the locks
        -- Check bedroom locks
        if(g.curLocation.name == "Bedroom") then
            if(g.curLocation.objects["bedroomDoor"].state == "Closed") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is closed!"})
            elseif(g.curLocation.objects["bedroomDoor"].state == "Open") then
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Living Room") then
            if(g.movementDirection == "North") then
                if(g.curLocation.objects["livingRoomDoor"].state == "Closed") then
                    g.mapTransitionIsLegal = false
                    g.writeToTextDisplay({"The door is closed!"})
                elseif(g.curLocation.objects["livingRoomDoor"].state == "Open") then
                    g.mapTransitionIsLegal = true
                end
            else
                g.mapTransitionIsLegal = true
            end
        
        elseif(g.curLocation.name == "School 2") then
            if(g.movementDirection == "North") then
                if(g.curLocation.objects.door.state == "Closed") then
                    g.mapTransitionIsLegal = false
                    g.writeToTextDisplay({"The door is closed!"})
                elseif(g.curLocation.objects.door.state == "Open") then
                    g.mapTransitionIsLegal = true
                end
            elseif(g.movementDirection == "South") then
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Gas Station Outside") then
            if(g.curLocation.objects.door.state == "Locked" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is locked!"})
            elseif(g.curLocation.objects.door.state == "Closed" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is closed!"})
            else
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Clock Tower Outside") then
            if(g.curLocation.objects["clockTowerOutsideDoor"].state == "Closed" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is closed!"})
            else
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Car 3" and g.movementDirection == "South") then
            g.mapTransitionIsLegal = false
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="car transition 3"}})
                  
        elseif(g.curLocation.name == "Highway 1" and g.curLocation.state == "Evil" and g.movementDirection == "East") then
            g.mapTransitionIsLegal = false
            g.writeToTextDisplay({"Your car is gone!"})
                  
        elseif(g.curLocation.name == "Church Outside") then
            if(g.curLocation.objects["churchOutsideDoor"].state == "Closed" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is closed!"})
            else
                g.mapTransitionIsLegal = true
            end
           
        -- Main church room (with candles)
        elseif(g.curLocation.name == "Church Inside 1") then
            if(g.curLocation.objects.churchInsideDoor ~= nil) then
                if(g.mouse.objectPointedAt == g.curLocation.objects.churchInsideDoor or g.movementDirection == "North") then
                    if(g.curLocation.objects.churchInsideDoor.state == "Closed") then
                        g.mapTransitionIsLegal = false
                        g.writeToTextDisplay({"The door is closed!"})
                    else
                        g.mapTransitionIsLegal = true
                    end
                else
                    g.mapTransitionIsLegal = true
                end
            else
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Church Inside 2") then
            --[[if(g.curLocation.objects.trapDoor.state == "Closed") then
                if((g.actionSelected == "Move" and g.mouse.objectPointedAt == g.curLocation.objects.trapDoor) or (g.movementDirection == "North")) then
                    g.mapTransitionIsLegal = false
                    g.writeToTextDisplay({"The door is closed!"})
                else
                    updateRoom.transition("Church Basement")
                    createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
                end
            else
                g.mapTransitionIsLegal = true
            end]]
            
        elseif(g.curLocation.name == "Mirror Room") then
            if(loadRooms.mirrorRoom.objects.mirror2.state == "Open" and (g.mouse.objectPointedAt == loadRooms.mirrorRoom.objects.mirror2 or g.movementDirection == "North")) then
                g.mapTransitionIsLegal = true
                updateRoom.transition("Church Inside Secret Room")
                createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
            elseif(g.movementDirection ~= "South") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is closed!"})
            else
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Park 1") then
            
            -- Check if the gate is locked
            if(g.curLocation.objects.parkGate.state == "Locked" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The gate is locked!"})
            elseif(g.curLocation.objects.parkGate.state == "Closed" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The gate is closed!"})
            else
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Park 3") then
            if(g.movementDirection == "North") then
                if(g.curLocation.objects.door.state == "Closed") then
                    g.mapTransitionIsLegal = false
                    g.writeToTextDisplay({"The door is closed!"})
                elseif(g.curLocation.objects.door.state == "Open") then
                    g.mapTransitionIsLegal = true
                end
            elseif(g.movementDirection == "West") then
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Graveyard") then
            if(loadRooms.graveyard.objects.stairs ~= nil and g.mouse.objectPointedAt == loadRooms.graveyard.objects.stairs) then
                updateRoom.transition("Statue Room")
                createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
            else
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Statue Room") then
            if(g.curLocation.objects.door ~= nil and (g.mouse.objectPointedAt == g.curLocation.objects.door or g.movementDirection == "North")) then
                if(g.curLocation.objects.door.state == "Closed") then
                    g.mapTransitionIsLegal = false
                    g.writeToTextDisplay({"The door is closed!"})
                else
                    updateRoom.transition("Graveyard Underground")
                    createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
                end
                
            else
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Street 5") then
            if(g.curLocation.objects["sewerGate"].state == "Rusted" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is rusted shut!"})
            else
                g.mapTransitionIsLegal = true
            end
            
        -- Using the move action to enter the puzzling stone door (after it's open)
        elseif(g.curLocation.name == "Puzzling Stone") then
            if(g.mouse.objectPointedAt == g.curLocation.objects.door and (g.actionSelected == "Move" or g.movementDirection == "North")) then
                if(g.curLocation.objects.door.state == "Open") then
                    updateRoom.transition("Altar Room")
                    createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
                else
                    g.mapTransitionIsLegal = false
                    g.writeToTextDisplay({"The door is closed!"})
                end
            else
                g.mapTransitionIsLegal = true
            end
            
        -- Provide an empty else block for "House Outside" to make sure the map transition is illegal
        elseif(g.curLocation.name == "House Outside") then
            
        elseif(g.curLocation.name == "Dream Mirror Room") then
            if(loadRooms.dreamMirrorRoom.objects.mirror3.state == "Broken") then
                if(g.mouse.objectPointedAt == loadRooms.dreamMirrorRoom.objects.mirror3 or g.movementDirection == "North") then
                    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="space transition"}})
                end
            else
                g.mapTransitionIsLegal = false
            end
        
        else
            g.mapTransitionIsLegal = true
        end
    else
        g.mapTransitionIsLegal = true
    end
end

return updateRoomLocks