function fullscreenToggle()
    local _, _, flags = love.window.getMode()
    local windowWidth, windowHeight = love.graphics.getDimensions( )
    local desktopWidth, desktopHeight = love.window.getDesktopDimensions(flags.display)
    local maximized = love.window.isMaximized()
    local fullscreen, fstype = love.window.getFullscreen()
    
    if(fullscreen) then
        flags.fullscreen = false
        love.window.setMode(160*scale, 144*scale,flags)
        love.window.setPosition((desktopWidth-(160*scale))/2, (desktopHeight-(144*scale))/2, flags.displayindex )
    else
        love.window.setMode(desktopWidth, desktopHeight,flags)
        love.window.setFullscreen(true, "exclusive")
    end
end
function love.load()
  
    --require("mobdebug").start()
  
    -- Global space
    GLOBALS = {}

    loadLibraries = require("Helper Functions/Load/loadLibraries")
    loadLibraries.load()
    
    GLOBALS.loadGameDateTime = {}
    
    GLOBALS.volume = {}
    GLOBALS.volume.master = 4
    love.audio.setVolume(GLOBALS.volume.master/10)
    
    --debug = true
    
    -- Debug mode
    if(debug) then
        createGame.create()
        GLOBALS.state = "game"
    end
    
    -- Check if "Endings_Found.lua" exists
    if(love.filesystem.getInfo("Endings_Found.lua") == nil) then
        local endingsFoundJson = json.encode({false,false,false,false,false})
        love.filesystem.write("Endings_Found.lua", endingsFoundJson)
        GLOBALS.endingsFound = {false,false,false,false,false}
    else
        -- Load in the contents of the file
        local contents = love.filesystem.read("Endings_Found.lua")
        
        -- Decode the json contents
        GLOBALS.endingsFound = json.decode(contents)
        --print("\"Endings_Found.lua\" already exists!")
    end
    
    -- Check if "Shadow_People_Found.lua" exists
    if(love.filesystem.getInfo("Shadow_People_Found.lua") == nil) then
        local shadowPeopleFoundJson = json.encode({endlessHallway=false,highway=false,imperfect=false,lostPeople=false,mirror=false,school=false,squiggleMan=false,window=false,whoAreYouRunningFrom=false})
        love.filesystem.write("Shadow_People_Found.lua", shadowPeopleFoundJson)
        GLOBALS.shadowPeopleFound = {endlessHallway=false,highway=false,imperfect=false,lostPeople=false,mirror=false,school=false,squiggleMan=false,window=false,whoAreYouRunningFrom=false}
    else
        -- Load in the contents of the file
        local contents = love.filesystem.read("Shadow_People_Found.lua")
        
        -- Decode the json contents
        GLOBALS.shadowPeopleFound = json.decode(contents)
        --print("\"Shadow_People_Found.lua\" already exists!")
    end
    
    GLOBALS.fullscreen = false
    
    -- Cap frame rate to 60 fps
    min_dt = 1/60 --fps
    next_time = love.timer.getTime()
end

function love.update(dt)
    next_time = next_time + min_dt
    updateGame.update(dt,GLOBALS)
    --print(love.window.getVSync( ))
    --print(love.timer.getFPS( ))
    --print(math.floor(1.0 / dt))
    
    local g = GLOBALS
    local fullscreen, fstype = love.window.getFullscreen( )
    if(fullscreen) then
        g.textBoxes.optionsScreen.fullscreenButton = {x=131,y=24+12*2,w=14-5,h=6,text="On"}
    else
        g.textBoxes.optionsScreen.fullscreenButton = {x=131,y=24+12*2,w=14,h=6,text="Off"}
    end
    
    --g.textBoxes.optionsScreen.
end

function love.draw() 
    drawManager.draw()
    
    -- Cap frame rate to 60 fps
    local cur_time = love.timer.getTime()
    if next_time <= cur_time then
        next_time = cur_time
        return
    end
    love.timer.sleep(next_time - cur_time)
end

function love.keypressed(key,scancode,isrepeat)
    
    -- Alt + Enter toggles fullscreen
    if((love.keyboard.isDown('lalt') or love.keyboard.isDown('ralt')) and love.keyboard.isDown('return')) then
        fullscreenToggle()
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    updateMousePress.update(x,y,button)
end
function love.wheelmoved(x,y)
    updateMouseWheelEvents.update(x,y)
end

function love.resize(w,h)
    updateWindowResize.update(w,h)
end