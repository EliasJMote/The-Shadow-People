local updateCheckActionPut = {}

local g = GLOBALS

function updateCheckActionPut.update()
    
    if(g.curLocation == loadRooms.gasStationOutside) then
        if(g.itemSelected == "G.S. Key" and g.curLocation.objects.door.state == "Locked" and g.mouse.objectPointedAt == g.curLocation.objects.door) then
            g.curLocation.objects.door.state = "Closed"
            g.writeToTextDisplay({"You unlock the door with the", "key."})
            g.curLocation.objects.door.text.look={"It's a double glass door. It's", "dark on the inside."}
            g.curLocation.objects.door.text.open={"You open the door."}
            g.curLocation.objects.door.text.pull={"You open the door."}
            loadSFX.pickup:play()
        end
    
    elseif(g.curLocation == loadRooms.clockTowerInsideFirstFloor) then
        if(g.itemSelected == "Cog" and g.mouse.objectPointedAt == g.curLocation.objects.cogHole and g.curLocation.objects.cogHole.state == "Empty") then
            g.playerState.gearPlaced = true
            g.curLocation.objects.cogHole.state = "Full"
            g.writeToTextDisplay({"You place the cog into the", "empty hole. You hear the gears", "begin to grind as the clock", "tower comes to life."})
            g.curLocation.objects.cogHole.text.look = {"It's a gear for the clock", "tower."}
            g.curLocation.objects.cogHole.text.put = {"The cog has already been", "placed."}
            g.itemSelected = nil
            loadSFX.pickup:play()
            g.itemCount = g.itemCount - 1
            
            -- Remove the cog from the player's inventory
            for k,v in ipairs(g.items) do
                if(v.name =="Cog") then
                    table.remove(g.items,k)
                    break
                end
            end
        end
    
    elseif(g.curLocation == loadRooms.shadowLands9) then
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
        end
    end
    
end

return updateCheckActionPut