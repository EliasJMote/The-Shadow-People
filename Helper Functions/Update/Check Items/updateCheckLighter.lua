local updateCheckLighter = {}

local g = GLOBALS

function updateCheckLighter.update()
    
    -- Inside the first room of the church
    if(g.curLocation == loadRooms.churchInside1) then
        
        -- If the mouse is pointed at something
        if(g.mouse.objectPointedAt ~= nil) then
            
            -- If the mouse is pointed at an unlit candle or candelabra, light it
            if((g.mouse.objectPointedAt.name == "Candle" or g.mouse.objectPointedAt.name == "Candelabra") and g.mouse.objectPointedAt.state == "Unlit") then
                g.mouse.objectPointedAt.state = "Lit"
                g.mouse.objectPointedAt.text.use={"You extinguish the light."}
                local textArray = {"You light the " .. string.lower(g.mouse.objectPointedAt.name) .. "."}
                loadSFX.fire:play()
                
                -- Check if the two candles and wall candelabra are lit
                if(g.curLocation.objects.candle1.state == "Lit"
                    and g.curLocation.objects.candle2.state == "Lit"
                    and g.curLocation.objects.wallCandelabra1.state == "Lit") then
                    
                    -- The inside door in the church appears after lighting the candles
                    if(g.curLocation.objects.churchInsideDoor == nil) then
                        g.curLocation.objects.churchInsideDoor={name="Door",x=13,y=30,w=10,h=37,img={closed=loadImages.churchDoorInsideClosed,open=loadImages.churchDoorInsideOpen},state="Closed",move="North",text={close={"You close the door."},look={"It's a narrow door hidden in", "the wall."},open={"You open the door."},pull={"You open the door."},move="",}}
                        table.insert(textArray, "Lighting the candles has")
                        table.insert(textArray, "revealed a hidden door in the")
                        table.insert(textArray, "wall.")
                        
                        -- Update the map for the room
                        loadRooms.churchInside1.map = loadImages.threeWayLeftMap
                        loadRooms.churchInside1.exits.north = "Mirror Room"
                    end
                end
                g.writeToTextDisplay(textArray)
            else
                g.writeToTextDisplay({"You can't use the lighter here."})
            end
        end
        
    elseif(g.curLocation == loadRooms.churchBasement) then
        -- If the mouse is pointed at something
        if(g.mouse.objectPointedAt ~= nil) then
            
            -- If the mouse is pointed at an unlit candelabra, light it
            if(g.mouse.objectPointedAt.name == "Candelabra" and g.mouse.objectPointedAt.state == "Unlit") then
                if(g.curLocation.objects.shadow == nil) then
                    g.mouse.objectPointedAt.state = "Lit"
                    loadSFX.fire:play()
                    g.writeToTextDisplay({"You light the " .. string.lower(g.mouse.objectPointedAt.name) .. "."})
                else
                    g.writeToTextDisplay({"It's too late for that."})
                end
            elseif(g.curLocation.objects.shadow ~= nil and g.mouse.objectPointedAt == g.curLocation.objects.shadow) then
                g.writeToTextDisplay({"It won't light..."})
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