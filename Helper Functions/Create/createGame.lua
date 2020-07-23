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
        g.curLocation = loadRooms.bedroom
        
        -- Initialize items currently held
        g.items =   {}
                  
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
            darkest_green = {r=7/255, g=24/255, b=33/255},
            dark_green = {r=48/255, g=104/255, b=80/255},
            light_green = {r=134/255, g=192/255, b=108/255},
            lightest_green = {r=224/255, g=248/255, b=207/255},
        }
        
        love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
        
        -- Show the text box
        g.showTextBox = true
        
        -- Which action is selected
        g.actionSelected = nil
        
        g.screenTransition = {}
        g.screenTransition.active = false
        g.screenTransition.x = 0
        g.screenTransition.y = 0
        g.screenTransition.w = 160
        g.screenTransition.h = 144
        
        g.actionButtons =   {
                                close={},
                                look={},
                                open={},
                                push={},
                                put={},
                                take={},
                                talk={},
                                use={},
                            }
    end

return createGame