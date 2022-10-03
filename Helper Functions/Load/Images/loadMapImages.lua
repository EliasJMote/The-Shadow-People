local loadMapImages = {}

function loadMapImages.load()
    -- 0 Way
    loadImages.zeroWayMap = love.graphics.newImage("Images/Maps/0 Way/0 Way Map.png")
    
    -- 1 Way
    loadImages.oneWayDownMap = love.graphics.newImage("Images/Maps/1 Way/1 Way Down Map.png")
    loadImages.oneWayLeftMap = love.graphics.newImage("Images/Maps/1 Way/1 Way Left Map.png")
    loadImages.oneWayRightMap = love.graphics.newImage("Images/Maps/1 Way/1 Way Right Map.png")
    loadImages.oneWayUpMap = love.graphics.newImage("Images/Maps/1 Way/1 Way Up Map.png")
    
    -- 2 Way
    loadImages.twoWayHorizontalMap = love.graphics.newImage("Images/Maps/2 Way/2 Way Horizontal Map.png")
    loadImages.twoWayVerticalMap = love.graphics.newImage("Images/Maps/2 Way/2 Way Vertical Map.png")
    loadImages.twoWayLUpperLeftMap = love.graphics.newImage("Images/Maps/2 Way/2 Way L Upper Left Map.png")
    loadImages.twoWayLUpperRightMap = love.graphics.newImage("Images/Maps/2 Way/2 Way L Upper Right Map.png")
    loadImages.twoWayLLowerLeftMap = love.graphics.newImage("Images/Maps/2 Way/2 Way L Lower Left Map.png")
    
    -- 3 Way
    loadImages.threeWayDownMap = love.graphics.newImage("Images/Maps/3 Way/3 Way Down Map.png")
    loadImages.threeWayLeftMap = love.graphics.newImage("Images/Maps/3 Way/3 Way Left Map.png")
    loadImages.threeWayRightMap = love.graphics.newImage("Images/Maps/3 Way/3 Way Right Map.png")
    loadImages.threeWayUpMap = love.graphics.newImage("Images/Maps/3 Way/3 Way Up Map.png")
    
    -- 4 Way
    loadImages.fourWayMap = love.graphics.newImage("Images/Maps/4 Way/4 Way Map.png")
end

return loadMapImages