local drawGame = {}

    local g = GLOBALS

    function drawGame.draw()
        
        -- draw the user interface
        drawUserInterface.draw()

        -- draw text
        love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)

        -- draw the item text
        love.graphics.print("Items", 118, 9, 0, 0.4, 0.4)
        for k,v in ipairs(g.items) do
            love.graphics.print(v, 105, 22 + 13 * (k-1), 0, 0.4, 0.4)
            if(k == 4) then break end
        end

        -- draw the game's text
        for k,v in ipairs(g.textBuffer) do
            love.graphics.print(v, 6, 93 + 13 * (k-1), 0, 0.4, 0.4)
            if(k == 4) then break end
        end

        love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)

        -- draw background
        if(g.curLocation.state == "Dark") then
            love.graphics.draw(g.curLocation.backgrounds.dark, 3, 3)
        else
            love.graphics.draw(g.curLocation.backgrounds.light, 3, 3)
        end
        
        love.graphics.setColor(1, 0, 0, 1)
        if(debug) then
            if(g.objectPointedAt ~= nil) then
                love.graphics.print("Object pointed at = " .. g.objectPointedAt.name, 0, 0, 0, 0.3, 0.3)
            else
                love.graphics.print("Object pointed at = nothing", 0, 0, 0, 0.3, 0.3)
            end
        end
        
        g.cursorOverObject = false
        g.objectPointedAt = nil
        
        for k,v in ipairs(g.curLocation.objects) do
            if(debug) then
                love.graphics.rectangle("line", v.x, v.y, v.w, v.h) -- draw red rectangles over clickable objects
            end
            love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
            if(v.img) then
                love.graphics.draw(v.img, v.x, v.y)
            end
            
            if(g.doesCursorPointToObject(g.mouse.x, g.mouse.y, v)) then
                g.cursorOverObject = true
                g.objectPointedAt = v
            end
        end
        
        g.cursorOverMap = nil

        -- If the cursor is hovering over the map
        if(g.mouse.x >= 7 and g.mouse.x <= 42 and g.mouse.y >= 101 and g.mouse.y <= 137) then
            for k,v in pairs(g.curLocation.exits) do
                if(k=="north") then
                    if(g.mouse.x >= 20 and g.mouse.x <= 20+11 and g.mouse.y >= 101 and g.mouse.y <= 101+9) then
                        g.cursorOverMap = "North"
                    end
                elseif(k=="south") then
                    if(g.mouse.x >= 20 and g.mouse.x <= 20+11 and g.mouse.y >= 128 and g.mouse.y <= 128+9) then
                        g.cursorOverMap = "South"
                    end
                elseif(k=="west") then
                    if(g.mouse.x >= 7 and g.mouse.x <= 7+11 and g.mouse.y >= 114 and g.mouse.y <= 114+9) then
                        g.cursorOverMap = "West"
                    end
                elseif(k=="east") then
                    if(g.mouse.x >= 31 and g.mouse.x <= 31+11 and g.mouse.y >= 114 and g.mouse.y <= 114+9) then
                        g.cursorOverMap = "East"
                    end
                end
            end
        end

        love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
        
    end

return drawGame