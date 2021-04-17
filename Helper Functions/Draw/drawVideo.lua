local drawVideo = {}

function drawVideo.draw()
    local g = GLOBALS
    
    if(g.state == "video intro") then
        --love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        love.graphics.draw(loadImages.video.intro[math.floor(g.timers.video)+1],0,0)
    elseif(g.state == "video bad ending") then
        love.graphics.draw(loadImages.video.badEnding[math.floor(g.timers.video)],0,0)
    end
end

return drawVideo