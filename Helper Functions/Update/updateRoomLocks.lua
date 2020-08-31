local updateRoomLocks = {}

function updateRoomLocks.update()
    
    local g = GLOBALS
    
    -- Debug mode lets you move around the game unhindered
    if not (debug) then
    
        -- For each room, check the locks
        if(g.curLocation.name == "Bedroom") then
            if(g.curLocation.objects[1].state == "Closed") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is closed!"})
            elseif(g.curLocation.objects[1].state == "Open") then
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Car 1" and g.movementDirection == "North") then
            g.mapTransitionIsLegal = false
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="car transition 1"}})
        
        elseif(g.curLocation.name == "Car 2" and g.movementDirection == "South") then
            g.mapTransitionIsLegal = false
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="car transition 2"}})
            
        elseif(g.curLocation.name == "Car 3" and g.movementDirection == "South") then
            g.mapTransitionIsLegal = false
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="car transition 3"}})
            
        elseif(g.curLocation.name == "Church Outside") then
            if(g.curLocation.objects[1].state == "Closed" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is closed!"})
            else
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Gas Station Outside") then
            if(g.curLocation.objects[1].state == "Locked" and g.movementDirection == "North") then
                g.mapTransitionIsLegal = false
                g.writeToTextDisplay({"The door is locked!"})
            else
                g.mapTransitionIsLegal = true
            end
            
        elseif(g.curLocation.name == "Street 7") then
            if(g.curLocation.objects[1].state == "Locked" and g.movementDirection == "North") then
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