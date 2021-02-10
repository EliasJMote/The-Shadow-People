local loadImages = {}

-- Intro screens
loadImages.titleScreen = love.graphics.newImage("Images/Intro Screens/Title Screen.png")
loadImages.rocStudiosLogo = love.graphics.newImage("Images/Intro Screens/Roc Studios Logo.png")

-- User interface
-- Cursors
loadImages.cursor = love.graphics.newImage("Images/User Interface/Cursors/Cursor Pointer.png")
loadImages.cursorClose = love.graphics.newImage("Images/User Interface/Cursors/Cursor Close.png")
loadImages.cursorEye = love.graphics.newImage("Images/User Interface/Cursors/Cursor Eye.png")
loadImages.cursorHand = love.graphics.newImage("Images/User Interface/Cursors/Cursor Hand.png")
loadImages.cursorMove = love.graphics.newImage("Images/User Interface/Cursors/Cursor Move.png")
loadImages.cursorOpen = love.graphics.newImage("Images/User Interface/Cursors/Cursor Open.png")
loadImages.cursorPull = love.graphics.newImage("Images/User Interface/Cursors/Cursor Pull.png")
loadImages.cursorPush = love.graphics.newImage("Images/User Interface/Cursors/Cursor Push.png")
loadImages.cursorPut = love.graphics.newImage("Images/User Interface/Cursors/Cursor Put.png")
loadImages.cursorTalk = love.graphics.newImage("Images/User Interface/Cursors/Cursor Talk.png")
loadImages.cursorTake = love.graphics.newImage("Images/User Interface/Cursors/Cursor Take.png")
loadImages.cursorUse = love.graphics.newImage("Images/User Interface/Cursors/Cursor Use.png")

-- GUI boxes
loadImages.userInterfaceTextBox = love.graphics.newImage("Images/User Interface/User Interface (Text).png")
loadImages.userInterfaceActions = love.graphics.newImage("Images/User Interface/User Interface (Actions).png")

