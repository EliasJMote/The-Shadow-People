local updateCheckAction = {}

    local g = GLOBALS

    -- If the player clicks on something in the room, perform a click update
    function updateCheckAction.update()
        if(g.curLocation ~= nil) then

            -- If the cursor is pointing to an object
            if(g.mouse.objectPointedAt ~= nil) then

                -- Check if the player is selecting an action
                if(g.actionSelected ~= nil) then

                    -- If it's an illegal action
                    if(g.mouse.objectPointedAt.text[g.actionSelected:lower()] == nil) then
                        if(g.curLocation.state == "Dark" and not g.mouse.objectPointedAt.visibleInDark and not debug) then
                            g.writeToTextDisplay({"It's too dark to see!"})
                        else
                            if(g.actionSelected == "Close") then
                                g.writeToTextDisplay({"You can't close that!"})
                            elseif(g.actionSelected == "Look") then
                                g.writeToTextDisplay({"You can't look at that!"})
                            elseif(g.actionSelected == "Move") then
                                g.writeToTextDisplay({"You can't move there!"})
                            elseif(g.actionSelected == "Open") then
                                g.writeToTextDisplay({"You can't open that!"})
                            elseif(g.actionSelected == "Push") then
                                g.writeToTextDisplay({"You can't push that!"})
                            elseif(g.actionSelected == "Put") then
                                g.writeToTextDisplay({"You can't put that there!"})
                            elseif(g.actionSelected == "Take") then
                                g.writeToTextDisplay({"You can't take that!"})
                            elseif(g.actionSelected == "Talk") then
                                g.writeToTextDisplay({"You can't talk to that!"})
                            elseif(g.actionSelected == "Use") then
                                g.writeToTextDisplay({"You can't use that!"})
                            else
                                g.writeToTextDisplay({"You can't do that!"})
                            end
                        end
                        
                    -- If it's an legal action
                    else

                        -- If the player is currently in the dark or the object is not visible in the dark
                        if(g.curLocation.state == "Dark" and not g.mouse.objectPointedAt.visibleInDark and not debug) then
                            g.writeToTextDisplay({"It's too dark to see!"})
                            
                        -- If the player is currently in the light
                        else
                        
                            if(g.actionSelected ~= "Move") then
                                if (g.actionSelected == "Open" and g.mouse.objectPointedAt.state ~= "Closed") then
                                    if(g.mouse.objectPointedAt.state == "Open") then
                                        g.writeToTextDisplay({"It's already open!"})
                                    elseif(g.mouse.objectPointedAt.state == "Locked") then
                                        g.writeToTextDisplay({"It's locked!"})
                                    end
                                elseif (g.actionSelected == "Close" and g.mouse.objectPointedAt.state == "Closed") then
                                    g.writeToTextDisplay({"It's already closed!"})
                                else
                                    g.writeToTextDisplay(g.mouse.objectPointedAt.text[g.actionSelected:lower()])
                                end
                            end
                            
                            -- Try to open the object if possible
                            if(g.actionSelected == "Open" and g.mouse.objectPointedAt.state == "Closed" and g.mouse.objectPointedAt.state ~= "Locked") then
                                g.mouse.objectPointedAt.state = "Open"
                                loadSFX.pickup:play()
                            end
                            
                            -- Try to close the object if possible
                            if(g.actionSelected == "Close" and g.mouse.objectPointedAt.state == "Open") then
                                g.mouse.objectPointedAt.state = "Closed"
                            end
                            
                            -- Turn off the light switch
                            if(g.actionSelected == "Use" and g.mouse.objectPointedAt.lightSwitch) then
                                loadSFX.pickup:play()
                                if(g.curLocation.state == "Light") then
                                    g.curLocation.state = "Dark"
                                    g.curLocation.music=loadMusic.houseDark
                                    createEvent.create({name="Play Music", music=loadMusic.houseDark})
                                else
                                    g.curLocation.state = "Light"
                                    g.curLocation.music=loadMusic.houseLight
                                    createEvent.create({name="Play Music", music=loadMusic.houseLight})
                                end
                            end
                            
                            if(g.actionSelected == "Push") then
                                if(g.curLocation == loadRooms.graveyard and g.mouse.objectPointedAt == loadRooms.graveyard.objects.grave) then
                                    if(loadRooms.graveyard.objects.grave.state == "normal") then
                                        loadRooms.graveyard.objects.stairs = {name="stairs",x=37,y=67,w=25,h=11,text={look={"Stairs. They lead down into the", "the earth. But what hides", "there?"},move=""},img=loadImages.graveStairs,move=""}
                                        loadRooms.graveyard.objects.grave.state = "Pushed"
                                        loadRooms.graveyard.objects.grave.y = loadRooms.graveyard.objects.grave.y - 12
                                        loadGameText.graveyard.grave.pull = "It has already been moved!"
                                        loadGameText.graveyard.grave.push = "It has already been moved!"
                                    end
                                end
                            end
                            
                            if(g.actionSelected == "Move") then
                                g.movementDirection = g.mouse.objectPointedAt.move
                            end
                            
                            -- Easter Egg Ending
                            if(g.actionSelected == "Look" and g.curLocation == loadRooms.patio) then
                                if(g.mouse.objectPointedAt == loadRooms.patio.objects.sun) then
                                    g.playerState.numOfTimesLookedAtSun = g.playerState.numOfTimesLookedAtSun + 1
                                    if(g.playerState.numOfTimesLookedAtSun >= 6) then
                                        g.actionSelected = nil
                                        g.textBuffer = {}
                                        createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="easter egg ending"}})
                                        createEvent.create({name="Play Music", music=loadMusic.darkStreets})
                                    end
                                end
                            end
                            
                            -- Pick up the item (if the selected item can be taken)
                            if(g.actionSelected == "Take" and g.mouse.objectPointedAt.item ~= nil) then
                                
                                -- Add the item to the player's inventory
                                table.insert(g.items, g.mouse.objectPointedAt.item)
                                
                                loadSFX.pickup:play()
                                
                                -- Move the item offscreen
                                for k,v in pairs(g.curLocation.objects) do
                                    if(v.name == g.mouse.objectPointedAt.name) then
                                        
                                        v.x = -256
                                        v.y = -256
                                        break
                                    end
                                end
                                g.mouse.objectPointedAt = nil
                            end
                        end
                    end
                
                -- Check if the player is selecting an item
                elseif(g.itemSelected ~= nil) then
                    -- The bolt cutters are used to cut the chain at the park
                    if(g.itemSelected == "B. Cutters") then
                        if(g.curLocation == loadRooms.park1) then
                            if(g.curLocation.objects.parkGate.state == "Locked" and g.mouse.objectPointedAt == g.curLocation.objects.parkGate) then
                                g.curLocation.objects.parkGate.state = "Closed"
                                g.writeToTextDisplay({"You cut the chain with the bolt", "cutters."})
                            else
                                g.writeToTextDisplay({"You can't use the bolt cutters", "here."})
                            end
                        else
                            if(g.mouse.objectPointedAt ~= nil) then
                                g.writeToTextDisplay({"You can't use the bolt cutters", "here."})
                            end
                        end
                    end
                else
                    g.writeToTextDisplay({"You must select an action", "or item first!"})
                end
            end
        end
    end

return updateCheckAction