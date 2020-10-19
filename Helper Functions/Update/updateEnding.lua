local updateEnding = {}

function updateEnding.update()
    local g = GLOBALS

    if(button == 1) then
        --createEvent.create{name="Left Click", state=g.state}
    end
    
    if(g.state == "good ending") then
        if(g.endingTextLine < 24) then
            if(g.timers.endingText % g.timers.endingTextFadeOut == 0) then
                g.textBuffer = {}
                for i=1,4 do
                    table.insert(g.textBuffer,loadGameText.goodCreditsText[g.endingTextLine])
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
        g.timers.endingText = g.timers.endingText + 1
    elseif(g.state == "easter egg ending") then
        if(g.endingTextLine < 8) then
            if(g.timers.endingText % g.timers.endingTextFadeOut == 0) then
                g.textBuffer = {}
                for i=1,4 do
                    table.insert(g.textBuffer,loadGameText.easterEggCreditsText[g.endingTextLine])
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
        g.timers.endingText = g.timers.endingText + 1
    end
end

return updateEnding