-- Location background images
loadImages.altarRoom = love.graphics.newImage("Images/Backgrounds/Altar Room.png")
loadImages.bedroomDark = love.graphics.newImage("Images/Backgrounds/Bedroom (Dark).png")
loadImages.bedroomLight = love.graphics.newImage("Images/Backgrounds/Bedroom (Light).png")
loadImages.carDay = love.graphics.newImage("Images/Backgrounds/Car (Day).png")
loadImages.carEvening = love.graphics.newImage("Images/Backgrounds/Car (Evening).png")
loadImages.carNight = love.graphics.newImage("Images/Backgrounds/Car (Night).png")
loadImages.carNightCollision = love.graphics.newImage("Images/Backgrounds/Car (Night, Collision).png")
loadImages.churchInside = love.graphics.newImage("Images/Backgrounds/Church Inside.png")
loadImages.churchOutside = love.graphics.newImage("Images/Backgrounds/Church Outside.png")
loadImages.classroom = love.graphics.newImage("Images/Backgrounds/Classroom.png")
loadImages.clockTowerInside1F = love.graphics.newImage("Images/Backgrounds/Clock Tower Inside 1F.png")
loadImages.clockTowerInside2F = love.graphics.newImage("Images/Backgrounds/Clock Tower Inside 2F.png")
loadImages.clockTowerOutside = love.graphics.newImage("Images/Backgrounds/Clock Tower Outside.png")
--loadImages.crawlspace = love.graphics.newImage("Images/Backgrounds/Crawlspace.png")
loadImages.empty = love.graphics.newImage("Images/Backgrounds/Empty.png")
loadImages.emptyOutside = love.graphics.newImage("Images/Backgrounds/Empty Outside.png")
loadImages.emptyRoom = love.graphics.newImage("Images/Backgrounds/Empty Room.png")
loadImages.floodedLabyrinth1 = love.graphics.newImage("Images/Backgrounds/Flooded Labyrinth 1.png")
loadImages.floodedLabyrinth2 = love.graphics.newImage("Images/Backgrounds/Flooded Labyrinth 2.png")
loadImages.floodedLabyrinth3 = love.graphics.newImage("Images/Backgrounds/Flooded Labyrinth 3.png")
loadImages.floodedLabyrinth4 = love.graphics.newImage("Images/Backgrounds/Flooded Labyrinth 4.png")
loadImages.floodedLabyrinth5 = love.graphics.newImage("Images/Backgrounds/Flooded Labyrinth 5.png")
loadImages.gasStationBathroomDark = love.graphics.newImage("Images/Backgrounds/Gas Station Bathroom (Dark).png")
loadImages.gasStationBathroomLight = love.graphics.newImage("Images/Backgrounds/Gas Station Bathroom (Light).png")
loadImages.gasStationInside = love.graphics.newImage("Images/Backgrounds/Gas Station Inside.png")
loadImages.gasStationOutside = love.graphics.newImage("Images/Backgrounds/Gas Station Outside.png")
loadImages.graveyard = love.graphics.newImage("Images/Backgrounds/Graveyard.png")
loadImages.graveyardUnderground2 = love.graphics.newImage("Images/Backgrounds/Graveyard Underground 2.png")
loadImages.highway = love.graphics.newImage("Images/Backgrounds/Highway.png")
loadImages.highwayNorthEnd = love.graphics.newImage("Images/Backgrounds/Highway North End.png")
loadImages.highwayTIntersection = love.graphics.newImage("Images/Backgrounds/Highway T Intersection.png")
loadImages.kitchen = love.graphics.newImage("Images/Backgrounds/Kitchen.png")
loadImages.livingRoomDark = love.graphics.newImage("Images/Backgrounds/Living Room (Dark).png")
loadImages.livingRoomLight = love.graphics.newImage("Images/Backgrounds/Living Room (Light).png")
loadImages.mirrorRoom = love.graphics.newImage("Images/Backgrounds/Mirror Room.png")
loadImages.nightmareGeometry1 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 1.png")
loadImages.nightmareGeometry2 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 2.png")
loadImages.nightmareGeometry2_2 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 2_2.png")
loadImages.nightmareGeometry2_3 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 2_3.png")
loadImages.nightmareGeometry3 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 3.png")
loadImages.nightmareGeometry4 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 4.png")
loadImages.nightmareGeometry4WithCreature = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 4 (with creature).png")
loadImages.nightmareGeometry5 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 5.png")
loadImages.nightmareGeometry7 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 7.png")
loadImages.outsideDay = love.graphics.newImage("Images/Backgrounds/Outside (Day).png")
loadImages.outsideEvening = love.graphics.newImage("Images/Backgrounds/Outside (Evening).png")
loadImages.parkEntrance = love.graphics.newImage("Images/Backgrounds/Park Entrance.png")
loadImages.park2 = love.graphics.newImage("Images/Backgrounds/Park 2.png")
loadImages.park3 = love.graphics.newImage("Images/Backgrounds/Park 3.png")
loadImages.patioLight = love.graphics.newImage("Images/Backgrounds/Patio (Light).png")
loadImages.patioDark = love.graphics.newImage("Images/Backgrounds/Patio (Dark).png")
loadImages.railroad = love.graphics.newImage("Images/Backgrounds/Railroad.png")
--loadImages.shed = love.graphics.newImage("Images/Backgrounds/Shed.png")
--loadImages.school1 = love.graphics.newImage("Images/Backgrounds/School 1.png")
loadImages.school1Evening = love.graphics.newImage("Images/Backgrounds/School 1 (Evening).png")
loadImages.school1Night = love.graphics.newImage("Images/Backgrounds/School 1 (Night).png")
loadImages.sewer1 = love.graphics.newImage("Images/Backgrounds/Sewer 1.png")
loadImages.sewer2 = love.graphics.newImage("Images/Backgrounds/Sewer 2.png")
loadImages.sewer3 = love.graphics.newImage("Images/Backgrounds/Sewer 3.png")
loadImages.sewer4 = love.graphics.newImage("Images/Backgrounds/Sewer 4.png")
loadImages.sewer5 = love.graphics.newImage("Images/Backgrounds/Sewer 5.png")
loadImages.sewer6 = love.graphics.newImage("Images/Backgrounds/Sewer 6.png")
loadImages.school2 = love.graphics.newImage("Images/Backgrounds/School 2.png")
loadImages.shed = love.graphics.newImage("Images/Backgrounds/Shed.png")
loadImages.street1 = love.graphics.newImage("Images/Backgrounds/Street 1.png")
loadImages.street2 = love.graphics.newImage("Images/Backgrounds/Street 2.png")
loadImages.street3 = love.graphics.newImage("Images/Backgrounds/Street 3.png")
loadImages.street4 = love.graphics.newImage("Images/Backgrounds/Street 4.png")
loadImages.street5 = love.graphics.newImage("Images/Backgrounds/Street 5.png")
loadImages.street6 = love.graphics.newImage("Images/Backgrounds/Street 6.png")
loadImages.street7 = love.graphics.newImage("Images/Backgrounds/Street 7.png")

