function love.load()
  
    --require("mobdebug").start()
  
    -- Global space
    GLOBALS = {}
    local g = GLOBALS

    -- External functions
    createEvent = require("Helper Functions/Create/createEvent")
    createGame = require("Helper Functions/Create/createGame")
    
    updateEvents = require("Helper Functions/Update/updateEvents")
    updateGame = require("Helper Functions/Update/updateGame")
    updateMousePress = require("Helper Functions/Update/updateMousePress")
    updateTitleScreen = require("Helper Functions/Update/updateTitleScreen")
    updateRoomLocks = require("Helper Functions/Update/updateRoomLocks")
    updateEnding = require("Helper Functions/Update/updateEnding")
    
    drawScreenTransition = require("Helper Functions/Draw/drawScreenTransition")
    drawManager = require("Helper Functions/Draw/drawManager")
    drawTitleScreen = require("Helper Functions/Draw/drawTitleScreen")
    drawTitleCreditsScreen = require("Helper Functions/Draw/drawTitleCreditsScreen")
    drawInstructionsScreen = require("Helper Functions/Draw/drawInstructionsScreen")
    drawUserInterface = require("Helper Functions/Draw/drawUserInterface")
    drawGame = require("Helper Functions/Draw/drawGame")
    drawInGameTransitions = require("Helper Functions/Draw/drawInGameTransitions")
    drawCursor = require("Helper Functions/Draw/drawCursor")
    drawEnding = require("Helper Functions/Draw/drawEnding")
    
    -- Set the scaler to use the nearest neighbor filter
    love.graphics.setDefaultFilter("nearest", "nearest", 0)
    
    -- Set the game window to be resizable
    love.window.setMode(love.graphics.getWidth(), love.graphics.getHeight(), {resizable = true})
    
    -- Load helper functions
    loadImages = require("Helper Functions/Load/loadImages")
    loadGameText = require("Helper Functions/Load/loadGameText")
    loadObjects = require("Helper Functions/Load/loadObjects")
    loadHelperFunctions = require("Helper Functions/Load/loadHelperFunctions")
    loadSFX = require("Helper Functions/Load/loadSFX")
    loadMusic = require("Helper Functions/Load/loadMusic")
    loadRooms = require("Helper Functions/Load/loadRooms")
    
    -- Update helper functions
    updateCheckAction = require("Helper Functions/Update/updateCheckAction")
    updateRoom = require("Helper Functions/Update/updateRoom")
    updatePlayerAction = require("Helper Functions/Update/updatePlayerAction")
    
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

function love.mousepressed(x, y, button, istouch, presses)
    updateMousePress.update(x,y,button)
end