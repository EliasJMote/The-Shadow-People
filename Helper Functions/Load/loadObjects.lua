loadObjects = {}

loadObjects.carKey = {name="Car Key",x=70,y=47,w=5,h=10,text={look={"A key that goes to your car.", "You won't make it far without", "it."},take={"You take the car key."}},img=loadImages.carKey,item={name="Car Key",w=33,h=4}}
loadObjects.flashlight = {name="Flashlight",x=60,y=45,w=13,h=5,text={take={"You take the flashlight."}},img=loadImages.flashlight,item={name="Flashlight",w=47,h=4}}
loadObjects.bedroomDoor = {name="Door",x=60,y=17,w=24,h=36,text=loadGameText.bedroom.door,state="Closed",img={closed=loadImages.bedroomDoorClosed,open=loadImages.bedroomDoorOpen},move="North"}
loadObjects.churchOutsideDoor = {name="Door",x=48,y=43,w=16,h=22,text=loadGameText.churchOutside.door,state="Closed",img={closed=loadImages.churchDoorOutsideClosed,open=loadImages.churchDoorOutsideOpen},move="North"}
loadObjects.mirror = {name="Mirror",x=19,y=30,w=6,h=9,text=loadGameText.bedroom.mirror,item={name="Mirror",w=28,h=4},img=loadImages.mirror}

return loadObjects