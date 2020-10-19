local updatePlayerAction = {}

function updatePlayerAction.update()
    local g = GLOBALS
    if(g.curLocation ~= nil) then
        if(g.mouse.actionText ~= nil) then
            if(g.actionSelected == g.mouse.actionText) then
                g.actionSelected = nil
            else
                g.actionSelected = g.mouse.actionText
                g.itemSelected = nil
            end
        end
    end
end

return updatePlayerAction