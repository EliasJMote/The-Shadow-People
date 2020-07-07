local updatePlayerAction = {}

function updatePlayerAction.update()
    local g = GLOBALS
    if(g.curLocation ~= nil) then
        if(g.cursorOverAction ~= nil) then
            g.selectedAction = g.actionPointedAt
        else
            g.selectedAction = nil
        end
    end
end

return updatePlayerAction