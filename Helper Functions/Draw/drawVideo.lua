local drawVideo = {}

function drawVideo.draw()
    local g = GLOBALS
    
    love.graphics.draw(loadImages.video.badEnding[math.floor(g.timers.video)],0,0)
end

return drawVideo