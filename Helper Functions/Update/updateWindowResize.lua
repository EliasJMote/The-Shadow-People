local updateWindowResize = {}

function updateWindowResize.update(w,h)
    
    local nativeWidth = 160
    local nativeHeight = 144
    
    -- When the window is resized, set it to a multiple of 160x144
    if(w % nativeWidth ~= 0 or h % nativeHeight ~= 0) then
        
        local newWidth = math.ceil(w/nativeWidth)*nativeWidth
        local newHeight = math.ceil(newWidth/nativeWidth)*nativeHeight
        
        local _, _, flags = love.window.getMode()
        local desktopWidth, desktopHeight = love.window.getDesktopDimensions(flags.display)
        
        while(newWidth > desktopWidth or newHeight > desktopHeight) do
            newWidth = newWidth - nativeWidth
            newHeight = newHeight - nativeHeight
        end
        
        love.window.setMode(newWidth,newHeight, {resizable = true,minwidth=nativeWidth,minheight=nativeHeight})
        
    end
end

return updateWindowResize