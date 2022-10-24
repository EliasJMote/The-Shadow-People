local updateCheckCog = {}

local g = GLOBALS

function updateCheckCog.update()
    
    if(g.mouse.objectPointedAt ~= nil) then
        
        if(g.curLocation == loadRooms.clockTowerInsideFirstFloor) then
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
            else
                g.writeToTextDisplay({"You can't use the cog here."})
            end
        else
            g.writeToTextDisplay({"You can't use the cog here."})
        end
    end
end

return updateCheckCog