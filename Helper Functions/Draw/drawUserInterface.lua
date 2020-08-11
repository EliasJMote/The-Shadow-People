local drawUserInterface = {}

    local g = GLOBALS
    
    function drawUserInterface.draw()
        
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(loadImages.userInterfaceActions,0,0)
        if(g.showMessageBox) then
            love.graphics.draw(loadImages.userInterfaceTextBox,0,82)
        else
            love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
            
            for k,v in pairs(g.actionButtons) do
                g.highlightText(v,0.4)
            end
            
            love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
            
            love.graphics.draw(g.curLocation.map, 7, 101)
            
            -- Draw the room's name
            love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
            love.graphics.print(g.curLocation.name, 54, 133, 0, 0.4, 0.4)
        end
        
    end

return drawUserInterface