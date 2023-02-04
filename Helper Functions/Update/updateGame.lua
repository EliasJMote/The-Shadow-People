local updateGame = {}

function updateGame.update(dt,g)

    local maximized = love.window.isMaximized( )
    local fullscreen, fstype = love.window.getFullscreen( )
    local nativeWidth = 160
    local nativeHeight = 144


    -- Update the next time we want to hit based on the minimum delta time
    g.nextTime = g.nextTime + g.minDT

    -- Update the window scaling (since the player can adjust this window at anytime)
    
    --[[if not(maximized or fullscreen) then
        
        g.scale.x = love.graphics.getWidth()/160
        g.scale.y = love.graphics.getHeight()/144
        
        g.translate.x = 0
        g.translate.y = 0]]
    --else
        
        local windowWidth, windowHeight = love.graphics.getDimensions( )
        
        g.scale.y = math.floor(windowHeight/144)
        g.scale.x = g.scale.y
        
        g.translate.x = (windowWidth - g.scale.x * 160) / 2
        g.translate.y = (windowHeight - g.scale.y * 144) / 2
    --end

    -- Update the mouse
    g.mouse.x, g.mouse.y = love.mouse.getPosition()
    g.mouse.x = (g.mouse.x - g.translate.x) / g.scale.x
    g.mouse.y = (g.mouse.y - g.translate.y) / g.scale.y
    
    if(g.mouse.x < 0) then
        g.mouse.x = 0
    elseif(g.mouse.x > 160) then
        g.mouse.x = 160
    end
    
    if(g.mouse.y < 0) then
        g.mouse.y = 0
    elseif(g.mouse.y > 144) then
        g.mouse.y = 144
    end
    
    -- Check the current position of the mouse as an event
    createEvent.create{name="Check Mouse Position", state=g.state, mouse={x=g.mouse.x,y=g.mouse.y}}
    
    -- Poll the title screen
    if(g.state == "title") then
        updateTitleScreen.update()
        
    -- Poll the endings
    elseif(g.state == "good ending" or g.state == "bad ending" or g.state == "alien ending" or g.state == "easter egg ending" or g.state == "red prince ending") then
        updateEnding.update()
    end
    
    -- Update the event table
    updateEvents.update()
    
    -- Check if the screen transition is active
    if(g.screenTransition.active) then
        -- Increment the screen transition timer
        g.timers.screenTransition = g.timers.screenTransition + 1
    end
    
    if(g.state == "pause") then
        g.mouse.actionHover = false
        g.mouse.objectHover = false
        g.mouse.mapHover = false
    
    elseif(g.state == "video intro") then
        updateVideoIntro.update()
    
    elseif(g.state == "video bad ending") then
        updateVideoBadEnding.update()
    
    -- Squiggle man rushes the player
    elseif(g.state == "game") then
        updateSquiggleMan.update()
        
        if(g.playerState.lookedAtGasStationBathroomMirror) then
            g.timers.gasStationBathroomMirrorShadow = g.timers.gasStationBathroomMirrorShadow + 1
        end
    
    -- The shadow child slowly approaches the player in a cutscene
    elseif(g.state == "shadow child") then
        updateShadowChild.update()
    end
    
    -- Update the global timer
    if(g.state ~= "warning" and g.state ~= "video intro") then
        g.timers.global = g.timers.global + 1
    end
end

return updateGame