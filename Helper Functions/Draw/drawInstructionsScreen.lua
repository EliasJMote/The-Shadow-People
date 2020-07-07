local drawInstructionsScreen = {}

    local g = GLOBALS
    
    function drawInstructionsScreen.draw()
        
        -- draw the background screen
        love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
        love.graphics.rectangle("fill", 0, 0, 160, 144)
        love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
        
        -- Print the "Instructions" title
        love.graphics.print("Instructions", 48, 8, 0, 0.5, 0.5)
        
        -- Print the body of instructions
        love.graphics.print("Move the mouse cursor to", 4, 24, 0, 0.5, 0.5)
        love.graphics.print("find objects to interact", 4, 32, 0, 0.5, 0.5)
        love.graphics.print("with. Use the action menu", 4, 40, 0, 0.5, 0.5)
        love.graphics.print("to select an action to", 4, 48, 0, 0.5, 0.5)
        love.graphics.print("interact with the object.", 4, 56, 0, 0.5, 0.5)
        
        -- Print the "Start Game" button
        g.highlightText(52,52+59,128,128+6,"Start Game")
        
    end

return drawInstructionsScreen