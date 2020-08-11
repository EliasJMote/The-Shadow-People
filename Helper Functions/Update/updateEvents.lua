local updateEvents = {}

updateEvents.update = function()
    
    local g = GLOBALS
    
    -- Event handling (modeled as a queue)
    while(#g.events > 0) do
        
        -- Grab the first event in the queue
        local event = g.events[1]
        
        if(event.name == "Left Click") then
        
            -- On the title screen
            if(event.state == "title") then
                -- Skip the opening credits
                if(g.timers.global < 90) then
                    g.timers.global = 90
                end
                
                -- Start the game
                if(g.timers.global >= 175 and g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleScreen.startGame)) then
                    g.state = "instructions"
                end
                
            -- On the instructions screen
            elseif(event.state == "instructions") then
                if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.instructionsScreen.startGame)) then
                    if(g.curLocation == loadRooms.bedroom) then
                        g.writeToTextDisplay(loadGameText.opening)
                    else
                        g.showMessageBox = false
                    end
                    g.state = "game"
                    loadMusic.house:play()
                end
            
            -- If we are in the game
            elseif(event.state == "game") then

                g.movementDirection = nil

                -- First, advance the text box until no text is left in the buffer
                if(g.showMessageBox) then
                    -- If there are more than 4 lines of text currently in the buffer
                    if(#g.textBuffer > 4) then
                        -- Clear those 4 lines from the buffer
                        for i=1,4 do
                            table.remove(g.textBuffer,1)
                        end
                    else
                        -- The message box goes away once the text is done
                        g.showMessageBox = false
                        g.textBuffer = {}
                    end
                else
                    
                    -- If we have clicked on the map in a legal direction, set the direction to move
                    if(g.mouse.mapHover ~= nil) then
                        g.movementDirection = g.mouse.mapHover
                    end
                    
                    -- If the message box is closed, the player can check the room
                    updateRoomObjects.update()
                    
                    -- check if the player is selecting an action
                    updatePlayerAction.update()
                    
                    -- If the player clicks the mouse on the map, check if we should go to a new room
                    updateRoom.update()
                end
                    
            end
            
        -- Start the screen transition
        elseif(event.name == "Start Screen Transition") then
            g.screenTransition.active = true
            g.timers.screenTransition = 0
            g.screenTransition.x = event.x or 0
            g.screenTransition.y = event.y or 0
            g.screenTransition.w = event.w or 160
            g.screenTransition.h = event.h or 144
            
        -- Stop the screen transition
        elseif(event.name == "Stop Screen Transition") then
            g.screenTransition.active = false
            g.timers.screenTransition = 0
            
        -- Check the current position of the mouse
        elseif(event.name == "Check Mouse Position") then
            g.mouse.textHover = false
            if(g.state == "title") then
                if(g.timers.global >= 175) then
                    for k,v in pairs(g.textBoxes.titleScreen) do
                        if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                            g.mouse.textHover = true
                        end
                    end
                end
            
            elseif(g.state == "instructions") then
                for k,v in pairs(g.textBoxes.instructionsScreen) do
                    if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                        g.mouse.textHover = true
                    end
                end
            
            elseif(g.state == "game") then
                g.mouse.objectHover = false
                g.mouse.objectPointedAt = nil
                
                -- Check if the cursor is over an object
                for k,v in ipairs(g.curLocation.objects) do
                    
                    if(g.mouseCollision(g.mouse.x, g.mouse.y, v)) then
                        g.mouse.objectHover = true
                        g.mouse.objectPointedAt = v
                    end
                end
                
                g.mouse.mapHover = nil

                -- Check if the cursor is over the map
                if(g.mouse.x >= 7 and g.mouse.x <= 42 and g.mouse.y >= 101 and g.mouse.y <= 137) then
                    for k,v in pairs(g.curLocation.exits) do
                        if(k=="north") then
                            if(g.mouse.x >= 20 and g.mouse.x <= 20+11 and g.mouse.y >= 101 and g.mouse.y <= 101+9) then
                                g.mouse.mapHover = "North"
                            end
                        elseif(k=="south") then
                            if(g.mouse.x >= 20 and g.mouse.x <= 20+11 and g.mouse.y >= 128 and g.mouse.y <= 128+9) then
                                g.mouse.mapHover = "South"
                            end
                        elseif(k=="west") then
                            if(g.mouse.x >= 7 and g.mouse.x <= 7+11 and g.mouse.y >= 114 and g.mouse.y <= 114+9) then
                                g.mouse.mapHover = "West"
                            end
                        elseif(k=="east") then
                            if(g.mouse.x >= 31 and g.mouse.x <= 31+11 and g.mouse.y >= 114 and g.mouse.y <= 114+9) then
                                g.mouse.mapHover = "East"
                            end
                        end
                    end
                end
                
                g.cursorOverAction = nil
                g.actionPointedAt = nil
                
                -- If the text box is closed
                if not(g.showMessageBox) then
                
                    g.mouse.actionHover = false
                    g.mouse.actionText = nil
                
                    -- Check if the cursor is over an action
                    for k,v in ipairs(g.actionButtons) do
                        if(g.mouseCollision(g.mouse.x, g.mouse.y, v)) then
                            g.mouse.actionHover = true
                            g.mouse.actionText = v.text
                        end
                    end
                end
                
                g.mouse.itemMenuHover = false
                g.mouse.itemMenuHoverItem = nil
                
                for k,v in ipairs(g.items) do
                    v.x = 105
                    v.y = 22 + 13 * (k-1)
                    if(g.mouseCollision(g.mouse.x, g.mouse.y, v)) then
                        g.mouse.itemMenuHover = true
                        g.mouse.itemMenuHoverItem = v
                    end
                end
            end
        end
        
        -- First in, first out
        table.remove(g.events,1)
    end
    
end

return updateEvents