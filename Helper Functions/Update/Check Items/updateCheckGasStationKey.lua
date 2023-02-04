local updateCheckGasStationKey = {}

local g = GLOBALS

function updateCheckGasStationKey.update()
    if(g.curLocation == loadRooms.gasStationOutside) then
        if(g.curLocation.objects.door.state == "Locked" and g.mouse.objectPointedAt == g.curLocation.objects.door) then
            g.curLocation.objects.door.state = "Open"
            g.writeToTextDisplay({"You unlock the door with the", "key."})
            g.updateGasStationDoor()
            loadSFX.pickup:play()
        else
            g.writeToTextDisplay({"You can't use the gas station", "key here."})
        end
    else
        if(g.mouse.objectPointedAt ~= nil) then
            g.writeToTextDisplay({"You can't use the gas station", "key here."})
        end
    end
end

return updateCheckGasStationKey