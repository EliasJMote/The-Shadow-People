local drawGame = {}

    local g = GLOBALS

    function drawGame.draw()
        
        -- Draw the user interface
        drawUserInterface.draw()

        -- Draw text
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)

        -- Draw the item text UI
        love.graphics.print("Items", 118, 9, 0, 0.4, 0.4)
        
        -- Draw each page of inventory items
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
            end
        end
        
        --love.graphics.print(g.itemPage .. "/" .. math.floor((g.itemCount-1)/4)+1, 126-5, 72, 0, 0.4, 0.4)
        love.graphics.print(g.itemPage, 126, 72, 0, 0.4, 0.4)

        -- draw the game's text
        for k,v in ipairs(g.textBuffer) do
            love.graphics.print(v, 6, 93 + 13 * (k-1), 0, 0.4, 0.4)
            if(k == 4) then break end
        end

        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)

        -- Draw Background
        love.graphics.draw(g.curLocation.backgrounds[string.lower(g.curLocation.state)], 3, 3)
        
        -- For Nightmare Geometry 1 (The Lost Room), very rarely flicker an image of people
        if(g.curLocation == loadRooms.nightmareGeometry1) then
            local spawnNum = love.math.random(0,20)
            if(spawnNum == 0) then
                love.graphics.draw(loadImages.lostRoomPeople, 3, 3)
            end
        end
        
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        
        -- Draw the room's objects
        for k,v in pairs(g.curLocation.objects) do
            if(debug) then
                love.graphics.setColor(1, 0, 0, 1)
                love.graphics.rectangle("line", v.x, v.y, v.w, v.h) -- draw red rectangles over clickable objects
            end
            
            -- If the particular object has an associated image
            if(v.img) then
                
                -- If the image has no current state
                if(v.state == nil) then
                    
                    -- Check if the image has any rotation
                    if(v.rot == nil) then
                        love.graphics.draw(v.img, v.x, v.y)
                    else
                        love.graphics.draw(v.img, v.x+v.rot.ox, v.y+v.rot.oy, v.rot.r, 1, 1, v.rot.ox, v.rot.oy)
                    end
                    
                -- If the image has a current state
                else
                    local image = v.img[v.state:lower()]
                    if(type(image) == "table" and #image > 1) then
                        love.graphics.draw(image[math.floor(g.timers.global/30)%(#image)+1], v.x, v.y)
                    else
                        love.graphics.draw(image, v.x, v.y)
                    end
                end
            end
        end
        
        -- If static is enabled (for certain rooms and conditions), draw it over the background
        if(g.backgroundStatic) then
            love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
            if(g.curLocation == loadRooms.gasStationBathroom) then
                if(love.math.random(0,15) == 0) then
                    love.graphics.rectangle("fill",3,3,94,77)
                end

            else
                for i=3,96 do
                    for j=3,79 do
                        local staticNum = love.math.random(0,20)
                        if(staticNum <= 1) then
                            love.graphics.rectangle("fill",i,j,1,1)
                        end
                    end
                end
                
                if(love.math.random(0,15) == 0) then
                    love.graphics.rectangle("fill",3,3,94,77)
                end
            end
        end
        
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        
        -- Draw rectangles around the scroll item arrows (if debug is enabled)
        if(debug) then
            love.graphics.setColor(1, 0, 0, 1)
            love.graphics.rectangle("line",g.scrollItemPageLeft.x,g.scrollItemPageLeft.y,g.scrollItemPageLeft.w,g.scrollItemPageLeft.h)
            love.graphics.rectangle("line",g.scrollItemPageRight.x,g.scrollItemPageRight.y,g.scrollItemPageRight.w,g.scrollItemPageRight.h)
            love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
        end
        
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        
        -- Draw Gas Station Mirror Shadow Person
        if(g.timers.gasStationBathroomMirrorShadow > 0 and g.timers.gasStationBathroomMirrorShadow < 60) then
            love.graphics.draw(loadImages.bathroomShadowPerson,0,0)
        end
        
    end

return drawGame