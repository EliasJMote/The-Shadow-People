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
        
        drawSquiggleMan.draw()
        
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
        
    elseif(g.state == "shadow child") then
        drawShadowChildCutscene.draw()
    end

    -- Draw the mouse cursor
    if not(g.state == "title" and g.timers.global < g.timers.titleScreenLogo+35) then
        drawCursor.draw()
    end
    
    -- Draw the screen transition
    drawScreenTransition.draw()
    
    -- Set the game to sleep or return if needed to cap the frame rate
    local curTime = love.timer.getTime()
    if g.nextTime <= curTime then
        g.nextTime = curTime
        return
    end
    love.timer.sleep(g.nextTime - curTime)
end

return drawManager