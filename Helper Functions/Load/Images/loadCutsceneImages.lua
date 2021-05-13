local loadCutsceneImages = {}

function loadCutsceneImages.load()
    loadImages.video = {}
    
    -- Street Video (for the intro)
    loadImages.video.intro = {}

    for i=726,876 do
        loadImages.video.intro[i] = love.graphics.newImage("Images/Video/Intro/img0" .. i .. ".png_160x144.png")
    end

    -- Shadow Person Video (for the bad ending)
    loadImages.video.badEnding = {}
    for i=0,9 do
        loadImages.video.badEnding[i] = love.graphics.newImage("Images/Video/Bedroom/Image1000" .. i .. ".png")
    end

    for i=10,99 do
        loadImages.video.badEnding[i] = love.graphics.newImage("Images/Video/Bedroom/Image100" .. i .. ".png")
    end

    for i=100,238 do
        loadImages.video.badEnding[i] = love.graphics.newImage("Images/Video/Bedroom/Image10" .. i .. ".png")
    end
end

return loadCutsceneImages