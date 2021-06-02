local drawLoadScreen = {}

function drawLoadScreen.draw()
    
    local g = GLOBALS
    
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    love.graphics.print("Load Game", 60, 8, 0, 0.4, 0.4)
    
    love.graphics.rectangle("line",2,2,160-4,144-4)
    
    if(love.filesystem.getInfo("Save_File_1.lua")) then
        local dT = g.deepCopy(g.loadGameDateTime1)
        if(tonumber(dT.hour) < 10) then dT.hour = "0" .. dT.hour end
        if(tonumber(dT.min) < 10) then dT.min = "0" .. dT.min end
        if(tonumber(dT.sec) < 10) then dT.sec = "0" .. dT.sec end
        local dTFormat = dT.month .. "/" .. dT.day .. "/" .. dT.year .. " " .. dT.hour .. ":" .. dT.min .. ":" .. dT.sec
        g.highlightText(g.textBoxes.loadGameScreen.loadGame1,0.4)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        love.graphics.print(dTFormat,g.textBoxes.loadGameScreen.loadGame1.x+58,g.textBoxes.loadGameScreen.loadGame1.y,0,0.4,0.4)
    else
        love.graphics.print("Load File 1 (Empty)",g.textBoxes.loadGameScreen.loadGame1.x,g.textBoxes.loadGameScreen.loadGame1.y,0,0.4,0.4)
    end
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    love.graphics.rectangle("line",g.textBoxes.loadGameScreen.loadGame1.x-2,g.textBoxes.loadGameScreen.loadGame1.y-2,56,8)
    
    if(love.filesystem.getInfo("Save_File_2.lua")) then
        local dT = g.deepCopy(g.loadGameDateTime2)
        if(tonumber(dT.hour) < 10) then dT.hour = "0" .. dT.hour end
        if(tonumber(dT.min) < 10) then dT.min = "0" .. dT.min end
        if(tonumber(dT.sec) < 10) then dT.sec = "0" .. dT.sec end
        local dTFormat = dT.month .. "/" .. dT.day .. "/" .. dT.year .. " " .. dT.hour .. ":" .. dT.min .. ":" .. dT.sec
        g.highlightText(g.textBoxes.loadGameScreen.loadGame2,0.4)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        love.graphics.print(dTFormat,g.textBoxes.loadGameScreen.loadGame2.x+58,g.textBoxes.loadGameScreen.loadGame2.y,0,0.4,0.4)
    else
        love.graphics.print("Load File 2 (Empty)",g.textBoxes.loadGameScreen.loadGame2.x,g.textBoxes.loadGameScreen.loadGame2.y,0,0.4,0.4)
    end
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    love.graphics.rectangle("line",g.textBoxes.loadGameScreen.loadGame2.x-2,g.textBoxes.loadGameScreen.loadGame2.y-2,56,8)
    
    if(love.filesystem.getInfo("Save_File_3.lua")) then
        local dT = g.deepCopy(g.loadGameDateTime3)
        if(tonumber(dT.hour) < 10) then dT.hour = "0" .. dT.hour end
        if(tonumber(dT.min) < 10) then dT.min = "0" .. dT.min end
        if(tonumber(dT.sec) < 10) then dT.sec = "0" .. dT.sec end
        local dTFormat = dT.month .. "/" .. dT.day .. "/" .. dT.year .. " " .. dT.hour .. ":" .. dT.min .. ":" .. dT.sec
        g.highlightText(g.textBoxes.loadGameScreen.loadGame3,0.4)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        love.graphics.print(dTFormat,g.textBoxes.loadGameScreen.loadGame3.x+58,g.textBoxes.loadGameScreen.loadGame3.y,0,0.4,0.4)
    else
        love.graphics.print("Load File 3 (Empty)",g.textBoxes.loadGameScreen.loadGame3.x,g.textBoxes.loadGameScreen.loadGame3.y,0,0.4,0.4)
    end
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    love.graphics.rectangle("line",g.textBoxes.loadGameScreen.loadGame3.x-2,g.textBoxes.loadGameScreen.loadGame3.y-2,56,8)
    
    g.highlightText(g.textBoxes.loadGameScreen.back,0.4)

end

return drawLoadScreen