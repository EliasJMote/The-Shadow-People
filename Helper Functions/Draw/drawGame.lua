local drawGame = {}

    local g = GLOBALS

    function drawGame.draw()
        
        -- draw the user interface
        drawUserInterface.draw()

        -- draw text
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)

        -- draw the item text
        love.graphics.print("Items", 118, 9, 0, 0.4, 0.4)
        for k,v in ipairs(g.items) do
            local x = 105
            local y = 22 + 13 * (k-1)
            local textBox = {x=105,y=22 + 13 * (k-1),w=v.w,h=v.h,text=v.name}
            g.highlightText(textBox,0.4)
            --love.graphics.print(v.name, x, y, 0, 0.4, 0.4)
            if(debug) then
                love.graphics.setColor(1, 0, 0, 1)
                love.graphics.rectangle("line", x, y, v.w, v.h) -- draw red rectangles over clickable objects
                love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
            end
            if(k == 4) then break end
        end
        
        

        -- draw the game's text
        for k,v in ipairs(g.textBuffer) do
            love.graphics.print(v, 6, 93 + 13 * (k-1), 0, 0.4, 0.4)
            if(k == 4) then break end
        end

        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)

        -- draw background
        if(g.curLocation.state == "Dark") then
            love.graphics.draw(g.curLocation.backgrounds.dark, 3, 3)
        else
            love.graphics.draw(g.curLocation.backgrounds.light, 3, 3)
        end
        
        -- Draw the debug menu
        --[[if(debug) then
            love.graphics.setColor(1, 0, 0, 1)
            if(g.objectPointedAt ~= nil) then
                love.graphics.print("Object pointed at = " .. g.objectPointedAt.name, 0, 0, 0, 0.3, 0.3)
            else
                love.graphics.print("Object pointed at = nothing", 0, 0, 0, 0.3, 0.3)
            end
        end]]
        
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        
        -- Draw the room objects
        for k,v in ipairs(g.curLocation.objects) do
            if(debug) then
                love.graphics.setColor(1, 0, 0, 1)
                love.graphics.rectangle("line", v.x, v.y, v.w, v.h) -- draw red rectangles over clickable objects
            end
            
            if(v.img) then
                if(v.state == nil) then
                    love.graphics.draw(v.img, v.x, v.y)
                else
                    love.graphics.draw(v.img[v.state:lower()], v.x, v.y)
                end
            end
        end
        
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        
    end

return drawGame