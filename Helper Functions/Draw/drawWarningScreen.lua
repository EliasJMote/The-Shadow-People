local drawWarningScreen = {}

local g = GLOBALS

function drawWarningScreen.draw()

    -- draw the background screen
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    love.graphics.print("WARNING!", 58, 16, 0, 0.5, 0.5)
    love.graphics.print("This video game has some light", 4, 32, 0, 0.4, 0.4)
    love.graphics.print("flashes that can potentially", 4, 40, 0, 0.4, 0.4)
    love.graphics.print("cause seizures for people with", 4, 48, 0, 0.4, 0.4)
    love.graphics.print("photosensitive epilepsy.", 4, 56, 0, 0.4, 0.4)
    love.graphics.print("In addition, this game contains", 4, 72, 0, 0.4, 0.4)
    love.graphics.print("content that may not be suitable", 4, 80, 0, 0.4, 0.4)
    love.graphics.print("for children or those easily", 4, 88, 0, 0.4, 0.4)
    love.graphics.print("disturbed.", 4, 96, 0, 0.4, 0.4)
    
    for k,v in pairs(g.textBoxes.warningScreen) do
        g.highlightText(v,0.4)
    end
end

return drawWarningScreen