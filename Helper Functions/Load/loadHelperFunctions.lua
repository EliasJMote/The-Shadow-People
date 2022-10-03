local loadHelperFunctions = {}

local g = GLOBALS

function g.deepCopy(a)
    local b = {}
    for k in pairs(a) do
        if(type(a[k]) == "table") then
            b[k] = g.deepCopy(a[k])
        else
            b[k] = a[k]
        end
    end
    return b
end

function g.round(x)
    return math.floor(x + 0.5)
end
-- Write to the game's text display
function g.writeToTextDisplay(text)

    -- Show the text box
    g.showMessageBox = true

    -- Clear the current text
    g.textBuffer = {}

    -- For each line in the text, insert them into the text display at the start in reverse order
    for k,v in ipairs(text) do
        table.insert(g.textBuffer, v)
    end
        
end

function g.stateTransition(state1, state2)
end
function g.mouseCollision(mouseX, mouseY,obj)
    if(mouseX >= obj.x and mouseX <= obj.x + obj.w
        and mouseY >= obj.y and mouseY <= obj.y + obj.h) then
        return true
    else
        return false
    end
end

function g.highlightText(textBox,textSize)
    if(g.state ~= "game") then
        love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
    else
        love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
    end
    -- Highlight moused-over text or selected actions
    if not(g.screenTransition.active) then
        if(g.mouseCollision(g.mouse.x, g.mouse.y,textBox) or g.actionSelected == textBox.text or g.itemSelected == textBox.text) then
            if(g.state ~= "game") then
                love.graphics.setColor(g.colors.lightestGreen.r, g.colors.lightestGreen.g, g.colors.lightestGreen.b, 1)
            else
                love.graphics.setColor(g.colors.lightGreen.r, g.colors.lightGreen.g, g.colors.lightGreen.b, 1)
            end
        end
    end

    love.graphics.print(textBox.text, textBox.x, textBox.y, 0, textSize or 0.5, textSize or 0.5)
    if(debug) then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle("line", textBox.x, textBox.y, textBox.w, textBox.h) -- draw red rectangles over clickable objects
    end
    love.graphics.setColor(g.colors.darkestGreen.r, g.colors.darkestGreen.g, g.colors.darkestGreen.b, 1)
end

function g.checkClock()
    -- Manipulate the clock
    if(g.mouse.objectPointedAt == loadRooms.clockTowerInsideSecondFloor.objects.hourButton
        or g.mouse.objectPointedAt == loadRooms.clockTowerInsideSecondFloor.objects.minuteButton) then
        g.showMessageBox = false
        g.textBuffer = {}
    end
        if(g.mouse.objectPointedAt == loadRooms.clockTowerInsideSecondFloor.objects.selectionButton) then
                                        
        local hourAngle = math.deg(loadRooms.clockTowerInsideSecondFloor.objects.hourHand.rot.r) % 360
        local minuteAngle = math.deg(loadRooms.clockTowerInsideSecondFloor.objects.minuteHand.rot.r) % 360

        local hour = 12
        local minute = 0
        
        if(hourAngle ~= 0) then hour = 12 - g.round(hourAngle / 30) end
        if(minuteAngle ~= 0) then minute = 60 - g.round((minuteAngle * 5) / 30) end
    
        -- Check if it is the correct time (8:35). If so, open the secret panel.
        if(hour == 8 and minute == 35) then
            if(loadRooms.clockTowerInsideSecondFloor.objects.panel.state ~= "Open") then
                g.showMessageBox = false
                g.textBuffer = {}
                
                loadRooms.clockTowerInsideSecondFloor.objects.panel.state = "Open"
                loadRooms.clockTowerInsideSecondFloor.objects.panel.text = {look={"It's a hidden panel. It's", "currently open."},open={"It's already open!"},pull={"It's already open!"}}
                loadRooms.clockTowerInsideSecondFloor.objects.hacksaw = loadObjects.hacksaw
                g.writeToTextDisplay({"As you press the button, a", "secret panel in the wall opens.", "A hacksaw falls out of the", "panel and clatters to the", "floor."})
                loadSFX.pickup:play()
            else
                g.showMessageBox = false
                g.textBuffer = {}
                g.writeToTextDisplay({"The panel is open already!"})
            end
        end
    end
