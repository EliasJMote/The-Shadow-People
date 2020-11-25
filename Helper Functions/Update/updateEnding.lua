local updateEnding = {}

function updateEnding.update()
    local g = GLOBALS

    if(button == 1) then
        --createEvent.create{name="Left Click", state=g.state}
    end
    
    local endingTextLineMax = 0
    local creditsTextTable = nil
    
    if(g.state == "good ending") then
        creditsTextTable = loadGameText.goodCreditsText
    elseif(g.state == "bad ending") then
        creditsTextTable = loadGameText.badCreditsText
    elseif(g.state == "easter egg ending") then
        creditsTextTable = loadGameText.easterEggCreditsText
    else
        creditsTextTable = loadGameText.alienCreditsText
    end
    endingTextLineMax = math.ceil((#creditsTextTable)/4)*4+4
    
    -- Update the ending
    if(g.endingTextLine < endingTextLineMax) then
        if(g.timers.endingText % g.timers.endingTextFadeOut == 0) then
            g.textBuffer = {}
            for i=1,4 do
                table.insert(g.textBuffer,creditsTextTable[g.endingTextLine])
                g.endingTextLine = g.endingTextLine + 1
            end
            g.endingScreenMask.y = 0
        end
        
        if(g.timers.endingText % g.timers.endingTextFadeOut == g.timers.endingTextFadeOut - 60 * 3) then g.endingScreenMask.y = -144 end

        if(g.endingScreenMask.y < 144) then
            g.endingScreenMask.y = (g.endingScreenMask.y + 0.5)
        else
            g.endingScreenMask.y = 144
        end
    else
        g.endingScreenMask.y = -144
    end
    
    -- Update the end credits timer
    g.timers.endingText = g.timers.endingText + 1
end

return updateEnding