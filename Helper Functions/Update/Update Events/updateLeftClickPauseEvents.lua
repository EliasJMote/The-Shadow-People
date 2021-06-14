local updateLeftClickPauseEvents = {}

local g = GLOBALS

function updateLeftClickPauseEvents.update(event)
    if(event.state == "pause") then
        if not(g.screenTransition.active) then
            if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.resumeGame)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
                if(g.music ~= nil) then
                    g.music:play()
                end
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.checkItems)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="inventory"}})
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.loadGame)) then
                g.previousState = "pause"
                
                if(love.filesystem.getInfo("Save_File_1.lua")) then
                    local contents = love.filesystem.read("Save_File_1.lua")
                    local loadTable = json.decode(contents)
                    g.loadGameDateTime1 = loadTable.dateTime
                end
                
                if(love.filesystem.getInfo("Save_File_2.lua")) then
                    local contents = love.filesystem.read("Save_File_2.lua")
                    local loadTable = json.decode(contents)
                    g.loadGameDateTime2 = loadTable.dateTime
                end
                
                if(love.filesystem.getInfo("Save_File_3.lua")) then
                    local contents = love.filesystem.read("Save_File_3.lua")
                    local loadTable = json.decode(contents)
                    g.loadGameDateTime3 = loadTable.dateTime
                end
                
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="load game"}})
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.saveGame)) then
                
                if(love.filesystem.getInfo("Save_File_1.lua")) then
                    local contents = love.filesystem.read("Save_File_1.lua")
                    local loadTable = json.decode(contents)
                    g.loadGameDateTime1 = loadTable.dateTime
                end
                
                if(love.filesystem.getInfo("Save_File_2.lua")) then
                    local contents = love.filesystem.read("Save_File_2.lua")
                    local loadTable = json.decode(contents)
                    g.loadGameDateTime2 = loadTable.dateTime
                end
                
                if(love.filesystem.getInfo("Save_File_3.lua")) then
                    local contents = love.filesystem.read("Save_File_3.lua")
                    local loadTable = json.decode(contents)
                    g.loadGameDateTime3 = loadTable.dateTime
                end
                
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="save game"}})
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.pauseScreen.quitGame)) then
                g.goToTitleScreen()
            end
        end
        
    elseif(event.state == "inventory") then
        if not(g.screenTransition.active) then
            if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.itemScreen.back)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="pause"}})
            end
        end
        
    elseif(event.state == "load game") then
        if not(g.screenTransition.active) then
            if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.loadGameScreen.back)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state=g.previousState}})
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.loadGameScreen.loadGame1) and love.filesystem.getInfo("Save_File_1.lua")) then
                g.loadGame("Save_File_1.lua")
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.loadGameScreen.loadGame2) and love.filesystem.getInfo("Save_File_2.lua")) then
                g.loadGame("Save_File_2.lua")
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.loadGameScreen.loadGame3) and love.filesystem.getInfo("Save_File_3.lua")) then
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
                local contents = love.filesystem.read("Save_File_1.lua")
                local loadTable = json.decode(contents)
                g.loadGameDateTime1 = loadTable.dateTime
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.saveGameScreen.saveGame2)) then
                g.saveGame("Save_File_2.lua")
                g.savedString = "Save to file 2 successful!"
                local contents = love.filesystem.read("Save_File_2.lua")
                local loadTable = json.decode(contents)
                g.loadGameDateTime2 = loadTable.dateTime
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.saveGameScreen.saveGame3)) then
                g.saveGame("Save_File_3.lua")
                g.savedString = "Save to file 3 successful!"
                local contents = love.filesystem.read("Save_File_3.lua")
                local loadTable = json.decode(contents)
                g.loadGameDateTime3 = loadTable.dateTime
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