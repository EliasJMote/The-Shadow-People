local updatePlayerAction = {}

function updatePlayerAction.update()
    local g = GLOBALS
    
    -- If we are in a room
    if(g.curLocation ~= nil) then
        if(g.mouse.actionText ~= nil) then
            
            -- If we are selecting an action that is currently selected
            if(g.actionSelected == g.mouse.actionText) then
                
                -- Deselect that action
                g.actionSelected = nil
                
                -- If an item is selected, deselect it
                g.itemSelected = nil
                
            -- If we are not selecting an action
            else
                g.actionSelected = g.mouse.actionText
                
                -- If we are not selecting "put" or "use", then deselect the item
                if(g.actionSelected ~= "Put" and g.actionSelected ~= "Use") then
                    g.itemSelected = nil
                end
            end
        end
    end
end

return updatePlayerAction