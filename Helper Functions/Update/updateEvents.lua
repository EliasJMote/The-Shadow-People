local updateEvents = {}

updateEvents.update = function()
    
    local g = GLOBALS
    
    -- Event handling (modeled as a queue)
    while(#g.events > 0) do
        
        -- Grab the first event in the queue
        local event = g.events[1]
        
        if(event.name == "Left Click") then
        
            if not(g.screenTransition.active) then
        
                -- Handle events for "warning", "video intro", "title", "title credits", "options"
                updateLeftClickTitleEvents.update(event)
                    
                -- Handle events for 
                updateLeftClickPauseEvents.update(event)
                
                -- Handle events for 
                updateLeftClickTransitionEvents.update(event)
                
                -- If we are in the game
                if(event.state == "game") then
                    updateGameEvents.update(event)
                end
            end
            
        elseif(event.name == "Right Click") then
            updateRightClickEvents.update(event)
        
        -- Start the screen transition
        elseif(event.name == "Start Screen Transition") then
            g.screenTransition.active = true
            g.timers.screenTransition = 0
            g.screenTransition.x = event.x or 0
            g.screenTransition.y = event.y or 0
            g.screenTransition.w = event.w or 160
            g.screenTransition.h = event.h or 144
            g.screenTransition.event = event.event
            
        -- Stop the screen transition
        elseif(event.name == "Stop Screen Transition") then
            g.screenTransition.active = false
            g.timers.screenTransition = 0
            if(g.screenTransition.event ~= nil) then
                createEvent.create(g.screenTransition.event)
                g.screenTransition.event = nil
            end
            
        elseif(event.name == "Play Music") then
            if(event.music ~= nil and event.music ~= g.music) then
                if(g.music ~= nil) then g.music:stop() end
                g.music = event.music
                g.music:play()
            end
            
        -- Check the current position of the mouse
        elseif(event.name == "Check Mouse Position") then
            updateMousePositionStates.update(event)
            
        elseif(event.name == "State Transition") then
            
            g.state = event.state
        end
        
        -- First in, first out
        table.remove(g.events,1)
    end
    
end

return updateEvents