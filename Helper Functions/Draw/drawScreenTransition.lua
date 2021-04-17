local drawScreenTransition = {}

function drawScreenTransition.draw()

    local g = GLOBALS

    if(g.screenTransition.active) then

        if(g.timers.screenTransition < 10) then
            love.graphics.setColor(g.colors.darkGreen.r, g.colors.darkGreen.g, g.colors.darkGreen.b, 1)
        elseif(g.timers.screenTransition < 25) then
            love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        elseif(g.timers.screenTransition < 40) then
            love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        elseif(g.timers.screenTransition < 55) then
            love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        elseif(g.timers.screenTransition < 70) then
            love.graphics.setColor(g.colors.darkGreen.r, g.colors.darkGreen.g, g.colors.darkGreen.b, 1)
        else
            createEvent.create(createEvent.create{name="Stop Screen Transition"})
        end

        -- draw the transition screen
        love.graphics.rectangle("fill", g.screenTransition.x, g.screenTransition.y, g.screenTransition.w, g.screenTransition.h)

        -- Set the color back to normal
        love.graphics.setColor(1, 1, 1, 1)
        
        
        
    end
    
end

return drawScreenTransition