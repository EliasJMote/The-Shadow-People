local loadMusic = {}

loadMusic.darkStreets = love.audio.newSource("Music/Dark Streets (8-bit).mp3", "stream")
loadMusic.floodedLabyrinth = love.audio.newSource("Music/Flooded Labyrinth.mp3", "stream")
loadMusic.house = love.audio.newSource("Music/Main House.wav", "stream")
loadMusic.houseLight = love.audio.newSource("Music/Main House (Light).mp3", "stream")
loadMusic.houseDark = love.audio.newSource("Music/Main House (Dark).mp3", "stream")
loadMusic.nightmareGeometry = love.audio.newSource("Music/Nightmare Geometry.mp3", "stream")
loadMusic.redPrince = love.audio.newSource("Music/Red Prince.wav", "stream")
loadMusic.sewers = love.audio.newSource("Music/Sewer Drip.mp3", "stream")
loadMusic.shadowLands = love.audio.newSource("Music/Shadow Lands.mp3", "stream")
loadMusic.title = love.audio.newSource("Music/Somber Song.mp3", "stream")
loadMusic.undertheStars = love.audio.newSource("Music/Under the Stars (8-bit).mp3", "stream")

for k,v in pairs(loadMusic) do
    v:setLooping(true)
end

return loadMusic