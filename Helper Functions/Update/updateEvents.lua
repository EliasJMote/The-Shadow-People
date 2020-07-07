local updateEvents = {}

updateEvents.update = function()
    
    local g = GLOBALS
    
    -- Event handling (modeled as a queue)
    while(#g.events > 0) do
        
        -- Grab the first event in the queue
        local event = g.events[1]
        
        if(event.name == "Left Click") then
        
            if(event.state == "title") then
                if(g.timers.global < 90) then
                    g.timers.global = 90
                end
                if(g.timers.global >= 175
                    and event.mouse.x >= 50 and event.mouse.x <= 109
                    and event.mouse.y >= 96 and event.mouse.y <= 102) then
                    g.state = "instructions"
                end
                
            elseif(event.state == "instructions"
                and event.mouse.x >= 52 and event.mouse.x <= (52+59)
                and event.mouse.y >= 128 and event.mouse.y <= (128+6)) then
                g.writeToTextDisplay(loadGameText.opening)
                g.state = "game"
                loadMusic.house:play()
            
            -- if we are in the game
            elseif(event.state == "game") then

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
                    
                    -- check if the player is selecting an action
                    updatePlayerAction.update()
                    
                    -- If the player clicks the mouse on the map, check if we should go to a new room
                    updateRoom.update()
                end
                    
            end
            
        -- Start the screen transition
        elseif(event.name == "Start Screen Transition") then
            g.screenTransition.active = true
            g.timers.screenTransition = 0
            g.screenTransition.x = event.x or 0
            g.screenTransition.y = event.y or 0
            g.screenTransition.w = event.w or 160
            g.screenTransition.h = event.h or 144
            
        -- Stop the screen transition
        elseif(event.name == "Stop Screen Transition") then
            g.screenTransition.active = false
            g.timers.screenTransition = 0
            
        -- Text that can be clicked
        elseif(event.name == "Mouseover") then
            event.mouseover()
        end
        
        -- First in, first out
        table.remove(g.events,1)
    end
    
end

return updateEvents