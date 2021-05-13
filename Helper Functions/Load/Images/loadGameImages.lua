local loadGameImages = {}

function loadGameImages.load()

    -- Intro screens
    loadImages.titleScreen = love.graphics.newImage("Images/Intro Screens/Title Screen.png")
    loadImages.rocStudiosLogo = love.graphics.newImage("Images/Intro Screens/Roc Studios Logo.png")

    -- User interface
    loadUIImages.load()

    -- Inventory items
    loadInventoryImages.load()

    -- Location background images
    loadBackgroundImages.load()

    -- Game background objects
    loadObjectImages.load()

    -- Pick up items
    loadPickUpImages.load()

    -- Map images
    loadMapImages.load()

    -- Endings
    loadEndingImages.load()

    -- SHADOW PEOPLE
    loadShadowPeopleImages.load()
        
    -- Cutscenes
    loadCutsceneImages.load()
end

return loadGameImages