local drawCarTransitions = {}

    function drawCarTransitions.draw()

        local g = GLOBALS

        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
        love.graphics.rectangle("fill", g.screenTransition.x, g.screenTransition.y, g.screenTransition.w, g.screenTransition.h)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        
        if(g.state == "car transition 1") then
            love.graphics.print("Car Transition 1", 32, 72, 0, 0.5, 0.5)
            
        elseif(g.state == "car transition 2") then
            love.graphics.print("Car Transition 2", 32, 72, 0, 0.5, 0.5)
            
        elseif(g.state == "car transition 3") then
            love.graphics.print("Car Transition 3", 32, 72, 0, 0.5, 0.5)
        end
        
        love.graphics.print("Click to continue", 40, 128, 0, 0.4, 0.4)
        
    end

return drawCarTransitions