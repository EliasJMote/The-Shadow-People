local loadMusic = {}

loadMusic.house = love.audio.newSource("Music/Main House.wav", "stream")
loadMusic.house:setLooping(true)
loadMusic.sewers = love.audio.newSource("Music/Sewers.wav", "stream")
loadMusic.sewers:setLooping(true)

return loadMusic