end
function g.updateGrave()
    -- Move the grave up and update text
    loadRooms.graveyard.objects.grave.text.pull = {"It has already been moved!"}
    loadRooms.graveyard.objects.grave.text.push = {"It has already been moved!"}
    
    loadRooms.graveyard.objects.stairs = {name="stairs",x=37,y=67,w=25,h=11,text={look={"Stairs. They lead down into the", "the earth. But what hides", "there?"},move=""},img=loadImages.graveStairs,move=""}
    loadRooms.graveyard.objects.grave.state = "Pushed"
    
    -- Move the grave and update the map
    loadRooms.graveyard.objects.grave.y = loadRooms.graveyard.objects.grave.y - 12
    
    -- Update the map
    loadRooms.graveyard.map = loadImages.twoWayVerticalMap
    loadRooms.graveyard.exits.north = "Statue Room"
end
function g.activateGasPumps()
    loadRooms.gasStationInside.objects.button.text.look={"It's a button to turn on the", "gas pumps. The pumps are", "receiving power."}
    loadRooms.gasStationInside.objects.button.text.push={"The pumps are already on!"}
    loadRooms.gasStationInside.objects.button.text.use={"The pumps are already on!"}
    loadRooms.gasStationOutside.objects.pump1.state = "On"
    loadRooms.gasStationOutside.objects.pump1.text.look={"It's a gas pump. It's receiving", "power."}
    loadRooms.gasStationOutside.objects.pump1.text.use={"You fill your car up with gas."}
    loadRooms.gasStationOutside.objects.pump2.state = "On"
    loadRooms.gasStationOutside.objects.pump2.text.look={"It's a gas pump. It's receiving", "power."}
    loadRooms.gasStationOutside.objects.pump2.text.use={"You fill your car up with gas."}
end
function g.playerCarHasGasoline()
    loadRooms.gasStationOutside.objects.pump1.text.use = {"Your car is already filled."}
    loadRooms.gasStationOutside.objects.pump2.text.use = {"Your car is already filled."}
end
function g.revealStatueRoomHiddenDoorOnMap()
    
    -- Reveal the hidden door in the statue room
        loadRooms.graveyardUnderground1.objects.door = {name="Door",x=45,y=30,w=10,h=37,img={closed=loadImages.graveyardDoorClosed,open=loadImages.graveyardDoorOpen},state="Closed",move="",text={close={"You close the door."},look={"It's a narrow door hidden in", "the wall."},open={"You open the door."},move="",}}
    
    -- The statue holding a dark crystal ball opens a door when the light reflects off the mirror and hits the dark crystal ball
    loadRooms.graveyardUnderground1.objects.statueHoldingDarkCrystalBall.text.look = {"A statue holding a lit crystal", "ball."}
    
    -- Update the map
    loadRooms.graveyardUnderground1.map = loadImages.twoWayVerticalMap
    loadRooms.graveyardUnderground1.exits.north = "Graveyard Underground"
end

function g.revealChurchHiddenDoorOnMap()
    -- Update the map
    loadRooms.churchInside1.map = loadImages.threeWayLeftMap
    loadRooms.churchInside1.exits.north = "Mirror Room"
end

function g.schoolEveningToNight()
    loadRooms.classroom.objects = {}
    loadRooms.school1.music = loadMusic.houseDark
    loadRooms.school1.state = "dark"
    loadRooms.school2.objects.door.img.open = loadImages.classDoorOpenNight
    loadRooms.car2.state = "dark"
    loadRooms.car2.music = loadMusic.houseDark
end

function g.brokenNormalMirrorState(mirror)
    mirror.text.look={"A long mirror. It's been", "smashed to pieces."}
end

function g.smashNormalMirror(mirror)
    mirror.state = "Broken"
    g.writeToTextDisplay({"You smash the mirror to pieces."})
    g.brokenNormalMirrorState(mirror)
    loadSFX.glassShattering:play()
end
function g.updateSewerGateText()
    loadRooms.street5.objects.sewerGate.text = {close={"It's been cut open. It can't be", "closed anymore."},look={"It's a sewer gate. It's been", "cut open."},move="North",open={"It's already open!"},pull={"It's already open!"},push={"It's already open!"}}
end
function g.updatePuzzlingStoneMap()
    -- Update the map
    loadRooms.puzzlingStone.map = loadImages.twoWayVerticalMap
    loadRooms.puzzlingStone.exits.north = "Altar Room"
