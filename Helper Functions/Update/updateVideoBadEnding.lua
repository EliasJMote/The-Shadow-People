local updateVideoBadEnding = {}

local g = GLOBALS

function updateVideoBadEnding.update()
    if(g.timers.video < 238) then
        g.timers.video = g.timers.video + 0.2
    else
        g.timers.global = -60*7.5
        g.state = "bad ending"
        g.music = loadMusic.shadowLands
        g.music:play()
    end
end

return updateVideoBadEnding