local updateLeftClickTitleEvents = {}

local g = GLOBALS

function updateLeftClickTitleEvents.update(event)
    if(event.state == "warning") then
        if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.warningScreen.continue)) then
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="video intro"}})
        end

    elseif(event.state == "video intro") then
        g.timers.video = 876

    -- On the title screen
    elseif(event.state == "title") then
        -- Skip the opening credits
        if(g.timers.global < g.timers.titleScreenLogo-70) then
            g.timers.global = g.timers.titleScreenLogo-70
        end
        
        -- Title screen
        if(g.timers.global >= g.timers.titleScreenLogo+35) then
            if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleScreen.startGame)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="instructions"}})
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleScreen.loadGame)) then
                g.previousState = "title"
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="load game"}})
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleScreen.options)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="options"}})
            elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleScreen.credits)) then
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="title credits"}})
            end
        end
        
    elseif(event.state == "title credits") then
        
        -- Click the back button
        if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleCreditsScreen.titleScreen)) then
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="title"}})
        
        -- Click the down arrow to scroll the credits down
        elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleCreditsScreen.downArrow) and g.titleCreditsPage == 1) then
            g.titleCreditsPage = 2
            
        -- Click the up arrow to scroll the credits down
        elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.titleCreditsScreen.upArrow) and g.titleCreditsPage == 2) then
            g.titleCreditsPage = 1
        end
        
    elseif(event.state == "options") then
        if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.optionsScreen.back)) then
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="title"}})
        elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.optionsScreen.increaseWindowScale)) then
            if(scale < 6) then
                scale = scale + 1
                love.window.setMode(160*scale, 144*scale, {resizable = true})
            end
        elseif(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.optionsScreen.decreaseWindowScale)) then
            if(scale > 2) then
                scale = scale - 1
                love.window.setMode(160*scale, 144*scale, {resizable = true})
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
    end
end

return updateLeftClickTitleEvents