local updateCheckItem = {}

local g = GLOBALS

function updateCheckItem.update()
    
    -- The bolt cutters are used to cut the chain at the park
    if(g.itemSelected == "B. Cutters") then
        updateCheckBoltCutters.update()
        
    elseif(g.itemSelected == "Car Key") then
        updateCheckCarKey.update()
        
    elseif(g.itemSelected == "Cog") then
        g.writeToTextDisplay({"You can't use the cog here."})
        
    elseif(g.itemSelected == "E. Brooch") then
        g.writeToTextDisplay({"You can't use the eclipse brooch", "here."})
        
    elseif(g.itemSelected == "Gas Can") then
        g.writeToTextDisplay({"You can't use the gas can here."})
        
    -- The gas station key unlocks the front door of the gas station
    elseif(g.itemSelected == "G.S. Key") then
        updateCheckGasStationKey.update()
        
    -- The hacksaw is used to cut the sewer gate
    elseif(g.itemSelected == "Hacksaw") then
        updateCheckHacksaw.update()
        
    -- The mallet is used to smash the mirrors in the mirror room
    elseif(g.itemSelected == "Mallet") then
        updateCheckMallet.update()
        
    elseif(g.itemSelected == "Lighter") then
        updateCheckLighter.update()
        
    -- The mirror is used in the statue room light puzzle
    elseif(g.itemSelected == "Mirror") then
        updateCheckMirror.update()
    
    elseif(g.itemSelected == "Necklace") then
        g.writeToTextDisplay({"You can't use the necklace", "here."})
        
    elseif(g.itemSelected == "Shadow Orb") then
        g.writeToTextDisplay({"You can't use the shadow orb", "here."})
    end
end

return updateCheckItem