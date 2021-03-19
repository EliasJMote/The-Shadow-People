function love.load()
  
    --require("mobdebug").start()
  
    -- Global space
    GLOBALS = {}
    local g = GLOBALS

    -- External functions
    createEvent = require("Helper Functions/Create/createEvent")
    createGame = require("Helper Functions/Create/createGame")
    createRooms = require("Helper Functions/Create/createRooms")
    
    updateEvents = require("Helper Functions/Update/updateEvents")
    updateGame = require("Helper Functions/Update/updateGame")
    updateMousePress = require("Helper Functions/Update/updateMousePress")
    updateTitleScreen = require("Helper Functions/Update/updateTitleScreen")
    updateRoomLocks = require("Helper Functions/Update/updateRoomLocks")
    updateEnding = require("Helper Functions/Update/updateEnding")
    
    drawWarningScreen = require("Helper Functions/Draw/drawWarningScreen")
    drawScreenTransition = require("Helper Functions/Draw/drawScreenTransition")
    drawManager = require("Helper Functions/Draw/drawManager")
    drawTitleScreen = require("Helper Functions/Draw/drawTitleScreen")
    drawTitleCreditsScreen = require("Helper Functions/Draw/drawTitleCreditsScreen")
    drawItemScreen = require("Helper Functions/Draw/drawItemScreen")
    drawLoadScreen = require("Helper Functions/Draw/drawLoadScreen")
    drawSaveScreen = require("Helper Functions/Draw/drawSaveScreen")
    drawOptionsScreen = require("Helper Functions/Draw/drawOptionsScreen")
    drawInstructionsScreen = require("Helper Functions/Draw/drawInstructionsScreen")
    drawPauseScreen = require("Helper Functions/Draw/drawPauseScreen")
    drawUserInterface = require("Helper Functions/Draw/drawUserInterface")
    drawGame = require("Helper Functions/Draw/drawGame")
    drawInGameTransitions = require("Helper Functions/Draw/drawInGameTransitions")
    drawCursor = require("Helper Functions/Draw/drawCursor")
    drawEnding = require("Helper Functions/Draw/drawEnding")
    
    json = require("Helper Functions/json")
    
    -- Set the scaler to use the nearest neighbor filter
    love.graphics.setDefaultFilter("nearest", "nearest", 0)
    
    -- Set the game window to be resizable
    love.window.setMode(love.graphics.getWidth(), love.graphics.getHeight(), {resizable = true}) -- For playing the game normally
    --love.window.setMode(love.graphics.getWidth(), love.graphics.getHeight(), {borderless = true}) -- For gif recording
    
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
    
    -- Set the font
    font = love.graphics.newFont("Font/prstart.ttf")
    love.graphics.setFont(font)
    
    -- Set the mouse to be invisible
    love.mouse.setVisible(false)
    
    -- Set up the mouse variables
    g.mouse = {}
    g.mouse.x, g.mouse.y = love.mouse.getPosition()
    
    -- Initialize scale of the game
    g.scale = {}
    
    -- Initialize game state
    g.state = "warning"
    --if(debug) then
        --g.state = "game"
    --end
    --g.state = "title credits"
    --g.state = "shadow child"
    
    -- Initialize the constant game timers
    g.timers = {}
    g.timers.global = 0
    g.timers.titleScreenLogo = 210
    g.timers.endingTextFadeOut = 60 * 12
    g.timers.endingTextTimeAddition = 60 * 2
    g.timers.goodEnding = 5 * g.timers.endingTextFadeOut + g.timers.endingTextTimeAddition 
    g.timers.badEnding = 8 * g.timers.endingTextFadeOut + g.timers.endingTextTimeAddition 
    g.timers.easterEggEnding = 1 * g.timers.endingTextFadeOut + g.timers.endingTextTimeAddition 
    g.timers.alienEnding = 2 * g.timers.endingTextFadeOut + g.timers.endingTextTimeAddition 
    g.timers.redPrinceEnding = 7 * g.timers.endingTextFadeOut + g.timers.endingTextTimeAddition 
    
    -- Initialize events table
    g.events = {}
    
    g.titleCreditsPage = 1
    
    g.screenTransition = {x=0,y=0,w=160,h=144,active=false}
        
    g.actionButtons =   {
                            {text="Close",x=54,y=103,w=23,h=4},
                            {text="Look",x=120,y=103,w=18,h=4},
                            {text="Move",x=15,y=90,w=18,h=4},
                            {text="Open",x=120,y=90,w=18,h=4},
                            {text="Pull",x=120,y=116,w=18,h=4},
                            {text="Push",x=87,y=116,w=18,h=4},
                            {text="Put",x=54,y=90,w=13,h=4},
                            {text="Take",x=87,y=90,w=18,h=4},
                            {text="Talk",x=54,y=116,w=18,h=4},
                            {text="Use",x=87,y=103,w=13,h=4},
                        }
          
    g.endingScreenMask = {x=0,y=0,w=160,h=144} 
        
    -- game boy studio palette
    g.colors = {
        darkestGreen = {r=7/255, g=24/255, b=33/255},
        darkGreen = {r=48/255, g=104/255, b=80/255},
        lightGreen = {r=134/255, g=192/255, b=108/255},
        lightestGreen = {r=224/255, g=248/255, b=207/255},
    }
          
    -- Miscellaneous text boxes that can be highlighted and selected (start game, options, etc.)
    g.textBoxes =   {
                        instructionsScreen =    {
                                                    startGame = {x=52,y=128,w=59,h=6,text="Start Game"},
                                                },
                        loadGameScreen =    {
                                                loadGame1 = {x=20,y=32,w=52,h=6,text="Load Game 1"},
                                                loadGame2 = {x=20,y=64,w=52,h=6,text="Load Game 2"},
                                                loadGame3 = {x=20,y=96,w=52,h=6,text="Load Game 3"},
                                                back = {x=20,y=128,w=18,h=6,text="Back"},
                                            },
                        optionsScreen = {
                                            back = {x=72,y=128,w=19,h=6,text="Back"},
                                            increaseWindowScale = {x=152,y=24,w=3,h=6,text="+"},
                                            decreaseWindowScale = {x=120,y=24,w=3,h=6,text="-"},
                                        },  
                        pauseScreen =   {
                                            resumeGame = {x=56,y=40,w=52,h=6,text="Resume Game"},
                                            checkItems = {x=56,y=56,w=52,h=6,text="Check Items"},
                                            loadGame = {x=56,y=72,w=42,h=6,text="Load Game"},
                                            saveGame = {x=56,y=88,w=42,h=6,text="Save Game"},
                                            quitGame = {x=56,y=104,w=42,h=6,text="Quit Game"},
                                        },
                        itemScreen =    {
                                            back = {x=3,y=136,w=18,h=6,text="Back"},
                                            items=  {
                                                        -- Row 1
                                                        boltCutters = {x=4-1,y=18-1,w=34,h=34,name="B. Cutters",longName="Bolt Cutters",img=loadImages.inventoryBoltCutters},
                                                        carKey = {x=4+40*1-1,y=18-1,w=34,h=34,name="Car Key",img=loadImages.inventoryCarKey},
                                                        cog = {x=4+40*2-1,y=18-1,w=34,h=34,name="Cog",img=loadImages.inventoryCog},
                                                        gasStationKey = {x=4+40*3-1,y=18-1,w=34,h=34,name="G.S. Key",longName="Gas Station Key",img=loadImages.inventoryGasStationKey},
                                                        
                                                        -- Row 2
                                                        hacksaw = {x=4+40*0-1,y=18+40*1-1,w=34,h=34,name="Hacksaw",img=loadImages.inventoryHacksaw},
                                                        hammer = {x=4+40*1-1,y=18+40*1-1,w=34,h=34,name="Hammer",img=loadImages.inventoryHammer},
                                                        lighter = {x=4+40*2-1,y=18+40*1-1,w=34,h=34,name="Lighter",img=loadImages.inventoryLighter},
                                                        mirror = {x=4+40*3-1,y=18+40*1-1,w=34,h=34,name="Mirror",img=loadImages.inventoryMirror},
                                                        
                                                        -- Row 3
                                                        eclipseBrooch = {x=24-1,y=18+40*2-1,w=34,h=34,name="E. Brooch",longName="Eclipse Brooch",img=loadImages.inventoryEclipseBrooch},
                                                        necklace = {x=24+40*1-1,y=18+40*2-1,w=34,h=34,name="Necklace",img=loadImages.inventoryNecklace},
                                                        shadowOrb = {x=24+40*2-1,y=18+40*2-1,w=34,h=34,name="Shadow Orb",img=loadImages.inventoryShadowOrb},
                                                    }
                                        },
                        saveGameScreen =    {
                                                saveGame1 = {x=20,y=32,w=52,h=6,text="Save Game 1"},
                                                saveGame2 = {x=20,y=64,w=52,h=6,text="Save Game 2"},
                                                saveGame3 = {x=20,y=96,w=52,h=6,text="Save Game 3"},
                                                back = {x=20,y=128,w=18,h=6,text="Back"},
                                            },
                        titleCreditsScreen =    {
                                                    downArrow = {x=134,y=120,w=18,h=6,text="Down"},
                                                    titleScreen = {x=4,y=128,w=19,h=6,text="Back"},
                                                    upArrow = {x=134,y=16,w=9,h=6,text="Up"},
                                                },
                        titleScreen =   {
                                            startGame = {x=52,y=82,w=59,h=6,text="Start Game"},
                                            loadGame = {x=52,y=96,w=59,h=6,text="Load Game"},
                                            options = {x=52,y=110,w=41,h=6,text="Options"},
                                            credits = {x=52,y=124,w=41,h=6,text="Credits"},
                                        },
                                        
                        warningScreen = {
                                            continue = {x=42,y=128,w=81,h=6,text="Click to Continue"},
                                        }, 
                    }
    
    g.scrollItemPageLeft = {x=104,y=70,w=4,h=8}
    g.scrollItemPageRight = {x=150,y=70,w=4,h=8}
    
    g.savedString = ""
    g.previousState = nil
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