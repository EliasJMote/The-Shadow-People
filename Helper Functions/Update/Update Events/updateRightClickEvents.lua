local updateRightClickEvents = {}

local g = GLOBALS

function updateRightClickEvents.update(event)
    
    -- If we can pause the game
    if not(g.screenTransition.active or g.timers.squiggleMan > 0 or g.timers.shadowChild > 0) then
        
        -- When the game is paused
        if(g.state == "game") then
            
            -- Pause the music if it's currently playing
            if(g.music ~= nil) then
                g.music:pause()
            end
            
            -- Clear the mouse cursor states
            g.clearMouseCursorState()
            
            -- Stop all SFX
            for k,v in pairs(loadSFX) do
                v:stop()
            end
            
            -- Transition to the pause state
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="pause"}})
        elseif(g.state == "pause") then
            
            -- Start the music back up
            g.music:play()
            
            -- Transition to the game state
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
        end
    end
    
end

return updateRightClickEvents