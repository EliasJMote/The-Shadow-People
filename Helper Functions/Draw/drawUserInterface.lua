local drawUserInterface = {}

    local g = GLOBALS
    
    function drawUserInterface.draw()
        
        love.graphics.draw(loadImages.userInterfaceActions,0,0)
        if(g.showTextBox) then
            love.graphics.draw(loadImages.userInterfaceTextBox,0,82)
        else
            love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
            love.graphics.print("Move", 15, 90, 0, 0.4, 0.4)
            love.graphics.print("Put", 54, 95, 0, 0.4, 0.4)
            love.graphics.print("Take", 84, 95, 0, 0.4, 0.4)
            love.graphics.print("Open", 54, 105, 0, 0.4, 0.4)
            love.graphics.print("Close", 84, 105, 0, 0.4, 0.4)
            love.graphics.print("Use", 54, 115, 0, 0.4, 0.4)
            love.graphics.print("Look", 84, 115, 0, 0.4, 0.4)
            love.graphics.print("Talk", 54, 125, 0, 0.4, 0.4)
            love.graphics.print("Push", 84, 125, 0, 0.4, 0.4)
            love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
            love.graphics.draw(g.curLocation.map, 7, 101)
        end
        
    end

return drawUserInterface