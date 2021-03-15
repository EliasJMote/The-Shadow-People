local drawInGameTransitions = {}

function drawInGameTransitions.draw()

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
        love.graphics.print("road. You swerve hard,", init_x, init_y+8*6, 0, 0.5, 0.5) -- Sentence could be rewritten
        love.graphics.print("slamming into a large", init_x, init_y+8*7, 0, 0.5, 0.5)
        love.graphics.print("tree and destroying", init_x, init_y+8*8, 0, 0.5, 0.5)
        love.graphics.print("your car.", init_x, init_y+8*9, 0, 0.5, 0.5)
        
    elseif(g.state == "class transition") then
        init_y = 40
        love.graphics.print("Class Transition", 32, 8, 0, 0.5, 0.5)
        love.graphics.print("Your professor starts", init_x, init_y, 0, 0.5, 0.5)
        love.graphics.print("the lecture. You", init_x, init_y+8, 0, 0.5, 0.5)
        love.graphics.print("frantically take notes", init_x, init_y+8*2, 0, 0.5, 0.5)
        love.graphics.print("while trying to avoid.", init_x, init_y+8*3, 0, 0.5, 0.5)
        love.graphics.print("passing out. Finals", init_x, init_y+8*4, 0, 0.5, 0.5)
        love.graphics.print("is next week and you", init_x, init_y+8*5, 0, 0.5, 0.5)
        love.graphics.print("can't miss anything.", init_x, init_y+8*6, 0, 0.5, 0.5)
        
    elseif(g.state == "dream transition") then
        init_y = 40
        love.graphics.print("Dream Transition", 32, 8, 0, 0.5, 0.5)
        love.graphics.print("Your enter your house", init_x, init_y, 0, 0.5, 0.5)
        love.graphics.print("and make a beeline", init_x, init_y+8, 0, 0.5, 0.5)
        love.graphics.print("for your bed. Slumber", init_x, init_y+8*2, 0, 0.5, 0.5)
        love.graphics.print("quickly overwhelms", init_x, init_y+8*3, 0, 0.5, 0.5)
        love.graphics.print("you, and you begin to", init_x, init_y+8*4, 0, 0.5, 0.5)
        love.graphics.print("experience a vivid", init_x, init_y+8*5, 0, 0.5, 0.5)
        love.graphics.print("dream...", init_x, init_y+8*6, 0, 0.5, 0.5)
        
    elseif(g.state == "space transition") then
        init_y = 32
        love.graphics.print("Space Transition", 32, 8, 0, 0.5, 0.5)
        love.graphics.print("You step through the", init_x, init_y, 0, 0.5, 0.5)
        love.graphics.print("portal and come out in", init_x, init_y+8, 0, 0.5, 0.5)
        love.graphics.print("deep space. Then you", init_x, init_y+8*2, 0, 0.5, 0.5)
        love.graphics.print("are carried by some", init_x, init_y+8*3, 0, 0.5, 0.5)
        love.graphics.print("unseen force until you", init_x, init_y+8*4, 0, 0.5, 0.5)
        love.graphics.print("reach the surface of", init_x, init_y+8*5, 0, 0.5, 0.5)
        love.graphics.print("an unknown planet. A", init_x, init_y+8*6, 0, 0.5, 0.5)
        love.graphics.print("total eclipse casts", init_x, init_y+8*7, 0, 0.5, 0.5)
        love.graphics.print("dim light over the", init_x, init_y+8*8, 0, 0.5, 0.5)
        love.graphics.print("strange land...", init_x, init_y+8*9, 0, 0.5, 0.5)
    end
    
    love.graphics.print("Click to continue", 30, 128, 0, 0.5, 0.5)
    
end

return drawInGameTransitions