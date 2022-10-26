local drawExtrasScreen = {}

local g = GLOBALS

function drawExtrasScreen.draw()

    -- Draw the background screen
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    love.graphics.print("Extras", 68, 8, 0, 0.4, 0.4)
    
    
    local endingsStr = ""
    for i=1,5 do
        if(GLOBALS.endingsFound[i] == true) then
            if(i<5) then
                endingsStr = endingsStr .. i .. ","
            else
                endingsStr = endingsStr .. i
            end
        end
        --love.graphics.rectangle("line",8+40*i,32,32,32)
    end
    if(endingsStr == "") then endingsStr = "[None]" end
    
    love.graphics.print("Endings Found: " .. endingsStr, 8, 24, 0, 0.4, 0.4)
    
    love.graphics.print("Shadow People Found:", 8, 40, 0, 0.4, 0.4)
    love.graphics.print("Shed Window: " .. tostring(GLOBALS.shadowPeopleFound.window), 8, 40+8, 0, 0.4, 0.4)
    love.graphics.print("Endless Hallway: " .. tostring(GLOBALS.shadowPeopleFound.endlessHallway), 8, 40+16, 0, 0.4, 0.4)
    love.graphics.print("Lair of the Imperfect: " .. tostring(GLOBALS.shadowPeopleFound.imperfect), 8, 40+24, 0, 0.4, 0.4)
    love.graphics.print("Lost People: " .. tostring(GLOBALS.shadowPeopleFound.lostPeople), 8, 40+32, 0, 0.4, 0.4)
    love.graphics.print("Gas Station Mirror: " .. tostring(GLOBALS.shadowPeopleFound.mirror), 8, 40+40, 0, 0.4, 0.4)
    love.graphics.print("School: " .. tostring(GLOBALS.shadowPeopleFound.school), 8, 40+48, 0, 0.4, 0.4)
    love.graphics.print("Who are you running from: " .. tostring(GLOBALS.shadowPeopleFound.whoAreYouRunningFrom), 8, 40+56, 0, 0.4, 0.4)
    love.graphics.print("Squiggle Man: " .. tostring(GLOBALS.shadowPeopleFound.squiggleMan), 8, 40+64, 0, 0.4, 0.4)
    love.graphics.print("Highway Dead End: " .. tostring(GLOBALS.shadowPeopleFound.highway), 8, 40+72, 0, 0.4, 0.4)
    
    for k,v in pairs(g.textBoxes.extrasScreen) do
        g.highlightText(v,0.4)
    end
end

return drawExtrasScreen