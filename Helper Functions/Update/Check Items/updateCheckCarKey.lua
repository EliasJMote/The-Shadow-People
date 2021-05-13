local updateCheckCarKey = {}

local g = GLOBALS

function updateCheckCarKey.update()
    if not((g.curLocation == loadRooms.car1 or g.curLocation == loadRooms.car2 or g.curLocation == loadRooms.car3)
        and g.mouse.objectPointedAt == g.curLocation.objects.steeringWheel) then
        g.writeToTextDisplay({"You can't use the car key", "here."})
    end
end

return updateCheckCarKey