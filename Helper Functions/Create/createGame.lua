local createGame = {}

    function createGame.create()

        local g = GLOBALS
        
        g.state = "title"
        
        -- Locations:
        g.curLocation = {
                            name="Bedroom",
                            state="Dark",
                            objects={
                                        {name="Door",x=60,y=17,w=24,h=36,text={"You open the door."}},
                                        {name="Light Switch",x=52,y=30,w=4,h=6,text={"You turn the light off."}},
                                        {name="Mirror",x=19,y=30,w=6,h=9,text={"You look in the mirror."}},
                                        {name="Mountain Picture",x=28,y=30,w=7,h=9,text={"You examine the picture."}},
                                        {name="Portrait Picture",x=39,y=30,w=7,h=9,text={"You examine the picture."}},
                                        {name="Text Book",x=46,y=19,w=1,h=8,text={"You take the book."}},
                                        {name="Window",x=3,y=21,w=10,h=26,text={"You look at the night sky."}},
                                    }
                        }
        
        
        g.items =   {
                        --{text="Textbook"}
                    }
                  
        g.displayText = true
        g.objectPointedAt = nil
        
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