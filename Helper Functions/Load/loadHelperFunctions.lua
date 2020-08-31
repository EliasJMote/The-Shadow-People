local loadHelperFunctions = {}

local g = GLOBALS

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
    if(g.mouseCollision(g.mouse.x, g.mouse.y,textBox) or g.selectedAction == textBox.text) then
        if(g.state ~= "game") then
            love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        else
            love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        end
    end

    love.graphics.print(textBox.text, textBox.x, textBox.y, 0, textSize or 0.5, textSize or 0.5)
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
end

return loadHelperFunctions