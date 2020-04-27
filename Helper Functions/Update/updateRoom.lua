local updateRoom = {}

    local g = GLOBALS

    function updateRoom.update()
        if(g.curLocation ~= nil) then
            if(g.curLocation.name == "Bedroom") then
                if(g.curLocation.state == "Dark") then
                    if(g.objectPointedAt ~= nil) then
                        if(g.objectPointedAt.name ~= "Light Switch") then
                            g.writeToTextDisplay({"It's too dark to see!"})
                        else
                            g.writeToTextDisplay({"You turn the light switch on."})
                            g.curLocation.state = "Light"
                        end
                    end
                else
                    if(g.objectPointedAt ~= nil) then
                        g.writeToTextDisplay(g.objectPointedAt.text)
                    end
                end
            end
        end
    end

return updateRoom