local drawDeleteSaveScreen = {}

function drawDeleteSaveScreen.draw()
    
    --[[local g = GLOBALS
    
    --local 
    
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    love.graphics.rectangle("line",2,2,160-4,144-4)
    
    love.graphics.print("Save Game", 60, 8, 0, 0.4, 0.4)
    love.graphics.print(g.savedString, 20, 16, 0, 0.4, 0.4)
    
    
    --[[for k,v in pairs(g.textBoxes.saveGameScreen) do
        g.highlightText(v,0.4)
    end]]
    
    g.highlightText(g.textBoxes.saveGameScreen.back,0.4)
    
    if(love.filesystem.getInfo("Save_File_1.lua") and g.loadGameDateTime1 ~= nil) then
        local dT = g.deepCopy(g.loadGameDateTime1)
        if(tonumber(dT.hour) < 10) then dT.hour = "0" .. dT.hour end
        if(tonumber(dT.min) < 10) then dT.min = "0" .. dT.min end
        if(tonumber(dT.sec) < 10) then dT.sec = "0" .. dT.sec end
        local dTFormat = dT.month .. "/" .. dT.day .. "/" .. dT.year .. " " .. dT.hour .. ":" .. dT.min .. ":" .. dT.sec
        g.highlightText(g.textBoxes.saveGameScreen.saveGame1,0.4)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        love.graphics.print(dTFormat,g.textBoxes.saveGameScreen.saveGame1.x+58,g.textBoxes.saveGameScreen.saveGame1.y,0,0.4,0.4)
    else
        g.highlightText(g.textBoxes.saveGameScreen.saveGame1,0.4)
    end
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    love.graphics.rectangle("line",g.textBoxes.saveGameScreen.saveGame1.x-2,g.textBoxes.saveGameScreen.saveGame1.y-2,56,8)
    
    if(love.filesystem.getInfo("Save_File_2.lua") and g.loadGameDateTime2 ~= nil) then
        local dT = g.deepCopy(g.loadGameDateTime2)
        if(tonumber(dT.hour) < 10) then dT.hour = "0" .. dT.hour end
        if(tonumber(dT.min) < 10) then dT.min = "0" .. dT.min end
        if(tonumber(dT.sec) < 10) then dT.sec = "0" .. dT.sec end
        local dTFormat = dT.month .. "/" .. dT.day .. "/" .. dT.year .. " " .. dT.hour .. ":" .. dT.min .. ":" .. dT.sec
        g.highlightText(g.textBoxes.saveGameScreen.saveGame2,0.4)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        love.graphics.print(dTFormat,g.textBoxes.saveGameScreen.saveGame2.x+58,g.textBoxes.saveGameScreen.saveGame2.y,0,0.4,0.4)
    else
        g.highlightText(g.textBoxes.saveGameScreen.saveGame2,0.4)
    end
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    love.graphics.rectangle("line",g.textBoxes.saveGameScreen.saveGame2.x-2,g.textBoxes.saveGameScreen.saveGame2.y-2,56,8)
    
    if(love.filesystem.getInfo("Save_File_3.lua") and g.loadGameDateTime3 ~= nil) then
        local dT = g.deepCopy(g.loadGameDateTime3)
        if(tonumber(dT.hour) < 10) then dT.hour = "0" .. dT.hour end
        if(tonumber(dT.min) < 10) then dT.min = "0" .. dT.min end
        if(tonumber(dT.sec) < 10) then dT.sec = "0" .. dT.sec end
        local dTFormat = dT.month .. "/" .. dT.day .. "/" .. dT.year .. " " .. dT.hour .. ":" .. dT.min .. ":" .. dT.sec
        g.highlightText(g.textBoxes.saveGameScreen.saveGame3,0.4)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        love.graphics.print(dTFormat,g.textBoxes.saveGameScreen.saveGame3.x+58,g.textBoxes.saveGameScreen.saveGame3.y,0,0.4,0.4)
    else
        g.highlightText(g.textBoxes.saveGameScreen.saveGame3,0.4)
    end
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    love.graphics.rectangle("line",g.textBoxes.saveGameScreen.saveGame3.x-2,g.textBoxes.saveGameScreen.saveGame3.y-2,56,8)]]
    
end

return drawDeleteSaveScreen