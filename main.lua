function love.load()
  
    --require("mobdebug").start()
  
    -- Global space
    GLOBALS = {}
    local g = GLOBALS
    
    loadGameSettings = require("Helper Functions/Load/loadGameSettings")
    loadGameSettings.load()
    
    loadVariables = require("Helper Functions/Load/loadVariables")
    loadVariables.load()

    loadLibraries = require("Helper Functions/Load/loadLibraries")
    loadLibraries.load()
    
    -- Miscellaneous text boxes that can be highlighted and selected (start game, options, etc.)
    -- These are loaded later since they depend on images
    loadTextBoxes.load()
    
    if(debug) then
        createGame.create()
        g.state = "game"
    end
end

function love.update(dt)
    updateGame.update(dt)
end

function love.draw()
    drawManager.draw()
end

function love.mousepressed(x, y, button, istouch, presses)
    updateMousePress.update(x,y,button)
end