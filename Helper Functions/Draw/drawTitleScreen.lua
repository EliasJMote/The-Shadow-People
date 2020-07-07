local drawTitleScreen = {}

local g = GLOBALS

function drawTitleScreen.draw()

    -- draw the background screen
    love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(1,1,1,1)
    
    -- Draw the Roc Studios Logo
    if(g.timers.global < 130) then
        love.graphics.draw(loadImages.rocStudiosLogo)
    end
    
    if(g.timers.global >= 175) then
        love.graphics.draw(loadImages.titleScreen)
        love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
        if(love.mouse.getX() >= 52 * g.scale.x and love.mouse.getX() <= (52+59) * g.scale.x
            and love.mouse.getY() >= 96 * g.scale.y and love.mouse.getY() <= 102 * g.scale.y) then
            love.graphics.setColor(g.colors.light_green.r, g.colors.light_green.g, g.colors.light_green.b, 1)
        end
        love.graphics.print("Start Game", 52, 96, 0, 0.5, 0.5)
        love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
        love.graphics.print(gameVersion, 112, 130, 0, 0.5, 0.5)
    end
end

return drawTitleScreen