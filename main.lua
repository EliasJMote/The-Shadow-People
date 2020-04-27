function love.load()
  
    -- Global space
    GLOBALS = {}
  
    -- External functions
    createGame = require("Helper Functions/Create/createGame")
    updateGame = require("Helper Functions/Update/updateGame")
    updateMousePress = require("Helper Functions/Update/updateMousePress")
    drawManager = require("Helper Functions/Draw/drawManager")
    
    -- Set the scaler to use the nearest neighbor filter
    love.graphics.setDefaultFilter("nearest", "nearest", 0)
    
    -- Set the game window to be resizable
    love.window.setMode(love.graphics.getWidth(), love.graphics.getHeight(), {resizable = true})
    
    -- Load helper functions
    loadImages = require("Helper Functions/Load/loadImages")
    loadHelperFunctions = require("Helper Functions/Load/loadHelperFunctions")
    --loadGameText = require("loadGameText")
    --loadLocations = require("loadLocations")
    --loadItems = require("loadItems")
    
    font = love.graphics.newFont("Font/prstart.ttf")
    love.graphics.setFont(font)
    
    love.mouse.setVisible(false)
    
    createGame.create()

    local g = GLOBALS
end

function love.update(dt)
    updateGame.update()
end

function love.draw()
    drawManager.draw()
end

--function love.keypressed(key, scancode, isrepeat)
  --updateKeyPress.update(key, scancode, isrepeat)
--end

function love.mousepressed(x, y, button, istouch, presses)
    updateMousePress.update(x,y,button)
end