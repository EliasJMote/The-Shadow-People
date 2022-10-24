local drawEnding = {}

function drawEnding.draw()
    local g = GLOBALS
    
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        
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
        
        if(g.timers.endingText < g.timers.redPrinceEnding + 60 * 25) then
            love.graphics.draw(loadImages.redPrinceEnding,0,0)
        end
    end

    -- Draw the credits text
    love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
    for k,v in ipairs(g.textBuffer) do
        love.graphics.print(v, 6, 83 + 15 * (k-1), 0, 0.4, 0.4)
        if(k == 4) then break end
    end
    
    if((g.state == "good ending" and g.timers.endingText >= g.timers.goodEnding)
        or (g.state == "bad ending" and g.timers.endingText >= g.timers.badEnding)
        or (g.state == "easter egg ending" and g.timers.endingText >= g.timers.easterEggEnding)
        or (g.state == "alien ending" and g.timers.endingText >= g.timers.alienEnding)
        or (g.state == "red prince ending" and g.timers.endingText >= g.timers.redPrinceEnding)) then
        
        -- Draw the ending pictures with text
        local endingNumberStr = ""
        local endingName = ""
        if(g.state == "good ending") then
            endingNumberStr = "(Ending 1 of 5)"
            endingName = "\"Morning Daybreak\""
            love.graphics.draw(loadImages.goodEndingWithText,0,0)
        elseif(g.state == "bad ending") then
            endingNumberStr = "(Ending 2 of 5)"
            endingName = "\"Midnight Shadows\""
            love.graphics.draw(loadImages.badEndingWithText[math.floor(g.timers.global/15)%5+1],0,0)
        elseif(g.state == "alien ending") then
            endingNumberStr = "(Ending 3 of 5)"
            endingName = "\"Eternal Twilight\""
            love.graphics.draw(loadImages.eternalTwilightEndingWithText,0,0)
        elseif(g.state == "easter egg ending") then
            endingNumberStr = "(Ending 4 of 5)"
            endingName = "\"Solar Blindness\""
            love.graphics.draw(loadImages.solarBlindnessEndingWithText,0,0)
        elseif(g.state == "red prince ending") then
            endingNumberStr = "(Ending 5 of 5)"
            endingName = "\"The Red Prince\""
            
            -- There is a jump scare associated with the "Red Prince" ending
            -- Set the screen to the color red
            if(g.timers.endingText >= g.timers.redPrinceEnding + 60 * 5) then
                love.graphics.setColor(1, 0, 0, 1)
            end
            
            -- Actual ending text
            if(g.timers.endingText < g.timers.redPrinceEnding + 60 * 25) then
                love.graphics.draw(loadImages.redPrinceEndingWithText,0,0)
            end
            
            -- Red prince jump scare
            if(g.timers.endingText >= g.timers.redPrinceEnding + 60 * 25) then
                love.graphics.draw(loadImages.redPrince,0,0,0,2,2)
            end
        end
    else
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, math.sin(2*math.pi*g.timers.global/g.timers.endingTextFadeOut))
        love.graphics.rectangle("fill", g.endingScreenMask.x, g.endingScreenMask.y, g.endingScreenMask.w, g.endingScreenMask.h)
    end
    
    -- Draw static for certain endings
    if(g.state == "bad ending" or g.state == "alien ending") then
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)

        --for i=3,96 do
        for i=4,4+152-1 do
            --for j=3,79 do
            for j=4,4+64-1 do
                local staticNum = love.math.random(0,20)
                if(staticNum <= 1) then
                    love.graphics.rectangle("fill",i,j,1,1)
                end
            end
        end
        
        if(love.math.random(0,15) == 0) then
            love.graphics.rectangle("fill",4,4,152-1,64-1)
        end
    end
end

return drawEnding