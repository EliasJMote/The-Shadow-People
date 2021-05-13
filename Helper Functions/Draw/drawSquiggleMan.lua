local drawSquiggleMan = {}

local g = GLOBALS

function drawSquiggleMan.draw()

    -- Draw squiggle man
    if(g.curLocation == loadRooms.nightmareGeometry4 and g.playerState.numOfTimesLookedAtWallHole >= 5 and g.timers.squiggleMan >= 0) then
        local t = g.timers.squiggleMan
        if(t <= 20) then
            love.graphics.draw(loadImages.squiggleMan[1],16+8+263/4,16+210/4+8, 0, 0.5, 0.5,16+263/2,16+210/2)
        elseif(t < 40) then
            love.graphics.draw(loadImages.squiggleMan[1+math.floor(t/2)%6],16+8+263/4+2*t-40,16+210/4+8+2*t-40, 0, 0.5+(t-20)/10, 0.5+(t-20)/10,16+263/2,16+210/2)
        else
            love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
            love.graphics.rectangle("fill",0,0,160,144)
            love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        end
    end
end

return drawSquiggleMan