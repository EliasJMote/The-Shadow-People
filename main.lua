function love.load()
  
    -- Global space
    GLOBALS = {}
    local g = GLOBALS

    -- External functions
    createGame = require("Helper Functions/Create/createGame")
    updateGame = require("Helper Functions/Update/updateGame")
    updateMousePress = require("Helper Functions/Update/updateMousePress")
    drawManager = require("Helper Functions/Draw/drawManager")
    drawTitleScreen = require("Helper Functions/Draw/drawTitleScreen")
    drawInstructionsScreen = require("Helper Functions/Draw/drawInstructionsScreen")
    drawUserInterface = require("Helper Functions/Draw/drawUserInterface")
    drawGame = require("Helper Functions/Draw/drawGame")
    
    -- Set the scaler to use the nearest neighbor filter
    love.graphics.setDefaultFilter("nearest", "nearest", 0)
    
    -- Set the game window to be resizable
    love.window.setMode(love.graphics.getWidth(), love.graphics.getHeight(), {resizable = true})
    
    -- Load helper functions
    loadImages = require("Helper Functions/Load/loadImages")
    loadHelperFunctions = require("Helper Functions/Load/loadHelperFunctions")
    loadRooms = require("Helper Functions/Load/loadRooms")
    --loadGameText = require("loadGameText")
    --loadLocations = require("loadLocations")
    --loadItems = require("loadItems")
    
    -- Update helper functions
    updateRoomObjects = require("Helper Functions/Update/updateRoomObjects")
    updateRoom = require("Helper Functions/Update/updateRoom")
    
    font = love.graphics.newFont("Font/prstart.ttf")
    love.graphics.setFont(font)
    
    love.mouse.setVisible(false)
    
    g.mouse = {}
    g.mouse.x, g.mouse.y = love.mouse.getPosition()
    
    createGame.create()
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