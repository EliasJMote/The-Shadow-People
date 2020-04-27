local createGame = {}

    function createGame.create()

        local g = GLOBALS
        
        g.state = "title"
        
        -- Locations:
        g.curLocation = {name="Bedroom", state="Dark"}
        
        
        g.items = {
                    {text="Textbook"}
                  }
        
        g.scale = {}
        
        -- current text onscreen
        g.curText = {}
        
        -- timer for game actions
        g.timer = 0
        
        -- game boy studio palette
        g.colors = {
            darkest_green = {r=7/255, g=24/255, b=33/255},
            dark_green = {r=48/255, g=104/255, b=80/255},
            light_green = {r=134/255, g=192/255, b=108/255},
            lightest_green = {r=224/255, g=248/255, b=207/255},
        }
        
        love.graphics.setColor(g.colors.darkest_green.r, g.colors.darkest_green.g, g.colors.darkest_green.b, 1)
        
        
    end

return createGame