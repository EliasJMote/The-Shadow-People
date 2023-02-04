local drawSaveScreen = {}

function drawSaveScreen.draw()
    
    local g = GLOBALS
    
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    love.graphics.rectangle("line",2,2,160-4,144-4)
    
    love.graphics.print("Save Game", 60, 8, 0, 0.4, 0.4)
    love.graphics.print(g.savedString, 20, 16, 0, 0.4, 0.4)
    
    
    g.highlightText(g.textBoxes.saveGameScreen.back,0.4)
    
    -- Draw the auto save grayed out
    love.graphics.setColor(g.colors.darkGreen.r, g.colors.darkGreen.g, g.colors.darkGreen.b, 1)
    if(love.filesystem.getInfo("Auto_Save_File.lua")) then
        local dT = g.deepCopy(g.loadAutoGameDateTime)
        if(tonumber(dT.hour) < 10) then dT.hour = "0" .. dT.hour end
        if(tonumber(dT.min) < 10) then dT.min = "0" .. dT.min end
        if(tonumber(dT.sec) < 10) then dT.sec = "0" .. dT.sec end
        local dTFormat = dT.month .. "/" .. dT.day .. "/" .. dT.year .. " " .. dT.hour .. ":" .. dT.min .. ":" .. dT.sec

        love.graphics.print(g.textBoxes.loadGameScreen.loadGameAuto.text,g.textBoxes.loadGameScreen.loadGameAuto.x,g.textBoxes.loadGameScreen.loadGameAuto.y,0,0.4,0.4)
        love.graphics.print(dTFormat,g.textBoxes.loadGameScreen.loadGameAuto.x+58,g.textBoxes.loadGameScreen.loadGameAuto.y,0,0.4,0.4)
    else
        love.graphics.print("Load File Auto (Empty)",g.textBoxes.loadGameScreen.loadGameAuto.x+58,g.textBoxes.loadGameScreen.loadGameAuto.y,0,0.4,0.4)
    end
    
    love.graphics.rectangle("line",g.textBoxes.loadGameScreen.loadGameAuto.x-2,g.textBoxes.loadGameScreen.loadGameAuto.y-2,56,8)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    -- For each save file
    for i=1,#g.textBoxes.saveGameScreen.saveGame do
        
        -- Display the save file if it exists, along with the current time
        if(love.filesystem.getInfo("Save_File_" .. i .. ".lua") and g.loadGameDateTime[i] ~= nil) then
            local dT = g.deepCopy(g.loadGameDateTime[i])
            if(tonumber(dT.hour) < 10) then dT.hour = "0" .. dT.hour end
            if(tonumber(dT.min) < 10) then dT.min = "0" .. dT.min end
            if(tonumber(dT.sec) < 10) then dT.sec = "0" .. dT.sec end
            local dTFormat = dT.month .. "/" .. dT.day .. "/" .. dT.year .. " " .. dT.hour .. ":" .. dT.min .. ":" .. dT.sec
            g.highlightText(g.textBoxes.saveGameScreen.saveGame[i],0.4)
            love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
            love.graphics.print(dTFormat,g.textBoxes.saveGameScreen.saveGame[i].x+58,g.textBoxes.saveGameScreen.saveGame[i].y,0,0.4,0.4)
        else
            g.highlightText(g.textBoxes.saveGameScreen.saveGame[i],0.4)
        end
        
        -- Draw a box around the save file
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        love.graphics.rectangle("line",g.textBoxes.saveGameScreen.saveGame[i].x-2,g.textBoxes.saveGameScreen.saveGame[i].y-2,56,8)
    end
    
    
    
end

return drawSaveScreen