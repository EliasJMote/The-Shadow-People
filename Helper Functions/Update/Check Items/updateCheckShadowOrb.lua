local updateCheckShadowOrb = {}

local g = GLOBALS

function updateCheckShadowOrb.update()
    
    if(g.mouse.objectPointedAt ~= nil) then
        g.writeToTextDisplay({"You can't use the shadow orb", "here."})
    end
end

return updateCheckShadowOrb