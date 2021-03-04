local drawPauseScreen = {}

function drawPauseScreen.draw()
    local g = GLOBALS
    
    -- draw the background screen
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    love.graphics.print("Paused", 68, 8, 0, 0.4, 0.4)
    
    for k,v in pairs(g.textBoxes.pauseScreen) do
        g.highlightText(v,0.4)
    end
end

return drawPauseScreen