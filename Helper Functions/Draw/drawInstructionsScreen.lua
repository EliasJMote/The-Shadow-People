local drawInstructionsScreen = {}

    local g = GLOBALS
    
    function drawInstructionsScreen.draw()
        
        -- draw the background screen
        love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
        love.graphics.rectangle("fill", 0, 0, 160, 144)
        love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
        love.graphics.print("Instructions", 48, 8, 0, 0.5, 0.5)
        if(love.mouse.getX() >= 52 * g.scale.x and love.mouse.getX() <= (52+59) * g.scale.x
            and love.mouse.getY() >= 128 * g.scale.y and love.mouse.getY() <= (128+6) * g.scale.y) then
            love.graphics.setColor(g.colors.light_green.r, g.colors.light_green.g, g.colors.light_green.b, 1)
        end
        love.graphics.print("Start Game", 52, 128, 0, 0.5, 0.5)
        
    end

return drawInstructionsScreen