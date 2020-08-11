loadObjects = {}

loadObjects.carKey = {name="Car Key",x=60,y=17,w=5,h=10,text={take={"You take the car key."}},img=loadImages.carKey,item={name="Car Key",w=33,h=4}}
loadObjects.flashlight = {name="Flashlight",x=60,y=45,w=13,h=5,text={take={"You take the flashlight."}},img=loadImages.flashlight,item={name="Flashlight",w=47,h=4}}
loadObjects.bedroomDoor = {name="Door",x=60,y=17,w=24,h=36,text=loadGameText.bedroom.door,state="Closed",img={closed=loadImages.bedroomDoorClosed,open=loadImages.bedroomDoorOpen},move="North"}
loadObjects.churchOutsideDoor = {name="Door",x=48,y=43,w=16,h=22,text=loadGameText.churchOutside.door,state="Closed",img={closed=loadImages.churchDoorOutsideClosed,open=loadImages.churchDoorOutsideOpen},move="North"}

return loadObjects