-- Game background objects
loadImages.bedroomDoorClosed = love.graphics.newImage("Images/Objects/Bedroom/Bedroom Door Closed.png")
loadImages.bedroomDoorOpen = love.graphics.newImage("Images/Objects/Bedroom/Bedroom Door Open.png")
loadImages.button = love.graphics.newImage("Images/Objects/Clock Tower Inside Second Floor/Button.png")
loadImages.churchDoorOutsideClosed = love.graphics.newImage("Images/Objects/Church Outside/Church Outside Door Closed.png")
loadImages.churchDoorOutsideOpen = love.graphics.newImage("Images/Objects/Church Outside/Church Outside Door Open.png")
loadImages.churchDoorInsideClosed = love.graphics.newImage("Images/Objects/Church Inside/Church Door (Closed).png")
loadImages.churchDoorInsideOpen = love.graphics.newImage("Images/Objects/Church Inside/Church Door (Open).png")
loadImages.classDoorClosed = love.graphics.newImage("Images/Objects/School/School Door (Closed).png")
loadImages.classDoorOpen = love.graphics.newImage("Images/Objects/School/School Door (Open).png")
loadImages.clockTowerOutsideDoorClosed = love.graphics.newImage("Images/Objects/Clock Tower Outside/Clock Tower Outside Door Closed.png")
loadImages.clockTowerOutsideDoorOpen = love.graphics.newImage("Images/Objects/Clock Tower Outside/Clock Tower Outside Door Open.png")
loadImages.gasStationStoreDoorClosed = love.graphics.newImage("Images/Objects/Gas Station/Store Door (Closed).png")
loadImages.gasStationStoreDoorOpen = love.graphics.newImage("Images/Objects/Gas Station/Store Door (Open).png")
loadImages.grave = love.graphics.newImage("Images/Objects/Graveyard/Grave.png")
loadImages.graveStairs = love.graphics.newImage("Images/Objects/Graveyard/Stairs.png")
loadImages.graveyardDoorClosed = love.graphics.newImage("Images/Objects/Graveyard Underground/Graveyard Door (Closed).png")
loadImages.graveyardDoorOpen = love.graphics.newImage("Images/Objects/Graveyard Underground/Graveyard Door (Open).png")
loadImages.hangingMirrorFat = love.graphics.newImage("Images/Objects/Mirror Room/Hanging Mirror (Fat).png")
loadImages.hangingMirrorFatBrokenClosed = love.graphics.newImage("Images/Objects/Mirror Room/Hanging Mirror (Fat, Broken, Closed).png")
loadImages.hangingMirrorFatBrokenOpen = love.graphics.newImage("Images/Objects/Mirror Room/Hanging Mirror (Fat, Broken, Open).png")
loadImages.hangingMirrorThin = love.graphics.newImage("Images/Objects/Mirror Room/Hanging Mirror (Thin).png")
loadImages.hangingMirrorThinBroken = love.graphics.newImage("Images/Objects/Mirror Room/Hanging Mirror (Thin, Broken).png")
loadImages.hourHand = love.graphics.newImage("Images/Objects/Clock Tower Inside Second Floor/Hour Hand.png")
loadImages.lamp = love.graphics.newImage("Images/Objects/Living Room/Lamp.png")
loadImages.litCandle = love.graphics.newImage("Images/Objects/Church Inside/Lit Candle.png")
loadImages.litWallCandelabra = love.graphics.newImage("Images/Objects/Church Inside/Lit Wall Candelabra.png")
loadImages.livingRoomDoorClosed = love.graphics.newImage("Images/Objects/Living Room/Living Room Door Closed.png")
loadImages.livingRoomDoorOpen = love.graphics.newImage("Images/Objects/Living Room/Living Room Door Open.png")
loadImages.minuteHand = love.graphics.newImage("Images/Objects/Clock Tower Inside Second Floor/Minute Hand.png")
loadImages.panel = love.graphics.newImage("Images/Objects/Clock Tower Inside Second Floor/Panel.png")
loadImages.panelOpen = love.graphics.newImage("Images/Objects/Clock Tower Inside Second Floor/Panel Open.png")
loadImages.parkGateClosed = love.graphics.newImage("Images/Objects/Park/Park Gate (Closed).png")
loadImages.parkGateOpen = love.graphics.newImage("Images/Objects/Park/Park Gate (Open).png")
loadImages.parkGateLocked = love.graphics.newImage("Images/Objects/Park/Park Gate (Locked).png")
loadImages.professor = love.graphics.newImage("Images/Objects/Classroom/Professor.png")
loadImages.sewerGate = love.graphics.newImage("Images/Objects/Streets/Sewer Gate.png")
loadImages.sewerGateBroken = love.graphics.newImage("Images/Objects/Streets/Sewer Gate (Broken).png")
loadImages.shedDoorClosed = love.graphics.newImage("Images/Objects/Park/Shed Door (Closed).png")
loadImages.shedDoorOpen = love.graphics.newImage("Images/Objects/Park/Shed Door (Open).png")
--loadImages.shedTable = love.graphics.newImage("Images/Objects/Shed/Table.png")
loadImages.statueWithDarkCrystalBall = love.graphics.newImage("Images/Objects/Graveyard Underground/Statue with Dark Crystal Ball.png")
loadImages.statueWithLightCrystalBall = love.graphics.newImage("Images/Objects/Graveyard Underground/Statue with Light Crystal Ball.png")
loadImages.unlitCandelabra = love.graphics.newImage("Images/Objects/Church Inside/Unlit Candelabra.png")
loadImages.unlitCandle = love.graphics.newImage("Images/Objects/Church Inside/Unlit Candle.png")
loadImages.unlitWallCandelabra = love.graphics.newImage("Images/Objects/Church Inside/Unlit Wall Candelabra.png")

