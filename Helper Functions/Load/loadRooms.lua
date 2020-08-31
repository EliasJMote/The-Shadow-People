local loadRooms = {}
    
-- Bedroom
loadRooms.bedroom = {
                        name="Bedroom",
                        state="Dark",
                        objects={
                                    loadObjects.bedroomDoor,
                                    {name="Light Fixture",x=43,y=5,w=19,h=5,text={look={"A cheap light fixture. It's", "amazing that it has lasted as", "long as it has."}}},
                                    {name="Light Switch",x=52,y=30,w=4,h=6,text=loadGameText.bedroom.lightSwitch,visibleInDark=true,lightSwitch=true},
                                    loadObjects.mirror,
                                    {name="Mountain Picture",x=28,y=30,w=7,h=9,text=loadGameText.bedroom.mountainPicture},
                                    {name="Portrait Picture",x=39,y=30,w=7,h=9,text=loadGameText.bedroom.portraitPicture},
                                    {name="Rug",x=16,y=60,w=37,h=10,text={look={"It's a rug. It really ties the", "room together."},take={"It's too large to take."}}},
                                    {name="Table",x=56,y=60,w=35,h=13,text={look={"It's a small table. You've", "played some board games on it", "with friends in the past."},take={"The table is too heavy to take.", "And what would you do with it", "anyway?"}}},
                                    {name="Text Book",x=46,y=19,w=1,h=8,text=loadGameText.bedroom.textBook},
                                    {name="Window",x=3,y=21,w=10,h=26,text=loadGameText.bedroom.window,visibleInDark=true},
                                },
                        map=loadImages.bedroomMap,
                        exits={north="Living Room"},
                        backgrounds={light=loadImages.bedroomLight,dark=loadImages.bedroomDark,},
                        locks={}
                    }


-- Car (at house)
loadRooms.car1 =     {
                        name="Car 1",
                        displayName = "Car",
                        state="Light",
                        map=loadImages.carMap,
                        backgrounds={light=loadImages.carDay},
                        objects={},
                        exits={south="Living Room",north="Car 2"},
                    }
       
-- Car (at college)
loadRooms.car2 =    {
                        name="Car 2",
                        displayName = "Car",
                        state="Light",
                        map=loadImages.car2Map,
                        backgrounds={light=loadImages.carEvening},
                        objects={},
                        exits={north="Classroom",south="Car 3"},
                    }

-- Car (at gas station)
loadRooms.car3 =    {
                        name="Car 3",
                        displayName = "Car",
                        state="Light",
                        map=loadImages.car3Map,
                        backgrounds={light=loadImages.carNight},
                        objects={},
                        exits={north="Gas Station Outside",south="Car 4"},
                    }
                    
-- Car (wreck)
loadRooms.car4 =    {
                        name="Car 4",
                        displayName = "Car",
                        state="Light",
                        map=loadImages.car4Map,
                        backgrounds={light=loadImages.carNight},
                        objects={},
                        exits={west="Highway 1"},
                    }
        
