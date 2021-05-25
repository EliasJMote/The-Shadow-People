local updateShadowChild = {}

local g = GLOBALS

function updateShadowChild.update()
    --[[if(g.playerState.numOfTimesLookedAtWallHole == 5) then
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
    end]]
    if(g.timers.shadowChild == 270) then
        g.music = loadMusic.shadowChildApproach
        g.music:play()
    end
    
    if(g.timers.shadowChild >= 660) then
        if not(g.playerState.hasNecklace) then
                
            -- Exit game
            love.event.quit(0)
            
        -- The magic necklace will save the player
        else
            g.state = "game"
            g.curLocation = loadRooms.nightmareGeometry8
            g.timers.shadowChild = 0
            g.music:stop()
            g.music = loadMusic.nightmareGeometry
            g.music:play()
            g.writeToTextDisplay({"The magic necklace protected", "you."})
        end
    end
    
    if(g.state == "shadow child") then
        g.timers.shadowChild = g.timers.shadowChild + 1
    end
end

return updateShadowChild