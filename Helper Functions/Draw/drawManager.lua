local drawManager = {}

function drawManager.draw()

    local g = GLOBALS
  
    -- scale the window
    love.graphics.scale(g.scale.x,g.scale.y)
  
    -- draw the title screen and intro
    if(g.state == "title") then
        drawTitleScreen.draw()
        
    elseif(g.state == "title credits") then
        drawTitleCreditsScreen.draw()
  
    -- draw the instructions screen
    elseif(g.state == "instructions") then
        drawInstructionsScreen.draw()
  
    elseif(g.state == "game") then
        drawGame.draw()
    
    elseif(g.state == "car transition 1" or g.state == "car transition 2" or g.state == "car transition 3" or g.state == "class transition") then
        drawInGameTransitions.draw()
    
    elseif(g.state == "good ending" or g.state == "bad ending" or g.state == "alien ending" or g.state == "easter egg ending") then
        drawEnding.draw()
        
    end

    -- Draw the mouse cursor
    if(g.playerState.numOfTimesLookedAtWallHole ~= 5) then
        if not(g.state == "title" and g.timers.global < g.timers.titleScreenLogo+35) then
            drawCursor.draw()
        end
    end
    
    -- Draw the screen transition
    drawScreenTransition.draw()
    
    -- Draw squiggle man
    if(g.curLocation == loadRooms.nightmareGeometry4 and g.playerState.numOfTimesLookedAtWallHole == 5) then
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

return drawManager