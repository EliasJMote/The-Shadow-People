local loadUIImages = {}

function loadUIImages.load()
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
end

return loadUIImages