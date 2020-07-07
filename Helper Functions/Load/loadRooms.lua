local loadRooms = {}
    
-- Bedroom
loadRooms.bedroom = {
                        name="Bedroom",
                        state="Dark",
                        objects={
                                    {name="Door",x=60,y=17,w=24,h=36,text=loadGameText.bedroom.door},
                                    {name="Light Switch",x=52,y=30,w=4,h=6,text=loadGameText.bedroom.lightSwitch,visibleInDark=true,lightSwitch=true},
                                    {name="Mirror",x=19,y=30,w=6,h=9,text=loadGameText.bedroom.mirror},
                                    {name="Mountain Picture",x=28,y=30,w=7,h=9,text=loadGameText.bedroom.mountainPicture},
                                    {name="Portrait Picture",x=39,y=30,w=7,h=9,text=loadGameText.bedroom.portraitPicture},
                                    {name="Text Book",x=46,y=19,w=1,h=8,text=loadGameText.bedroom.textBook},
                                    {name="Window",x=3,y=21,w=10,h=26,text=loadGameText.bedroom.window,visibleInDark=true},
                                },
                        map=loadImages.bedroomMap,
                        exits={north="Living Room"},
                        backgrounds={light=loadImages.bedroomLight,dark=loadImages.bedroomDark,}
                    }


-- Car
loadRooms.car =     {
                        name="Car",
                        state="Light",
                        map=loadImages.carMap,
                        backgrounds={light=loadImages.car},
                        objects={},
                        exits={west="Living Room",north="Car 2"},
                    }
                    
loadRooms.car2 =     {
                        name="Car 2",
                        state="Light",
                        map=loadImages.carMap,
                        backgrounds={light=loadImages.car},
                        objects={},
                        exits={west="Classroom",south="Car 3"},
                    }

loadRooms.car3 =     {
                        name="Car 3",
                        state="Light",
                        map=loadImages.carMap,
                        backgrounds={light=loadImages.car},
                        objects={},
                        exits={west="Gas Station Outside"},
                    }

-- Classroom
loadRooms.classroom =   {
                            name="Classroom",
                            state="Light",
                            map=loadImages.classroomMap,
                            backgrounds={light=loadImages.classroom},
                            objects={},
                            exits={south="Car 2"},
                        }

-- House patio
loadRooms.kitchen =     {
                            name="Kitchen",
                            state="Light",
                            objects={
                                        {name="Knife",x=60,y=17,w=13,h=5,text={"You take the kitchen knife."},item="Knife"}
                                    },
                            backgrounds={light=loadImages.kitchen},
                            map=loadImages.kitchenMap,
                            exits={west="Patio", east="Living Room"},
                        }

-- Living Room
loadRooms.livingRoom =  {
                            name="Living Room",
                            state="Light",
                            map=loadImages.livingRoomMap,
                            backgrounds={light=loadImages.livingRoom},
                            objects={
                                        {name="Car Key",x=60,y=17,w=13,h=5,text={"You take the car key."},img=loadImages.carKey,item="Car Key"}
                                    },
                            exits={north="Car", west="Kitchen", south="Bedroom"},
                            introText={"You enter the living room."}
                        }

-- House patio
loadRooms.patio =   {
                        name="Patio",
                        state="Light",
                        objects={
                                    {name="Flashlight",x=60,y=45,w=13,h=5,text={"You take the flashlight."},img=loadImages.flashlight,item="Flashlight"}
                                },
                        backgrounds={light=loadImages.patioLight},
                        map=loadImages.patioMap,
                        exits={east="Kitchen"},
                    }

-- Shed
loadRooms.shed =    {  
                        name="Shed",
                        state="Dark",
                        backgrounds={light=loadImages.shedLight,dark=loadImages.shedDark},
                        map=loadImages.shedMap,
                        objects={},
                        exits={},
                    }
    

return loadRooms