local drawTitleCreditsScreen = {}

    local g = GLOBALS

    function drawTitleCreditsScreen.draw()
        
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
        love.graphics.rectangle("fill", 0, 0, 160, 144)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        
        love.graphics.print("Credits", 60, 8, 0, 0.4, 0.4)
        if(g.titleCreditsPage == 1) then
            love.graphics.print("Producer:", 4, 16, 0, 0.4, 0.4)
            love.graphics.print("Elias Mote", 60, 24, 0, 0.4, 0.4)
            love.graphics.print("Programmer:", 4, 32, 0, 0.4, 0.4)
            love.graphics.print("Elias Mote", 60, 40, 0, 0.4, 0.4)
            love.graphics.print("Musicians:", 4, 48, 0, 0.4, 0.4)
            love.graphics.print("Taylor Fielder", 60, 56, 0, 0.4, 0.4)
            love.graphics.print("Elias Mote", 60, 64, 0, 0.4, 0.4)
            love.graphics.print("Artist:", 4, 72, 0, 0.4, 0.4)
            love.graphics.print("Elias Mote", 60, 80, 0, 0.4, 0.4)
            love.graphics.print("Testers:", 4, 88, 0, 0.4, 0.4)
            love.graphics.print("Dred4170", 60, 96, 0, 0.4, 0.4)
            love.graphics.print("Raistlarn", 60, 104, 0, 0.4, 0.4)
        else
            love.graphics.print("Testers:", 4, 16, 0, 0.4, 0.4)
            love.graphics.print("Taylor Fielder", 60, 24, 0, 0.4, 0.4)
            love.graphics.print("Aluminati", 60, 32, 0, 0.4, 0.4)
            love.graphics.print("BeanWagon", 60, 40, 0, 0.4, 0.4)
            love.graphics.print("David Harper", 60, 48, 0, 0.4, 0.4)
            love.graphics.print("Elias Mote", 60, 56, 0, 0.4, 0.4)
            love.graphics.print("Special Thanks:", 4, 64, 0, 0.4, 0.4)
            love.graphics.print("My loving and", 60, 72, 0, 0.4, 0.4)
            love.graphics.print("supportive family.", 60, 80, 0, 0.4, 0.4)
            love.graphics.print("YoshGamesLive", 60, 80+8, 0, 0.4, 0.4)
            love.graphics.print("@starson777", 60, 80+8*2, 0, 0.4, 0.4)
            love.graphics.print("@Llama_Blair", 60, 80+8*3, 0, 0.4, 0.4)
        end
        --
        love.graphics.print("@Roc_Studios", 36, 128-8, 0, 0.4, 0.4)
        love.graphics.print("(C) Elias Mote  2020-2023", 36, 128, 0, 0.4, 0.4)
        love.graphics.print("(C) Roc Studios 2020-2023", 36, 136, 0, 0.4, 0.4)
        
        for k,v in pairs(g.textBoxes.titleCreditsScreen) do
            g.highlightText(v,0.4)
        end
    end

return drawTitleCreditsScreen