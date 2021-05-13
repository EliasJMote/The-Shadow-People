local updateCheckBoltCutters = {}

local g = GLOBALS

function updateCheckBoltCutters.update()
    if(g.curLocation == loadRooms.park1) then
        if(g.curLocation.objects.parkGate.state == "Locked" and g.mouse.objectPointedAt == g.curLocation.objects.parkGate) then
            g.curLocation.objects.parkGate.state = "Closed"
            g.writeToTextDisplay({"You cut the chain with the bolt", "cutters."})
            g.curLocation.objects.parkGate.text.look={"It's a gate to a park."}
            loadSFX.pickup:play()
        else
            g.writeToTextDisplay({"You can't use the bolt cutters", "here."})
        end
    else
        if(g.mouse.objectPointedAt ~= nil) then
            g.writeToTextDisplay({"You can't use the bolt cutters", "here."})
        end
    end
end

return updateCheckBoltCutters