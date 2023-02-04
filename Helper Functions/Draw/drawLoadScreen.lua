local drawLoadScreen = {}

function drawLoadScreen.draw()
    
    local g = GLOBALS
    
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    love.graphics.print("Load Game", 60, 8, 0, 0.4, 0.4)
    
    love.graphics.rectangle("line",2,2,160-4,144-4)
    
    if(love.filesystem.getInfo("Auto_Save_File.lua")) then
        local dT = g.deepCopy(g.loadAutoGameDateTime)
        if(tonumber(dT.hour) < 10) then dT.hour = "0" .. dT.hour end
        if(tonumber(dT.min) < 10) then dT.min = "0" .. dT.min end
        if(tonumber(dT.sec) < 10) then dT.sec = "0" .. dT.sec end
        local dTFormat = dT.month .. "/" .. dT.day .. "/" .. dT.year .. " " .. dT.hour .. ":" .. dT.min .. ":" .. dT.sec
        g.highlightText(g.textBoxes.loadGameScreen.loadGameAuto,0.4)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        love.graphics.print(dTFormat,g.textBoxes.loadGameScreen.loadGameAuto.x+58,g.textBoxes.loadGameScreen.loadGameAuto.y,0,0.4,0.4)
    else
        love.graphics.print("Load File Auto (Empty)",g.textBoxes.loadGameScreen.loadGameAuto.x+58,g.textBoxes.loadGameScreen.loadGameAuto.y,0,0.4,0.4)
    end
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    love.graphics.rectangle("line",g.textBoxes.loadGameScreen.loadGameAuto.x-2,g.textBoxes.loadGameScreen.loadGameAuto.y-2,56,8)
    
    for i=1,#g.textBoxes.loadGameScreen.loadGame do
        if(love.filesystem.getInfo("Save_File_" .. i .. ".lua")) then
            local dT = g.deepCopy(g.loadGameDateTime[i])
            if(tonumber(dT.hour) < 10) then dT.hour = "0" .. dT.hour end
            if(tonumber(dT.min) < 10) then dT.min = "0" .. dT.min end
            if(tonumber(dT.sec) < 10) then dT.sec = "0" .. dT.sec end
            local dTFormat = dT.month .. "/" .. dT.day .. "/" .. dT.year .. " " .. dT.hour .. ":" .. dT.min .. ":" .. dT.sec
            g.highlightText(g.textBoxes.loadGameScreen.loadGame[i],0.4)
            love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
            love.graphics.print(dTFormat,g.textBoxes.loadGameScreen.loadGame[i].x+58,g.textBoxes.loadGameScreen.loadGame[i].y,0,0.4,0.4)
        else
            love.graphics.print("Load File " .. i .. " (Empty)",g.textBoxes.loadGameScreen.loadGame[i].x,g.textBoxes.loadGameScreen.loadGame[i].y,0,0.4,0.4)
        end
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        love.graphics.rectangle("line",g.textBoxes.loadGameScreen.loadGame[i].x-2,g.textBoxes.loadGameScreen.loadGame[i].y-2,56,8)
    end
    
    g.highlightText(g.textBoxes.loadGameScreen.back,0.4)

end

return drawLoadScreen