-- Church (main room)
loadRooms.churchInside =    {
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
                                state="Light",
                                objects={
                                            loadObjects.churchOutsideDoor,
                                            {name="Bell Tower",x=50,y=21,w=12,h=16,text={look={"It looks to be a small bell","tower. It appears to have been", "out of service for a time."}}},
                                            {name="Icon",x=52,y=3,w=8,h=8,text={look={"A small metal cross with upward", "curving arms circumscribed by a", "heavy iron ring sits atop the", "church. It appears to be some","kind of religious icon. It", "seems familiar, but you're", "aren't sure where you've seen", "it. Perhaps, in a dream...?"}}},
                                            {name="Stained Glass Window",x=14,y=32,w=19,h=24,text={look={"A stained glass window."}}},
                                        },
                                map=loadImages.churchOutsideMap,
                                backgrounds={light=loadImages.churchOutside},
                                exits={north="Church Inside", south="Street 4"},
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
loadRooms.clockTower =  {
                            name="Clock Tower",
                            state="Dark",
                            map=loadImages.highwayNorthEndMap,
                            backgrounds={dark=loadImages.empty},
                            objects={},
                            exits={south="Street 1"},
                        }
         
-- Flooded Labyrinth 1
loadRooms.floodedLabyrinth1 =   {  
                                    name="Flooded Labyrinth 1",
                                    displayName = "Flooded Labyrinth",
                                    state="Dark",
                                    backgrounds={dark=loadImages.emptyRoom},
                                    map=loadImages.sewer1Map,
                                    objects={},
                                    exits={north="Flooded Labyrinth 2", south="Sewer 7"},
                                }

-- Gas Station Bathroom
loadRooms.gasStationBathroom =  {
                                    name="Gas Station Bathroom",
                                    state="Dark",
                                    map=loadImages.gasStationBathroomMap,
                                    backgrounds={dark=loadImages.gasStationBathroom},
                                    objects={},
                                    exits={south="Gas Station Outside"},
                                }

-- Gas Station Outside
loadRooms.gasStationOutside =   {
                                    name="Gas Station Outside",
                                    state="Light",
                                    map=loadImages.gasStationOutsideMap,
                                    backgrounds={light=loadImages.gasStationOutside},
                                    objects={
                                                {name="Door",x=75,y=57,w=7,h=7, move="North", state="Locked", text={look={"It's a double glass door. It's", "dark on the inside."},open={"The door is locked."}}},
                                                {name="Light 1",x=15,y=44,w=4,h=2,text={look={"It's a light fixture."}}},
                                                {name="Light 2",x=28,y=44,w=4,h=2,text={look={"It's a light fixture."}}},
                                                {name="Light 3",x=42,y=44,w=4,h=2,text={look={"It's a light fixture."}}},
                                                {name="Pump 1",x=13,y=59,w=7,h=10,text={look={"It's a gas pump."}}},
                                                {name="Pump 2",x=40,y=59,w=7,h=10,text={look={"It's a gas pump."}}},
                                                {name="Window 1",x=63,y=57,w=5,h=5,text={look={"It's a window. It's too dark to", "see inside."}}},
                                                {name="Window 2",x=69,y=57,w=5,h=5,text={look={"It's a window. It's too dark to", "see inside."}}},
                                                {name="Window 3",x=83,y=57,w=5,h=5,text={look={"It's a window. It's too dark to", "see inside."}}},
                                                {name="Window 4",x=89,y=57,w=5,h=5,text={look={"It's a window. It's too dark to", "see inside."}}},
                                            },
                                    exits={north="Gas Station Inside", south="Car 3",east="Gas Station Bathroom"},
                                }
                                
-- Gas Station Store Inside
loadRooms.gasStationInside =  {
                                    name="Gas Station Inside",
                                    state="Dark",
                                    map=loadImages.gasStationBathroomMap,
                                    backgrounds={dark=loadImages.emptyRoom},
                                    objects={},
                                    exits={south="Gas Station Outside"},
                                }

-- General Store Outside
loadRooms.generalStore =    {
                                name="General Store",
                                state="Light",
                                map=loadImages.highwayNorthEndMap,
                                backgrounds={light=loadImages.empty},
                                objects={},
                                exits={south="Street 2"},
                            }

-- Highway 1
loadRooms.highway1 =    {
                            name="Highway 1",
                            displayName = "Highway",
                            state="Light",
                            map=loadImages.highwaySouthEndMap,
                            backgrounds={light=loadImages.highway},
                            objects={},
                            exits={north="Highway 2"},
                        }

-- Highway 2
loadRooms.highway2 =    {
                            name="Highway 2",
                            displayName = "Highway",
                            state="Light",
                            map=loadImages.highwayMap,
                            backgrounds={light=loadImages.highway},
                            objects={},
                            exits={north="Highway 3", south="Highway 1"},
                        }

-- Highway 3
loadRooms.highway3 =    {
                            name="Highway 3",
                            displayName = "Highway",
                            state="Light",
                            map=loadImages.highwayMap,
                            backgrounds={light=loadImages.highway},
                            objects={},
                            exits={north="Highway 4", south="Highway 2"},
                        }

-- Highway 4
loadRooms.highway4 =    {
                            name="Highway 4",
                            displayName = "Highway",
                            state="Light",
                            map=loadImages.highwayTIntersectionMap,
                            backgrounds={light=loadImages.highway},
                            objects={},
                            exits={north="Highway 5", east="Street 1", south="Highway 3"},
                        }
                        
-- Highway 5
loadRooms.highway5 =    {
                            name="Highway 5",
                            displayName = "Highway",
                            state="Light",
                            map=loadImages.highwayNorthEndMap,
                            backgrounds={light=loadImages.highwayNorthEnd},
                            objects={
                                        {name="Highway End",x=3,y=60,w=94,h=20,text={look={"The highway simply ends..."}}},
                                    },
                            exits={south="Highway 4"},
                        }

-- House patio
loadRooms.kitchen =     {
                            name="Kitchen",
                            state="Light",
                            objects={
                                        --{name="Knife",x=60,y=17,w=13,h=5,text={"You take the kitchen knife."},item="Knife"}
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
                                        loadObjects.carKey,
                                    },
                            exits={north="Car 1", west="Kitchen", south="Bedroom"},
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

-- Park
loadRooms.park =    {
                        name="Park",
                        state="Dark",
                        map=loadImages.highwayNorthEndMap,
                        backgrounds={dark=loadImages.empty},
                        objects={},
                        exits={south="Street 3"},
                    }

-- House patio
loadRooms.patio =   {
                        name="Patio",
                        state="Light",
                        objects={
                                    --loadObjects.flashlight,
                                    {name="Forest",x=3,y=12,w=94,h=38,text={look={"It's a dead forest."}}},
                                    {name="Sun",x=84,y=6,w=5,h=5,text={look={"It's the sun. Don't stare", "directly at it!"},take={"It's too hot to handle!"}}},
                                },
                        backgrounds={light=loadImages.patioLight},
                        map=loadImages.patioMap,
                        exits={east="Kitchen"},
                    }
                    
-- Railroad station
loadRooms.railroadStation =     {
                                    name="Railroad Station",
                                    state="Dark",
                                    map=loadImages.highwayNorthEndMap,
                                    backgrounds={dark=loadImages.empty},
                                    objects={},
                                    exits={south="Street 5"},
                                }

-- Sewer
loadRooms.sewer1 =  {  
                        name="Sewer 1",
                        displayName = "Sewer",
                        state="Dark",
                        backgrounds={dark=loadImages.emptyRoom},
                        map=loadImages.sewer1Map,
                        objects={},
                        exits={north="Sewer 2", south="Street 7"},
                    }
                    
loadRooms.sewer2 =  {  
                        name="Sewer 2",
                        displayName = "Sewer",
                        state="Dark",
                        backgrounds={dark=loadImages.emptyRoom},
                        map=loadImages.sewer1Map,
                        objects={},
                        exits={north="Sewer 3", south="Sewer 1"},
                    }
                    
loadRooms.sewer3 =  {  
                        name="Sewer 3",
                        displayName = "Sewer",
                        state="Dark",
                        backgrounds={dark=loadImages.emptyRoom},
                        map=loadImages.sewer1Map,
                        objects={},
                        exits={north="Sewer 4", south="Sewer 2"},
                    }
                    
loadRooms.sewer4 =  {  
                        name="Sewer 3",
                        displayName = "Sewer",
                        state="Dark",
                        backgrounds={dark=loadImages.emptyRoom},
                        map=loadImages.sewer1Map,
                        objects={},
                        exits={north="Sewer 5", south="Sewer 3"},
                    }
                    
loadRooms.sewer5 =  {  
                        name="Sewer 5",
                        displayName = "Sewer",
                        state="Dark",
                        backgrounds={dark=loadImages.emptyRoom},
                        map=loadImages.sewer1Map,
                        objects={},
                        exits={north="Sewer 6", south="Sewer 4"},
                    }
                    
loadRooms.sewer6 =  {  
                        name="Sewer 6",
                        displayName = "Sewer",
                        state="Dark",
                        backgrounds={dark=loadImages.emptyRoom},
                        map=loadImages.sewer1Map,
                        objects={},
                        exits={north="Sewer 7", south="Sewer 5"},
                    }
                    
loadRooms.sewer7 =  {  
                        name="Sewer 7",
                        displayName = "Sewer",
                        state="Dark",
                        backgrounds={dark=loadImages.emptyRoom},
                        map=loadImages.sewer1Map,
                        objects={},
                        exits={north="Flooded Labyrinth 1", south="Sewer 6"},
                    }
                    
-- Shadow Lands
loadRooms.shadowLands1 =    {  
                                name="Shadow Lands 1",
                                state="Dark",
                                backgrounds={dark=loadImages.empty},
                                map=loadImages.sewer1Map,
                                objects={},
                                exits={north="Shadow Lands 2"},
                            }
                            
loadRooms.shadowLands2 =    {  
                                name="Shadow Lands 2",
                                state="Dark",
                                backgrounds={dark=loadImages.empty},
                                map=loadImages.sewer1Map,
                                objects={},
                                exits={north="Shadow Lands 3"},
                            }    
                            
loadRooms.shadowLands3 =    {  
                                name="Shadow Lands 2",
                                state="Dark",
                                backgrounds={dark=loadImages.empty},
                                map=loadImages.sewer1Map,
                                objects={},
                                exits={north="Shadow Lands 3"},
                            }                              
                    
-- Street 1
loadRooms.street1 =    {  
                            name="Street 1",
                            displayName = "Street",
                            state="Light",
                            backgrounds={light=loadImages.street1},
                            map=loadImages.street1Map,
                            objects={},
                            exits={west="Highway 4", east="Street 2", north="Clock Tower"},
                        }

-- Street 2
loadRooms.street2 =    {  
                            name="Street 2",
                            displayName = "Street",
                            state="Light",
                            backgrounds={light=loadImages.street2},
                            map=loadImages.street2Map,
                            objects={},
                            exits={west="Street 1", east="Street 3", north="General Store"},
                        }
                        
-- Street 3
loadRooms.street3 =    {
                            name="Street 3",
                            displayName = "Street",
                            state="Light",
                            backgrounds={light=loadImages.street3},
                            map=loadImages.street3Map,
                            objects={},
                            exits={west="Street 2", east="Street 4", north="Park"},
                        }

-- Street 4
loadRooms.street4 =    {  
                            name="Street 4",
                            displayName = "Street",
                            state="Light",
                            backgrounds={light=loadImages.street4},
                            map=loadImages.street4Map,
                            objects={},
                            exits={west="Street 3", east="Street 5", north="Church Outside"},
                        }
                        
-- Street 5
loadRooms.street5 =    {  
                            name="Street 5",
                            displayName = "Street",
                            state="Light",
                            backgrounds={light=loadImages.street5},
                            map=loadImages.street5Map,
                            objects={},
                            exits={west="Street 4", east="Street 6", north="Railroad Station"},
                        }
                        
loadRooms.street6 =    {  
                            name="Street 6",
                            displayName = "Street",
                            state="Light",
                            music=loadMusic.house,
                            backgrounds={light=loadImages.street6},
                            map=loadImages.street6Map,
                            objects={
                                        {name="Note",x=46,y=48,w=8,h=7,text={look={"Something is etched into the", "wall here:", "\"An endless midnight has been", "visited upon me. Only in a", "dream does light exist for me", "anymore. Am I blind? Even when", "my eyes are open, not even the", "faint sliver of the crescent", "moon is visible to me.\""}}},
                                        {name="Silhouette body",x=45,y=63,w=20,h=10,text={look={"You're not quite sure what it", "is, but it appears to be a", "silhouette of a person. For", "some reason, you get the", "distinct impression that it's", "not a drawing."}}},
                                    },
                            exits={west="Street 5", east="Street 7"},
                        }
                        
loadRooms.street7 =    {  
                            name="Street 7",
                            displayName = "Street",
                            state="Light",
                            music=loadMusic.sewers,
                            backgrounds={light=loadImages.street7},
                            map=loadImages.street7Map,
                            objects={
                                        {name="Sewer Gate",x=45,y=38,w=11,h=22,move="North",state="Locked",text={look={"It's a sewer gate. It looks to", "be rusted in place."},open={"You can't pull it open with", "your bare hands."}}},
                                    },
                            exits={north="Sewer 1", west="Street 6"},
                        }

return loadRooms