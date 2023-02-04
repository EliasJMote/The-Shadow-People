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
            if(i>1) then
                endingsStr = endingsStr .. i .. ","
            else
                endingsStr = endingsStr .. i
            end
        end
        
        -- Draw image borders
        local x = 22+40*((i-1)%3)+20*math.floor((i-1)/3)
        local y = 38+48*math.floor((i-1)/3)
        love.graphics.rectangle("line",x,y,34,34)
        love.graphics.print(i,x+16,y+38,0,0.4,0.4)
        
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        
        -- Draw images
        if(i==1 and GLOBALS.endingsFound[1]) then
            love.graphics.draw(loadImages.morningDaybreakAchievement,x+1,y+1)
        elseif(i==2 and GLOBALS.endingsFound[2]) then
            love.graphics.draw(loadImages.midnightShadowsAchievement,x+1,y+1)
        elseif(i==3 and GLOBALS.endingsFound[3]) then
            love.graphics.draw(loadImages.eternalTwilightAchievement,x+1,y+1)
        elseif(i==4 and GLOBALS.endingsFound[4]) then
            love.graphics.draw(loadImages.solarBlindnessAchievement,x+1,y+1)
        elseif(i==5 and GLOBALS.endingsFound[5]) then
            love.graphics.draw(loadImages.redPrinceAchievement,x+1,y+1)
        end
        
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    end
    --if(endingsStr == "") then endingsStr = "None" end
    
    --love.graphics.print("Endings Found: " .. endingsStr, 8, 24, 0, 0.4, 0.4)
    love.graphics.printf("Endings Found:", 0, 24, 160/0.4,"center",0,0.4,0.4)
    
    
    
    --[[
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
    ]]
    
    for k,v in pairs(g.textBoxes.extrasScreen) do
        g.highlightText(v,0.4)
    end
end

return drawExtrasScreen