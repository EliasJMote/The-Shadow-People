local loadGameSettings = {}

function loadGameSettings.load()
    -- Set the game window to be resizable
    --love.window.setMode(1920/2, 1080/2)
    --love.window.setMode(160 * scale, 144 * scale) -- For playing the game normally
    --love.window.setMode(love.graphics.getWidth(), love.graphics.getHeight(), {resizable = true}) -- For playing the game normally
    --love.window.setMode(love.graphics.getWidth(), love.graphics.getHeight(), {borderless = true}) -- For gif recording and screenshots
    
    -- Set the scaler to use the nearest neighbor filter
    love.graphics.setDefaultFilter("nearest", "nearest", 0)

    -- Set the font
    font = love.graphics.newFont("Font/prstart.ttf")
    love.graphics.setFont(font)
    
    love.window.setIcon(love.image.newImageData("Images/Icon/The Shadow People Icon.png"))
    
    -- Set the mouse to be invisible
    love.mouse.setVisible(false)
end

return loadGameSettings