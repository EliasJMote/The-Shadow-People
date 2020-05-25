local updateGame = {}

  function updateGame.update()
    
    local g = GLOBALS
    
    -- Update the window scaling (since the player can adjust this window at anytime)
    g.scale.x = love.graphics.getWidth()/160
    g.scale.y = love.graphics.getHeight()/144
    
    g.timer = g.timer + 1
    --if(g.state == "title" and g.timer >= 500) then
      --g.timer = 0
    --end
    
    g.mouse.x, g.mouse.y = love.mouse.getPosition()
    g.mouse.x = g.mouse.x / g.scale.x
    g.mouse.y = g.mouse.y / g.scale.y
    
  end

return updateGame