local updateCheckHacksaw = {}

local g = GLOBALS

function updateCheckHacksaw.update()
    
    -- Street 5 has the sewer entrance
    if(g.curLocation == loadRooms.street5) then
        
        -- Check if the player is attempting to use the hacksaw on the ruster sewer gate (before it's opened)
        if(g.curLocation.objects.sewerGate.state == "Rusted" and g.mouse.objectPointedAt == g.curLocation.objects.sewerGate) then
            -- The sewer gate is broken once it has been cut open
            g.curLocation.objects.sewerGate.state = "Broken"
            
            -- Tell the player the bars are cut
            g.writeToTextDisplay({"You cut the bars with the", "hacksaw."})
            
            -- Update the text for the sewer gate
            g.updateSewerGateText()
            loadSFX.pickup:play()
        else
            g.writeToTextDisplay({"You can't use the hacksaw here."})
        end
        
    -- The hacksaw doesn't do anything else
    else
        if(g.mouse.objectPointedAt ~= nil) then
            g.writeToTextDisplay({"You can't use the hacksaw here."})
        end
    end
end

return updateCheckHacksaw