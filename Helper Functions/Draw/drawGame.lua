local drawGame = {}

    local g = GLOBALS

    function drawGame.draw()
        
        -- draw the user interface
        drawUserInterface.draw()

        -- draw text
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)

        -- draw the item text
        love.graphics.print("Items", 118, 9, 0, 0.4, 0.4)
        
        -- Draw each page of items
        for i=1+4*(g.itemPage-1),4*g.itemPage do
            if(g.items[i] ~= nil) then
                local x = 105
                local y = 22 + 13 * ((i-1)%4)
                local textBox = {x=x,y=y,w=g.items[i].w,h=g.items[i].h,text=g.items[i].name}
                g.highlightText(textBox,0.4)
                
                if(debug) then
                    love.graphics.setColor(1, 0, 0, 1)
                    love.graphics.rectangle("line", x, y, g.items[i].w, g.items[i].h) -- draw red rectangles over clickable objects
                    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
                end
            else
                break
                --if(k == 4) then break end
            end
        end

        -- draw the game's text
        for k,v in ipairs(g.textBuffer) do
            love.graphics.print(v, 6, 93 + 13 * (k-1), 0, 0.4, 0.4)
            if(k == 4) then break end
        end

        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)

        -- Draw Background
        if(math.floor(love.timer.getTime()*100000000) % 4 <= 2 or not g.backgroundStatic) then
            if(g.curLocation.state == "Dark") then
                love.graphics.draw(g.curLocation.backgrounds.dark, 3, 3)
            else
                love.graphics.draw(g.curLocation.backgrounds.light, 3, 3)
            end
        end
        
        -- For Nightmare Geometry 1 (The Lost Room), very rarely flicker an image of a person far away
        if(g.curLocation == loadRooms.nightmareGeometry1) then
            local spawnNum = love.math.random(0,20)
            if(spawnNum == 0) then
                love.graphics.draw(loadImages.lostRoomPeople, 3, 3)
            end
        end
        
        -- If static is enabled (for certain rooms and conditions), draw it
        if(g.backgroundStatic) then
            love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
            for i=3,96 do
                for j=3,79 do
                    local staticNum = love.math.random(0,20)
                    if(staticNum <= 1) then
                        love.graphics.rectangle("fill",i,j,1,1)
                    end
                end
            end
            --end
        end
        
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        
        -- Draw the room objects
        for k,v in pairs(g.curLocation.objects) do
            if(debug) then
                love.graphics.setColor(1, 0, 0, 1)
                love.graphics.rectangle("line", v.x, v.y, v.w, v.h) -- draw red rectangles over clickable objects
            end
            
            if(v.img) then
                if(v.state == nil) then
                    if(v.rot == nil) then
                        love.graphics.draw(v.img, v.x, v.y)
                    else
                        love.graphics.draw(v.img, v.x+v.rot.ox, v.y+v.rot.oy, v.rot.r, 1, 1, v.rot.ox, v.rot.oy)
                    end
                else
                    love.graphics.draw(v.img[v.state:lower()], v.x, v.y)
                end
            end
        end
        
        -- Draw rectangles around the scroll item arrows (if debug is enabled)
        if(debug) then
            love.graphics.setColor(1, 0, 0, 1)
            love.graphics.rectangle("line",g.scrollItemPageLeft.x,g.scrollItemPageLeft.y,g.scrollItemPageLeft.w,g.scrollItemPageLeft.h)
            love.graphics.rectangle("line",g.scrollItemPageRight.x,g.scrollItemPageRight.y,g.scrollItemPageRight.w,g.scrollItemPageRight.h)
            love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
        end
        
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        
    end

return drawGame