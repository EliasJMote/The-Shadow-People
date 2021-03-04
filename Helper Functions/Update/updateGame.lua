local updateGame = {}

function updateGame.update()

    local g = GLOBALS

    -- Update the window scaling (since the player can adjust this window at anytime)
    
    g.scale.x = love.graphics.getWidth()/160
    g.scale.y = love.graphics.getHeight()/144

    -- Update the mouse
    g.mouse.x, g.mouse.y = love.mouse.getPosition()
    g.mouse.x = g.mouse.x / g.scale.x
    g.mouse.y = g.mouse.y / g.scale.y
    
    -- Check the current position of the mouse as an event
    createEvent.create{name="Check Mouse Position", state=g.state, mouse={x=g.mouse.x,y=g.mouse.y}}
    
    -- Poll the title screen
    if(g.state == "title") then
        updateTitleScreen.update()
    elseif(g.state == "good ending" or g.state == "bad ending" or g.state == "alien ending" or g.state == "easter egg ending" or g.state == "red prince ending") then
        updateEnding.update()
    end
    
    -- Update the event table
    updateEvents.update()
    
    if(g.state == "pause") then
        --g.mouse.textHover = false
        g.mouse.actionHover = false
        g.mouse.objectHover = false
        g.mouse.mapHover = false
    end
    
    -- Squiggle man rushes the player
    if(g.state == "game") then
        if(g.playerState.numOfTimesLookedAtWallHole == 5) then
            g.timers.squiggleMan = g.timers.squiggleMan + 1
            if(g.timers.squiggleMan > 60) then
                if not(g.playerState.hasNecklace) then
                    
                    g.fun = 100 -- Set "fun" value to 100
                    -- Save a text file with the "fun" value. When the player restarts the game, if "fun" == 100, a new image of "Squiggle Man" appears, then "fun" is set back to 50.
                    --love.filesystem.write("Save.txt", "{Fun=100}")
                    
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
    
    if(g.state == "shadow child") then
        g.timers.shadowChild = g.timers.shadowChild + 1
        if(g.timers.shadowChild > 660) then
            if not(g.playerState.hasNecklace) then
                
                g.fun = 120 -- Set "fun" value to 120
                -- Save a text file with the "fun" value. When the player restarts the game, if "fun" == 100, a new image of "Squiggle Man" appears, then "fun" is set back to 50.
                --love.filesystem.write("Save.txt", "{Fun=100}")
                
                -- Exit game
                love.event.quit(0)
                
            -- The magic necklace will save the player
            else
                --loadSFX.squiggleManScream:stop()
                --g.playerState.numOfTimesLookedAtWallHole = 6
                g.music:play()
                g.state = "game"
                g.curLocation = loadRooms.nightmareGeometry8
                g.timers.shadowChild = -1
                g.writeToTextDisplay({"The magic necklace protected", "you."})
            end
        end
    end
    
    -- Update the global timer
    if(g.state ~= "warning") then
        g.timers.global = g.timers.global + 1
    end

end

return updateGame