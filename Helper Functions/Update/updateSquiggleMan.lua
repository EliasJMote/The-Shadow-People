local updateSquiggleMan = {}

local g = GLOBALS

function updateSquiggleMan.update()
    if(g.playerState.numOfTimesLookedAtWallHole == 5) then
        g.timers.squiggleMan = g.timers.squiggleMan + 1
        if(g.timers.squiggleMan > 60) then
            if not(g.playerState.hasNecklace) then
                
                -- Return to the title screen
                g.goToTitleScreen()
                
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

return updateSquiggleMan