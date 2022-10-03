local loadObjectImages = {}

function loadObjectImages.load()
    loadImages.altar = love.graphics.newImage("Images/Objects/Shadow Lands/Altar.png")
    loadImages.bedroomDoorClosed = love.graphics.newImage("Images/Objects/Bedroom/Bedroom Door Closed.png")
    loadImages.bedroomDoorOpen = love.graphics.newImage("Images/Objects/Bedroom/Bedroom Door Open.png")
    loadImages.button = love.graphics.newImage("Images/Objects/Clock Tower Inside Second Floor/Button.png")
    
    -- Load church images
    loadImages.churchBasementLadder = love.graphics.newImage("Images/Objects/Church Basement/Ladder.png")
    loadImages.churchBasementShadow = love.graphics.newImage("Images/Objects/Church Basement/Shadow.png")
    loadImages.churchBasementShadow2 = love.graphics.newImage("Images/Objects/Church Basement/Shadow 2.png")
    loadImages.churchBasementShadow3 = love.graphics.newImage("Images/Objects/Church Basement/Shadow 3.png")
    loadImages.churchBasementShadow4 = love.graphics.newImage("Images/Objects/Church Basement/Shadow 4.png")
    loadImages.churchBasementShadow5 = love.graphics.newImage("Images/Objects/Church Basement/Shadow 5.png")
    loadImages.churchBasementMirror = love.graphics.newImage("Images/Objects/Church Basement/Mirror.png")
    
    loadImages.churchDoorOutsideClosed = love.graphics.newImage("Images/Objects/Church Outside/Church Outside Door Closed.png")
    loadImages.churchDoorOutsideOpen = love.graphics.newImage("Images/Objects/Church Outside/Church Outside Door Open.png")
    loadImages.churchDoorInsideClosed = love.graphics.newImage("Images/Objects/Church Inside/Church Door (Closed).png")
    loadImages.churchDoorInsideOpen = love.graphics.newImage("Images/Objects/Church Inside/Church Door (Open).png")
    loadImages.churchTrapDoorClosed = love.graphics.newImage("Images/Objects/Church Inside/Trap Door (Closed).png")
    loadImages.churchTrapDoorOpen = love.graphics.newImage("Images/Objects/Church Inside/Trap Door (Open).png")
    
    -- Load classroom images
    loadImages.classDoorClosed = love.graphics.newImage("Images/Objects/School/School Door (Closed).png")
    loadImages.classDoorOpen = love.graphics.newImage("Images/Objects/School/School Door (Open).png")
    loadImages.classDoorOpenNight = love.graphics.newImage("Images/Objects/School/School Door (Open, Night).png")
    
    -- Load clock tower images
    loadImages.clockTowerOutsideDoorClosed = love.graphics.newImage("Images/Objects/Clock Tower Outside/Clock Tower Outside Door Closed.png")
    loadImages.clockTowerOutsideDoorOpen = love.graphics.newImage("Images/Objects/Clock Tower Outside/Clock Tower Outside Door Open.png")
    loadImages.cogHole = love.graphics.newImage("Images/Objects/Clock Tower Inside First Floor/Cog Hole.png") 
    
    -- Load gas station objects
    loadImages.gasStationButtonOff = love.graphics.newImage("Images/Objects/Gas Station/Gas Station Inside Button (Off).png")
    loadImages.gasStationButtonOn = love.graphics.newImage("Images/Objects/Gas Station/Gas Station Inside Button (On).png")
    loadImages.gasStationStoreDoorClosed = love.graphics.newImage("Images/Objects/Gas Station/Store Door (Closed).png")
    loadImages.gasStationStoreDoorOpen = love.graphics.newImage("Images/Objects/Gas Station/Store Door (Open).png")
    
    -- Load graveyard images
    loadImages.grave = love.graphics.newImage("Images/Objects/Graveyard/Grave.png")
    loadImages.graveStairs = love.graphics.newImage("Images/Objects/Graveyard/Stairs.png")
    loadImages.graveyardDoorClosed = love.graphics.newImage("Images/Objects/Graveyard Underground/Graveyard Door (Closed).png")
    loadImages.graveyardDoorOpen = love.graphics.newImage("Images/Objects/Graveyard Underground/Graveyard Door (Open).png")
    loadImages.graveyardNote = love.graphics.newImage("Images/Objects/Graveyard Underground/Note.png")
    
    -- Load mirror images
    loadImages.hangingMirrorFat = love.graphics.newImage("Images/Objects/Mirror Room/Hanging Mirror (Fat).png")
    loadImages.hangingMirrorFatBroken = love.graphics.newImage("Images/Objects/Dream Mirror Room/Hanging Mirror (Fat, Broken).png")
    loadImages.hangingMirrorFatBrokenClosed = love.graphics.newImage("Images/Objects/Mirror Room/Hanging Mirror (Fat, Broken, Closed).png")
    loadImages.hangingMirrorFatBrokenOpen = love.graphics.newImage("Images/Objects/Mirror Room/Hanging Mirror (Fat, Broken, Open).png")
    loadImages.hangingMirrorThin = love.graphics.newImage("Images/Objects/Mirror Room/Hanging Mirror (Thin).png")
    loadImages.hangingMirrorThinBroken = love.graphics.newImage("Images/Objects/Mirror Room/Hanging Mirror (Thin, Broken).png")
    loadImages.hangingMirrorThinBrokenSpace = love.graphics.newImage("Images/Objects/Dream Mirror Room/Hanging Mirror (Thin, Broken, Space).png")
    
    -- Load house outside images
    loadImages.houseOutsideDoorClosed = love.graphics.newImage("Images/Objects/House Outside/Door Closed.png")
    loadImages.houseOutsideDoorOpen = love.graphics.newImage("Images/Objects/House Outside/Door Open.png")
    loadImages.hourHand = love.graphics.newImage("Images/Objects/Clock Tower Inside Second Floor/Hour Hand.png")
    loadImages.lamp = love.graphics.newImage("Images/Objects/Living Room/Lamp.png")
    
    -- Load lit candle images
    loadImages.litCandle = love.graphics.newImage("Images/Objects/Church Inside/Lit Candle.png")
    loadImages.litCandle2 = love.graphics.newImage("Images/Objects/Church Inside/Lit Candle 2.png")
    loadImages.litWallCandelabra = love.graphics.newImage("Images/Objects/Church Inside/Lit Wall Candelabra.png")
    loadImages.litWallCandelabra2 = love.graphics.newImage("Images/Objects/Church Inside/Lit Wall Candelabra 2.png")
    
    -- Load living room door
    loadImages.livingRoomDoorClosed = love.graphics.newImage("Images/Objects/Living Room/Living Room Door Closed.png")
    loadImages.livingRoomDoorOpen = love.graphics.newImage("Images/Objects/Living Room/Living Room Door Open.png")
    loadImages.minuteHand = love.graphics.newImage("Images/Objects/Clock Tower Inside Second Floor/Minute Hand.png")
    
    -- Load the panel in the clock tower 2nd floor
    loadImages.panel = love.graphics.newImage("Images/Objects/Clock Tower Inside Second Floor/Panel.png")
    loadImages.panelOpen = love.graphics.newImage("Images/Objects/Clock Tower Inside Second Floor/Panel Open.png")
    
    -- Load the park gate images
    loadImages.parkGateClosed = love.graphics.newImage("Images/Objects/Park/Park Gate (Closed).png")
    loadImages.parkGateOpen = love.graphics.newImage("Images/Objects/Park/Park Gate (Open).png")
    loadImages.parkGateLocked = love.graphics.newImage("Images/Objects/Park/Park Gate (Locked).png")
    
    
    loadImages.professor = love.graphics.newImage("Images/Objects/Classroom/Professor.png")
    
    -- Load objects in the puzzling stone room (leading to the red prince)
    loadImages.puzzlingStoneButtonOff = love.graphics.newImage("Images/Objects/Puzzling Stone/Button Off.png")
    loadImages.puzzlingStoneButtonOn = love.graphics.newImage("Images/Objects/Puzzling Stone/Button On.png")
    loadImages.puzzlingStoneDoorClosed = love.graphics.newImage("Images/Objects/Puzzling Stone/Door Closed.png")
    loadImages.puzzlingStoneDoorOpen = love.graphics.newImage("Images/Objects/Puzzling Stone/Door Open.png")
    loadImages.sewerGate = love.graphics.newImage("Images/Objects/Streets/Sewer Gate.png")
    loadImages.sewerGateBroken = love.graphics.newImage("Images/Objects/Streets/Sewer Gate (Broken).png")
    loadImages.shedDoorClosed = love.graphics.newImage("Images/Objects/Park/Shed Door (Closed).png")
    loadImages.shedDoorOpen = love.graphics.newImage("Images/Objects/Park/Shed Door (Open).png")
    --loadImages.shedTable = love.graphics.newImage("Images/Objects/Shed/Table.png")
    loadImages.statueWithDarkCrystalBall = love.graphics.newImage("Images/Objects/Graveyard Underground/Statue with Dark Crystal Ball.png")
    loadImages.statueWithLightCrystalBall = love.graphics.newImage("Images/Objects/Graveyard Underground/Statue with Light Crystal Ball.png")
    loadImages.statueWithoutBall = love.graphics.newImage("Images/Objects/Shadow Lands/Statue without Ball.png")
    loadImages.unlitCandelabra = love.graphics.newImage("Images/Objects/Church Inside/Unlit Candelabra.png")
    loadImages.unlitCandle = love.graphics.newImage("Images/Objects/Church Inside/Unlit Candle.png")
    loadImages.unlitWallCandelabra = love.graphics.newImage("Images/Objects/Church Inside/Unlit Wall Candelabra.png")
end

return loadObjectImages