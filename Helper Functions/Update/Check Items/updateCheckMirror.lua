local updateCheckMirror = {}

local g = GLOBALS

function updateCheckMirror.update()
    if(g.curLocation == loadRooms.graveyardUnderground1) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.statueEmittingLight) then
            if(g.curLocation.objects.statueHoldingDarkCrystalBall.state ~= "Lit") then
                
                -- Light up the dark crystal ball
                g.curLocation.objects.statueHoldingDarkCrystalBall.state = "Lit"
                
                -- Tell the player that the dark crystal ball is now illuminated, revealing a secret door
                g.writeToTextDisplay({"You hold the mirror up,", "reflecting light back at the", "dim orb. The orb fills with", "shining light. You hear a panel", "slide in the wall, revealing a", "hidden door."})
                
                -- Reveal the hidden door in the statue room
                loadRooms.graveyardUnderground1.objects.door = {name="Door",x=45,y=30,w=10,h=37,img={closed=loadImages.graveyardDoorClosed,open=loadImages.graveyardDoorOpen},state="Closed",move="",text={close={"You close the door."},look={"It's a narrow door hidden in", "the wall."},open={"You open the door."},move="",}}
                
                -- Put the secret door on the map
                g.revealStatueRoomHiddenDoorOnMap()
                
                loadSFX.pickup:play()
            else
                g.writeToTextDisplay({"The orb is already lit!"})
            end
        else
            g.writeToTextDisplay({"You can't use the mirror here."})
        end
    else
        if(g.mouse.objectPointedAt ~= nil) then
            g.writeToTextDisplay({"You can't use the mirror here."})
        end
    end
end

return updateCheckMirror