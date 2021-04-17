local drawLoadScreen = {}

function drawLoadScreen.draw()
    
    local g = GLOBALS
    
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    love.graphics.print("Load Game", 60, 8, 0, 0.4, 0.4)
    
    love.graphics.rectangle("line",2,2,160-4,144-4)
    
    if(love.filesystem.getInfo("Save_File_1.lua")) then
        g.highlightText(g.textBoxes.loadGameScreen.loadGame1,0.4)
    else
        love.graphics.print("Load File 1 (Empty)",g.textBoxes.loadGameScreen.loadGame1.x,g.textBoxes.loadGameScreen.loadGame1.y,0,0.4,0.4)
    end
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    if(love.filesystem.getInfo("Save_File_2.lua")) then
        g.highlightText(g.textBoxes.loadGameScreen.loadGame2,0.4)
    else
        love.graphics.print("Load File 2 (Empty)",g.textBoxes.loadGameScreen.loadGame2.x,g.textBoxes.loadGameScreen.loadGame2.y,0,0.4,0.4)
    end
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    if(love.filesystem.getInfo("Save_File_3.lua")) then
        g.highlightText(g.textBoxes.loadGameScreen.loadGame3,0.4)
    else
        love.graphics.print("Load File 3 (Empty)",g.textBoxes.loadGameScreen.loadGame3.x,g.textBoxes.loadGameScreen.loadGame3.y,0,0.4,0.4)
    end
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    g.highlightText(g.textBoxes.loadGameScreen.back,0.4)

end

return drawLoadScreen