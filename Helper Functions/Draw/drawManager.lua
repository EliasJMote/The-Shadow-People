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
    
    elseif(g.state == "car transition 1" or g.state == "car transition 2" or g.state == "car transition 3") then
        drawCarTransitions.draw()
    
    elseif(g.state == "good ending" or g.state == "bad ending" or g.state == "alien ending" or g.state == "easter egg ending") then
        drawEnding.draw()
        
    --[[elseif(g.state == "bad ending") then
        drawBadEnding.draw()
        
    elseif(g.state == "alien ending") then
        drawAlienEnding.draw()]]
    end

    -- Draw the mouse cursor
    if not(g.state == "title" and g.timers.global < g.timers.titleScreenLogo+35) then
        drawCursor.draw()
    end
    
    -- Draw the screen transition
    drawScreenTransition.draw()
    
end

return drawManager