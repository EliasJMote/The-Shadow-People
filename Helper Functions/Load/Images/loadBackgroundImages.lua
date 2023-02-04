local loadBackgroundImages = {}

function loadBackgroundImages.load()
    
    -- Player's home
    loadImages.bedroomDark = love.graphics.newImage("Images/Backgrounds/Bedroom (Dark).png")
    loadImages.bedroomLight = love.graphics.newImage("Images/Backgrounds/Bedroom (Light).png")
    loadImages.houseOutside = love.graphics.newImage("Images/Backgrounds/House Outside.png")
    loadImages.houseOutsideEvil = love.graphics.newImage("Images/Backgrounds/House Outside (Evil).png")
    loadImages.livingRoomDark = love.graphics.newImage("Images/Backgrounds/Living Room (Dark).png")
    loadImages.livingRoomLight = love.graphics.newImage("Images/Backgrounds/Living Room (Light).png")
    
    -- Player's car
    loadImages.carDay = love.graphics.newImage("Images/Backgrounds/Car (Day).png")
    loadImages.carEvening = love.graphics.newImage("Images/Backgrounds/Car (Evening).png")
    loadImages.carNight = love.graphics.newImage("Images/Backgrounds/Car (Night).png")
    loadImages.carNightCollision = love.graphics.newImage("Images/Backgrounds/Car (Night, Collision).png")
    
    -- Church area
    loadImages.churchBasement = love.graphics.newImage("Images/Backgrounds/Church Basement.png")
    loadImages.churchInside = love.graphics.newImage("Images/Backgrounds/Church Inside.png")
    loadImages.churchInside2 = love.graphics.newImage("Images/Backgrounds/Church Inside 2.png")
    loadImages.churchOutside = love.graphics.newImage("Images/Backgrounds/Church Outside.png")
    loadImages.churchOutsideEvil = love.graphics.newImage("Images/Backgrounds/Church Outside (Evil).png")
    loadImages.mirrorRoom = love.graphics.newImage("Images/Backgrounds/Mirror Room.png")
    
    -- Clock Tower area
    loadImages.clockTowerInside1F = love.graphics.newImage("Images/Backgrounds/Clock Tower Inside 1F.png")
    loadImages.clockTowerInside2F = love.graphics.newImage("Images/Backgrounds/Clock Tower Inside 2F.png")
    loadImages.clockTowerOutside = love.graphics.newImage("Images/Backgrounds/Clock Tower Outside.png")
    
    -- Empty area (used for the dark passages and empty rooms)
    loadImages.empty = love.graphics.newImage("Images/Backgrounds/Empty.png")
    loadImages.emptyRoom = love.graphics.newImage("Images/Backgrounds/Empty Room.png")
    
    -- Flooded labyrinth area
    loadImages.altarRoom = love.graphics.newImage("Images/Backgrounds/Altar Room.png")
    loadImages.floodedLabyrinth1 = love.graphics.newImage("Images/Backgrounds/Flooded Labyrinth 1.png")
    loadImages.floodedLabyrinth2 = love.graphics.newImage("Images/Backgrounds/Flooded Labyrinth 2.png")
    loadImages.floodedLabyrinth3 = love.graphics.newImage("Images/Backgrounds/Flooded Labyrinth 3.png")
    loadImages.floodedLabyrinth4 = love.graphics.newImage("Images/Backgrounds/Flooded Labyrinth 4.png")
    loadImages.floodedLabyrinth5 = love.graphics.newImage("Images/Backgrounds/Flooded Labyrinth 5.png")
    loadImages.puzzlingStone = love.graphics.newImage("Images/Backgrounds/Puzzling Stone.png")
    
    -- Gas station area
    loadImages.gasStationBathroomDark = love.graphics.newImage("Images/Backgrounds/Gas Station Bathroom (Dark).png")
    loadImages.gasStationBathroomLight = love.graphics.newImage("Images/Backgrounds/Gas Station Bathroom (Light).png")
    loadImages.gasStationInside = love.graphics.newImage("Images/Backgrounds/Gas Station Inside.png")
    loadImages.gasStationOutside = love.graphics.newImage("Images/Backgrounds/Gas Station Outside.png")
    
    -- Highway area
    loadImages.highway = love.graphics.newImage("Images/Backgrounds/Highway.png")
    loadImages.highwayEvil = love.graphics.newImage("Images/Backgrounds/Highway (Evil).png")
    loadImages.highwayNorthEnd = love.graphics.newImage("Images/Backgrounds/Highway North End.png")
    loadImages.highwayNorthEndEvil = love.graphics.newImage("Images/Backgrounds/Highway North End (Evil).png")
    loadImages.highwayTIntersection = love.graphics.newImage("Images/Backgrounds/Highway T Intersection.png")
    loadImages.highwayTIntersectionEvil = love.graphics.newImage("Images/Backgrounds/Highway T Intersection (Evil).png")
    
    -- Nightmare Geometry
    loadImages.nightmareGeometry1 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 1.png")
    loadImages.nightmareGeometry2 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 2.png")
    loadImages.nightmareGeometry2_2 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 2_2.png")
    loadImages.nightmareGeometry2_3 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 2_3.png")
    loadImages.nightmareGeometry3 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 3.png")
    loadImages.nightmareGeometry4 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 4.png")
    loadImages.nightmareGeometry4WithCreature = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 4 (with creature).png")
    loadImages.nightmareGeometry5 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 5.png")
    loadImages.nightmareGeometry7 = love.graphics.newImage("Images/Backgrounds/Nightmare Geometry 7.png")
    loadImages.finalDarkPassage = love.graphics.newImage("Images/Backgrounds/Final Dark Passage.png")
    
    -- Park
    loadImages.parkEntrance = love.graphics.newImage("Images/Backgrounds/Park Entrance.png")
    loadImages.parkEntranceEvil = love.graphics.newImage("Images/Backgrounds/Park Entrance (Evil).png")
    loadImages.park2 = love.graphics.newImage("Images/Backgrounds/Park 2.png")
    loadImages.park2Evil = love.graphics.newImage("Images/Backgrounds/Park 2 (Evil).png")
    loadImages.park3 = love.graphics.newImage("Images/Backgrounds/Park 3.png")
    loadImages.park3Evil = love.graphics.newImage("Images/Backgrounds/Park 3 (Evil).png")
    loadImages.graveyard = love.graphics.newImage("Images/Backgrounds/Graveyard.png")
    loadImages.graveyardEvil = love.graphics.newImage("Images/Backgrounds/Graveyard (Evil).png")
    loadImages.statueRoom = love.graphics.newImage("Images/Backgrounds/Statue Room.png")
    loadImages.graveyardUnderground2 = love.graphics.newImage("Images/Backgrounds/Graveyard Underground 2.png")
    loadImages.shed = love.graphics.newImage("Images/Backgrounds/Shed.png")
    loadImages.shedEvil = love.graphics.newImage("Images/Backgrounds/Shed (Evil).png")
    
    -- Patio
    loadImages.patioLight = love.graphics.newImage("Images/Backgrounds/Patio (Light).png")
    loadImages.patioDark = love.graphics.newImage("Images/Backgrounds/Patio (Dark).png")
    
    
    -- School
    loadImages.classroom = love.graphics.newImage("Images/Backgrounds/Classroom.png")
    loadImages.school1Evening = love.graphics.newImage("Images/Backgrounds/School 1 (Evening).png")
    loadImages.school1Night = love.graphics.newImage("Images/Backgrounds/School 1 (Night).png")
    loadImages.school2 = love.graphics.newImage("Images/Backgrounds/School 2.png")
    
    -- Sewers
    loadImages.sewer1 = love.graphics.newImage("Images/Backgrounds/Sewer 1.png")
    loadImages.sewer2 = love.graphics.newImage("Images/Backgrounds/Sewer 2.png")
    loadImages.sewer3 = love.graphics.newImage("Images/Backgrounds/Sewer 3.png")
    loadImages.sewer4 = love.graphics.newImage("Images/Backgrounds/Sewer 4.png")
    loadImages.sewer5 = love.graphics.newImage("Images/Backgrounds/Sewer 5.png")
    loadImages.sewer6 = love.graphics.newImage("Images/Backgrounds/Sewer 6.png")
    
    -- The Shadow Lands (end of the alien planet ending)
    loadImages.shadowLands1 = love.graphics.newImage("Images/Backgrounds/Shadow Lands 1.png")
    loadImages.shadowLands2 = love.graphics.newImage("Images/Backgrounds/Shadow Lands 2.png")
    
    -- Streets
    loadImages.street1 = love.graphics.newImage("Images/Backgrounds/Street 1.png")
    loadImages.street1Evil = love.graphics.newImage("Images/Backgrounds/Street 1 (Evil).png")
    loadImages.street2 = love.graphics.newImage("Images/Backgrounds/Street 2.png")
    loadImages.street2Evil = love.graphics.newImage("Images/Backgrounds/Street 2 (Evil).png")
    loadImages.street3 = love.graphics.newImage("Images/Backgrounds/Street 3.png")
    loadImages.street3Evil = love.graphics.newImage("Images/Backgrounds/Street 3 (Evil).png")
    loadImages.street4 = love.graphics.newImage("Images/Backgrounds/Street 4.png")
    loadImages.street4Evil = love.graphics.newImage("Images/Backgrounds/Street 4 (Evil).png")
    loadImages.street5 = love.graphics.newImage("Images/Backgrounds/Street 5.png")
    loadImages.street5Evil = love.graphics.newImage("Images/Backgrounds/Street 5 (Evil).png")
end

return loadBackgroundImages