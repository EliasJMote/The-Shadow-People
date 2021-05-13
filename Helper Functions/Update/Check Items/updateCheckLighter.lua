local updateCheckLighter = {}

local g = GLOBALS

function updateCheckLighter.update()
    if(g.curLocation == loadRooms.churchInside1) then
        if(g.mouse.objectPointedAt ~= nil) then
            if((g.mouse.objectPointedAt.name == "Candle" or g.mouse.objectPointedAt.name == "Candelabra") and g.mouse.objectPointedAt.state == "Unlit") then
                g.mouse.objectPointedAt.state = "Lit"
                local textArray = {"You light the " .. string.lower(g.mouse.objectPointedAt.name) .. "."}
                loadSFX.fire:play()
                if(g.curLocation.objects.candle1.state == "Lit"
                    and g.curLocation.objects.candle2.state == "Lit"
                    and g.curLocation.objects.wallCandelabra1.state == "Lit") then
                    
                    -- The inside door in the church appears after lighting the candles
                    g.curLocation.objects.churchInsideDoor={name="Door",x=13,y=30,w=10,h=37,img={closed=loadImages.churchDoorInsideClosed,open=loadImages.churchDoorInsideOpen},state="Closed",move="",text={close={"You close the door."},look={"It's a narrow door hidden in", "the wall."},open={"You open the door."},move="",}}
                    table.insert(textArray, "Lighting the candles has")
                    table.insert(textArray, "revealed a hidden door in the")
                    table.insert(textArray, "wall.")
                    
                    -- Update the map for the room
                    loadRooms.churchInside1.map = loadImages.twoWayVerticalMap
                    loadRooms.churchInside1.exits.north = "Mirror Room"
                    
                end
                g.writeToTextDisplay(textArray)
            else
                g.writeToTextDisplay({"You can't use the lighter here."})
            end
        end
        
    else
        if(g.mouse.objectPointedAt ~= nil) then
            g.writeToTextDisplay({"You can't use the lighter here."})
        end
    end
end

return updateCheckLighter