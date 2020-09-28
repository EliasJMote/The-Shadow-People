loadObjects = {}

loadObjects.carKey = {name="Car Key",x=62,y=51,w=10,h=5,text={look={"A key that goes to your car.", "You won't make it far without", "it."},take={"You take the car key."}},img=loadImages.carKey,item={name="Car Key",w=33,h=4}}
--loadObjects.flashlight = {name="Flashlight",x=63,y=45,w=13,h=5,text={take={"You take the flashlight."}},img=loadImages.flashlight,item={name="Flashlight",w=47,h=4}}
loadObjects.bedroomDoor = {name="Door",x=59,y=17,w=24,h=36,text=loadGameText.bedroom.door,state="Closed",img={closed=loadImages.bedroomDoorClosed,open=loadImages.bedroomDoorOpen},move="North"}
loadObjects.churchOutsideDoor = {name="Door",x=48,y=43,w=16,h=22,text=loadGameText.churchOutside.door,state="Closed",img={closed=loadImages.churchDoorOutsideClosed,open=loadImages.churchDoorOutsideOpen},move="North"}
loadObjects.gasStationKey = {name="Gas Station Key",x=19,y=41,w=10,h=5,text={look={"A key that goes to the gas", "station store."},take={"You take the gas station key."}},img=loadImages.carKey,item={name="G.S. Key",w=38,h=4}}
loadObjects.livingRoomDoor = {name="Door",x=16,y=28,w=24,h=36,text={close={"You close the door."},look={"It's a door leading outside to", "your car."},open={"You open the door."}},img={closed=loadImages.livingRoomDoorClosed,open=loadImages.livingRoomDoorOpen},state="Closed",move="North"}
loadObjects.livingRoomLamp = {name="Lamp",x=76,y=32,w=12,h=42,text={look={"It's a lamp."},use={"You activated the lamp."}},img=loadImages.lamp,visibleInDark=true,lightSwitch=true}
loadObjects.mirror = {name="Mirror",x=19,y=30,w=6,h=9,text=loadGameText.bedroom.mirror,item={name="Mirror",w=28,h=4},img=loadImages.mirror}

return loadObjects