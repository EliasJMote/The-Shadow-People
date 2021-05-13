local updateCheckIllegalWordAction = {}

local g = GLOBALS

function updateCheckIllegalWordAction.update()
    
    if(g.actionSelected == "Close") then
        g.writeToTextDisplay({"You can't close that!"})
    elseif(g.actionSelected == "Look") then
        g.writeToTextDisplay({"You can't look at that!"})
    elseif(g.actionSelected == "Move") then
        g.writeToTextDisplay({"You can't move there!"})
    elseif(g.actionSelected == "Open") then
        g.writeToTextDisplay({"You can't open that!"})
    elseif(g.actionSelected == "Pull") then
        g.writeToTextDisplay({"You can't pull that!"})
    elseif(g.actionSelected == "Push") then
        g.writeToTextDisplay({"You can't push that!"})
    elseif(g.actionSelected == "Put") then
        if(g.itemSelected == nil) then
            g.writeToTextDisplay({"Select an item to place first."})
        else
            g.writeToTextDisplay({"You can't put that there!"})
        end
    elseif(g.actionSelected == "Take") then
        g.writeToTextDisplay({"You can't take that!"})
    elseif(g.actionSelected == "Talk") then
        g.writeToTextDisplay({"You can't talk to that!"})
    elseif(g.actionSelected == "Use") then
        g.writeToTextDisplay({"You can't use that!"})
    else
        g.writeToTextDisplay({"You can't do that!"})
    end
end

return updateCheckIllegalWordAction