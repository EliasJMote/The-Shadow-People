local loadHelperFunctions = {}

local g = GLOBALS

-- Write to the game's text display
function g.writeToTextDisplay(text)

    -- For each line in the text, insert them into the text display at the start in reverse order
    table.insert(g.curText, "\n")
    for k,v in ipairs(text) do
        table.insert(g.curText, v)
    end
    
    -- Truncate the display text until there are only 4 text lines
    while(#g.curText > 6) do
        table.remove(g.curText,1)
    end
        
end

function g.stateTransition(state1, state2)
end

return loadHelperFunctions