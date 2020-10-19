local updateTitleScreen = {}

    function updateTitleScreen.update()
        
        local g = GLOBALS
        
        if((g.timers.global == g.timers.titleScreenLogo-35 or g.timers.global == g.timers.titleScreenLogo-35-1) and not g.screenTransition.active) then
            createEvent.create(createEvent.create{name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="Play Music", music=loadMusic.title}})
        end
        
    end

return updateTitleScreen