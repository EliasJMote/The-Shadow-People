local createEvent = {}

createEvent.create = function(event)

  local g = GLOBALS
  
  table.insert(g.events,event)
end

return createEvent