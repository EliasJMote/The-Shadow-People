local updateCheckShadowOrb = {}

local g = GLOBALS

function updateCheckShadowOrb.update()
    
    if(g.mouse.objectPointedAt ~= nil) then
        
        if(g.curLocation == loadRooms.shadowLands9) then
            if(g.itemSelected == "Shadow Orb" and g.mouse.objectPointedAt == g.curLocation.objects.statue and g.curLocation.objects.statue.state == "Off") then
                g.curLocation.objects.statue.state = "On"
                g.writeToTextDisplay({"You place the Shadow Orb into", "the hands of the statue. It", "pulses with a strange energy.", "Somehow, in your head, you hear", "the words: THE RITUAL IS READY.", "LIE DOWN ON THE ALTAR TO BEGIN", "THE TRANSMOGRIFICATION."})
                g.curLocation.objects.statue.text.look = {"A statue with a dark crystal", "ball."}
                g.curLocation.objects.statue.text.put = {"The orb has already been", "placed."}
                g.itemSelected = nil
                loadSFX.pickup:play()
                g.itemCount = g.itemCount - 1
                
                for k,v in ipairs(g.items) do
                    if(v.name =="Shadow Orb") then
                        table.remove(g.items,k)
                        break
                    end
                end
            else
                g.writeToTextDisplay({"You can't use the shadow orb", "here."})
            end
        else
            g.writeToTextDisplay({"You can't use the shadow orb", "here."})
        end
    end
end

return updateCheckShadowOrb