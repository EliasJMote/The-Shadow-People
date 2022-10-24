function love.load()
  
    --require("mobdebug").start()
  
    -- Global space
    GLOBALS = {}

    loadLibraries = require("Helper Functions/Load/loadLibraries")
    loadLibraries.load()
    
    -- Debug mode
    if(debug) then
        createGame.create()
        GLOBALS.state = "game"
    end
end

function love.update(dt)
    updateGame.update(dt,GLOBALS)
end

function love.draw()
    drawManager.draw()
end

function love.mousepressed(x, y, button, istouch, presses)
    updateMousePress.update(x,y,button)
end

function love.resize(w,h)
    updateWindowResize.update(w,h)
end