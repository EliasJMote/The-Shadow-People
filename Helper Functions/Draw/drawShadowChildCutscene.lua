local drawShadowChildCutscene = {}

local g = GLOBALS

-- Draw the shadow child cutscene
function drawShadowChildCutscene.draw()
    
    local t = g.timers.shadowChild
    local dt = 16
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill",-64,-64,160+64,144+64)
    love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
    
    if(t < 150) then
        love.graphics.draw(loadImages.shadowChild[1],160/2,144/2, 0, 0.3, 0.3,11,21)
    elseif(t < 180) then
        love.graphics.draw(loadImages.shadowChild[2],160/2,144/2, 0, 0.3, 0.3,11,21)
    elseif(t < 210) then
        love.graphics.draw(loadImages.shadowChild[3],160/2,144/2, 0, 0.3, 0.3,11,21)
    elseif(t < 210) then
        love.graphics.draw(loadImages.shadowChild[4],160/2,144/2, 0, 0.3, 0.3,11,21)
    elseif(t < 240) then
        love.graphics.draw(loadImages.shadowChild[5],160/2,144/2, 0, 0.3, 0.3,11,21)
    elseif(t < 270) then
        love.graphics.draw(loadImages.shadowChild[6],160/2,144/2, 0, 0.3, 0.3,11,21)
    elseif(t < 660) then
        if(t%dt<dt/2) then
            love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        else
            love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
        end
        if(t % dt < dt/2) then
            love.graphics.rectangle("fill",-64,-64,160+64,144+64)
        end
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        local shakeMagnitude = 2
        local dx = love.math.random(-shakeMagnitude, shakeMagnitude)
        local dy = love.math.random(-shakeMagnitude, shakeMagnitude)
        love.graphics.translate(dx, dy)
        love.graphics.draw(loadImages.shadowChild[7+math.floor(g.timers.shadowChild/4)%4],160/2,144/2, 0, 0.3+(t-270)/200, 0.3+(t-270)/200,11,21)
    else
        --love.graphics.draw(loadImages.shadowChild[7+math.floor(660/4)%4],160/2,144/2, 0, 0.3+(660-270)/200, 0.3+(660-270)/200,11,21)
    end
    
end

return drawShadowChildCutscene