local loadEndingImages = {}

function loadEndingImages.load()
    loadImages.badEnding = {}
    loadImages.badEnding[1] = love.graphics.newImage("Images/Endings/Midnight Shadows/Midnight Shadows Ending 1.png")
    loadImages.badEnding[2] = love.graphics.newImage("Images/Endings/Midnight Shadows/Midnight Shadows Ending 2.png")
    loadImages.badEnding[3] = love.graphics.newImage("Images/Endings/Midnight Shadows/Midnight Shadows Ending 3.png")
    loadImages.badEnding[4] = love.graphics.newImage("Images/Endings/Midnight Shadows/Midnight Shadows Ending 4.png")
    loadImages.badEnding[5] = love.graphics.newImage("Images/Endings/Midnight Shadows/Midnight Shadows Ending 5.png")

    loadImages.eternalTwilightEnding = love.graphics.newImage("Images/Endings/Eternal Twilight Ending.png")
    loadImages.goodEnding = love.graphics.newImage("Images/Endings/Morning Daybreak Ending.png")
    loadImages.redPrinceEnding = love.graphics.newImage("Images/Endings/Red Prince Ending.png")
    loadImages.redPrince = love.graphics.newImage("Images/Endings/Red Prince.png")
    loadImages.solarBlindnessEnding = love.graphics.newImage("Images/Endings/Solar Blindness Ending.png")
end

return loadEndingImages