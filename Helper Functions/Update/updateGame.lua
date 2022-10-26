local updateGame = {}

function updateGame.update(dt,g)


    -- Update the next time we want to hit based on the minimum delta time
    g.nextTime = g.nextTime + g.minDT

    -- Update the window scaling (since the player can adjust this window at anytime)
    g.scale.x = love.graphics.getWidth()/160
    g.scale.y = love.graphics.getHeight()/144

    -- Update the mouse
    g.mouse.x, g.mouse.y = love.mouse.getPosition()
    g.mouse.x = g.mouse.x / g.scale.x
    g.mouse.y = g.mouse.y / g.scale.y
    
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