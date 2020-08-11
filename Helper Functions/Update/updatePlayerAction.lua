local updatePlayerAction = {}

function updatePlayerAction.update()
    local g = GLOBALS
    if(g.curLocation ~= nil) then
        if(g.mouse.actionText ~= nil) then
            if(g.selectedAction == g.mouse.actionText) then
                g.selectedAction = nil
            else
                g.selectedAction = g.mouse.actionText
            end
        end
    end
end

return updatePlayerAction