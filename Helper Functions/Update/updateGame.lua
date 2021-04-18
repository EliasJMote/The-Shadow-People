local updateGame = {}

function updateGame.update()

    local g = GLOBALS

    -- Update the next time we want to hit based on the minimum delta time
    g.nextTime = g.nextTime + g.minDT

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
    
    if(g.screenTransition.active) then
        -- Increment the screen transition timer
        g.timers.screenTransition = g.timers.screenTransition + 1
    end
    
    if(g.state == "pause") then
        g.mouse.actionHover = false
        g.mouse.objectHover = false
        g.mouse.mapHover = false
    
    elseif(g.state == "video intro") then
        if(g.timers.video < 875) then
            g.timers.video = g.timers.video + 0.2
        else
            g.timers.video = 0
            g.state = "screen transition"
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="title"}})
        end
    
    elseif(g.state == "video bad ending") then
        if(g.timers.video < 238) then
            g.timers.video = g.timers.video + 0.2
        else
            g.state = "bad ending"
            g.music = loadMusic.shadowLands
            g.music:play()
            --love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
            --createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="bad ending"}})
        end
    
    -- Squiggle man rushes the player
    elseif(g.state == "game") then
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
    --end
    
    elseif(g.state == "shadow child") then
        if(g.timers.shadowChild == 270) then
            g.music = loadMusic.shadowChildApproach
            g.music:play()
        end
        g.timers.shadowChild = g.timers.shadowChild + 1
        if(g.timers.shadowChild > 660) then
            if not(g.playerState.hasNecklace) then
                
                -- Exit game
                love.event.quit(0)
                
            -- The magic necklace will save the player
            else
                g.music:stop()
                g.music = loadMusic.nightmareGeometry
                g.music:play()
                g.state = "game"
                g.curLocation = loadRooms.nightmareGeometry8
                g.timers.shadowChild = -1
                g.writeToTextDisplay({"The magic necklace protected", "you."})
            end
        end
    end
    
    -- Update the global timer
    if(g.state ~= "warning" and g.state ~= "video intro") then
        g.timers.global = g.timers.global + 1
    end

end

return updateGame