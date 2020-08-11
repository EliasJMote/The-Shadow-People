local createGame = {}

    function createGame.create()

        local g = GLOBALS
        
        -- Initialize scale of the game
        g.scale = {}
        
        -- Initialize game state
        g.state = "title"
        
        -- Initialize events table
        g.events = {}
        
        -- Initialize current location
        g.curLocation = loadRooms.gasStationOutside
        --g.curLocation = loadRooms.bedroom
        
        -- Initialize items currently held
        g.items = {}
                  
        g.displayText = true
        g.objectPointedAt = nil
        
        -- current text onscreen
        g.curText = {}
        
        -- timers for game actions
        g.timers = {}
        g.timers.global = 0
        g.timers.screenTransition = 0
        
        -- game boy studio palette
        g.colors = {
            darkestGreen = {r=7/255, g=24/255, b=33/255},
            darkGreen = {r=48/255, g=104/255, b=80/255},
            lightGreen = {r=134/255, g=192/255, b=108/255},
            lightestGreen = {r=224/255, g=248/255, b=207/255},
        }
        
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
        
        -- Show the message box
        g.showMessageBox = true
        
        -- Miscellaneous text boxes (start game, options, etc.)
        g.textBoxes =   {
                            instructionsScreen =    {
                                                        startGame = {x=52,y=128,w=59,h=6,text="Start Game"},
                                                    },
                            titleScreen =   {
                                                startGame = {x=52,y=96,w=59,h=6,text="Start Game"},
                                            },
                            
                            
                        }
        
        -- Which action is selected
        g.selectedAction = nil
        g.screenTransition = {x=0,y=0,w=160,h=144,active=false}
        
        g.actionButtons =   {
                                {text="Close",x=54,y=103,w=23,h=4},
                                {text="Look",x=120,y=103,w=18,h=4},
                                {text="Move",x=15,y=90,w=18,h=4},
                                {text="Open",x=120,y=90,w=18,h=4},
                                {text="Push",x=87,y=116,w=18,h=4},
                                {text="Put",x=54,y=90,w=13,h=4},
                                {text="Take",x=87,y=90,w=18,h=4},
                                {text="Talk",x=54,y=116,w=18,h=4},
                                {text="Use",x=87,y=103,w=13,h=4},
                            }
                            
        g.mapTransitionIsLegal = false
        g.movementDirection = nil
        
        g.textBuffer = {}
    end

return createGame