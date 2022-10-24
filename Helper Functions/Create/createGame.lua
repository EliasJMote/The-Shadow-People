local createGame = {}

    function createGame.create()

        local g = GLOBALS
        
        g.backgroundStatic = false
        
        -- Create the game rooms
        createRooms.create()
        
        -- Initialize current location
        g.curLocation = loadRooms.bedroom
        if(debug) then
            --g.curLocation = loadRooms.patio
        end
        
        -- Initialize items currently held
        g.items = {}
                  
        g.displayText = true
        g.objectPointedAt = nil
        
        -- current text onscreen
        g.curText = {}
        
        -- Reset timers for game actions
        g.timers.global = 0
        g.timers.screenTransition = 0
        g.timers.endingText = 0
        g.timers.video = 0
        
        -- Horror related timers (with Shadow People)
        g.timers.squiggleMan = 0
        g.timers.shadowChild = 0
        g.timers.gasStationBathroomMirrorShadow = 0
        
        --g.endingTextFadeOutTime = 60 * 0.01
        g.endingTextLine = 1
        
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
        
        -- Show the message box
        g.showMessageBox = true
        if(debug) then
            g.showMessageBox = false
        end
        
        -- Which action is selected
        g.actionSelected = nil
        
        g.textBuffer = {}
        
        g.playerState = {
            classOver = false,
            gearPlaced = false,
            hasGas = false,
            hasShadowOrb = false,
            hasEclipseBrooch = false,
            hasNecklace = false,
            numOfTimesLookedAtSun = 0,
            numOfTimesLookedAtWallHole = 0,
            lookedAtGasStationBathroomMirror = false,
        }
        
        g.mapTransitionIsLegal = false
        g.movementDirection = nil
        
        -- Which page of items are we on
        g.itemPage = 1
        g.itemCount = 0
        g.mouse.scrollPageArrowHover = nil
        
        g.previousState = nil
        
        -- Clear the mouse cursor state
        g.clearMouseCursorState()
        
        -- Clear selected items
        g.actionSelected = nil
        g.itemSelected = nil
        
        for k,v in pairs(loadSFX) do
            v:setVolume(1)
            v:setPitch(1)
        end
        
        g.shadowPeople = {}
    end

return createGame