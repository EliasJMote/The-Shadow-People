local drawInstructionsScreen = {}

    local g = GLOBALS
    
    function drawInstructionsScreen.draw()
        
        -- draw the background screen
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
        love.graphics.rectangle("fill", 0, 0, 160, 144)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        
        -- Print the "Instructions" title
        love.graphics.print("Instructions", 44, 10, 0, 0.5, 0.5)
        
        local size = 0.4
        
        -- Print the body of instructions
        love.graphics.print("Move the mouse cursor to find", 4, 8*3, 0, size, size)
        love.graphics.print("objects to interact with. Use", 4, 8*4, 0, size, size)
        love.graphics.print("the action menu to select an", 4, 8*5, 0, size, 0.5)
        love.graphics.print("action to interact with the", 4, 8*6, 0, size, size)
        love.graphics.print("object.", 4, 8*7, 0, size, size)
        
        love.graphics.print("Left click selects something.", 4, 8*9, 0, size, size)
        love.graphics.print("Right click opens the pause", 4, 8*10, 0, size, size)
        love.graphics.print("menu.", 4, 8*11, 0, size, size)
        
        love.graphics.print("You can move by clicking on the", 4, 8*13, 0, size, size)
        love.graphics.print("map or using the \"Move\" action.", 4, 8*14, 0, size, size)
        
        -- Print the "Start Game" button
        g.highlightText(g.textBoxes.instructionsScreen.startGame,size)
        
    end

return drawInstructionsScreen