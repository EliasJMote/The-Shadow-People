local drawTitleScreen = {}

    local g = GLOBALS
    
    function drawTitleScreen.draw()
        if(g.timer < 90) then
            love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
        elseif(g.timer < 100) then
            love.graphics.setColor(g.colors.dark_green.r, g.colors.dark_green.g, g.colors.dark_green.b, 1)
        elseif(g.timer < 115) then
            love.graphics.setColor(g.colors.light_green.r, g.colors.light_green.g, g.colors.light_green.b, 1)
        elseif(g.timer < 130) then
            love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
        elseif(g.timer < 145) then
            love.graphics.setColor(g.colors.light_green.r, g.colors.light_green.g, g.colors.light_green.b, 1)
        elseif(g.timer < 160) then
            love.graphics.setColor(g.colors.dark_green.r, g.colors.dark_green.g, g.colors.dark_green.b, 1)
        else
            love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
        end
        
        -- draw the background screen
        love.graphics.rectangle("fill", 0, 0, 160, 144)
        
        love.graphics.setColor(1, 1, 1, 1)
        if(g.timer < 130) then
          love.graphics.draw(loadImages.rocStudiosLogo)
        end
        
        if(g.timer >= 175) then
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