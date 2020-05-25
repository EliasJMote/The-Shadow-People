function love.conf(t)
    debug = false
    gameVersion = "0.2.0"
    local scale = 5
    t.title = "The Shadow People " .. gameVersion
    t.version = "11.1"
    t.window.width = 160 * scale
    t.window.height = 144 * scale
    t.console = false
end