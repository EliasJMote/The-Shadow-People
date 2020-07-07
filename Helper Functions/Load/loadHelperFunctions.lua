local loadHelperFunctions = {}

local g = GLOBALS

-- Write to the game's text display
function g.writeToTextDisplay(text)

    -- Show the text box
    g.showTextBox = true

    -- Clear the current text
    g.textBuffer = {}

    -- For each line in the text, insert them into the text display at the start in reverse order
    for k,v in ipairs(text) do
        table.insert(g.textBuffer, v)
    end
        
end

function g.stateTransition(state1, state2)
end

function g.doesCursorPointToObject(mouseX, mouseY,obj)
    if(mouseX >= obj.x and mouseX <= obj.x + obj.w
        and mouseY >= obj.y and mouseY <= obj.y + obj.h) then
        return true
    else
        return false
    end
end

function g.clickableText(text,event)
    
end

function g.highlightText(x1,x2,y1,y2,text,textSize)
    if(g.mouse.x >= x1 and g.mouse.x <= x2 and g.mouse.y >= y1 and g.mouse.y <= y2) then
        love.graphics.setColor(g.colors.light_green.r, g.colors.light_green.g, g.colors.light_green.b, 1)
    end
    --else
        --love.graphics.setColor(g.colors.dark_green.r, g.colors.dark_green.g, g.colors.dark_green.b, 1)
    --end
    love.graphics.print(text, x1, y1, 0, textSize or 0.5, textSize or 0.5)
    love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
end


function g.createTextButton()
    
end

return loadHelperFunctions