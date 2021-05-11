local drawEnding = {}

function drawEnding.draw()
    local g = GLOBALS
    
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
    
    -- Draw the credits text
    for k,v in ipairs(g.textBuffer) do
        love.graphics.print(v, 7, 47 + 13 * (k-1), 0, 0.4, 0.4)
        if(k == 4) then break end
    end

    if((g.state == "good ending" and g.timers.endingText >= g.timers.goodEnding)
        or (g.state == "bad ending" and g.timers.endingText >= g.timers.badEnding)
        or (g.state == "easter egg ending" and g.timers.endingText >= g.timers.easterEggEnding)
        or (g.state == "alien ending" and g.timers.endingText >= g.timers.alienEnding)
        or (g.state == "red prince ending" and g.timers.endingText >= g.timers.redPrinceEnding)) then
        
        -- Draw the ending pictures
        local endingNumberStr = ""
        local endingName = ""
        if(g.state == "good ending") then
            endingNumberStr = "(Ending 1 of 5)"
            endingName = "\"Morning Daybreak\""
            love.graphics.draw(loadImages.goodEnding,0,0)
        elseif(g.state == "bad ending") then
            endingNumberStr = "(Ending 2 of 5)"
            endingName = "\"Midnight Shadows\""
            love.graphics.draw(loadImages.badEnding[math.floor(g.timers.global/15)%5+1],0,0)
        elseif(g.state == "alien ending") then
            endingNumberStr = "(Ending 3 of 5)"
            endingName = "\"Eternal Twilight\""
            love.graphics.draw(loadImages.eternalTwilightEnding,0,0)
        elseif(g.state == "easter egg ending") then
            endingNumberStr = "(Ending 4 of 5)"
            endingName = "\"Solar Blindness\""
            love.graphics.draw(loadImages.solarBlindnessEnding,0,0)
        elseif(g.state == "red prince ending") then
            endingNumberStr = "(Ending 5 of 5)"
            endingName = "\"The Red Prince\""
            
            -- There is a jump scare associated with the "Red Prince" ending
            if(g.timers.endingText >= g.timers.redPrinceEnding + 60 * 5) then
                love.graphics.setColor(1, 0, 0, 1)
            end
            if(g.timers.endingText < g.timers.redPrinceEnding + 60 * 25) then
                love.graphics.draw(loadImages.redPrinceEnding,0,0)
            end
            if(g.timers.endingText >= g.timers.redPrinceEnding + 60 * 25) then
                --local t = (g.timers.endingText - (g.timers.redPrinceEnding + 60 * 15))/60 + 1
                love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
                love.graphics.rectangle("fill", 0, 0, 160, 144)
                love.graphics.setColor(1, 1, 1, 1)
                love.graphics.draw(loadImages.redPrince,16,6,0,2,2)
            end
        end
        
        --[[if(g.state == "alien ending") then
            love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
            for i=0,160 do
                for j=0,144 do
                    local staticNum = love.math.random(0,20)
                    if(staticNum <= 1) then
                        love.graphics.rectangle("fill",i,j,1,1)
                    end
                end
            end
            
            local staticNum = love.math.random(0,20)
            if(staticNum <= 1) then
                love.graphics.rectangle("fill",0,0,160,144)
            end
        end]]
        
        --[[if(g.state == "bad ending") then-- or g.state == "alien ending") then
            love.graphics.print(endingName, 39, 120, 0, 0.4, 0.4)
            love.graphics.print(endingNumberStr, 44, 130, 0, 0.4, 0.4)
        end]]
    end

    if not(g.state == "red prince ending" and g.timers.endingText >= g.timers.redPrinceEnding) then
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
        love.graphics.rectangle("fill", g.endingScreenMask.x, g.endingScreenMask.y, g.endingScreenMask.w, g.endingScreenMask.h)
    end
end

return drawEnding