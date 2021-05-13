local updateShadowChild = {}

local g = GLOBALS

function updateShadowChild.update()
    if(g.playerState.numOfTimesLookedAtWallHole == 5) then
        g.timers.squiggleMan = g.timers.squiggleMan + 1
        if(g.timers.squiggleMan > 60) then
            if not(g.playerState.hasNecklace) then
                
                -- Exit game
                love.event.quit(0)
                
            -- The magic necklace will save the player
            else
                loadSFX.squiggleManScream:stop()
                g.playerState.numOfTimesLookedAtWallHole = 6
                g.timers.squiggleMan = -1
                g.writeToTextDisplay({"The magic necklace protected", "you."})
            end
        end
    end
end

return updateShadowChild