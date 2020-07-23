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
                        backgrounds={light=loadImages.bedroomLight,dark=loadImages.bedroomDark,},
                        locks={}
                    }


-- Car (at house)
loadRooms.car =     {
                        name="Car",
                        state="Light",
                        map=loadImages.carMap,
                        backgrounds={light=loadImages.car},
                        objects={},
                        exits={south="Living Room",north="Car 2"},
                    }
       
-- Car (at college)
loadRooms.car2 =     {
                        name="Car 2",
                        state="Light",
                        map=loadImages.car2Map,
                        backgrounds={light=loadImages.car},
                        objects={},
                        exits={north="Classroom",south="Car 3"},
                    }

-- Car (at gas station)
loadRooms.car3 =     {
                        name="Car 3",
                        state="Light",
                        map=loadImages.car3Map,
                        backgrounds={light=loadImages.car},
                        objects={},
                        exits={north="Gas Station Outside"},
                    }
                    
-- Car (wreck)
loadRooms.car4 =    {
                        name="Car 4",
                        state="Light",
                        map=loadImages.car4Map,
                        backgrounds={light=loadImages.car},
                        objects={},
                        exits={west="Highway 1"},
                    }
        
-- Church (main room)
loadRooms.churchInside =   {
                                name="Church Inside",
                                state="Dark",
                                map=loadImages.churchOutsideMap,
                                backgrounds={dark=loadImages.churchInside},
                                objects={},
                                exits={north="Mirror Room", south="Church Outside"},
                            }

-- Church (outside)
loadRooms.churchOutside =   {
                                name="Church Outside",
                                state="Dark",
                                map=loadImages.churchOutsideMap,
                                backgrounds={dark=loadImages.churchOutside},
                                objects={},
                                exits={north="Church Inside", south="Town Hub 4"},
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
                        
-- Clock Tower
loadRooms.clockTower =    {
                            name="Clock Tower",
                            state="Dark",
                            map=loadImages.highwayMapEnd,
                            backgrounds={dark=loadImages.livingRoom},
                            objects={},
                            exits={south="Town Hub 1"},
                        }

-- Gas Station Inside
loadRooms.gasStationBathroom =  {
                                    name="Gas Station Bathroom",
                                    state="Light",
                                    map=loadImages.gasStationBathroomMap,
                                    backgrounds={light=loadImages.gasStationBathroom},
                                    objects={},
                                    exits={south="Gas Station Outside"},
                                }

-- Gas Station Outside
loadRooms.gasStationOutside =   {
                                    name="Gas Station Outside",
                                    state="Light",
                                    map=loadImages.gasStationOutsideMap,
                                    backgrounds={light=loadImages.gasStationOutside},
                                    objects={},
                                    exits={south="Car 4",north="Gas Station Bathroom"},
                                }

-- Highway 1
loadRooms.highway1 =    {
                            name="Highway 1",
                            state="Dark",
                            map=loadImages.highwaySouthEndMap,
                            backgrounds={dark=loadImages.highway},
                            objects={},
                            exits={north="Highway 2"},
                        }

-- Highway 2
loadRooms.highway2 =    {
                            name="Highway 2",
                            state="Dark",
                            map=loadImages.highwayMap,
                            backgrounds={dark=loadImages.highway},
                            objects={},
                            exits={north="Highway 3", south="Highway 1"},
                        }

-- Highway 3
loadRooms.highway3 =    {
                            name="Highway 3",
                            state="Dark",
                            map=loadImages.highwayMap,
                            backgrounds={dark=loadImages.highway},
                            objects={},
                            exits={north="Highway 4", south="Highway 2"},
                        }

-- Highway 4
loadRooms.highway4 =    {
                            name="Highway 4",
                            state="Dark",
                            map=loadImages.highwayTIntersectionMap,
                            backgrounds={dark=loadImages.highway},
                            objects={},
                            exits={north="Highway 5", east="Town Hub 1", south="Highway 3"},
                        }
                        
-- Highway 5
loadRooms.highway5 =    {
                            name="Highway 5",
                            state="Dark",
                            map=loadImages.highwayNorthEndMap,
                            backgrounds={dark=loadImages.highwayNorthEnd},
                            objects={},
                            exits={south="Highway 4"},
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

-- Mirror room (inside the church)
loadRooms.mirrorRoom =  {
                            name="Mirror Room",
                            state="Dark",
                            map=loadImages.mirrorRoomMap,
                            backgrounds={dark=loadImages.mirrorRoom},
                            objects={},
                            exits={south="Church Inside"},
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
loadRooms.sewer1 =  {  
                        name="Sewer 1",
                        state="Dark",
                        backgrounds={dark=loadImages.livingRoom},
                        map=loadImages.sewer1Map,
                        objects={},
                        exits={north="Sewer 2"},
                    }
                    
-- Town Hub 1
loadRooms.townHub1 =    {  
                            name="Town Hub 1",
                            state="Dark",
                            backgrounds={dark=loadImages.street},
                            map=loadImages.townHub1Map,
                            objects={},
                            exits={east="Town Hub 2", --[[north="Clock Tower"]]},
                        }

-- Town Hub 2
loadRooms.townHub2 =    {  
                            name="Town Hub 2",
                            state="Dark",
                            backgrounds={dark=loadImages.street},
                            map=loadImages.townHub2Map,
                            objects={},
                            exits={west="Town Hub 1", east="Town Hub 3", --[[north="General Store"]]},
                        }
                        
-- Town Hub 3
loadRooms.townHub3 =    {  
                            name="Town Hub 3",
                            state="Dark",
                            backgrounds={dark=loadImages.street},
                            map=loadImages.townHub3Map,
                            objects={},
                            exits={west="Town Hub 2", east="Town Hub 4", --[[north="Park"]]},
                        }
    

-- Town Hub 4
loadRooms.townHub4 =    {  
                            name="Town Hub 4",
                            state="Dark",
                            backgrounds={dark=loadImages.street},
                            map=loadImages.townHub4Map,
                            objects={},
                            exits={west="Town Hub 3", east="Town Hub 5", north="Church Outside"},
                        }
                        
-- Town Hub 5
loadRooms.townHub5 =    {  
                            name="Town Hub 5",
                            state="Dark",
                            backgrounds={dark=loadImages.street},
                            map=loadImages.townHub5Map,
                            objects={},
                            exits={west="Town Hub 4", --[[north="Railroad Station"]]},
                        }

return loadRooms