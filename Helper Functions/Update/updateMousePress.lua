local updateMousePress = {}

function updateMousePress.update(x, y, button)
    local g = GLOBALS

    if(button == 1) then
        if(g.state == "title") then
            if(g.timer < 90) then g.timer = 90 end
            if(g.timer >= 175
                and love.mouse.getX() >= 50 * g.scale.x and love.mouse.getX() <= 109 * g.scale.x
                and love.mouse.getY() >= 96 * g.scale.y and love.mouse.getY() <= 102 * g.scale.y) then
                g.state = "instructions"
            end
            
        elseif(g.state == "instructions"
            and love.mouse.getX() >= 52 * g.scale.x and love.mouse.getX() <= (52+59) * g.scale.x
            and love.mouse.getY() >= 128 * g.scale.y and love.mouse.getY() <= (128+6) * g.scale.y) then
            g.writeToTextDisplay( 
                                    {
                                      "You are in a small dark room.",
                                      "You can barely just make out",
                                      "the door opposite your bed.",
                                      "You had trouble sleeping last",
                                      "night, and you know that you",
                                      "have a difficult day ahead of",
                                      "you. Today marks the third day",
                                      "of finals week, and you know",
                                      "there's no rest for the wicked.",
                                    }
                                )
            g.state = "game"
        
        -- if we are in the game
        elseif(g.state == "game") then

            -- first, advance the text box until no text is left in the buffer
            if(g.showTextBox) then
                -- If there are more than 4 lines of text currently in the buffer
                if(#g.textBuffer > 4) then
                    -- Clear those 4 lines from the buffer
                    for i=1,4 do
                        table.remove(g.textBuffer,1)
                    end
                else
                    g.showTextBox = false
                    g.textBuffer = {}
                    -- afterwards, the player can check the room
                    updateRoomObjects.update()
                end
            else
                -- afterwards, the player can check the room
                updateRoomObjects.update()
                
                -- If the player clicks the mouse on the map, check if we should go to a new room
                updateRoom.update()
            end
                
        end
    end
end

return updateMousePress