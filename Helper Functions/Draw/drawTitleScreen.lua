local drawTitleScreen = {}

local g = GLOBALS

function drawTitleScreen.draw()

    -- draw the background screen
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    --love.graphics.setColor(1,1,1,1)
    
    -- Draw the Roc Studios Logo
    if(g.timers.global < 130) then
        love.graphics.draw(loadImages.rocStudiosLogo)
    end
    
    if(g.timers.global >= 175) then
        love.graphics.draw(loadImages.titleScreen)
        
        for k,v in pairs(g.textBoxes.titleScreen) do
            g.highlightText(v,0.5)
        end
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        love.graphics.print("V" .. gameVersion, 112, 130, 0, 0.5, 0.5)
    end
end

return drawTitleScreen