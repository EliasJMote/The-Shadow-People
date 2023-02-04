local updateMouseWheelEvents = {}

function updateMouseWheelEvents.update(x,y)
    
    local g = GLOBALS
    
    if(g.state == "game") then
    
        if(g.actionSelected ~= nil) then
            local actionSelectedNumber = 1
        
            for i=1,10 do
                if(g.actionSelected == g.actionButtons[i].text) then
                    actionSelectedNumber = i
                end
            end
        
            --print("Wheel value = " .. y)
            --print("Action selected = " .. g.actionSelected)
            --print("Action number = " .. actionSelectedNumber)
        
            -- Mouse wheel moved up
            if(y==1) then
                actionSelectedNumber = actionSelectedNumber + 1
                if(actionSelectedNumber > 10) then actionSelectedNumber = 1 end
                g.actionSelected = g.actionButtons[actionSelectedNumber].text
            
            -- Mouse wheel moved down
            elseif(y==-1) then
                actionSelectedNumber = actionSelectedNumber - 1
                if(actionSelectedNumber < 1) then actionSelectedNumber = 10 end
                g.actionSelected = g.actionButtons[actionSelectedNumber].text
            end
            
            g.itemSelected = nil
            
            --print("Action moved to = " .. g.actionSelected)
            --print("Action number moved to = " .. actionSelectedNumber .. "\n")
        else
            if(y~=0) then g.actionSelected = g.actionButtons[1].text end
        end
    end
end

return updateMouseWheelEvents