local updateCheckAction = {}

    local g = GLOBALS

    -- If the player clicks on something in the room, perform a click update
    function updateCheckAction.update()
        if(g.curLocation ~= nil) then

            -- If the cursor is pointing to an object
            if(g.mouse.objectPointedAt ~= nil) then

                -- Check if the player is selecting an action (and not selecting an item)
                if(g.actionSelected ~= nil and g.itemSelected == nil) then

                    -- If it's an illegal action
                    if(g.mouse.objectPointedAt.text[g.actionSelected:lower()] == nil) then
                        
                        updateCheckIllegalWordAction.update()
                        
                    -- If it's an legal action
                    else
                        
                        -- Check what the selected action will do (not counting items)
                        updateCheckWordAction.update()
                    end
                
                -- Check if the player is selecting an item
                elseif(g.itemSelected ~= nil) then
                
                    -- TODO: Write helper function for checking actions that involve using an item (likely break up into separate helper function)
                    updateCheckItem.update()
                    
                else
                    g.writeToTextDisplay({"You must select an action", "or item first!"})
                end
            end
        end
    end
    
return updateCheckAction