local loadSFX = {}

loadSFX.doorClose = love.audio.newSource("SFX/Door Close.wav", "static")
loadSFX.doorOpen = love.audio.newSource("SFX/Door Open.wav", "static")
loadSFX.fire = love.audio.newSource("SFX/Fire.wav", "static")
loadSFX.glassShattering = love.audio.newSource("SFX/Glass Shattering.wav", "static")
loadSFX.lockedDoor = love.audio.newSource("SFX/Locked Door.wav", "static")
loadSFX.numberRadioStationMessage = love.audio.newSource("SFX/Number Radio Station Message.wav", "static")
loadSFX.pickup = love.audio.newSource("SFX/pickup.wav", "static")
loadSFX.squiggleManScream = love.audio.newSource("SFX/Squiggle Man Scream.wav", "static")

return loadSFX