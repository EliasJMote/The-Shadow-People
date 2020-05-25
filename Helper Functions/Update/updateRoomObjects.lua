local updateRoomObjects = {}

    local g = GLOBALS

    function updateRoomObjects.update()
        if(g.curLocation ~= nil) then

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
                        if(g.objectPointedAt.item ~= nil) then
                            table.insert(g.items, g.objectPointedAt.item)
                            
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