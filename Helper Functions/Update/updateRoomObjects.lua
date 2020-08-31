local updateRoomObjects = {}

    local g = GLOBALS

    -- If the player clicks on something in the room, perform a click update
    function updateRoomObjects.update()
        if(g.curLocation ~= nil) then

            -- If the cursor is pointing to an object
            if(g.mouse.objectPointedAt ~= nil) then

                -- Player must select an action first!
                if(g.selectedAction ~= nil) then

                    -- If it's an illegal action
                    if(g.selectedAction ~= "Move" and g.mouse.objectPointedAt.text[g.selectedAction:lower()] == nil) then
                        if(g.curLocation.state == "Dark" and not g.mouse.objectPointedAt.visibleInDark) then
                            g.writeToTextDisplay({"It's too dark to see!"})
                        else
                            if(g.selectedAction == "Close") then
                                g.writeToTextDisplay({"You can't close that!"})
                            elseif(g.selectedAction == "Look") then
                                g.writeToTextDisplay({"You can't look at that!"})
                            elseif(g.selectedAction == "Open") then
                                g.writeToTextDisplay({"You can't open that!"})
                            elseif(g.selectedAction == "Push") then
                                g.writeToTextDisplay({"You can't push that!"})
                            elseif(g.selectedAction == "Put") then
                                g.writeToTextDisplay({"You can't put that there!"})
                            elseif(g.selectedAction == "Take") then
                                g.writeToTextDisplay({"You can't take that!"})
                            elseif(g.selectedAction == "Talk") then
                                g.writeToTextDisplay({"You can't talk to that!"})
                            elseif(g.selectedAction == "Use") then
                                g.writeToTextDisplay({"You can't use that!"})
                            else
                                g.writeToTextDisplay({"You can't do that!"})
                            end
                        end
                        
                    -- If it's an legal action
                    else

                        -- If the player is currently in the dark
                        if(g.curLocation.state == "Dark" and not g.mouse.objectPointedAt.visibleInDark) then
                            g.writeToTextDisplay({"It's too dark to see!"})
                            
                        -- If the player is currently in the light
                        else
                        
                            if(g.selectedAction ~= "Move") then
                                g.writeToTextDisplay(g.mouse.objectPointedAt.text[g.selectedAction:lower()])
                            end
                            
                            -- Try to open the object if possible
                            if(g.selectedAction == "Open" and g.mouse.objectPointedAt.state ~= "Locked") then
                                g.mouse.objectPointedAt.state = "Open"
                                loadSFX.pickup:play()
                            end
                            
                            -- Try to close the object if possible
                            if(g.selectedAction == "Close" and g.mouse.objectPointedAt.state == "Open") then
                                g.mouse.objectPointedAt.state = "Closed"
                            end
                            
                            -- Turn off the light switch
                            if(g.selectedAction == "Use" and g.mouse.objectPointedAt.lightSwitch) then
                                loadSFX.pickup:play()
                                if(g.curLocation.state == "Light") then
                                    g.curLocation.state = "Dark"
                                else
                                    g.curLocation.state = "Light"
                                end
                            end
                            
                            if(g.selectedAction == "Move") then
                                g.movementDirection = g.mouse.objectPointedAt.move
                            end
                            
                            -- Pick up the item (if the selected item can be taken)
                            if(g.selectedAction == "Take" and g.mouse.objectPointedAt.item ~= nil) then
                                
                                -- Add the item to the player's inventory
                                table.insert(g.items, g.mouse.objectPointedAt.item)
                                
                                loadSFX.pickup:play()
                                
                                -- Move the item offscreen
                                for k,v in ipairs(g.curLocation.objects) do
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
                else
                    g.writeToTextDisplay({"You must select an action", "first!"})
                end
            end
        end
    end

return updateRoomObjects