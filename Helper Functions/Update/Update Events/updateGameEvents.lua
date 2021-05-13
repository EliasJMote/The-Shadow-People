local updateGameEvents = {}

local g = GLOBALS

function updateGameEvents.update(event)
    g.movementDirection = nil

    -- First, advance the text box until no text is left in the buffer
    if(g.showMessageBox) then
        if not(g.screenTransition.active) then
            -- If there are more than 4 lines of text currently in the buffer
            if(#g.textBuffer > 4) then
                -- Clear those 4 lines from the buffer
                for i=1,4 do
                    table.remove(g.textBuffer,1)
                end
            else
                -- The message box goes away once the text is done
                g.showMessageBox = false
                g.textBuffer = {}
            end
        end
    else
        
        -- If we have clicked on the map in a legal direction, set the direction to move
        if(g.mouse.mapHover ~= nil) then
            g.movementDirection = g.mouse.mapHover
        end
            
        -- Select/deselect an item to use
        if(g.mouse.itemMenuHoverItem) then
            if(g.itemSelected == nil or g.itemSelected ~= g.mouse.itemMenuHoverItem) then
                if(g.actionSelected ~= "Look") then
                    g.itemSelected = g.mouse.itemMenuHoverItem
                end
                if(g.actionSelected ~= "Put" and g.actionSelected ~= "Look") then
                    g.actionSelected = nil
                end
                if(g.actionSelected == "Look") then
                    for k,v in pairs(loadObjects) do
                        if(v.item ~= nil) then
                            local itemName = ""
                            if(g.mouse.itemMenuHoverItem == "G.S. Key") then
                                itemName = "Gas Station Key"
                            elseif(g.mouse.itemMenuHoverItem == "B. Cutters") then
                                itemName = "Bolt Cutters"
                            elseif(g.mouse.itemMenuHoverItem == "E. Brooch") then
                                itemName = "Eclipse Brooch"
                            else
                                itemName = g.mouse.itemMenuHoverItem
                            end
                            if(v.name == itemName) then
                                g.writeToTextDisplay(v.item.description)
                                break
                            end
                        end
                    end
                    --g.writeToTextDisplay(loadObjects[g.mouse.itemMenuHoverItem].item.description)
                end
            elseif(g.itemSelected == g.mouse.itemMenuHoverItem) then
                g.itemSelected = nil
            end
        end
        
        -- Flip to the item page on the left
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.scrollItemPageLeft)) then
            if(g.itemPage > 1) then
                g.itemPage = g.itemPage - 1
            end
            
        -- Flip to the item page on the right
        elseif(g.mouseCollision(g.mouse.x,g.mouse.y,g.scrollItemPageRight)) then
            if(g.itemPage < math.ceil(g.itemCount/4)) then
                g.itemPage = g.itemPage + 1
            end
        end
        
        -- If the message box is closed, the player can check the room
        updateCheckAction.update()
        
        -- Check if the player is selecting an action
        updatePlayerAction.update()
        
        -- If the player clicks the mouse on the map, check if we should go to a new room
        updateRoom.update()
    end
end

return updateGameEvents