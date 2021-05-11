local drawManager = {}

function drawManager.draw()

    local g = GLOBALS
  
    -- scale the window
    love.graphics.scale(g.scale.x,g.scale.y)
  
    if(g.state == "warning") then
        drawWarningScreen.draw()
  
    -- draw the title screen and intro
    elseif(g.state == "title") then
        drawTitleScreen.draw()
        
    elseif(g.state == "title credits") then
        drawTitleCreditsScreen.draw()
      
    elseif(g.state == "options") then
        drawOptionsScreen.draw()
        
    elseif(g.state == "load game") then
        drawLoadScreen.draw()
        
    elseif(g.state == "save game") then
        drawSaveScreen.draw()
  
    -- draw the instructions screen
    elseif(g.state == "instructions") then
        drawInstructionsScreen.draw()
  
    elseif(g.state == "game") then
        drawGame.draw()
        
    elseif(g.state == "pause") then
        drawPauseScreen.draw()
        
    elseif(g.state == "inventory") then
        drawItemScreen.draw()
    
    elseif(g.state == "car transition 1" or g.state == "car transition 2" or g.state == "car transition 3" or g.state == "class transition" or g.state == "dream transition" or g.state == "space transition" or g.state == "night transition" or g.state == "dark transition") then
        drawInGameTransitions.draw()
    
    elseif(g.state == "good ending" or g.state == "bad ending" or g.state == "red prince ending" or g.state == "alien ending" or g.state == "easter egg ending") then
        drawEnding.draw()
        
    elseif(g.state == "video intro" or g.state == "video bad ending") then
        drawVideo.draw()
    end

    -- Draw the mouse cursor
    if not(g.state == "title" and g.timers.global < g.timers.titleScreenLogo+35) then
        drawCursor.draw()
    end
    
    -- Draw the screen transition
    drawScreenTransition.draw()
    
    -- Draw squiggle man
    if(g.state == "game") then
        if(g.curLocation == loadRooms.nightmareGeometry4 and g.playerState.numOfTimesLookedAtWallHole >= 5 and g.timers.squiggleMan >= 0) then
            local t = g.timers.squiggleMan
            if(t <= 20) then
                love.graphics.draw(loadImages.squiggleMan[1],16+8+263/4,16+210/4+8, 0, 0.5, 0.5,16+263/2,16+210/2)
            elseif(t < 40) then
                love.graphics.draw(loadImages.squiggleMan[1+math.floor(t/2)%6],16+8+263/4+2*t-40,16+210/4+8+2*t-40, 0, 0.5+(t-20)/10, 0.5+(t-20)/10,16+263/2,16+210/2)
            else
                love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
                love.graphics.rectangle("fill",0,0,160,144)
                love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
            end
        end
    end
    
    -- Draw the shadow child
    if(g.state == "shadow child") then
        local t = g.timers.shadowChild
        local dt = 16
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
        love.graphics.rectangle("fill",-64,-64,160+64,144+64)
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        
        if(t < 150) then
            love.graphics.draw(loadImages.shadowChild[1],160/2,144/2, 0, 0.3, 0.3,11,21)
        elseif(t < 180) then
            love.graphics.draw(loadImages.shadowChild[2],160/2,144/2, 0, 0.3, 0.3,11,21)
        elseif(t < 210) then
            love.graphics.draw(loadImages.shadowChild[3],160/2,144/2, 0, 0.3, 0.3,11,21)
        elseif(t < 210) then
            love.graphics.draw(loadImages.shadowChild[4],160/2,144/2, 0, 0.3, 0.3,11,21)
        elseif(t < 240) then
            love.graphics.draw(loadImages.shadowChild[5],160/2,144/2, 0, 0.3, 0.3,11,21)
        elseif(t < 270) then
            love.graphics.draw(loadImages.shadowChild[6],160/2,144/2, 0, 0.3, 0.3,11,21)
        elseif(t < 660) then
            if(t%dt<dt/2) then
                love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
            else
                love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
            end
            if(t % dt < dt/2) then
                love.graphics.rectangle("fill",-64,-64,160+64,144+64)
            end
            love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
            local shakeMagnitude = 2
            local dx = love.math.random(-shakeMagnitude, shakeMagnitude)
            local dy = love.math.random(-shakeMagnitude, shakeMagnitude)
            love.graphics.translate(dx, dy)
            love.graphics.draw(loadImages.shadowChild[7+math.floor(g.timers.shadowChild/4)%4],160/2,144/2, 0, 0.3+(t-270)/200, 0.3+(t-270)/200,11,21)
        else
            --love.graphics.draw(loadImages.shadowChild[7+math.floor(660/4)%4],160/2,144/2, 0, 0.3+(660-270)/200, 0.3+(660-270)/200,11,21)
        end
    end
    
    -- Set the game to sleep or return if needed to cap the frame rate
    local curTime = love.timer.getTime()
    if g.nextTime <= curTime then
        g.nextTime = curTime
        return
    end
    love.timer.sleep(g.nextTime - curTime)
end

return drawManager