local drawItemScreen = {}

function drawItemScreen.draw()
    
    local g = GLOBALS
    
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    love.graphics.rectangle("fill", 0, 0, 160, 144)
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    
    love.graphics.print("Inventory", 60, 8, 0, 0.4, 0.4)
    
    for k,v in pairs(g.textBoxes.itemScreen.items) do
        if(k == "eclipseBrooch" or k == "necklace" or k == "shadowOrb") then
            love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        else
            love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
        end
        love.graphics.rectangle("line", v.x, v.y, v.w, v.h)
        
        love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
        for k2,v2 in ipairs(g.items) do
            if(v.name == v2.name) then
                if(v.img ~= nil) then
                    love.graphics.draw(v.img,v.x+1,v.y+1)
                end
                break
            end
        end
    end
    
    love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    love.graphics.rectangle("line", 43, 134, 75, 8)
    
    --love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    local itemText = ""
    for k,v in pairs(g.textBoxes.itemScreen.items) do
        if(g.mouseCollision(g.mouse.x, g.mouse.y,v)) then
            for k2,v2 in ipairs(g.items) do
                if(v.name == v2.name) then
                    if(v.longName ~= nil) then
                        itemText = v.longName
                    else
                        itemText = v.name
                    end
                    break
                end
            end
            
        end
    end
    
    love.graphics.print(itemText, 45, 136, 0, 0.4, 0.4)
    love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
    
    g.highlightText(g.textBoxes.itemScreen.back,0.4)

end

return drawItemScreen