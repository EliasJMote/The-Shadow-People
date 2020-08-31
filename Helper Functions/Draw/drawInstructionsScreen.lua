local drawInstructionsScreen = {}

    local g = GLOBALS
    
    function drawInstructionsScreen.draw()
        
        -- draw the background screen
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
        love.graphics.rectangle("fill", 0, 0, 160, 144)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        
        -- Print the "Instructions" title
        love.graphics.print("Instructions", 48, 8, 0, 0.5, 0.5)
        
        -- Print the body of instructions
        love.graphics.print("Move the mouse cursor to", 4, 24, 0, 0.5, 0.5)
        love.graphics.print("find objects to interact", 4, 32, 0, 0.5, 0.5)
        love.graphics.print("with. Use the action menu", 4, 40, 0, 0.5, 0.5)
        love.graphics.print("to select an action to", 4, 48, 0, 0.5, 0.5)
        love.graphics.print("interact with the object.", 4, 56, 0, 0.5, 0.5)
        
        -- Print the "Start Game" button
        g.highlightText(g.textBoxes.instructionsScreen.startGame,0.5)
        
    end

return drawInstructionsScreen