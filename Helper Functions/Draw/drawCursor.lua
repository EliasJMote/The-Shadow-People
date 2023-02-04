local drawCursor = {}

function drawCursor.draw()
    
    local g = GLOBALS
    
    love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
    
    if((g.screenTransition.active ~= true or debug) and g.state ~= "good ending" and g.state ~= "bad ending" and g.state ~= "alien ending" and g.state ~= "easter egg ending" and g.state ~= "red prince ending" and g.state ~= "shadow child" and g.state ~= "video bad ending" and g.state ~= "video intro" and g.state ~= "screen transition"
        and g.state ~= "who are you running from?") then
        if(g.mouse.actionHover or g.mouse.textHover or (g.mouse.itemMenuHover and g.actionSelected ~= "Look") or g.mouse.scrollPageArrowHover or g.mouse.pauseMenuHover) then
            love.graphics.draw(loadImages.cursorHand, g.mouse.x - 4, g.mouse.y)
        elseif(g.mouse.mapHover and g.showMessageBox ~= true) then
            love.graphics.draw(loadImages.cursorMove, g.mouse.x - 4, g.mouse.y - 4)
        elseif(g.mouse.itemMenuHoverItem and g.actionSelected == "Look") then
            love.graphics.draw(loadImages.cursorEye, g.mouse.x - 4, g.mouse.y - 3)
            
        -- If the mouse is hovering over an object, show what action is currently selected
        elseif(g.mouse.objectHover) then
            if(g.actionSelected == "Close") then
                love.graphics.draw(loadImages.cursorClose, g.mouse.x - 3, g.mouse.y - 3)
            elseif(g.actionSelected == "Look") then
                love.graphics.draw(loadImages.cursorEye, g.mouse.x - 4, g.mouse.y - 3)
            elseif(g.actionSelected == "Move") then
                love.graphics.draw(loadImages.cursorMove, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.actionSelected == "Open") then
                love.graphics.draw(loadImages.cursorOpen, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.actionSelected == "Pull") then
                love.graphics.draw(loadImages.cursorPull, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.actionSelected == "Push") then
                love.graphics.draw(loadImages.cursorPush, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.actionSelected == "Put") then
                
                -- If an item is selected and no action is selected, show the current object
                if(g.itemSelected == "B. Cutters") then
                    love.graphics.draw(loadImages.boltCutters, g.mouse.x+8, g.mouse.y+8)
                    
                elseif(g.itemSelected == "Car Key") then
                    love.graphics.draw(loadImages.carKey, g.mouse.x+8, g.mouse.y+8)
                    
                elseif(g.itemSelected == "Cog") then
                    love.graphics.draw(loadImages.cog, g.mouse.x+8, g.mouse.y+8)
                    
                elseif(g.itemSelected == "E. Brooch") then
                    love.graphics.draw(loadImages.eclipseBrooch, g.mouse.x+8, g.mouse.y+8)
                    
                elseif(g.itemSelected == "Gas Can") then
                    love.graphics.draw(loadImages.gasCanister, g.mouse.x+8, g.mouse.y+8)

                elseif(g.itemSelected == "G.S. Key") then
                    love.graphics.draw(loadImages.carKey, g.mouse.x+8, g.mouse.y+8)

                elseif(g.itemSelected == "Hacksaw") then
                    love.graphics.draw(loadImages.hacksaw, g.mouse.x+8, g.mouse.y+8)

                elseif(g.itemSelected == "Mallet") then
                    love.graphics.draw(loadImages.hammer, g.mouse.x+8, g.mouse.y+8)
                    
                elseif(g.itemSelected == "Lighter") then
                    love.graphics.draw(loadImages.lighter, g.mouse.x+8, g.mouse.y+8)

                elseif(g.itemSelected == "Mirror") then
                    love.graphics.draw(loadImages.mirror, g.mouse.x+8, g.mouse.y+5)
                
                elseif(g.itemSelected == "Necklace") then
                    love.graphics.draw(loadImages.necklace, g.mouse.x+8, g.mouse.y+8)
                    
                elseif(g.itemSelected == "Shadow Orb") then
                    love.graphics.draw(loadImages.shadowOrb, g.mouse.x+8, g.mouse.y+8)
                
                end
                
                love.graphics.draw(loadImages.cursorPut, g.mouse.x - 6, g.mouse.y - 7)
                
            elseif(g.actionSelected == "Talk") then
                love.graphics.draw(loadImages.cursorTalk, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.actionSelected == "Take") then
                love.graphics.draw(loadImages.cursorTake, g.mouse.x - 4, g.mouse.y - 4)
            elseif(g.actionSelected == "Use" and g.itemSelected == nil) then
                love.graphics.draw(loadImages.cursorUse, g.mouse.x - 6, g.mouse.y - 6)
            else
                
                -- If an item is selected and no action is selected, show the current object
                if(g.itemSelected == "B. Cutters") then
                    love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
                    love.graphics.draw(loadImages.boltCutters, g.mouse.x+8, g.mouse.y+8)
                    
                elseif(g.itemSelected == "Car Key") then
                    love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
                    love.graphics.draw(loadImages.carKey, g.mouse.x+8, g.mouse.y+8)
                    
                elseif(g.itemSelected == "Cog") then
                    love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
                    love.graphics.draw(loadImages.cog, g.mouse.x+8, g.mouse.y+8)
                    
                elseif(g.itemSelected == "E. Brooch") then
                    love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
                    love.graphics.draw(loadImages.eclipseBrooch, g.mouse.x+8, g.mouse.y+8)
                    
                elseif(g.itemSelected == "Gas Can") then
                    love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
                    love.graphics.draw(loadImages.gasCanister, g.mouse.x+8, g.mouse.y+8)

                elseif(g.itemSelected == "G.S. Key") then
                    love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
                    love.graphics.draw(loadImages.carKey, g.mouse.x+8, g.mouse.y+8)

                elseif(g.itemSelected == "Hacksaw") then
                    love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
                    love.graphics.draw(loadImages.hacksaw, g.mouse.x+8, g.mouse.y+8)

                elseif(g.itemSelected == "Mallet") then
                    love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
                    love.graphics.draw(loadImages.hammer, g.mouse.x+8, g.mouse.y+8)
                    
                elseif(g.itemSelected == "Lighter") then
                    love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
                    love.graphics.draw(loadImages.lighter, g.mouse.x+8, g.mouse.y+8)

                elseif(g.itemSelected == "Mirror") then
                    love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
                    love.graphics.draw(loadImages.mirror, g.mouse.x+8, g.mouse.y+8)
                
                elseif(g.itemSelected == "Necklace") then
                    love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
                    love.graphics.draw(loadImages.necklace, g.mouse.x+8, g.mouse.y+8)
                    
                elseif(g.itemSelected == "Shadow Orb") then
                    love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
                    love.graphics.draw(loadImages.shadowOrb, g.mouse.x+8, g.mouse.y+8)
                
                -- If no item is selected, show default cursor
                else
                    love.graphics.draw(loadImages.cursorHand, g.mouse.x - 4, g.mouse.y)
                end
            end
        else
            love.graphics.draw(loadImages.cursor, g.mouse.x, g.mouse.y)
        end
    end
    
end

return drawCursor