local drawSaveScreen = {}

function drawSaveScreen.draw()
    
    local g = GLOBALS
    
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    love.graphics.rectangle("line",2,2,160-4,144-4)
    
    love.graphics.print("Save Game", 60, 8, 0, 0.4, 0.4)
    love.graphics.print(g.savedString, 20, 16, 0, 0.4, 0.4)
    
    
    for k,v in pairs(g.textBoxes.saveGameScreen) do
        g.highlightText(v,0.4)
    end
end

return drawSaveScreen