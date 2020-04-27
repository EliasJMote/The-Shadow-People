function love.conf(t)
  gameVersion = "0.1.0"
  local scale = 5
  t.title = "The Shadow People " .. gameVersion
  t.version = "11.1"
  t.window.width = 160 * scale
  t.window.height = 144 * scale
  t.console = false
end