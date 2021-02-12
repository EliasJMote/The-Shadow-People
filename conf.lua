function love.conf(t)
    debug = false
    --debug = true
    gameVersion = "0.9.6"
    local scale = 5
    t.title = "The Shadow People V" .. gameVersion
    t.version = "11.1"
    t.window.width = 160 * scale
    t.window.height = 144 * scale
    t.console = false
end