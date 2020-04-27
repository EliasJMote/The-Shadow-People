local drawManager = {}

function drawManager.draw()

    local g = GLOBALS
  
    -- scale the window
    love.graphics.scale(g.scale.x,g.scale.y)
  
    -- draw the title screen and intro
    if(g.state == "title") then
    
        if(g.timer < 90) then
            love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
        elseif(g.timer < 100) then
            love.graphics.setColor(g.colors.dark_green.r, g.colors.dark_green.g, g.colors.dark_green.b, 1)
        elseif(g.timer < 115) then
            love.graphics.setColor(g.colors.light_green.r, g.colors.light_green.g, g.colors.light_green.b, 1)
        elseif(g.timer < 130) then
            love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
        elseif(g.timer < 145) then
            love.graphics.setColor(g.colors.light_green.r, g.colors.light_green.g, g.colors.light_green.b, 1)
        elseif(g.timer < 160) then
            love.graphics.setColor(g.colors.dark_green.r, g.colors.dark_green.g, g.colors.dark_green.b, 1)
        else
            love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
        end
        
        -- draw the background screen
        love.graphics.rectangle("fill", 0, 0, 160, 144)
        
        love.graphics.setColor(1, 1, 1, 1)
        if(g.timer < 130) then
          love.graphics.draw(loadImages.rocStudiosLogo)
        end
        
        if(g.timer >= 175) then
            love.graphics.draw(loadImages.titleScreen)
            love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
            if(love.mouse.getX() >= 52 * g.scale.x and love.mouse.getX() <= (52+59) * g.scale.x
                and love.mouse.getY() >= 96 * g.scale.y and love.mouse.getY() <= 102 * g.scale.y) then
                love.graphics.setColor(g.colors.light_green.r, g.colors.light_green.g, g.colors.light_green.b, 1)
            end
            love.graphics.print("Start Game", 52, 96, 0, 0.5, 0.5)
            love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
            love.graphics.print(gameVersion, 112, 130, 0, 0.5, 0.5)
        end
  
    -- draw the instructions screen
    elseif(g.state == "instructions") then
        -- draw the background screen
        love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
        love.graphics.rectangle("fill", 0, 0, 160, 144)
        love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
        love.graphics.print("Instructions", 48, 8, 0, 0.5, 0.5)
        if(love.mouse.getX() >= 52 * g.scale.x and love.mouse.getX() <= (52+59) * g.scale.x
            and love.mouse.getY() >= 128 * g.scale.y and love.mouse.getY() <= (128+6) * g.scale.y) then
            love.graphics.setColor(g.colors.light_green.r, g.colors.light_green.g, g.colors.light_green.b, 1)
        end
        love.graphics.print("Start Game", 52, 128, 0, 0.5, 0.5)
  
    elseif(g.state == "game") then

        -- draw the user interface
        love.graphics.draw(loadImages.userInterfaceText,0,0)

        -- draw text
        love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)

        -- draw the item title text
        love.graphics.print("Items", 118, 9, 0, 0.4, 0.4)

        -- draw the game's text
        for k,v in ipairs(g.curText) do
          love.graphics.print(v, 6, 93 + 13 * (k-1), 0, 0.4, 0.4)
        end

        love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)

        -- draw room
        love.graphics.draw(loadImages.bedroomDark, 3, 3)

        -- draw map screen
        --love.graphics.rectangle("line", 440, 20, 100, 150, 10)

        -- draw item text
        --love.graphics.print("[I]tems", 568, 30)
        
        love.graphics.setColor(1, 0, 0, 1)
        if(debug) then
            if(g.objectPointedAt ~= nil) then
                love.graphics.print("Object pointed at = " .. g.objectPointedAt, 0, 0, 0, 0.3, 0.3)
            else
                love.graphics.print("Object pointed at = nothing", 0, 0, 0, 0.3, 0.3)
            end
        end
        cursorOverObject = false
        local mouseX, mouseY = love.mouse.getPosition()
        g.objectPointedAt = nil
        for k,v in ipairs(g.curLocation.objects) do
            if(debug) then
                love.graphics.rectangle("line", v.x, v.y, v.w, v.h) -- draw red rectangles over clickable objects
            end
            if(g.doesCursorPointToObject(mouseX/g.scale.x, mouseY/g.scale.y, v)) then
                cursorOverObject = true
                g.objectPointedAt = v
            end
        end
        love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
      
    elseif(g.state == "ending") then
    end

    

    -- Draw the mouse cursor
    local mouseX, mouseY = love.mouse.getPosition()
    love.graphics.setColor(g.colors.lightest_green.r, g.colors.lightest_green.g, g.colors.lightest_green.b, 1)
    if(cursorOverObject) then
        love.graphics.draw(loadImages.cursorHand, mouseX / g.scale.x - 4, mouseY / g.scale.y)
    else
        love.graphics.draw(loadImages.cursor, mouseX / g.scale.x, mouseY / g.scale.y)
    end
    
    
end

return drawManager