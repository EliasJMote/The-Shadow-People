local updateMousePress = {}

function updateMousePress.update(x, y, button)
    local g = GLOBALS

    if(g.state == "title" and button == 1) then
        if(g.timer < 90) then g.timer = 90 end
        if(g.timer >= 175
            and love.mouse.getX() >= 50 * g.scale.x and love.mouse.getX() <= 109 * g.scale.x
            and love.mouse.getY() >= 96 * g.scale.y and love.mouse.getY() <= 102 * g.scale.y) then
            g.state = "instructions"
        end
        
    elseif(g.state == "instructions" and button == 1
        and love.mouse.getX() >= 52 * g.scale.x and love.mouse.getX() <= (52+59) * g.scale.x
        and love.mouse.getY() >= 128 * g.scale.y and love.mouse.getY() <= (128+6) * g.scale.y) then
        g.writeToTextDisplay( 
                              {
                                  "You are in a small dark room.",
                                  "You can barely just make out",
                                  "the door opposite your bed.",
                              }
                            )
        g.state = "game"
        return
    end
    
    -- if we are in the game
    if(g.state == "game") then
        
    end
    
end

return updateMousePress