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

return loadHelperFunctions