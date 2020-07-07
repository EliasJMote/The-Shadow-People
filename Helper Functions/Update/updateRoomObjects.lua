local updateRoomObjects = {}

    local g = GLOBALS

    function updateRoomObjects.update()
        if(g.curLocation ~= nil) then

                -- If the player is currently in the dark
                if(g.curLocation.state == "Dark") then
                    if(g.objectPointedAt ~= nil) then
                        if not(g.objectPointedAt.visibleInDark) then
                            g.writeToTextDisplay({"It's too dark to see!"})
                        else
                            if(g.objectPointedAt.lightSwitch) then
                                g.writeToTextDisplay({"You turn the light switch on."})
                                g.curLocation.state = "Light"
                            else
                                g.writeToTextDisplay(g.objectPointedAt.text)
                            end
                        end
                    end
                else
                    if(g.objectPointedAt ~= nil) then
                        g.writeToTextDisplay(g.objectPointedAt.text)
                        if(g.objectPointedAt.lightSwitch) then
                            g.curLocation.state = "Dark"
                        end
                        
                        -- Pick up the item
                        if(g.objectPointedAt.item ~= nil) then
                            
                            -- Add the item to the player's inventory
                            table.insert(g.items, g.objectPointedAt.item)
                            
                            loadSFX.pickup:play()
                            
                            for k,v in ipairs(g.curLocation.objects) do
                                if(v.name == g.objectPointedAt.name) then
                                    
                                    v.x = -256
                                    v.y = -256
                                    break
                                end
                            end
                            g.objectPointedAt = nil
                        end
                    end
                end

        end
    end

return updateRoomObjects