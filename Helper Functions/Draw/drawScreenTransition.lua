local drawScreenTransition = {}

function drawScreenTransition.draw()

    local g = GLOBALS

    if(g.screenTransition.active) then

        if(g.timers.screenTransition < 10) then
            love.graphics.setColor(g.colors.dark_green.r, g.colors.dark_green.g, g.colors.dark_green.b, 1)
        elseif(g.timers.screenTransition < 25) then
            love.graphics.setColor(g.colors.light_green.r, g.colors.light_green.g, g.colors.light_green.b, 1)
        elseif(g.timers.screenTransition < 40) then
            love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
        elseif(g.timers.screenTransition < 55) then
            love.graphics.setColor(g.colors.light_green.r, g.colors.light_green.g, g.colors.light_green.b, 1)
        elseif(g.timers.screenTransition < 70) then
            love.graphics.setColor(g.colors.dark_green.r, g.colors.dark_green.g, g.colors.dark_green.b, 1)
        else
            createEvent.create(createEvent.create{name="Stop Screen Transition"})
        end

        -- draw the transition screen
        love.graphics.rectangle("fill", g.screenTransition.x, g.screenTransition.y, g.screenTransition.w, g.screenTransition.h)

        -- Set the color back to normal
        love.graphics.setColor(1, 1, 1, 1)
        
        -- Increment the screen transition timer
        g.timers.screenTransition = g.timers.screenTransition + 1
        
    end
    
end

return drawScreenTransition