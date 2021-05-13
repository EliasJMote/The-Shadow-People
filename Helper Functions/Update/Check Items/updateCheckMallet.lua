local updateCheckMallet = {}

local g = GLOBALS

function updateCheckMallet.update()
    
    -- Smashing the mirrors in the mirror room with the mallet
    if(g.curLocation == loadRooms.mirrorRoom) then
        if(g.curLocation.objects.mirror1.state == "Unbroken" and g.mouse.objectPointedAt == g.curLocation.objects.mirror1) then
            g.smashNormalMirror(g.curLocation.objects.mirror1)
            
        elseif(g.curLocation.objects.mirror2.state == "Unbroken" and g.mouse.objectPointedAt == g.curLocation.objects.mirror2) then
            g.curLocation.objects.mirror2.state = "Closed"
            g.writeToTextDisplay({"You smash the mirror to pieces,", "revealing a hidden door behind", "it."})
            g.updateHiddenDoorInMirror()
            loadSFX.glassShattering:play()
            
        elseif(g.curLocation.objects.mirror3.state == "Unbroken" and g.mouse.objectPointedAt == g.curLocation.objects.mirror3) then
            g.smashNormalMirror(g.curLocation.objects.mirror3)
            
        else
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
        
    -- The mallet is also used to smash the mirrors in the dream mirror room
    elseif(g.curLocation == loadRooms.dreamMirrorRoom) then
        if(g.curLocation.objects.mirror1.state == "Unbroken" and g.mouse.objectPointedAt == g.curLocation.objects.mirror1) then
            g.smashNormalMirror(g.curLocation.objects.mirror1)
            
        elseif(g.curLocation.objects.mirror2.state == "Unbroken" and g.mouse.objectPointedAt == g.curLocation.objects.mirror2) then
            g.smashNormalMirror(g.curLocation.objects.mirror2)
            
        elseif(g.curLocation.objects.mirror3.state == "Unbroken" and g.mouse.objectPointedAt == g.curLocation.objects.mirror3) then
            g.curLocation.objects.mirror3.state = "Broken"
            g.writeToTextDisplay({"You smash the mirror to pieces.", "A strange sight lies before", "you. It looks to be a portal to", "deep space. There is a planet", "covered in darkness, barely lit", "by a total eclipse of a nearby", "star."})
            
            -- Update the space portal, as well as the map
            g.updateSpacePortalInMirror()
            
            loadSFX.glassShattering:play()
        else
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
    else
        if(g.mouse.objectPointedAt ~= nil) then
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
    end
end

return updateCheckMallet