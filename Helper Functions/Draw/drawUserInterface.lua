local drawUserInterface = {}

    local g = GLOBALS
    
    function drawUserInterface.draw()
        
        love.graphics.setColor(1, 1, 1, 1)
        
        -- Draw the user interface actions
        love.graphics.draw(loadImages.userInterfaceActions,0,0)
        
        -- If the message box is onscreen
        if(g.showMessageBox) then
            
            -- Draw the message box
            love.graphics.draw(loadImages.userInterfaceTextBox,0,82)
            
        -- If the message box is not onscreen  
        else
            love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
            
            -- Highlight a button if the player mouses over it
            for k,v in pairs(g.actionButtons) do
                --love.graphics.rectangle("line",v.x-1, v.y-2, v.w+2, v.h+4)
                g.highlightText(v,0.4)
            end
            love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
            
            -- Draw the map
            love.graphics.draw(g.curLocation.map, 7, 101)
            
            -- Draw the room's name
            love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
            if(g.curLocation.displayName ~= nil) then
                love.graphics.print(g.curLocation.displayName, 54, 133, 0, 0.4, 0.4)
            else
                love.graphics.print(g.curLocation.name, 54, 133, 0, 0.4, 0.4)
            end
            
            -- If the player is hovering the mouse above the pause button, highlight it
            if(g.mouse.pauseMenuHover) then
                love.graphics.setColor(1, 1, 1, 1)
                love.graphics.draw(loadImages.userInterfacePauseIconLitUp,g.pauseButton.x,g.pauseButton.y)
            end
        end
        
    end

return drawUserInterface