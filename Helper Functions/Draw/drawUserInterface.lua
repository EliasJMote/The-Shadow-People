local drawUserInterface = {}

    local g = GLOBALS
    
    function drawUserInterface.draw()
        
        g.cursorOverAction = nil
        g.actionPointedAt = nil
        
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(loadImages.userInterfaceActions,0,0)
        if(g.showTextBox) then
            love.graphics.draw(loadImages.userInterfaceTextBox,0,82)
        else
            love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
            love.graphics.print("Move", 15, 90, 0, 0.4, 0.4)
            
            -- Row 1
            g.highlightText(54,54+13,90,90+4,"Put",0.4)
            g.highlightText(87,87+18,90,90+4,"Take",0.4)
            g.highlightText(120,120+18,90,90+4,"Open",0.4)
            --g.highlightText(54,54+18,103,103+4,"Open",0.4)
            
            -- Row 2
            g.highlightText(54,54+23,103,103+4,"Close",0.4)
            g.highlightText(87,87+13,103,103+4,"Use",0.4)
            g.highlightText(120,120+18,103,103+4,"Look",0.4)
            
            -- Row 3
            g.highlightText(54,54+18,116,116+4,"Talk",0.4)
            g.highlightText(87,87+18,116,116+4,"Push",0.4)
            love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
            love.graphics.draw(g.curLocation.map, 7, 101)
            
            -- Draw the room's name
            love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
            love.graphics.print(g.curLocation.name, 54, 133, 0, 0.4, 0.4)
        end
        
    end

return drawUserInterface