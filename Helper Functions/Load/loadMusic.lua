local loadMusic = {}

loadMusic.house = love.audio.newSource("Music/Main House.wav", "stream")
loadMusic.house:setLooping(true)

return loadMusic