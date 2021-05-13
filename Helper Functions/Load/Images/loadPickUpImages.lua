local loadPickUpImages = {}

function loadPickUpImages.load()
    loadImages.boltCutters = love.graphics.newImage("Images/Objects/Park/Bolt Cutters.png")
    loadImages.carKey = love.graphics.newImage("Images/Objects/Living Room/Car Key.png")
    loadImages.cog = love.graphics.newImage("Images/Objects/Shed/Cog.png")
    loadImages.eclipseBrooch = love.graphics.newImage("Images/Objects/Flooded Labyrinth/Eclipse Brooch.png")
    loadImages.gasCanister = love.graphics.newImage("Images/Objects/Gas Station/Gas Canister.png")
    loadImages.hacksaw = love.graphics.newImage("Images/Objects/Clock Tower Inside Second Floor/Hacksaw.png")
    loadImages.hammer = love.graphics.newImage("Images/Objects/Patio/Hammer.png")
    loadImages.lighter = love.graphics.newImage("Images/Objects/Park/Lighter.png")
    loadImages.mirror = love.graphics.newImage("Images/Objects/Bedroom/Mirror.png")
    loadImages.necklace = love.graphics.newImage("Images/Objects/Church Inside/Necklace.png")
    loadImages.shadowOrb = love.graphics.newImage("Images/Objects/Graveyard Underground/Shadow Orb.png")
end

return loadPickUpImages