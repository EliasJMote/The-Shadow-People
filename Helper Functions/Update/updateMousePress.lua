local updateMousePress = {}

function updateMousePress.update(x, y, button)
    local g = GLOBALS

    if(button == 1) then
        createEvent.create{name="Left Click", state=g.state, mouse={x=g.mouse.x,y=g.mouse.y}}
    elseif(button == 2) then
        createEvent.create{name="Right Click", state=g.state, mouse={x=g.mouse.x,y=g.mouse.y}}
    end
end

return updateMousePress