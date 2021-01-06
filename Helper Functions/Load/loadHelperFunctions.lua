local loadHelperFunctions = {}

local g = GLOBALS

function g.round(x)
    return math.floor(x + 0.5)
end
-- Write to the game's text display
function g.writeToTextDisplay(text)

    -- Show the text box
    g.showMessageBox = true

    -- Clear the current text
    g.textBuffer = {}

    -- For each line in the text, insert them into the text display at the start in reverse order
    for k,v in ipairs(text) do
        table.insert(g.textBuffer, v)
    end
        
end

function g.stateTransition(state1, state2)
end
function g.mouseCollision(mouseX, mouseY,obj)
    if(mouseX >= obj.x and mouseX <= obj.x + obj.w
        and mouseY >= obj.y and mouseY <= obj.y + obj.h) then
        return true
    else
        return false
    end
end

function g.highlightText(textBox,textSize)
    if(g.state ~= "game") then
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    else
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    end
    -- Highlight moused-over text or selected actions
    if not(g.screenTransition.active) then
        if(g.mouseCollision(g.mouse.x, g.mouse.y,textBox) or g.actionSelected == textBox.text or g.itemSelected == textBox.text) then
            if(g.state ~= "game") then
                love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
            else
                love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
            end
        end
    end

    love.graphics.print(textBox.text, textBox.x, textBox.y, 0, textSize or 0.5, textSize or 0.5)
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
end

function g.checkClock()
    -- Check if it is the correct time (8:35). If so, open the secret panel.
    if(g.mouse.objectPointedAt == loadRooms.clockTowerInsideSecondFloor.objects.hourButton
        or g.mouse.objectPointedAt == loadRooms.clockTowerInsideSecondFloor.objects.minuteButton) then
                                        
        local hourAngle = math.deg(loadRooms.clockTowerInsideSecondFloor.objects.hourHand.rot.r)
        local minuteAngle = math.deg(loadRooms.clockTowerInsideSecondFloor.objects.minuteHand.rot.r)

        local hour = 12
        local minute = 0
        
        if(hourAngle ~= 0) then hour = g.round(hourAngle / 30) end
        if(minuteAngle ~= 0) then minute = g.round((minuteAngle * 5) / 30) end
        
        if(hour == 8 and minute == 35) then
            loadRooms.clockTowerInsideSecondFloor.objects.panel.state = "Open"
            loadRooms.clockTowerInsideSecondFloor.objects.panel.text = {look={"It's a hidden panel. It's", "currently open."},pull={"It's already open!"}}
            loadRooms.clockTowerInsideSecondFloor.objects.hacksaw = loadObjects.hacksaw
            g.writeToTextDisplay({"As you press the button, a", "secret panel in the wall opens.", "A hacksaw falls out of the", "panel and clatters to the", "floor."})
        end
    end
end

return loadHelperFunctions