-- Pick up items
loadImages.boltCutters = love.graphics.newImage("Images/Objects/Park/Bolt Cutters.png")
loadImages.carKey = love.graphics.newImage("Images/Objects/Living Room/Car Key.png")
loadImages.eclipseBrooch = love.graphics.newImage("Images/Objects/Flooded Labyrinth/Eclipse Brooch.png")
loadImages.gasCanister = love.graphics.newImage("Images/Objects/Gas Station/Gas Canister.png")
loadImages.hacksaw = love.graphics.newImage("Images/Objects/Clock Tower Inside Second Floor/Hacksaw.png")
loadImages.hammer = love.graphics.newImage("Images/Objects/Patio/Hammer.png")
loadImages.lighter = love.graphics.newImage("Images/Objects/Park/Lighter.png")
loadImages.mirror = love.graphics.newImage("Images/Objects/Bedroom/Mirror.png")
loadImages.necklace = love.graphics.newImage("Images/Objects/Church Inside/Necklace.png")
loadImages.shadowOrb = love.graphics.newImage("Images/Objects/Graveyard Underground/Shadow Orb.png")

-- Map images
loadImages.bedroomMap = love.graphics.newImage("Images/Maps/Bedroom Map.png")
loadImages.carMap = love.graphics.newImage("Images/Maps/Car Map.png")
loadImages.car2Map = love.graphics.newImage("Images/Maps/Car 2 Map.png")
loadImages.car3Map = love.graphics.newImage("Images/Maps/Car 3 Map.png")
loadImages.car4Map = love.graphics.newImage("Images/Maps/Car 4 Map.png")
loadImages.classroomMap = love.graphics.newImage("Images/Maps/Classroom Map.png")
loadImages.churchInsideMap = love.graphics.newImage("Images/Maps/Church Inside Map.png")
loadImages.churchOutsideMap = love.graphics.newImage("Images/Maps/Church Outside Map.png")
loadImages.clockTowerInside1FMap = love.graphics.newImage("Images/Maps/Clock Tower Inside 1F Map.png")
loadImages.clockTowerInside2FMap = love.graphics.newImage("Images/Maps/Clock Tower Inside 2F Map.png")
loadImages.clockTowerOutsideMap = love.graphics.newImage("Images/Maps/Clock Tower Outside Map.png")
--loadImages.crawlspace = love.graphics.newImage("Images/Backgrounds/Crawlspace.png")
loadImages.fourWayMap = love.graphics.newImage("Images/Maps/4 Way Map.png")
loadImages.floodedLabyrinth1Map = love.graphics.newImage("Images/Maps/Flooded Labyrinth 1 Map.png")
loadImages.gasStationBathroomMap = love.graphics.newImage("Images/Maps/Gas Station Bathroom Map.png")
loadImages.gasStationOutsideMap = love.graphics.newImage("Images/Maps/Gas Station Outside Map.png")
loadImages.graveyardMap = love.graphics.newImage("Images/Maps/Graveyard Map.png")
loadImages.graveyardUnderground1Map = love.graphics.newImage("Images/Maps/Graveyard Underground 1 Map.png")
loadImages.highwayMap = love.graphics.newImage("Images/Maps/Highway Map.png")
loadImages.highwayNorthEndMap = love.graphics.newImage("Images/Maps/Highway North End Map.png")
loadImages.highwaySouthEndMap = love.graphics.newImage("Images/Maps/Highway South End Map.png")
loadImages.highwayTIntersectionMap = love.graphics.newImage("Images/Maps/Highway T Intersection Map.png")
loadImages.mirrorRoomMap = love.graphics.newImage("Images/Maps/Mirror Room Map.png")
loadImages.parkEntranceMap = love.graphics.newImage("Images/Maps/Park Entrance Map.png")
loadImages.sewer1Map = love.graphics.newImage("Images/Maps/Sewer 1 Map.png")
loadImages.sewer2Map = love.graphics.newImage("Images/Maps/Sewer 2 Map.png")
loadImages.shadowLands3Map = love.graphics.newImage("Images/Maps/Shadow Lands 3 Map.png")
loadImages.street1Map = love.graphics.newImage("Images/Maps/Street 1 Map.png")
loadImages.street2Map = love.graphics.newImage("Images/Maps/Street 2 Map.png")
loadImages.street3Map = love.graphics.newImage("Images/Maps/Street 3 Map.png")
loadImages.street4Map = love.graphics.newImage("Images/Maps/Street 4 Map.png")
loadImages.street5Map = love.graphics.newImage("Images/Maps/Street 5 Map.png")
loadImages.street6Map = love.graphics.newImage("Images/Maps/Street 6 Map.png")
loadImages.street7Map = love.graphics.newImage("Images/Maps/Street 7 Map.png")
loadImages.TMap = love.graphics.newImage("Images/Maps/T Map.png")
loadImages.kitchenMap = love.graphics.newImage("Images/Maps/Kitchen Map.png")
loadImages.livingRoomMap = love.graphics.newImage("Images/Maps/Living Room Map.png")
loadImages.patioMap = love.graphics.newImage("Images/Maps/Patio Map.png")
--loadImages.shedOutsideMap = love.graphics.newImage("Images/Backgrounds/Shed Map.png")

-- Endings
loadImages.goodEnding = love.graphics.newImage("Images/Endings/Morning Daybreak Ending.png")
loadImages.redPrinceEnding = love.graphics.newImage("Images/Endings/Red Prince Ending.png")
loadImages.solarBlindnessEnding = love.graphics.newImage("Images/Endings/Solar Blindness Ending.png")

-- SHADOW PEOPLE
-- Lost room
loadImages.lostRoomPeople = love.graphics.newImage("Images/SHADOW PEOPLE/Lost Room People.png")

-- Squiggle Man
loadImages.squiggleMan = {}
for i=1,6 do
    loadImages.squiggleMan[i] = love.graphics.newImage("Images/SHADOW PEOPLE/Squiggle Man/Squiggle Man " .. i .. ".png")
end

-- Shadow Child
loadImages.shadowChild = {}
for i=1,10 do
    loadImages.shadowChild[i] = love.graphics.newImage("Images/SHADOW PEOPLE/Shadow Child/Shadow Child " .. i .. ".png")
end
    

return loadImages