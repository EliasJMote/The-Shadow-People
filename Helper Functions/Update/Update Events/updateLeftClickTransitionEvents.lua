local updateLeftClickTransitionEvents = {}

local g = GLOBALS

function updateLeftClickTransitionEvents.update(event)
    if(event.state == "car transition 1") then
        if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.transitionScreens.car1.startGame)) then
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
            g.curLocation = loadRooms.car2
        end
        
    elseif(event.state == "car transition 2") then
        if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.transitionScreens.car2.startGame)) then
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
            g.curLocation = loadRooms.car3
        end
        
    elseif(event.state == "car transition 3") then
        if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.transitionScreens.car3.startGame)) then
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
            g.curLocation = loadRooms.car4
        end
        
    elseif(event.state == "class transition") then
        if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.transitionScreens.class.startGame)) then
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
        end
        
    elseif(event.state == "dream transition") then
        if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.transitionScreens.dream.startGame)) then
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
            g.curLocation = loadRooms.dreamMirrorRoom
            g.music:stop()
            g.music = loadMusic.shadowLands
            g.music:play()
        end
        
    elseif(event.state == "space transition") then
        if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.transitionScreens.space.startGame)) then
            createEvent.create({name="Play Music", music=loadMusic.shadowLands})
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
            g.curLocation = loadRooms.shadowLands1
            g.backgroundStatic = true
        end
        
    elseif(event.state == "night transition") then
        if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.transitionScreens.car1.startGame)) then
            g.music:stop()
            -- Play the bad ending video
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="video bad ending"}})
        end
        
    elseif(event.state == "dark transition") then
        if(g.mouseCollision(event.mouse.x,event.mouse.y,g.textBoxes.transitionScreens.dark.startGame)) then
            createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
            g.curLocation = loadRooms.houseOutside
            g.music:stop()
            g.music = loadMusic.title
            g.music:play()
            g.backgroundStatic = false
        end
    end
end

return updateLeftClickTransitionEvents