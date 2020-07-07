local loadImages = {}

-- Intro screens
loadImages.titleScreen = love.graphics.newImage("Images/Intro Screens/Title Screen.png")
loadImages.rocStudiosLogo = love.graphics.newImage("Images/Intro Screens/Roc Studios Logo.png")

-- User interface
loadImages.cursor = love.graphics.newImage("Images/User Interface/Cursor.png")
loadImages.cursorHand = love.graphics.newImage("Images/User Interface/Cursor Hand.png")
loadImages.userInterfaceTextBox = love.graphics.newImage("Images/User Interface/User Interface (Text).png")
loadImages.userInterfaceActions = love.graphics.newImage("Images/User Interface/User Interface (Actions).png")

-- Location background images
loadImages.bedroomDark = love.graphics.newImage("Images/Backgrounds/Bedroom (Dark).png")
loadImages.bedroomLight = love.graphics.newImage("Images/Backgrounds/Bedroom (Light).png")
loadImages.car = love.graphics.newImage("Images/Backgrounds/Car.png")
loadImages.classroom = love.graphics.newImage("Images/Backgrounds/Classroom.png")
loadImages.crawlspace = love.graphics.newImage("Images/Backgrounds/Crawlspace.png")
loadImages.gasStationBathroom = love.graphics.newImage("Images/Backgrounds/Gas Station Bathroom.png")
loadImages.gasStationOutside = love.graphics.newImage("Images/Backgrounds/Gas Station Outside.png")
loadImages.kitchen = love.graphics.newImage("Images/Backgrounds/Kitchen.png")
loadImages.livingRoom = love.graphics.newImage("Images/Backgrounds/Living Room.png")
loadImages.patioLight = love.graphics.newImage("Images/Backgrounds/Patio (Light).png")
loadImages.patioDark = love.graphics.newImage("Images/Backgrounds/Patio (Dark).png")
loadImages.shed = love.graphics.newImage("Images/Backgrounds/Shed.png")

-- Game background objects
loadImages.carKey = love.graphics.newImage("Images/Objects/Living Room/Car Key.png")
loadImages.flashlight = love.graphics.newImage("Images/Objects/Patio/Flashlight.png")
loadImages.knife = love.graphics.newImage("Images/Objects/Kitchen/Knife.png")

-- Map objects
loadImages.bedroomMap = love.graphics.newImage("Images/Maps/Bedroom Map.png")
loadImages.carMap = love.graphics.newImage("Images/Maps/Car Map.png")
loadImages.classroomMap = love.graphics.newImage("Images/Maps/Classroom Map.png")
--loadImages.crawlspace = love.graphics.newImage("Images/Backgrounds/Crawlspace.png")
loadImages.gasStationBathroomMap = love.graphics.newImage("Images/Maps/Gas Station Bathroom Map.png")
loadImages.gasStationOutsideMap = love.graphics.newImage("Images/Maps/Gas Station Outside Map.png")
loadImages.kitchenMap = love.graphics.newImage("Images/Maps/Kitchen Map.png")
loadImages.livingRoomMap = love.graphics.newImage("Images/Maps/Living Room Map.png")
loadImages.patioMap = love.graphics.newImage("Images/Maps/Patio Map.png")
--loadImages.shedOutsideMap = love.graphics.newImage("Images/Backgrounds/Shed Map.png")

return loadImages