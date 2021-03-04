local updateEvents = {}

updateEvents.update = function()
    
    local g = GLOBALS
    
    -- Event handling (modeled as a queue)
    while(#g.events > 0) do
        
        -- Grab the first event in the queue
        local event = g.events[1]
        
        if(event.name == "Left Click") then
        
            if(event.state == "warning") then
                if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.warningScreen.continue)) then
                    --createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="title"}})
                    g.state = "title"
                end
            
        
            -- On the title screen
            elseif(event.state == "title") then
                -- Skip the opening credits
                if(g.timers.global < g.timers.titleScreenLogo-70) then
                    g.timers.global = g.timers.titleScreenLogo-70
                end
                
                -- Title screen
                if(g.timers.global >= g.timers.titleScreenLogo+35) then
                    if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleScreen.startGame)) then
                        --g.state = "instructions"
                        --createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144})
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="instructions"}})
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleScreen.loadGame)) then
                        g.previousState = "title"
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="load game"}})
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleScreen.options)) then
                        --g.state = "options"
                        --createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144})
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="options"}})
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleScreen.credits)) then
                        --g.state = "title credits"
                        --createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144})
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="title credits"}})
                    end
                end
                
            elseif(event.state == "title credits") then
                
                -- Click the back button
                if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleCreditsScreen.titleScreen)) then
                    g.state = "title"
                    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144})
                
                -- Click the down arrow to scroll the credits down
                elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleCreditsScreen.downArrow) and g.titleCreditsPage == 1) then
                    g.titleCreditsPage = 2
                    
                -- Click the up arrow to scroll the credits down
                elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleCreditsScreen.upArrow) and g.titleCreditsPage == 2) then
                    g.titleCreditsPage = 1
                end
                
            elseif(event.state == "options") then
                if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.optionsScreen.back)) then
                    g.state = "title"
                    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144})
                elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.optionsScreen.increaseWindowScale)) then
                    if(scale < 6) then
                        scale = scale + 1
                        love.window.setMode(160*scale, 144*scale, {resizable = true})
                    end
                elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.optionsScreen.decreaseWindowScale)) then
                    if(scale > 1) then
                        scale = scale - 1
                        love.window.setMode(160*scale, 144*scale, {resizable = true})
                    end
                end
                
            elseif(event.state == "pause") then
                if not(g.screenTransition.active) then
                    if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.resumeGame)) then
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
                        g.music:play()
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.loadGame)) then
                        g.previousState = "pause"
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="load game"}})
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.saveGame)) then
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="save game"}})
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.quitGame)) then
                        g.music = loadMusic.title
                        g.music:play()
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="title"}})
                    end
                end
                
            elseif(event.state == "load game") then
                if not(g.screenTransition.active) then
                    if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.loadGameScreen.back)) then
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state=g.previousState}})
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.loadGameScreen.loadGame1)) then
                        g.loadGame("Save_File_1.lua")
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.loadGameScreen.loadGame2)) then
                        g.loadGame("Save_File_2.lua")
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.loadGameScreen.loadGame3)) then
                        g.loadGame("Save_File_3.lua")
                    end
                end
                
            elseif(event.state == "save game") then
                if not(g.screenTransition.active) then
                    if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.saveGameScreen.back)) then
                        g.savedString = ""
                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="pause"}})
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.saveGameScreen.saveGame1)) then
                        g.saveGame("Save_File_1.lua")
                        g.savedString = "Save to file 1 successful!"
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.saveGameScreen.saveGame2)) then
                        g.saveGame("Save_File_2.lua")
                        g.savedString = "Save to file 2 successful!"
                    elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.saveGameScreen.saveGame3)) then
                        g.saveGame("Save_File_3.lua")
                        g.savedString = "Save to file 3 successful!"
                    end
                end
                
            -- On the instructions screen
            elseif(event.state == "instructions") then
                if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.instructionsScreen.startGame)) then
                    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="Play Music", music=loadMusic.houseDark}})
                    createGame.create()
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
                
            elseif(event.state == "class transition") then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
                loadRooms.classroom.objects = {}
                
            elseif(event.state == "dream transition") then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
                g.curLocation = loadRooms.dreamMirrorRoom
                
            elseif(event.state == "space transition") then
                createEvent.create({name="Play Music", music=loadMusic.shadowLands})
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
                g.curLocation = loadRooms.shadowLands1
                g.backgroundStatic = true
            
            -- If we are in the game
            elseif(event.state == "game") then

                g.movementDirection = nil

                -- First, advance the text box until no text is left in the buffer
                if(g.showMessageBox) then
                    if not(g.screenTransition.active) then
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
                    end
                else
                    
                    -- If we have clicked on the map in a legal direction, set the direction to move
                    if(g.mouse.mapHover ~= nil) then
                        g.movementDirection = g.mouse.mapHover
                    end
                        
                    -- Select/deselect an item to use
                    if(g.mouse.itemMenuHoverItem) then
                        if(g.itemSelected == nil or g.itemSelected ~= g.mouse.itemMenuHoverItem) then
                            g.itemSelected = g.mouse.itemMenuHoverItem
                            if(g.actionSelected ~= "Put") then
                                g.actionSelected = nil
                            end
                        elseif(g.itemSelected == g.mouse.itemMenuHoverItem) then
                            g.itemSelected = nil
                        end
                    end
                    
                    if(g.mouseCollision(g.mouse.x,g.mouse.y,g.scrollItemPageLeft)) then
                        if(g.itemPage > 1) then
                            g.itemPage = g.itemPage - 1
                        end
                        --g.mouse.scrollPageArrowHover = "Left"
                    elseif(g.mouseCollision(g.mouse.x,g.mouse.y,g.scrollItemPageRight)) then
                        if(g.itemPage < math.ceil(g.itemCount/4)) then
                            g.itemPage = g.itemPage + 1
                        end
                        --g.mouse.scrollPageArrowHover = "Right"
                    --else
                        --g.mouse.scrollPageArrowHover = nil
                    end
                    
                    -- If the message box is closed, the player can check the room
                    updateCheckAction.update()
                    
                    -- Check if the player is selecting an action
                    updatePlayerAction.update()
                    
                    -- If the player clicks the mouse on the map, check if we should go to a new room
                    updateRoom.update()
                end
                    
            end
            
        elseif(event.name == "Right Click") then
            if not(g.screenTransition.active or g.timers.squiggleMan > 0 or g.timers.shadowChild > 0) then
                if(g.state == "game") then
                    --g.state = "pause"
                    g.music:pause()
                    g.mouse.textHover = false
                    g.mouse.actionHover = false
                    g.mouse.objectHover = false
                    g.mouse.mapHover = false
                    for k,v in pairs(loadSFX) do
                        v:stop()
                    end
                    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="pause"}})
                elseif(g.state == "pause") then
                    --g.state = "game"
                    g.music:play()
                    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
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
            
            if(g.state == "warning") then
                for k,v in pairs(g.textBoxes.warningScreen) do
                    if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                        g.mouse.textHover = true
                    end
                end
            
            elseif(g.state == "title") then
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
                
            elseif(g.state == "options") then
                for k,v in pairs(g.textBoxes.optionsScreen) do
                    if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                        g.mouse.textHover = true
                    end
                end
                
            elseif(g.state == "pause") then
                local mouseHover = false
                for k,v in pairs(g.textBoxes.pauseScreen) do
                    if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                        g.mouse.textHover = true
                        mouseHover = true
                    end
                end
                --[[if not mouseHover then
                    g.mouse.textHover = false
                    g.mouse.actionHover = false
                    g.mouse.objectHover = false
                end]]
            
            elseif(g.state == "game") then
                g.mouse.objectHover = false
                g.mouse.objectPointedAt = nil
                
                -- Check if the cursor is over an object
                for k,v in pairs(g.curLocation.objects) do
                    if(v.w ~= 0 and v.h ~= 0) then
                        if(g.mouseCollision(g.mouse.x, g.mouse.y, v)) then
                            g.mouse.objectHover = true
                            g.mouse.objectPointedAt = v
                        end
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
                for i=1+4*(g.itemPage-1),4*g.itemPage do
                    if(g.items[i] ~= nil) then
                        g.items[i].x = 105
                        g.items[i].y = 22 + 13 * ((i-1)%4)
                        
                        -- Check if the cursor is over an item
                        if(g.mouseCollision(g.mouse.x, g.mouse.y, g.items[i])) then
                            g.mouse.itemMenuHover = true
                            g.mouse.itemMenuHoverItem = g.items[i].name
                        end
                    end
                end
                
                if(g.mouseCollision(g.mouse.x,g.mouse.y,g.scrollItemPageLeft)) then
                    g.mouse.scrollPageArrowHover = "Left"
                elseif(g.mouseCollision(g.mouse.x,g.mouse.y,g.scrollItemPageRight)) then
                    g.mouse.scrollPageArrowHover = "Right"
                else
                    g.mouse.scrollPageArrowHover = nil
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