local drawManager = {}

function drawManager.draw()

    local g = GLOBALS
  
    -- scale the window
    love.graphics.scale(g.scale.x,g.scale.y)
  
    -- draw the title screen and intro
    if(g.state == "title") then
    
        drawTitleScreen.draw()
  
    -- draw the instructions screen
    elseif(g.state == "instructions") then
    
        drawInstructionsScreen.draw()
  
    elseif(g.state == "game") then

        drawGame.draw()
      
    elseif(g.state == "ending") then
    end

    -- Draw the mouse cursor
    love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
    if(g.mouse.objectHover or g.mouse.mapHover or g.mouse.actionHover or g.mouse.textHover or g.mouse.itemMenuHover) then
        love.graphics.draw(loadImages.cursorHand, g.mouse.x - 4, g.mouse.y)
    else
        love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
    end
    
    -- Draw the screen transition
    drawScreenTransition.draw()
    
end

return drawManager