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
end

return loadShadowPeopleImages