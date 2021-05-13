local updateCheckGasStationKey = {}

local g = GLOBALS

function updateCheckGasStationKey.update()
    if(g.curLocation == loadRooms.gasStationOutside) then
        if(g.curLocation.objects.door.state == "Locked" and g.mouse.objectPointedAt == g.curLocation.objects.door) then
            g.curLocation.objects.door.state = "Closed"
            g.writeToTextDisplay({"You unlock the door with the", "key."})
            g.curLocation.objects.door.text.look={"It's a double glass door. It's", "dark on the inside."}
            g.curLocation.objects.door.text.open={"You open the door."}
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