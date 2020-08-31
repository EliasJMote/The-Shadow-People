local drawTitleCreditsScreen = {}

    local g = GLOBALS

    function drawTitleCreditsScreen.draw()
        
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
        love.graphics.rectangle("fill", 0, 0, 160, 144)
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        
        love.graphics.print("Credits", 60, 8, 0, 0.4, 0.4)
        love.graphics.print("Producer:", 4, 16, 0, 0.4, 0.4)
        love.graphics.print("Elias Mote", 60, 24, 0, 0.4, 0.4)
        love.graphics.print("Programmer:", 4, 32, 0, 0.4, 0.4)
        love.graphics.print("Elias Mote", 60, 40, 0, 0.4, 0.4)
        love.graphics.print("Musician:", 4, 48, 0, 0.4, 0.4)
        love.graphics.print("Taylor Fielder", 60, 56, 0, 0.4, 0.4)
        love.graphics.print("Artist:", 4, 64, 0, 0.4, 0.4)
        love.graphics.print("Elias Mote", 60, 72, 0, 0.4, 0.4)
        love.graphics.print("Testers:", 4, 80, 0, 0.4, 0.4)
        love.graphics.print("Dred4170", 60, 88, 0, 0.4, 0.4)
        love.graphics.print("Raistlarn", 60, 96, 0, 0.4, 0.4)
        --love.graphics.print("Special Thanks:", 4, 104, 0, 0.4, 0.4)
        love.graphics.print("(C) Elias Mote 2020", 60, 128, 0, 0.4, 0.4)
        love.graphics.print("(C) Roc Studios 2020", 60, 136, 0, 0.4, 0.4)
        
        for k,v in pairs(g.textBoxes.titleCreditsScreen) do
            g.highlightText(v,0.4)
        end
    end

return drawTitleCreditsScreen