local drawCursor = {}

function drawCursor.draw()
    
    local g = GLOBALS
    
    love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
    
    if((g.screenTransition.active ~= true or debug) and g.state ~= "good ending" and g.state ~= "bad ending" and g.state ~= "alien ending" and g.state ~= "easter egg ending" and g.state ~= "red prince ending" and g.state ~= "car transition 1" and g.state ~= "car transition 2" and g.state ~= "car transition 3" and g.state ~= "class transition" and g.state ~= "shadow child" and g.state ~= "dream transition" and g.state ~= "space transition" and g.state ~= "video bad ending") then
        if(g.mouse.actionHover or g.mouse.textHover or (g.mouse.itemMenuHover and g.actionSelected ~= "Look") or g.mouse.scrollPageArrowHover) then
            love.graphics.draw(loadImages.cursorHand, g.mouse.x - 4, g.mouse.y)
        elseif(g.mouse.mapHover and g.showMessageBox ~= true) then
            love.graphics.draw(loadImages.cursorMove, g.mouse.x - 4, g.mouse.y - 4)
        elseif(g.mouse.itemMenuHoverItem and g.actionSelected == "Look") then
            love.graphics.draw(loadImages.cursorEye, g.mouse.x - 4, g.mouse.y - 3)
        elseif(g.mouse.objectHover) then
            if(g.actionSelected == "Close") then
                love.graphics.draw(loadImages.cursorClose, g.mouse.x - 3, g.mouse.y - 3)
            elseif(g.actionSelected == "Look") then
                love.graphics.draw(loadImages.cursorEye, g.mouse.x - 4, g.mouse.y - 3)
            elseif(g.actionSelected == "Move") then
                love.graphics.draw(loadImages.cursorMove, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.actionSelected == "Open") then
                love.graphics.draw(loadImages.cursorOpen, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.actionSelected == "Pull") then
                love.graphics.draw(loadImages.cursorPull, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.actionSelected == "Push") then
                love.graphics.draw(loadImages.cursorPush, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.actionSelected == "Put") then
                love.graphics.draw(loadImages.cursorPut, g.mouse.x - 6, g.mouse.y - 7)
            elseif(g.actionSelected == "Talk") then
                love.graphics.draw(loadImages.cursorTalk, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.actionSelected == "Take") then
                love.graphics.draw(loadImages.cursorTake, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.actionSelected == "Use") then
                love.graphics.draw(loadImages.cursorUse, g.mouse.x - 6, g.mouse.y - 6)
            else
                love.graphics.draw(loadImages.cursorHand, g.mouse.x - 4, g.mouse.y)
            end
        else
            love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
        end
    end
    
end

return drawCursor