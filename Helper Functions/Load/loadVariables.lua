local loadVariables = {}

local g = GLOBALS

function loadVariables.load()
    loadImages = {}
    
    -- Initialize the max FPS
    g.minDT = 1/60 -- 1 / max FPS
    g.nextTime = love.timer.getTime()
    
    -- Set up the mouse variables
    g.mouse = {}
    g.mouse.x, g.mouse.y = love.mouse.getPosition()
    
    -- Initialize scale of the game
    g.scale = {}
    
    g.translate = {x=0,y=0}
    
    -- Initialize game state
    g.state = "warning"
    
    -- Initialize the constant game timers
    g.timers = {}
    g.timers.global = 0
    g.timers.titleScreenLogo = 210
    g.timers.endingTextFadeOut = 60 * 10
    g.timers.endingTextTimeAddition = 60 * 2
    
    -- Divide the number of text lines by 4, then round up
    g.timers.goodEnding = 5 * g.timers.endingTextFadeOut + g.timers.endingTextTimeAddition 
    g.timers.badEnding = 6 * g.timers.endingTextFadeOut + g.timers.endingTextTimeAddition 
    g.timers.easterEggEnding = 1 * g.timers.endingTextFadeOut + g.timers.endingTextTimeAddition 
    g.timers.alienEnding = 11 * g.timers.endingTextFadeOut + g.timers.endingTextTimeAddition 
    g.timers.redPrinceEnding = 7 * g.timers.endingTextFadeOut + g.timers.endingTextTimeAddition
    
    -- 726 is the first video frame for the intro cutscene
    g.timers.video = 726
    
    -- Initialize events table
    g.events = {}
    
    g.titleCreditsPage = 1
    
    g.screenTransition = {x=0,y=0,w=160,h=144,active=false}
        
    g.actionButtons =   {
                            {text="Move",x=7,y=90,w=28,h=4+2},
                            
                            {text="Put",x=54+1,y=90,w=13,h=4+2},
                            {text="Take",x=87+1,y=90,w=18,h=4+2},
                            {text="Open",x=120+1,y=90,w=18,h=4+2},
                            
                            {text="Close",x=54+1,y=103,w=23,h=4+2},
                            {text="Use",x=87+1,y=103,w=13,h=4+2},
                            {text="Look",x=120+1,y=103,w=18,h=4+2},
                            
                            {text="Talk",x=54+1,y=116,w=18,h=4+2},
                            {text="Push",x=87+1,y=116,w=18,h=4+2},
                            {text="Pull",x=120+1,y=116,w=18,h=4+2},
                        }
                        
    g.pauseButton = {x=143,y=127,w=15,h=15}
                   
    -- List of all states that objects can be in the game
    g.objectStates = {"On", "Off", "Open", "Closed", "Locked", "Stuck", "Rusted", "Lit", "Unlit"}
          
    g.endingScreenMask = {x=4,y=76,w=152,h=64} 
        
    -- game boy studio palette
    g.colors = {
        darkestGreen = {r=7/255, g=24/255, b=33/255},
        darkGreen = {r=48/255, g=104/255, b=80/255},
        lightGreen = {r=134/255, g=192/255, b=108/255},
        lightestGreen = {r=224/255, g=248/255, b=207/255},
    }
          
    
    g.scrollItemPageLeft = {x=104,y=70,w=4,h=8}
    g.scrollItemPageRight = {x=150,y=70,w=4,h=8}
    
    g.savedString = ""
    g.previousState = nil
    
    g.screenTransition.active = false
    g.timers.squiggleMan = 0
    g.timers.shadowChild = 0
end

return loadVariables