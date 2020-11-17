loadObjects = {}

-- Objects that can be picked up
loadObjects.boltCutters = {name="Bolt Cutters",x=70,y=71,w=13,h=6,text={look={"A pair of bolt cutters. Use it", "to cut chains or padlocks."},take={"You take the bolt cutters."}},img=loadImages.boltCutters,item={name="B. Cutters",w=47,h=4}}

loadObjects.carKey = {name="Car Key",x=62,y=52,w=10,h=5,text={look={"A key that goes to your car.", "You won't make it far without", "it."},take={"You take the car key."}},img=loadImages.carKey,item={name="Car Key",w=33,h=4}}

loadObjects.eclipseBrooch = {name="Eclipse Brooch",x=52,y=62,w=10,h=10,text={look={"A brooch set with a magnificent", "black onyx stone. It's", "surrounded by many fine", "crystals and resembles a total", "eclipse of the sun."},take={"You take the eclipse brooch."}},img=loadImages.eclipseBrooch,item={name="E. Brooch",w=42,h=4}}

loadObjects.gasStationKey = {name="Gas Station Key",x=19,y=41,w=10,h=5,text={look={"A key that goes to the gas", "station store."},take={"You take the gas station key."}},img=loadImages.carKey,item={name="G.S. Key",w=38,h=4}}

loadObjects.gasCanister = {name="Gas Canister",x=17,y=55,w=9,h=11,text={look={"A canister full of gasoline."},take={"You take the gas canister."}},img=loadImages.gasCanister,item={name="Gas Can",w=32,h=4}}

--loadObjects.flashlight = {name="Flashlight",x=63,y=45,w=13,h=5,text={take={"You take the flashlight."}},img=loadImages.flashlight,item={name="Flashlight",w=47,h=4}}

loadObjects.hacksaw = {name="Hacksaw",x=70,y=70,w=13,h=7,text={look={"It's a hacksaw. It can be", "used to cut metal, such as", "pipes."},take={"You take the hacksaw."}},item={name="Hacksaw",w=33,h=4},img=loadImages.hacksaw}

loadObjects.hammer = {name="Hammer",x=75,y=70,w=13,h=7,text={look={"A wooden mallet with a rubber", "head. Often used for flattening", "sheet metal but can be useful", "for smashing fragile objects."},take={"You take the hammer."}},item={name="Hammer",w=28,h=4},img=loadImages.hammer}

loadObjects.necklace = {name="Necklace",x=45,y=29,w=10,h=11,text={look={"A silver necklace adorned with", "a small blue sapphire. It seems", "to have a strange but calming", "energy to it."},take={"You take the necklace."}},item={name="Necklace",w=37,h=4},img=loadImages.necklace}

loadObjects.mirror = {name="Mirror",x=19,y=30,w=6,h=9,text=loadGameText.bedroom.mirror,item={name="Mirror",w=28,h=4},img=loadImages.mirror}

loadObjects.shadowOrb = {name="Shadow Orb",x=42,y=25,w=16,h=16,text={look={"A mysterious orb of darkness."},take={"You take the shadow orb."}},img=loadImages.shadowOrb,item={name="Shadow Orb",w=47,h=4}}

-- Background objects that can be interacted with
loadObjects.bedroomDoor = {name="Door",x=59,y=17,w=24,h=36,text=loadGameText.bedroom.door,state="Closed",img={closed=loadImages.bedroomDoorClosed,open=loadImages.bedroomDoorOpen},move="North"}

loadObjects.churchOutsideDoor = {name="Door",x=48,y=43,w=16,h=22,text=loadGameText.churchOutside.door,state="Closed",img={closed=loadImages.churchDoorOutsideClosed,open=loadImages.churchDoorOutsideOpen},move="North"}

loadObjects.livingRoomDoor = {name="Door",x=16,y=28,w=24,h=36,text={close={"You close the door."},look={"It's a door leading outside to", "your car."},move="North",open={"You open the door."}},img={closed=loadImages.livingRoomDoorClosed,open=loadImages.livingRoomDoorOpen},state="Closed",move="North"}

loadObjects.livingRoomLamp = {name="Lamp",x=76,y=32,w=12,h=42,text={look={"It's a lamp."},use={"You activated the lamp."}},img=loadImages.lamp,visibleInDark=true,lightSwitch=true}

return loadObjects