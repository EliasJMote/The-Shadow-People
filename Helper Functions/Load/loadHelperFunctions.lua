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
    
    -- Check if it is the correct time (8:35). If so, open the secret panel.
    --[[elseif(g.mouse.objectPointedAt == loadRooms.clockTowerInsideSecondFloor.objects.selectionButton) then
        g.showMessageBox = false
        g.textBuffer = {}
    
        if(hour == 8 and minute == 35 and loadRooms.clockTowerInsideSecondFloor.objects.panel.state ~= "Open") then
            loadRooms.clockTowerInsideSecondFloor.objects.panel.state = "Open"
            loadRooms.clockTowerInsideSecondFloor.objects.panel.text = {look={"It's a hidden panel. It's", "currently open."},open={"It's already open!"},pull={"It's already open!"}}
            loadRooms.clockTowerInsideSecondFloor.objects.hacksaw = loadObjects.hacksaw
            g.writeToTextDisplay({"As you press the button, a", "secret panel in the wall opens.", "A hacksaw falls out of the", "panel and clatters to the", "floor."})
            loadSFX.pickup:play()
        end]]
    end
end

function g.loadGame(loadFile)
    
    -- Read in the contents of the file
    local contents = love.filesystem.read(loadFile)
    
    createGame.create()
    g.showMessageBox = false
    
    local loadTable = json.decode(contents)
    
    g.playerState = loadTable.playerState
    g.items = loadTable.items
    
    for room_key,room_value in pairs(loadRooms) do
        if(room_key == "mirrorRoom") then
            print("ok")
        end
        room_value.state = loadTable.rooms[room_key].state
        for obj_key,obj_value in pairs(loadTable.rooms[room_key].objects) do
            if(room_value.objects[obj_key] ~= nil) then
                room_value.objects[obj_key].state = obj_value.state
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
    
    -- Check if the grave has already been moved
    if(loadRooms.graveyard.objects.grave.state == "Pushed") then
        loadRooms.graveyard.objects.stairs = {name="stairs",x=37,y=67,w=25,h=11,text={look={"Stairs. They lead down into the", "the earth. But what hides", "there?"},move=""},img=loadImages.graveStairs,move=""}
        loadGameText.graveyard.grave.pull = {"It has already been moved!"}
        loadGameText.graveyard.grave.push = {"It has already been moved!"}
        loadRooms.graveyard.objects.grave.text = loadGameText.graveyard.grave
    end
    
    -- Check if the cog has been placed already
    if(g.playerState.gearPlaced == true) then
        loadRooms.clockTowerInsideFirstFloor.objects.cogHole.text.look = {"It's a gear for the clock", "tower."}
        loadRooms.clockTowerInsideFirstFloor.objects.cogHole.text.put = {"The cog has already been", "placed."}
    end
    
    -- Check if the panel is open and the player has not yet picked up the hacksaw
    if(loadRooms.clockTowerInsideSecondFloor.objects.panel.state == "Open") then
        loadRooms.clockTowerInsideSecondFloor.objects.panel.text = {look={"It's a hidden panel. It's", "currently open."},open={"It's already open!"},pull={"It's already open!"}}
        local playerHasHacksaw = false
        for k,v in ipairs(g.items) do
            if(v.name == "Hacksaw") then
                playerHasHacksaw = true
            end
        end
        if not(playerHasHacksaw) then
            loadRooms.clockTowerInsideSecondFloor.objects.hacksaw = loadObjects.hacksaw
        end
    end
    
    if(loadRooms.graveyard.objects.grave.state == "Pushed") then
        loadRooms.graveyard.objects.grave.y = loadRooms.graveyard.objects.grave.y - 12
        loadGameText.graveyard.grave.pull = {"It has already been moved!"}
        loadGameText.graveyard.grave.push = {"It has already been moved!"}
    end
    
    if(loadRooms.gasStationInside.objects.button.state == "On") then
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
    
    if(loadRooms.street7.objects.sewerGate.state == "Broken") then
        loadRooms.street7.objects.sewerGate.text = {close={"It's been cut open. It can't be", "closed anymore."},look={"It's a sewer gate. It's been", "cut open."},move="North",open={"It's already open!"},pull={"It's already open!"},push={"It's already open!"}}
    end
    
    if(g.playerState.hasGas == true) then
        loadRooms.gasStationOutside.objects.pump1.text.use = {"Your car is already filled."}
        loadRooms.gasStationOutside.objects.pump2.text.use = {"Your car is already filled."}
    end
    
    if(g.playerState.classOver == true) then
        loadRooms.school1.music = loadMusic.houseDark
        loadRooms.school1.state = "dark"
        loadRooms.school2.objects.door.img.open = loadImages.classDoorOpenNight
        loadRooms.car2.state = "dark"
        loadRooms.car2.music = loadMusic.houseDark
        loadRooms.classroom.objects = {}
    end
    
    if(loadRooms.park1.objects.parkGate.state == "Closed") then
        loadRooms.park1.objects.parkGate.text.look={"It's a gate to a park."}
    end
    
    if(loadRooms.mirrorRoom.objects.mirror2.state == "Closed" or loadRooms.mirrorRoom.objects.mirror2.state == "Open") then
        loadRooms.mirrorRoom.objects.mirror2.text.close = {"You close the secret door."}
        loadRooms.mirrorRoom.objects.mirror2.text.open = {"You open the secret door."}
        loadRooms.mirrorRoom.objects.mirror2.text.look = {"A hidden room lies beyond the", "broken mirror."}
        loadRooms.mirrorRoom.objects.mirror2.text.move=""
        loadRooms.mirrorRoom.objects.mirror2.move=""
    end
    
    if(loadRooms.dreamMirrorRoom.objects.mirror3.state == "Broken") then
        loadRooms.dreamMirrorRoom.objects.mirror3.text.move=""
        loadRooms.dreamMirrorRoom.objects.mirror3.move=""
    end
    
    if(loadRooms.churchInside1.objects.candle1.state == "Lit"
        and loadRooms.churchInside1.objects.candle2.state == "Lit"
        and loadRooms.churchInside1.objects.wallCandelabra1.state == "Lit") then
        loadRooms.churchInside1.objects.churchInsideDoor={name="Door",x=13,y=30,w=10,h=37,img={closed=loadImages.churchDoorInsideClosed,open=loadImages.churchDoorInsideOpen},state="Closed",move="",text={close={"You close the door."},look={"It's a narrow door hidden in", "the wall."},open={"You open the door."},move="",}}
    end
    
    if(loadRooms.graveyardUnderground1.objects.statueHoldingDarkCrystalBall.state == "Lit") then
        loadRooms.graveyardUnderground1.objects.statueHoldingDarkCrystalBall.text.look = {"A statue holding a lit crystal", "ball."}
        loadRooms.graveyardUnderground1.objects.door = {name="Door",x=45,y=30,w=10,h=37,img={closed=loadImages.graveyardDoorClosed,open=loadImages.graveyardDoorOpen},state="Closed",move="",text={close={"You close the door."},look={"It's a narrow door hidden in", "the wall."},open={"You open the door."},move="",}}
    end
    
    loadRooms.nightmareGeometry2.backgrounds.light = loadImages.nightmareGeometry2
    
    loadRooms.nightmareGeometry4 =  {
                                        name="Nightmare Geometry 4",
                                        displayName="Cracked Wall?",
                                        state="Light",
                                        map=loadImages.TMap,
                                        music=loadMusic.nightmareGeometry,
                                        backgrounds={light=loadImages.nightmareGeometry4},
                                        objects={
                                                    -- Repeatedly checking this will eventually cause a shadow person appearing and screaming in pain
                                                    squiggleHoleInWall={name="Squiggle Hole in Wall",x=16,y=16,w=68,h=51,text={look={"It appears to be twisting,", "snaking cracks in the wall.", "It's faint, but you think you", "can hear someone screaming in", "pain deep inside the fissures,", "followed by what sounds like", "crawling..."}}},
                                                },
                                        exits={west="Nightmare Geometry 5",south="Nightmare Geometry 5",east="Nightmare Geometry 5"},
                                        backgroundStatic = true,
                                }
    
    for room_key,room_value in pairs(loadRooms) do
        --[[for load_room_key, load_room_value in pairs(loadTable.rooms) do
            if(room_value.name == load_room_value.name) then
                room_value.state = load_room_value
                break
            end
        end]]
        room_value.state = loadTable.rooms[room_key].state
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
    
    for k,v in pairs(loadRooms) do
        if(v.name == loadTable.curLocation) then
            g.curLocation = v
        end
    end
    
    g.itemPage = 1
    g.itemCount = #g.items
    
    if(g.curLocation.backgroundStatic) then
        g.backgroundStatic = true
    else
        g.backgroundStatic = false
    end
    
    g.music:stop()
    g.music = g.curLocation.music
    g.music:seek(0)
    g.music:play()
    
    g.playerState.numOfTimesLookedAtSun = 0
    g.playerState.numOfTimesLookedAtWallHole = 0
    g.timers.squiggleMan = 0
    
    createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="game"}})
    
    --return 
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
    local saveTable = {curLocation=g.curLocation.name,items=g.items,rooms=rooms,playerState=g.playerState}
    
    --local saveData = g.serializeTable(saveTable)
    local saveDataJson = json.encode(saveTable)
    
    --love.filesystem.write(saveFile, saveData)
    love.filesystem.write(saveFile, saveDataJson)
end
return loadHelperFunctions