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
                if(g.timers.global < g.timers.titleScreenLogo-70) then
                    g.timers.global = g.timers.titleScreenLogo-70
                end
                
                -- Start the game
                if(g.timers.global >= g.timers.titleScreenLogo+35) then
                    if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleScreen.startGame)) then
                        g.state = "instructions"
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144})
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleScreen.credits)) then
                        g.state = "title credits"
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144})
                    end
                end
                
            elseif(event.state == "title credits") then
                if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleCreditsScreen.titleScreen)) then
                    g.state = "title"
                    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144})
                end
                
            -- On the instructions screen
            elseif(event.state == "instructions") then
                if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.instructionsScreen.startGame)) then
                    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="Play Music", music=loadMusic.house}})
                    if(g.curLocation == loadRooms.bedroom) then
                        g.writeToTextDisplay(loadGameText.opening)
                    else
                        g.showMessageBox = false
                    end
                    g.state = "game"
                end
            
            elseif(event.state == "car transition 1") then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
                g.curLocation = loadRooms.car2
                
            elseif(event.state == "car transition 2") then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
                g.curLocation = loadRooms.car3
                
            elseif(event.state == "car transition 3") then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
                g.curLocation = loadRooms.car4
            
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
                    
                    
                    if(g.selectedAction == "Use") then
                        
                        -- Select/deselect an item to use
                        if(g.mouse.itemMenuHoverItem) then
                            if(g.itemSelected == nil) then
                                g.itemSelected = g.mouse.itemMenuHoverItem
                            else
                                g.itemSelected = nil
                            end
                        end
                    end
                    
                    -- Clear the item being selected if using an action besides "Use" or "Look"
                    if(g.itemSelected ~= nil) then
                        if(g.selectedAction ~= "Use" and g.selectedAction ~= "Look") then
                            g.itemSelected = nil
                        end
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
            g.screenTransition.event = event.event
            
        -- Stop the screen transition
        elseif(event.name == "Stop Screen Transition") then
            g.screenTransition.active = false
            g.timers.screenTransition = 0
            if(g.screenTransition.event ~= nil) then
                createEvent.create(g.screenTransition.event)
                g.screenTransition.event = nil
            end
            
        elseif(event.name == "Play Music") then
            if(event.music ~= nil and event.music ~= g.music) then
                if(g.music ~= nil) then g.music:stop() end
                g.music = event.music
                g.music:play()
            end
            
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
                
            elseif(g.state == "title credits") then
                for k,v in pairs(g.textBoxes.titleCreditsScreen) do
                    if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                        g.mouse.textHover = true
                    end
                end
            
            elseif(g.state == "game") then
                g.mouse.objectHover = false
                g.mouse.objectPointedAt = nil
                
                -- Check if the cursor is over an object
                for k,v in pairs(g.curLocation.objects) do
                    
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
                
                -- Get the collision boxes for the item names
                for k,v in ipairs(g.items) do
                    v.x = 105
                    v.y = 22 + 13 * (k-1)
                    
                    -- Check if the cursor is over an item
                    if(g.mouseCollision(g.mouse.x, g.mouse.y, v)) then
                        g.mouse.itemMenuHover = true
                        g.mouse.itemMenuHoverItem = v.name
                    end
                end
            end
            
        elseif(event.name == "State Transition") then
            
            g.state = event.state
        end
        
        -- First in, first out
        table.remove(g.events,1)
    end
    
end

return updateEvents