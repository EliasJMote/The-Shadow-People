local updateLeftClickPauseEvents = {}

local g = GLOBALS

-- When the user left clicks something in the pause menu, run through possible event triggers
function updateLeftClickPauseEvents.update(event)
    
    -- If the game is paused
    if(event.state == "pause") then
        
        -- If we are not currently in a screen transition
        if not(g.screenTransition.active) then
            
            -- If the player clicks "resume game", then start the game back up
            if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.resumeGame)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
                if(g.music ~= nil) then
                    g.music:play()
                end
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.checkItems)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="inventory"}})
                
            -- If the player clicks on "Load Game", go to the load game screen
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.loadGame)) then
                g.previousState = "pause"
                
                -- Read the contents of the auto save
                if(love.filesystem.getInfo("Auto_Save_File.lua")) then
                    local contents = love.filesystem.read("Auto_Save_File.lua")
                    local loadTable = json.decode(contents)
                    g.loadAutoGameDateTime = loadTable.dateTime
                end
                
                -- Read the contents of the normal save files
                for i=1,#g.textBoxes.loadGameScreen.loadGame do
                    if(love.filesystem.getInfo("Save_File_" .. i .. ".lua")) then
                        local contents = love.filesystem.read("Save_File_" .. i .. ".lua")
                        local loadTable = json.decode(contents)
                        g.loadGameDateTime[i] = loadTable.dateTime
                    end
                end
                
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="load game"}})
                
            -- If the player clicks on "Save Game", go to the save game screen
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.saveGame)) then
                g.previousState = "pause"
                
                for i=1,#g.textBoxes.saveGameScreen.saveGame do
                    if(love.filesystem.getInfo("Save_File_" .. i .. ".lua")) then
                        local contents = love.filesystem.read("Save_File_" .. i .. ".lua")
                        local loadTable = json.decode(contents)
                        g.loadGameDateTime[i] = loadTable.dateTime
                    end
                end
                
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="save game"}})
            
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.instructions)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="pause instructions"}})
            
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.quitGame)) then
                g.goToTitleScreen()
            end
        end
        
    elseif(event.state == "pause instructions") then
        
        -- If we are not currently in a screen transition
        if not(g.screenTransition.active) then
            if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseInstructionsScreen.back)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="pause"}})
            end
            
        end
        
    elseif(event.state == "inventory") then
        if not(g.screenTransition.active) then
            if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.itemScreen.back)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="pause"}})
            end
        end
        
    -- In the load game screen
    elseif(event.state == "load game") then
    
        -- If the screen isn't currently transitioning
        if not(g.screenTransition.active) then
            
            -- If the player clicks the back button, go back to the pause menu
            if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.loadGameScreen.back)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state=g.previousState}})
                
            -- Load the auto-saved file
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.loadGameScreen.loadGameAuto) and love.filesystem.getInfo("Auto_Save_File.lua")) then
                g.loadGame("Auto_Save_File.lua")
                
            -- Load a normal save file
            else
                -- Load the selected save file
                for i=1,#g.textBoxes.loadGameScreen.loadGame do
                    if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.loadGameScreen.loadGame[i]) and love.filesystem.getInfo("Save_File_" .. i .. ".lua")) then
                        g.loadGame("Save_File_" .. i .. ".lua")
                    end
                end
            end
        end
        
    elseif(event.state == "save game") then
        if not(g.screenTransition.active) then
            if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.saveGameScreen.back)) then
                g.savedString = ""
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="pause"}})
                
            else
                for i=1,#g.textBoxes.saveGameScreen.saveGame do
                    if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.saveGameScreen.saveGame[i])) then
                        g.saveGame("Save_File_" .. i .. ".lua")
                        g.savedString = "Save to file " .. i .. " successful!"
                        local contents = love.filesystem.read("Save_File_" .. i .. ".lua")
                        local loadTable = json.decode(contents)
                        g.loadGameDateTime[i] = loadTable.dateTime
                    end
                end
            end
        end
        
    elseif((g.state == "good ending" and g.timers.endingText >= g.timers.goodEnding)
        or (g.state == "bad ending" and g.timers.endingText >= g.timers.badEnding)
        or (g.state == "easter egg ending" and g.timers.endingText >= g.timers.easterEggEnding)
        or (g.state == "alien ending" and g.timers.endingText >= g.timers.alienEnding)) then
        g.goToTitleScreen()
    end
end

return updateLeftClickPauseEvents