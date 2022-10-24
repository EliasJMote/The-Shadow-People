function love.conf(t)
    debug = false
    --debug = true
    scale = 5
    gameVersion = "1.2"
    t.title = "The Shadow People V" .. gameVersion
    t.version = "11.1"
    t.window.width = 160 * scale
    t.window.height = 144 * scale
    t.window.resizable = true
    t.window.borderless = false 
    t.console = false
    --t.console = true
end