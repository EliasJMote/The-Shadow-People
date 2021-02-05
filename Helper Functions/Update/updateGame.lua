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
    elseif(g.state == "good ending" or g.state == "bad ending" or g.state == "alien ending" or g.state == "easter egg ending") then
        updateEnding.update()
    end
    
    -- Update the event table
    updateEvents.update()
    
    if(g.playerState.numOfTimesLookedAtWallHole == 5) then
        g.timers.squiggleMan = g.timers.squiggleMan + 1
        if(g.timers.squiggleMan > 60) then
            if not(g.playerState.hasNecklace) then
                --g.playerState.numOfTimesLookedAtWallHole = 0
                --g.timers.squiggleMan = 0
                --g.objectPointedAt = nil
                --g.mouse.mapHover = nil
                --g.mouse.objectHover = nil
                --g.state = "title"
                --g.music:stop()
                love.event.quit(0)
            else
                g.playerState.numOfTimesLookedAtWallHole = 6
                g.timers.squiggleMan = 0
                g.writeToTextDisplay({"The holy necklace saved you."})
            end
        end
    end
    
    -- Update the global timer
    g.timers.global = g.timers.global + 1

end

return updateGame