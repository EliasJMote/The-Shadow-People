local loadShadowPeopleImages = {}

function loadShadowPeopleImages.load()
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
    
    -- Church basement (who are you running from shadow)
    loadImages.whoAreYouRunningFrom = love.graphics.newImage("Images/SHADOW PEOPLE/Who are you running from.png")
    loadImages.whoAreYouRunningFrom2 = love.graphics.newImage("Images/SHADOW PEOPLE/Who are you running from 2.png")
    loadImages.whoAreYouRunningFrom3 = love.graphics.newImage("Images/SHADOW PEOPLE/Who are you running from 3.png")
    loadImages.whoAreYouRunningFrom4 = love.graphics.newImage("Images/SHADOW PEOPLE/Who are you running from 4.png")
    
    -- Bathroom shadow person
    --loadImages.bathroomShadowPerson = 
end

return loadShadowPeopleImages