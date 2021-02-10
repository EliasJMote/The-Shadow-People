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
        or g.state == "bad ending" and g.timers.endingText >= g.timers.badEnding
        or g.state == "easter egg ending" and g.timers.endingText >= g.timers.easterEggEnding
        or g.state == "alien ending" and g.timers.endingText >= g.timers.alienEnding) then
        
        if(g.state == "bad ending" or g.state == "alien ending") then
            love.graphics.print("The", 44, 44, 0, 2, 2)
            love.graphics.print("End", 44, 76, 0, 2, 2)
        end
        
        local endingNumberStr = ""
        local endingName = ""
        if(g.state == "good ending") then
            endingNumberStr = "(Ending 1 of 5)"
            endingName = "\"Morning Daybreak\""
            love.graphics.draw(loadImages.goodEnding,0,0)
        elseif(g.state == "bad ending") then
            endingNumberStr = "(Ending 2 of 5)"
            endingName = "\"Midnight Shadows\""
        elseif(g.state == "alien ending") then
            endingNumberStr = "(Ending 3 of 5)"
            endingName = "\"Eternal Twilight\""
        elseif(g.state == "easter egg ending") then
            endingNumberStr = "(Ending 4 of 5)"
            endingName = "\"Solar Blindness\""
            love.graphics.draw(loadImages.solarBlindnessEnding,0,0)
        elseif(g.state == "red prince ending") then
            endingNumberStr = "(Ending 5 of 5)"
            endingName = "\"The Red Prince\""
            love.graphics.draw(loadImages.redPrinceEnding,0,0)
        end
        
        if(g.state == "bad ending" or g.state == "alien ending") then
            love.graphics.print(endingName, 39, 120, 0, 0.4, 0.4)
            love.graphics.print(endingNumberStr, 44, 130, 0, 0.4, 0.4)
        end
    else
        
    end
    
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", g.endingScreenMask.x, g.endingScreenMask.y, g.endingScreenMask.w, g.endingScreenMask.h)
end

return drawEnding