end
function g.updatePuzzlingStonePuzzle()
    g.showMessageBox = false
    g.textBuffer = {}
    
    for i=0,8 do
        if(g.mouse.objectPointedAt == loadRooms.puzzlingStone.objects["button" .. (i+1)]) then 
            if(loadRooms.puzzlingStone.objects["button" .. (i+1)].state == "Off") then
                loadRooms.puzzlingStone.objects["button" .. (i+1)].state = "On"
            else
                loadRooms.puzzlingStone.objects["button" .. (i+1)].state = "Off"
            end
        end
    end
    
    if(loadRooms.puzzlingStone.objects.button1.state == "On"
        and loadRooms.puzzlingStone.objects.button2.state == "Off"
        and loadRooms.puzzlingStone.objects.button3.state == "Off"
        and loadRooms.puzzlingStone.objects.button4.state == "Off"
        and loadRooms.puzzlingStone.objects.button5.state == "On"
        and loadRooms.puzzlingStone.objects.button6.state == "Off"
        and loadRooms.puzzlingStone.objects.button7.state == "On"
        and loadRooms.puzzlingStone.objects.button8.state == "On"
        and loadRooms.puzzlingStone.objects.button9.state == "Off"
        and loadRooms.puzzlingStone.objects.door.state == "Stuck") then
        g.showMessageBox = true
        g.writeToTextDisplay({"The door suddenly opens."})
        loadRooms.puzzlingStone.objects.door.state = "Open"
        
        -- Update the map
        g.updatePuzzlingStoneMap()
        
        loadSFX.pickup:play()
    end
end
function g.updateHiddenDoorInMirror()
    loadRooms.mirrorRoom.objects.mirror2.text.close = {"You close the secret door."}
    loadRooms.mirrorRoom.objects.mirror2.text.open = {"You open the secret door."}
    loadRooms.mirrorRoom.objects.mirror2.text.move=""
    loadRooms.mirrorRoom.objects.mirror2.move = ""
    loadRooms.mirrorRoom.objects.mirror2.text.look = {"A hidden room lies beyond the", "broken mirror."}
    
    
    -- Update the map
    loadRooms.mirrorRoom.map = loadImages.twoWayVerticalMap
    loadRooms.mirrorRoom.exits.north = "Church Inside Secret Room"
    --loadRooms.churchInside1.exits.east = "Mirror Room"
    loadRooms.churchInside1.exits.north = nil
    loadRooms.churchInside1.exits.north = "Mirror Room"
end
function g.updateSpacePortalInMirror()
    loadRooms.dreamMirrorRoom.objects.mirror3.text.move = ""
    loadRooms.dreamMirrorRoom.objects.mirror3.move = ""
    loadRooms.dreamMirrorRoom.objects.mirror3.text.look = {"A hidden portal to another", "planet lies beyond the broken", "mirror."}
    
    -- Update the map
    loadRooms.dreamMirrorRoom.map = loadImages.oneWayUpMap
    loadRooms.dreamMirrorRoom.exits.north = ""
