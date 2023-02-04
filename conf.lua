function love.conf(t)
    
    debug = false
    --debug = true
    
    scale = 4
    gameVersion = "1.2.3"
    t.title = "The Shadow People V" .. gameVersion
    t.version = "11.2"
    --t.window.icon = ""
    t.window.width = 160 * scale
    t.window.height = 144 * scale
    t.window.minwidth = 160
    t.window.minheight = 144
    t.window.resizable = true
    t.window.borderless = false
    --t.window.borderless = true 
    --t.window.fullscreen = false
    t.window.vsync = 1
    t.console = false
    --t.console = true
    
end