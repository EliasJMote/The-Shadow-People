local updateTitleScreen = {}

    function updateTitleScreen.update()
        
        local g = GLOBALS
        
        if((g.timers.global == 90 or g.timers.global == 91) and not g.screenTransition.active) then
            createEvent.create(createEvent.create{name="Start Screen Transition", x=0, y=0, w=160, h=144})
        end
        
    end

return updateTitleScreen