end
function g.loadGame(loadFile)
    
    -- Read in the contents of the file
    local contents = love.filesystem.read(loadFile)
    
    createGame.create()
    g.showMessageBox = false
    
    local loadTable = json.decode(contents)
    
    g.playerState = loadTable.playerState
    g.items = loadTable.items
    g.mapTransitionIsLegal = true
    
    -- Move objects offscreen if the player has picked them up already
    for room_key,room_value in pairs(loadRooms) do
        
        -- Set the room's state to be the loaded game's state
        room_value.state = loadTable.rooms[room_key].state
        
        -- For each object in the loaded game's object table
        for obj_key,obj_value in pairs(loadTable.rooms[room_key].objects) do
            
            --
            if(room_value.objects[obj_key] ~= nil) then
                
                -- Set the object state in the room to be the loaded game's object state
                room_value.objects[obj_key].state = obj_value.state
                
                -- Move it offscreen if needed
                if(obj_value.state == "offscreen") then
                   room_value.objects[obj_key].x = -256
                   room_value.objects[obj_key].y = -256
                end
            end
        end
        
        if(room_value == loadRooms.livingRoom or room_value == loadRooms.bedroom or room_value == loadRooms.gasStationBathroom or room_value == loadRooms.school1
            or room_value == loadRooms.car2) then
            if(room_value.state == "Light" and room_value.music ~= loadMusic.houseLight) then
                room_value.music = loadMusic.houseLight
            elseif(room_value.state == "Dark" and room_value.music ~= loadMusic.houseDark) then
                room_value.music = loadMusic.houseDark
            end
        end
    end
    
    -- For each room in the room table
    for room_key,room_value in pairs(loadRooms) do
        
        -- Set the room to be the same state as before
        room_value.state = loadTable.rooms[room_key].state
        
        -- Set all object states
        for obj_key,obj_value in pairs(loadTable.rooms[room_key].objects) do
            if(room_value.objects[obj_key] ~= nil) then
                room_value.objects[obj_key].state = obj_value.state
                if(obj_value.state == "offscreen") then
                   room_value.objects[obj_key].x = -256
                   room_value.objects[obj_key].y = -256
                end
            end
        end
    end
    
    -- Check if the grave has already been moved
    if(loadRooms.graveyard.objects.grave.state == "Pushed") then
        g.updateGrave()
    end
    
    -- Check if the cog has been placed already
    if(g.playerState.gearPlaced == true) then
        loadRooms.clockTowerInsideFirstFloor.objects.cogHole.text.look = {"It's a gear for the clock", "tower."}
        loadRooms.clockTowerInsideFirstFloor.objects.cogHole.text.put = {"The cog has already been", "placed."}
    end
    
    -- If the panel is locked and the hacksaw is offscreen, restore it back to original state
    if(loadRooms.clockTowerInsideSecondFloor.objects.panel.state == "Locked") then
        if(loadObjects.hacksaw.state == "offscreen") then
           loadObjects.hacksaw = {name="Hacksaw",x=70,y=70,w=13,h=7,text={look={"It's a hacksaw. It can be used", "to cut metal, such as pipes."},take={"You take the hacksaw."}},item={name="Hacksaw",w=33,h=4,description={"It's a hacksaw. It can be used", "to cut metal, such as pipes."}},img=loadImages.hacksaw}
            loadObjects.hacksaw.state = "item"
            loadObjects.hacksaw.img = {item=loadObjects.hacksaw.img,offscreen=loadObjects.hacksaw.img}
        end
    end
    
    -- Check if the panel is open and the player has not yet picked up the hacksaw
    if(loadRooms.clockTowerInsideSecondFloor.objects.panel.state == "Open") then
        loadRooms.clockTowerInsideSecondFloor.objects.panel.text = {look={"It's a hidden panel. It's", "currently open."},open={"It's already open!"},pull={"It's already open!"}}
        local playerHasHacksaw = false
        
        -- Check if the player has the hacksaw
        for k,v in ipairs(g.items) do
            if(v.name == "Hacksaw") then
                playerHasHacksaw = true
            end
        end
        
        -- If the player has not picked up the hacksaw yet, spawn it in the clock tower second floor
        if not(playerHasHacksaw) then
            loadRooms.clockTowerInsideSecondFloor.objects.hacksaw = loadObjects.hacksaw
        end
    end
    
    -- Check if the button is on in the gas station store
    if(loadRooms.gasStationInside.objects.button.state == "On") then
        g.activateGasPumps()
    end
    
    if(loadRooms.street5.objects.sewerGate.state == "Broken") then
        g.updateSewerGateText()
    end
    
    if(g.playerState.hasGas == true) then
        g.playerCarHasGasoline()
    end
    
    if(g.playerState.classOver == true) then
        g.schoolEveningToNight()
    end
    
    if(loadRooms.park1.objects.parkGate.state == "Closed" or loadRooms.park1.objects.parkGate.state == "Open") then
        loadRooms.park1.objects.parkGate.text.look={"It's a gate to a park."}
    end
    
    if(loadRooms.mirrorRoom.objects.mirror1.state == "Broken") then
        g.brokenNormalMirrorState(loadRooms.mirrorRoom.objects.mirror1)
    end
    
    if(loadRooms.mirrorRoom.objects.mirror3.state == "Broken") then
        g.brokenNormalMirrorState(loadRooms.mirrorRoom.objects.mirror3)
    end
    
    if(loadRooms.mirrorRoom.objects.mirror2.state == "Closed" or loadRooms.mirrorRoom.objects.mirror2.state == "Open") then
        g.updateHiddenDoorInMirror()
    end
    
    if(loadRooms.puzzlingStone.objects.door.state == "Open") then
        g.updatePuzzlingStoneMap()
    end
    
    if(loadRooms.dreamMirrorRoom.objects.mirror1.state == "Broken") then
        g.brokenNormalMirrorState(loadRooms.dreamMirrorRoom.objects.mirror1)
    end
    
    if(loadRooms.dreamMirrorRoom.objects.mirror2.state == "Broken") then
        g.brokenNormalMirrorState(loadRooms.dreamMirrorRoom.objects.mirror2)
    end
    
    -- If the player smashes the dream mirror, they can transition to the Shadow Lands
    if(loadRooms.dreamMirrorRoom.objects.mirror3.state == "Broken") then
        g.updateSpacePortalInMirror()
    end
    
    -- If the player lights the three candles in the church, reveal the hidden door
    if(loadRooms.churchInside1.objects.candle1.state == "Lit"
        and loadRooms.churchInside1.objects.candle2.state == "Lit"
        and loadRooms.churchInside1.objects.wallCandelabra1.state == "Lit") then
        
        -- Reveal the hidden door
        loadRooms.churchInside1.objects.churchInsideDoor={name="Door",x=13,y=30,w=10,h=37,img={closed=loadImages.churchDoorInsideClosed,open=loadImages.churchDoorInsideOpen},state="Closed",move="",text={close={"You close the door."},look={"It's a narrow door hidden in", "the wall."},open={"You open the door."},move="",}}
        
        -- Update the map
        g.revealChurchHiddenDoorOnMap()
    end
    
    g.mouse.objectPointedAt = nil
    
    -- If the player used the mirror to reveal the hidden door
    if(loadRooms.graveyardUnderground1.objects.statueHoldingDarkCrystalBall.state == "Lit") then
        g.revealStatueRoomHiddenDoorOnMap()
    end
    
    loadRooms.nightmareGeometry2.backgrounds.light = loadImages.nightmareGeometry2
    
    -- Reset Squiggly Man's room
    loadRooms.nightmareGeometry4.objects={squiggleHoleInWall={name="Squiggle Hole in Wall",x=16,y=16,w=68,h=51,text={look={"It appears to be twisting,", "snaking cracks in the wall.", "It's faint, but you think you", "can hear someone screaming in", "pain deep inside the fissures,", "followed by what sounds like", "crawling..."}}}}
    
    -- Reset the church basement
    loadRooms.churchBasement.objects.wallCandelabra1.state = "Lit"
    loadRooms.churchBasement.objects.wallCandelabra2.state = "Lit"
    
    -- Place the player at the current location
    for k,v in pairs(loadRooms) do
        if(v.name == loadTable.curLocation) then
            g.curLocation = v
        end
    end
    
    g.itemPage = 1
    g.itemCount = #g.items
    
    -- Turn background static on if the room has it
    if(g.curLocation.backgroundStatic) then
        g.backgroundStatic = true
    else
        g.backgroundStatic = false
    end
    
    -- Stop music if it currently exists
    if(g.music ~= nil) then
        g.music:stop()
    end
    
    -- If the location has music to load, load it. Otherwise, do nothing (the shed doesn't have music, so it's value is nil when loaded).
    if(g.curLocation.music ~= nil) then
        g.music = g.curLocation.music
        g.music:seek(0)
        g.music:play()
    end
    
    -- Reset looking at the sun, the wall hole, and squiggle man
    g.playerState.numOfTimesLookedAtSun = 0
    g.playerState.numOfTimesLookedAtWallHole = 0
    g.timers.squiggleMan = 0
    
    -- Clear the mouse cursor state
    g.clearMouseCursorState()
    
    -- Clear selected items
    g.actionSelected = nil
    g.itemSelected = nil
    
    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
