local updateVideoIntro = {}

local g = GLOBALS

function updateVideoIntro.update()
    if(g.timers.video < 875) then
        g.timers.video = g.timers.video + 0.2
    else
        g.timers.video = 0
        g.state = "screen transition"
        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="title"}})
    end
end

return updateVideoIntro