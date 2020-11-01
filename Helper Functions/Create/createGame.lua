local createGame = {}

    function createGame.create()

        local g = GLOBALS
        
        -- Initialize scale of the game
        g.scale = {}
        
        -- Initialize game state
        g.state = "title"
        if(debug) then
            g.state = "game"
        end
        
        -- Initialize events table
        g.events = {}
        
        -- Initialize current location
        g.curLocation = loadRooms.bedroom
        if(debug) then
            g.curLocation = loadRooms.floodedLabyrinth1
        end
        
        -- Initialize items currently held
        g.items = {}
        --[[g.items={
                    {name="Item 1",w=28,h=4},
                    {name="Item 2",w=28,h=4},
                    {name="Item 3",w=28,h=4},
                    {name="Item 4",w=28,h=4},
                    {name="Item 5",w=28,h=4}
                }]]
                  
        g.displayText = true
        g.objectPointedAt = nil
        
        -- current text onscreen
        g.curText = {}
        
        -- timers for game actions
        g.timers = {}
        g.timers.global = 0
        g.timers.screenTransition = 0
        g.timers.titleScreenLogo = 210
        g.timers.endingText = 0
        g.timers.endingTextFadeOut = 60 * 9
        g.timers.goodEnding = 5 * g.timers.endingTextFadeOut + 60 * 2
        g.timers.easterEggEnding = 1 * g.timers.endingTextFadeOut + 60 * 2
        
        --g.endingTextFadeOutTime = 60 * 0.01
        g.endingTextLine = 1
        g.endingScreenMask = {x=0,y=0,w=160,h=144} 
        
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
        if(debug) then g.showMessageBox = false end
        
        -- Miscellaneous text boxes (start game, options, etc.)
        g.textBoxes =   {
                            instructionsScreen =    {
                                                        startGame = {x=52,y=128,w=59,h=6,text="Start Game"},
                                                    },
                            titleCreditsScreen =    {
                                                        titleScreen = {x=20,y=128,w=30,h=6,text="Back"}
                                                    },
                            titleScreen =   {
                                                startGame = {x=52,y=96,w=59,h=6,text="Start Game"},
                                                credits = {x=52,y=110,w=59,h=6,text="Credits"},
                                            },
                        }
        
        -- Which action is selected
        g.actionSelected = nil
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
                            
        g.mapTransitionIsLegal = false
        g.movementDirection = nil
        --g.itemSelected = ""
        
        g.textBuffer = {}
        
        g.playerState = {
            classOver = false,
            hasGasCan = false,
            numOfTimesLookedAtSun = 0,
            clockHour = 3,
            clockMinute = 45,
        }
        
        -- Which page of items are we on
        g.itemPage = 1
        g.itemCount = 0
        g.scrollItemPageLeft = {x=104,y=70,w=4,h=8}
        g.scrollItemPageRight = {x=150,y=70,w=4,h=8}
        g.mouse.scrollPageArrowHover = nil
        
        g.shadowPeople = {}
    end

return createGame