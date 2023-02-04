local updateCheckMallet = {}

local g = GLOBALS

function updateCheckMallet.update()
    
    -- Trying to smash the gas station windows
    if(g.curLocation == loadRooms.gasStationOutside) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.window1 or g.mouse.objectPointedAt == g.curLocation.objects.window4) then
            g.writeToTextDisplay({"You attempt to smash the", "window, but the glass is", "laminated and refuses to break", "from the rubber mallet head."})
        elseif(g.mouse.objectPointedAt == g.curLocation.objects.door) then
            g.writeToTextDisplay({"You attempt to smash the", "door, but the glass is", "laminated and refuses to break", "from the rubber mallet head."})
        else
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
    
    -- Trying to smash the gas station bathroom mirror
    elseif(g.curLocation == loadRooms.gasStationBathroom) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.mirror) then
            g.writeToTextDisplay({"Nah. It's damaged enough as is."})
        else
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
    
    -- Smashing the mirror in the church basement
    elseif(g.curLocation == loadRooms.churchBasement) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.mirror and g.curLocation.objects.mirror.state == "Unbroken") then
            g.curLocation.objects.mirror.state = "Broken"
            g.curLocation.objects.mirror.text.look = {"The mirror is destroyed."}
            g.writeToTextDisplay({"You smash it to pieces!"})
            g.curLocation.objects.inscription.text.look = {"With the mirror shattered, you","can no longer see your true","self."}
            loadSFX.glassShattering:play()
        elseif(g.curLocation.objects.shadow ~= nil and g.mouse.objectPointedAt == g.curLocation.objects.shadow) then
            g.writeToTextDisplay({"The mallet bounces off","uselessly."})
        else
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
    
    -- Smashing the window in the shed
    elseif(g.curLocation == loadRooms.shed) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.window and g.curLocation.objects.window.state == "Unbroken") then
            g.curLocation.objects.window.state = "Broken"
            g.curLocation.objects.window.text.look = {"The window is destroyed."}
            g.writeToTextDisplay({"You smash it to pieces!"})
            loadSFX.glassShattering:play()
        else
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
    
    -- Trying to smash the crystal balls under the graveyard
    elseif(g.curLocation == loadRooms.graveyardUnderground1) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.statueEmittingLight or g.mouse.objectPointedAt == g.curLocation.objects.statueHoldingDarkCrystalBall) then
            g.writeToTextDisplay({"The crystal ball is impervious","to your assault."})
        else
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
    
    elseif(g.curLocation == loadRooms.nightmareGeometry2) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.beast) then
            g.writeToTextDisplay({"It would likely kill you","before you get close."})
        else
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
    
    -- Trying to smash the crystal ball in the Shadow Lands
    elseif(g.curLocation == loadRooms.shadowLands9) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.statueWithDarkCrystalBall) then
            g.writeToTextDisplay({"The crystal ball is impervious","to your assault."})
        else
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
    
    -- Trying to smash the park gate
    elseif(g.curLocation == loadRooms.park1) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.parkGate) then
            g.writeToTextDisplay({"With a rubber-headed mallet?", "Not a chance."})
        else
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
    
    -- Trying to smash the sewer gate
    elseif(g.curLocation == loadRooms.street5) then
        if(g.curLocation.objects.sewerGate.state == "Rusted" and g.mouse.objectPointedAt == g.curLocation.objects.sewerGate) then
            g.writeToTextDisplay({"With a rubber-headed mallet?", "Not a chance."})
        else
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
    
    -- Trying to smash the pillars in the red prince's room
    elseif(g.curLocation == loadRooms.altarRoom) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.poleSymbol1 or g.mouse.objectPointedAt == g.curLocation.objects.poleSymbol2
            or g.mouse.objectPointedAt == g.curLocation.objects.poleSymbol3 or g.mouse.objectPointedAt == g.curLocation.objects.poleSymbol4) then
            g.writeToTextDisplay({"You strike the pole with your", "mallet. It bounces off, and you", "feel strong reverberations","throughout your body."})
        elseif(g.mouse.objectPointedAt == g.curLocation.objects.symbolOfThePrince or g.mouse.objectPointedAt == g.curLocation.objects.altar) then
            g.writeToTextDisplay({"You raise the mallet, and suddenly","hear a voice in your head. The","voice is strong, babbling","incoherently. You can't make the","words out, but somehow know they","are deadly serious. Then your arm","is lowered involuntarily by an","unknown force."})
        else
            g.writeToTextDisplay({"You can't use the mallet here."})
        end
    
    -- Smashing the mirrors in the mirror room with the mallet
    elseif(g.curLocation == loadRooms.mirrorRoom) then
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