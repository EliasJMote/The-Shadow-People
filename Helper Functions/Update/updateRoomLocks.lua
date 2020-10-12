local updateRoomLocks = {}

function updateRoomLocks.update()
    
    local g = GLOBALS
    
    -- Debug mode lets you move around the game unhindered
    if not (debug) then
    
        -- For each room, check the locks
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
            elseif(g.movementDirection == "West") then
                g.mapTransitionIsLegal = true
            end
        
        elseif(g.curLocation.name == "Car 2" and g.movementDirection == "South") then
            g.mapTransitionIsLegal = false
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="car transition 2"}})
            
        elseif(g.curLocation.name == "Gas Station Outside") then
            if(g.curLocation.objects["door"].state == "Locked" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is locked!"})
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
                        
        elseif(g.curLocation.name == "Church Outside") then
            if(g.curLocation.objects["churchOutsideDoor"].state == "Closed" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is closed!"})
            else
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Church Inside 2") then
            if(g.curLocation.objects["churchInsideDoor"].state == "Closed" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is closed!"})
            else
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Graveyard") then
            if(g.selectedAction == "Move" and loadRooms.graveyard.objects.stairs ~= nil and g.mouse.objectPointedAt == loadRooms.graveyard.objects.stairs) then
                updateRoom.transition("Graveyard Underground")
                createEvent.create({name="Start Screen Transition", x=3, y=3, w=94, h=77,event={name="Play Music", music=g.curLocation.music}})
            end
            
        elseif(g.curLocation.name == "Street 7") then
            if(g.curLocation.objects["sewerGate"].state == "Locked" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is rusted shut!"})
            else
                g.mapTransitionIsLegal = true
            end
        else
            g.mapTransitionIsLegal = true
        end
    else
        g.mapTransitionIsLegal = true
    end
end

return updateRoomLocks