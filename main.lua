function love.load()
  
    --require("mobdebug").start()
  
    -- Global space
    GLOBALS = {}

    loadLibraries = require("Helper Functions/Load/loadLibraries")
    loadLibraries.load()
    
    -- Debug mode
    if(debug) then
        --createGame.create()
        --GLOBALS.state = "game"
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

function love.mousepressed(x, y, button, istouch, presses)
    updateMousePress.update(x,y,button)
end

function love.resize(w,h)
    updateWindowResize.update(w,h)
end