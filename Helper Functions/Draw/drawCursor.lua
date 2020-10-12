local drawCursor = {}

function drawCursor.draw()
    
    local g = GLOBALS
    
    love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
    
    if not (g.screenTransition.active) then
        if(g.mouse.actionHover or g.mouse.textHover or g.mouse.itemMenuHover) then
            love.graphics.draw(loadImages.cursorHand, g.mouse.x - 4, g.mouse.y)
        elseif(g.mouse.mapHover) then
            love.graphics.draw(loadImages.cursorMove, g.mouse.x - 4, g.mouse.y - 4)
        elseif(g.mouse.objectHover) then
            if(g.selectedAction == "Close") then
                love.graphics.draw(loadImages.cursorClose, g.mouse.x - 3, g.mouse.y - 3)
            elseif(g.selectedAction == "Look") then
                love.graphics.draw(loadImages.cursorEye, g.mouse.x - 4, g.mouse.y - 3)
            elseif(g.selectedAction == "Move") then
                love.graphics.draw(loadImages.cursorMove, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.selectedAction == "Open") then
                love.graphics.draw(loadImages.cursorOpen, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.selectedAction == "Pull") then
                love.graphics.draw(loadImages.cursorPull, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.selectedAction == "Push") then
                love.graphics.draw(loadImages.cursorPush, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.selectedAction == "Put") then
                love.graphics.draw(loadImages.cursorPut, g.mouse.x - 6, g.mouse.y - 7)
            elseif(g.selectedAction == "Talk") then
                love.graphics.draw(loadImages.cursorTalk, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.selectedAction == "Take") then
                love.graphics.draw(loadImages.cursorTake, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.selectedAction == "Use") then
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