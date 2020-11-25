local drawCarTransitions = {}

function drawCarTransitions.draw()

    local g = GLOBALS

    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", g.screenTransition.x, g.screenTransition.y, g.screenTransition.w, g.screenTransition.h)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    local init_x = 16
    local init_y = 48
    
    if(g.state == "car transition 1") then
        
        love.graphics.print("Car Transition 1", 32, 8, 0, 0.5, 0.5)
        love.graphics.print("You drive your car", init_x, init_y, 0, 0.5, 0.5)
        love.graphics.print("through the cold", init_x, init_y+8, 0, 0.5, 0.5)
        love.graphics.print("sunshine, doing your", init_x, init_y+8*2, 0, 0.5, 0.5)
        love.graphics.print("best to keep awake", init_x, init_y+8*3, 0, 0.5, 0.5)
        love.graphics.print("during the long drive", init_x, init_y+8*4, 0, 0.5, 0.5)
        love.graphics.print("to campus.", init_x, init_y+8*5, 0, 0.5, 0.5)
        
    elseif(g.state == "car transition 2") then
        love.graphics.print("Car Transition 2", 32, 8, 0, 0.5, 0.5)
        love.graphics.print("You drive your car", init_x, init_y, 0, 0.5, 0.5)
        love.graphics.print("back home along a", init_x, init_y+8, 0, 0.5, 0.5)
        love.graphics.print("lonely stretch of", init_x, init_y+8*2, 0, 0.5, 0.5)
        love.graphics.print("highway. You pull off", init_x, init_y+8*3, 0, 0.5, 0.5)
        love.graphics.print("onto an exit with a", init_x, init_y+8*4, 0, 0.5, 0.5)
        love.graphics.print("nearby gas station.", init_x, init_y+8*5, 0, 0.5, 0.5)
        
    elseif(g.state == "car transition 3") then
        init_y = 32
        love.graphics.print("Car Transition 3", 32, 8, 0, 0.5, 0.5)
        love.graphics.print("You drive along in a", init_x, init_y, 0, 0.5, 0.5)
        love.graphics.print("moonlit night. You", init_x, init_y+8, 0, 0.5, 0.5)
        love.graphics.print("struggle to stay", init_x, init_y+8*2, 0, 0.5, 0.5)
        love.graphics.print("awake. Suddenly, a", init_x, init_y+8*3, 0, 0.5, 0.5)
        love.graphics.print("dark figure of a", init_x, init_y+8*4, 0, 0.5, 0.5)
        love.graphics.print("child appears in the", init_x, init_y+8*5, 0, 0.5, 0.5)
        love.graphics.print("road. You swerve hard,", init_x, init_y+8*6, 0, 0.5, 0.5)
        love.graphics.print("slamming into a large", init_x, init_y+8*7, 0, 0.5, 0.5)
        love.graphics.print("tree and destroying.", init_x, init_y+8*8, 0, 0.5, 0.5)
        love.graphics.print("your car.", init_x, init_y+8*9, 0, 0.5, 0.5)
        
    elseif(g.state == "dream transition") then
        love.graphics.print("Dream Transition", 32, 8, 0, 0.5, 0.5)
    end
    
    love.graphics.print("Click to continue", 30, 128, 0, 0.5, 0.5)
    
end

return drawCarTransitions