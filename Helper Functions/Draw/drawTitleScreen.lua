local drawTitleScreen = {}

local g = GLOBALS

function drawTitleScreen.draw()

    -- Draw the background screen
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    -- Draw the Roc Studios Logo
    if(g.timers.global < g.timers.titleScreenLogo) then
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        love.graphics.draw(loadImages.rocStudiosLogo)
    end
    
    -- Transition from Roc Studios Logo to Title Screen
    if(g.timers.global >= g.timers.titleScreenLogo+35-20) then
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        love.graphics.draw(loadImages.titleScreen)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        
        for k,v in pairs(g.textBoxes.titleScreen) do
            g.highlightText(v,0.5)
        end
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        --love.graphics.print("V" .. gameVersion, 112-4, 134, 0, 0.5, 0.5)
        love.graphics.printf("V" .. gameVersion, -8, 134-3, 160*2, "right", 0, 0.5, 0.5)
    end
end

return drawTitleScreen