end
function g.saveGame(saveFile)
    local rooms = {}
    
    for room_key,room_value in pairs(loadRooms) do
        rooms[room_key] = {state=room_value.state,objects={}}
        for obj_key,obj_val in pairs(room_value.objects) do
            --rooms[k1]
            if(obj_val.state ~= nil) then
                rooms[room_key].objects[obj_key] = {state=obj_val.state}
            end
        end
    end
    
    -- Save rooms, items, player state, current location
    local saveTable = {curLocation=g.curLocation.name,dateTime=os.date('*t'),items=g.items,rooms=rooms,playerState=g.playerState}
    
    --local saveData = g.serializeTable(saveTable)
    local saveDataJson = json.encode(saveTable)
    
    --love.filesystem.write(saveFile, saveData)
    love.filesystem.write(saveFile, saveDataJson)
end

function g.clearMouseCursorState()
    g.mouse.objectHover = nil
    g.mouse.mapHover = nil
    g.mouse.actionHover = nil
    g.mouse.itemMenuHoverItem = nil
    g.mouse.scrollPageArrowHover = nil
end
function g.fromGameToTransition(state)
    g.mapTransitionIsLegal = false
    g.clearMouseCursorState()
    g.textBuffer = {}
    g.showMessageBox = false
    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state=state}})
end
function g.goToTitleScreen()
    g.video = 0
    g.clearMouseCursorState()
    
    -- Stop music only if it exists
    if(g.music ~= nil) then
        g.music:stop()
    end
    
    loadSFX.squiggleManScream:stop()
    g.playerState.numOfTimesLookedAtWallHole = 0
    g.timers.squiggleMan = 0
    g.timers.shadowChild = 0
    g.music = loadMusic.title
    g.music:play()
    g.backgroundStatic = false
    g.state = "title"
    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="title"}})
end
return loadHelperFunctions