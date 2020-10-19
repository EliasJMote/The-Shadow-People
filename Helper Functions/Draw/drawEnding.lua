local drawEnding = {}

function drawEnding.draw()
    local g = GLOBALS
    
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
    
    for k,v in ipairs(g.textBuffer) do
        love.graphics.print(v, 7, 47 + 13 * (k-1), 0, 0.4, 0.4)
        if(k == 4) then break end
    end
    
    if(g.state == "good ending" and g.timers.endingText >= g.timers.goodEnding
        or g.state == "easter egg ending" and g.timers.endingText >= g.timers.easterEggEnding) then
        love.graphics.print("The", 44, 44, 0, 2, 2)
        love.graphics.print("End", 44, 76, 0, 2, 2)
        local endingNumberStr = ""
        if(g.state == "good ending") then
            endingNumberStr = "(Ending 1 of 4)"
        elseif(g.state == "bad ending") then
            endingNumberStr = "(Ending 2 of 4)"
        elseif(g.state == "alien ending") then
            endingNumberStr = "(Ending 3 of 4)"
        elseif(g.state == "easter egg ending") then
            endingNumberStr = "(Ending 4 of 4)"
        end
        love.graphics.print(endingNumberStr, 44, 130, 0, 0.4, 0.4)
    else
        
    end
    
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", g.endingScreenMask.x, g.endingScreenMask.y, g.endingScreenMask.w, g.endingScreenMask.h)
end

return drawEnding