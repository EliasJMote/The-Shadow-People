local updateMousePositionStates = {}

local g = GLOBALS

function updateMousePositionStates.update(event)
    g.mouse.textHover = false
            
    if(g.state == "warning") then
        for k,v in pairs(g.textBoxes.warningScreen) do
            if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                g.mouse.textHover = true
            end
        end
    
    elseif(g.state == "title") then
        if(g.timers.global >= 175) then
            for k,v in pairs(g.textBoxes.titleScreen) do
                if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                    g.mouse.textHover = true
                end
            end
        end
    
    elseif(g.state == "instructions") then
        for k,v in pairs(g.textBoxes.instructionsScreen) do
            if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                g.mouse.textHover = true
            end
        end
        
    elseif(g.state == "pause instructions") then
        for k,v in pairs(g.textBoxes.pauseInstructionsScreen) do
            if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                g.mouse.textHover = true
            end
        end
        
    elseif(g.state == "title credits") then
        for k,v in pairs(g.textBoxes.titleCreditsScreen) do
            if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                g.mouse.textHover = true
            end
        end
        
    elseif(g.state == "options") then
        for k,v in pairs(g.textBoxes.optionsScreen) do
            if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                g.mouse.textHover = true
            end
        end
        
    elseif(g.state == "extras") then
        for k,v in pairs(g.textBoxes.extrasScreen) do
            if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                g.mouse.textHover = true
            end
        end
        
    elseif(g.state == "pause") then
        g.mouse.pauseMenuHover = false
        local mouseHover = false
        for k,v in pairs(g.textBoxes.pauseScreen) do
            if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                g.mouse.textHover = true
                mouseHover = true
            end
        end
        
    elseif(g.state == "save game") then
        local mouseHover = false
        for k,v in ipairs(g.textBoxes.saveGameScreen.saveGame) do
            if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                g.mouse.textHover = true
                mouseHover = true
            end
        end
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.textBoxes.saveGameScreen.back)) then
            g.mouse.textHover = true
            mouseHover = true
        end
        
    elseif(g.state == "load game") then
        local mouseHover = false
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.textBoxes.loadGameScreen.loadGameAuto)) then
            g.mouse.textHover = true
            mouseHover = true
        end
        for k,v in ipairs(g.textBoxes.loadGameScreen.loadGame) do
            if(g.mouseCollision(g.mouse.x,g.mouse.y,v)) then
                g.mouse.textHover = true
                mouseHover = true
            end
        end
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.textBoxes.loadGameScreen.back)) then
            g.mouse.textHover = true
            mouseHover = true
        end
        
    elseif(g.state == "inventory") then
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.textBoxes.itemScreen.back)) then
            g.mouse.textHover = true
        else
            g.mouse.textHover = false
        end
    
    elseif(g.state == "car transition 1") then
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.textBoxes.transitionScreens.car1.startGame)) then
            g.mouse.textHover = true
        else
            g.mouse.textHover = false
        end
        g.clearMouseCursorState()
        
    elseif(g.state == "car transition 2") then
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.textBoxes.transitionScreens.car2.startGame)) then
            g.mouse.textHover = true
        else
            g.mouse.textHover = false
        end
        g.clearMouseCursorState()
        
    elseif(g.state == "car transition 3") then
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.textBoxes.transitionScreens.car3.startGame)) then
            g.mouse.textHover = true
        else
            g.mouse.textHover = false
        end
        g.clearMouseCursorState()
        
    elseif(g.state == "class transition") then
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.textBoxes.transitionScreens.class.startGame)) then
            g.mouse.textHover = true
        else
            g.mouse.textHover = false
        end
        g.clearMouseCursorState()
    
    elseif(g.state == "dream transition") then
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.textBoxes.transitionScreens.dream.startGame)) then
            g.mouse.textHover = true
        else
            g.mouse.textHover = false
        end
        g.clearMouseCursorState()
        
    elseif(g.state == "space transition") then
        local mouseHover = false
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.textBoxes.transitionScreens.space.startGame)) then
            g.mouse.textHover = true
            mouseHover = true
        else
            g.mouse.textHover = false
        end
        g.clearMouseCursorState()
        
    elseif(g.state == "night transition") then
        local mouseHover = false
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.textBoxes.transitionScreens.space.startGame)) then
            g.mouse.textHover = true
            mouseHover = true
        else
            g.mouse.textHover = false
        end
        g.clearMouseCursorState()
        
    elseif(g.state == "dark transition") then
        local mouseHover = false
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.textBoxes.transitionScreens.dark.startGame)) then
            g.mouse.textHover = true
            mouseHover = true
        else
            g.mouse.textHover = false
        end
        g.clearMouseCursorState()
    
    elseif(g.state == "game") then
        g.mouse.pauseMenuHover = false
        if(g.mouseCollision(g.mouse.x, g.mouse.y, g.pauseButton) and not g.showMessageBox) then
            g.mouse.pauseMenuHover = true
        end
    
        g.mouse.objectHover = false
        g.mouse.objectPointedAt = nil
        
        -- Check if the cursor is over an object
        for k,v in pairs(g.curLocation.objects) do
            if(v.w ~= 0 and v.h ~= 0) then
                if(g.mouseCollision(g.mouse.x, g.mouse.y, v)) then
                    g.mouse.objectHover = true
                    g.mouse.objectPointedAt = v
                end
            end
        end
        
        g.mouse.mapHover = nil

        -- Check if the cursor is over the map
        if(g.mouse.x >= 7 and g.mouse.x <= 42 and g.mouse.y >= 101 and g.mouse.y <= 137) then
            for k,v in pairs(g.curLocation.exits) do
                if(k=="north") then
                    if(g.mouse.x >= 20 and g.mouse.x <= 20+11 and g.mouse.y >= 101 and g.mouse.y <= 101+9) then
                        g.mouse.mapHover = "North"
                    end
                elseif(k=="south") then
                    if(g.mouse.x >= 20 and g.mouse.x <= 20+11 and g.mouse.y >= 128 and g.mouse.y <= 128+9) then
                        g.mouse.mapHover = "South"
                    end
                elseif(k=="west") then
                    if(g.mouse.x >= 7 and g.mouse.x <= 7+11 and g.mouse.y >= 114 and g.mouse.y <= 114+9) then
                        g.mouse.mapHover = "West"
                    end
                elseif(k=="east") then
                    if(g.mouse.x >= 31 and g.mouse.x <= 31+11 and g.mouse.y >= 114 and g.mouse.y <= 114+9) then
                        g.mouse.mapHover = "East"
                    end
                end
            end
        end
        
        g.cursorOverAction = nil
        g.actionPointedAt = nil
        
        -- If the text box is closed
        if not(g.showMessageBox) then
        
            g.mouse.actionHover = false
            g.mouse.actionText = nil
        
            -- Check if the cursor is over an action
            for k,v in ipairs(g.actionButtons) do
                if(g.mouseCollision(g.mouse.x, g.mouse.y, v)) then
                    g.mouse.actionHover = true
                    g.mouse.actionText = v.text
                end
            end
        end
        
        
        g.mouse.itemMenuHover = false
        g.mouse.itemMenuHoverItem = nil
        
        -- Get the collision boxes for the item names
        for i=1+4*(g.itemPage-1),4*g.itemPage do
            if(g.items[i] ~= nil) then
                g.items[i].x = 105
                g.items[i].y = 22 + 13 * ((i-1)%4)
                
                -- Check if the cursor is over an item
                if(g.mouseCollision(g.mouse.x, g.mouse.y, g.items[i])) then
                    g.mouse.itemMenuHover = true
                    g.mouse.itemMenuHoverItem = g.items[i].name
                end
            end
        end
        
        if(g.mouseCollision(g.mouse.x,g.mouse.y,g.scrollItemPageLeft)) then
            g.mouse.scrollPageArrowHover = "Left"
        elseif(g.mouseCollision(g.mouse.x,g.mouse.y,g.scrollItemPageRight)) then
            g.mouse.scrollPageArrowHover = "Right"
        else
            g.mouse.scrollPageArrowHover = nil
        end
    end
end

return updateMousePositionStates