local updateGame = {}

function updateGame.update()

local g = GLOBALS

    -- Update the window scaling (since the player can adjust this window at anytime)
    g.scale.x = love.graphics.getWidth()/160
    g.scale.y = love.graphics.getHeight()/144

    
    --if(g.state == "title" and g.timer >= 500) then
      --g.timer = 0
    --end

    -- Update the mouse
    g.mouse.x, g.mouse.y = love.mouse.getPosition()
    g.mouse.x = g.mouse.x / g.scale.x
    g.mouse.y = g.mouse.y / g.scale.y
    
    -- Poll the title screen
    if(g.state == "title") then
        updateTitleScreen.update()
    end
    
    -- Update the event table
    updateEvents.update()
    
    -- Update the global timer
    g.timers.global = g.timers.global + 1

end

return updateGame