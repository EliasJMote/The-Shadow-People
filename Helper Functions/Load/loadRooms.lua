local loadRooms = {}
    
-- Bedroom
loadRooms.bedroom = {
                        name="Bedroom",
                        state="Dark",
                        objects={
                                    bedroomDoor=loadObjects.bedroomDoor,
                                    lightFixture={name="Light Fixture",x=43,y=5,w=19,h=5,text={look={"A cheap light fixture. It's", "amazing that it has lasted as", "long as it has."}}},
                                    lightSwitch={name="Light Switch",x=52,y=30,w=4,h=6,text=loadGameText.bedroom.lightSwitch,visibleInDark=true,lightSwitch=true},
                                    mirror=loadObjects.mirror,
                                    mountainPicture={name="Mountain Picture",x=28,y=30,w=7,h=9,text=loadGameText.bedroom.mountainPicture},
                                    portraitPicture={name="Portrait Picture",x=39,y=30,w=7,h=9,text=loadGameText.bedroom.portraitPicture},
                                    rug={name="Rug",x=16,y=60,w=37,h=10,text={look={"It's a rug. It really ties the", "room together."},take={"It's too large to take."}}},
                                    table={name="Table",x=56,y=60,w=35,h=13,text={look={"It's a small table. You've", "played some board games on it", "with friends in the past."},take={"The table is too heavy to take.", "And what would you do with it", "anyway?"}}},
                                    textBook={name="Text Book",x=46,y=19,w=1,h=8,text=loadGameText.bedroom.textBook},
                                    window={name="Window",x=3,y=21,w=10,h=26,text=loadGameText.bedroom.window,visibleInDark=true},
                                },
                        map=loadImages.bedroomMap,
                        exits={north="Living Room"},
                        backgrounds={light=loadImages.bedroomLight,dark=loadImages.bedroomDark},
                    }


-- Car (at house)
loadRooms.car1 =     {
                        name="Car 1",
                        displayName = "Car",
                        state="Light",
                        map=loadImages.carMap,
                        backgrounds={light=loadImages.carDay},
                        objects={
                                    shifter={name="Shifter",x=48,y=51,w=4,h=20,text={look={"It's your car shifter. It's", "currently locked."},use={"The shifter is locked while the", "car is off."}}},
                                    steeringWheel={name="Steering Wheel",x=7,y=30,w=28,h=28,text={look={"It's a steering wheel."}}},
                                    sun={name="Sun",x=81,y=5,w=5,h=5,text={look={"It's the morning sun."}}},
                                },
                        --exits={south="Living Room",north="Car 2"},
                        exits={south="Living Room"},
                    }
       
-- Car (at college)
loadRooms.car2 =    {
                        name="Car 2",
                        displayName = "Car",
                        state="Light",
                        map=loadImages.car2Map,
                        backgrounds={light=loadImages.carEvening},
                        objects={
                                    shifter={name="Shifter",x=48,y=51,w=4,h=20,text={look={"It's your car shifter. It's", "currently locked."},use={"The shifter is locked while the", "car is off."}}},
                                    steeringWheel={name="Steering Wheel",x=7,y=30,w=28,h=28,text={look={"It's a steering wheel."}}}
                                },
                        exits={north="School 1",south="Car 3"},
                    }

-- Car (at gas station)
loadRooms.car3 =    {
                        name="Car 3",
                        displayName = "Car",
                        state="Light",
                        map=loadImages.car3Map,
                        backgrounds={light=loadImages.carNight},
                        objects={
                                    shifter={name="Shifter",x=48,y=51,w=4,h=20,text={look={"It's your car shifter. It's", "currently locked."},use={"The shifter is locked while the", "car is off."}}},
                                    steeringWheel={name="Steering Wheel",x=7,y=30,w=28,h=28,text={look={"It's a steering wheel."}}}
                                },
                        exits={north="Gas Station Outside",south="Car 4"},
                    }
                    
-- Car (wreck)
loadRooms.car4 =    {
                        name="Car 4",
                        displayName = "Car",
                        state="Light",
                        map=loadImages.car4Map,
                        backgrounds={light=loadImages.carNightCollision},
                        objects={
                                    shifter={name="Shifter",x=48,y=51,w=4,h=20,text={look={"It's your car shifter. It's", "currently locked."},use={"The shifter is locked while the", "car is off."}}},
                                    steeringWheel={name="Steering Wheel",x=7,y=30,w=28,h=28,text={look={"It's a steering wheel."}}},
                                    windshield={name="Windshield",x=25,y=9,w=45,h=20,text={look={"A tree has crushed your", "windshield."}}}
                                },
                        exits={west="Highway 1"},
                    }
        
-- Church (main room)
loadRooms.churchInside1 =    {
                                name="Church Inside 1",
                                state="Light",
                                displayName = "Church Inside",
                                map=loadImages.churchOutsideMap,
                                backgrounds={light=loadImages.emptyRoom},
                                objects={},
                                exits={north="Church Inside 2", south="Church Outside"},
                            }
                            
loadRooms.churchInside2 =    {
                                name="Church Inside 2",
                                state="Light",
                                displayName = "Church Inside",
                                map=loadImages.churchOutsideMap,
                                backgrounds={light=loadImages.churchInside},
                                objects={
                                            churchInsideDoor={name="Door",x=27,y=31,w=9,h=35,state="Closed",move="North",text={close={"You close the door."},look={"It's a narrow door hidden in", "the wall."},open={"You open the door."},move="North",}},
                                        },
                                exits={north="Mirror Room", south="Church Inside 1"},
                            }

-- Church (outside)
loadRooms.churchOutside =   {
                                name="Church Outside",
                                state="Light",
                                objects={
                                            churchOutsideDoor=loadObjects.churchOutsideDoor,
                                            bellTower={name="Bell Tower",x=50,y=21,w=12,h=16,text={look={"It looks to be a small bell","tower. It appears to have been", "out of service for a time."}}},
                                            icon={name="Icon",x=52,y=3,w=8,h=8,text={look={"A small metal cross with upward", "curving arms circumscribed by a", "heavy iron ring sits atop the", "church. It appears to be some","kind of religious icon. It", "seems familiar, but you're", "aren't sure where you've seen", "it. Perhaps, in a dream...?"}}},
                                            stainedGlassWindow={name="Stained Glass Window",x=14,y=32,w=19,h=24,text={look={"A stained glass window."}}},
                                        },
                                map=loadImages.churchOutsideMap,
                                backgrounds={light=loadImages.churchOutside},
                                exits={north="Church Inside 1", south="Street 4"},
                            }

-- Classroom
loadRooms.classroom =   {
                            name="Classroom",
                            state="Light",
                            map=loadImages.classroomMap,
                            backgrounds={light=loadImages.classroom},
                            objects={},
                            exits={south="School 3"},
                        }
                        
-- Clock Tower
loadRooms.clockTowerInsideFirstFloor =  {
                                            name="Clock Tower Inside First Floor",
                                            displayName = "C.T. Inside 1F",
                                            state="Light",
                                            map=loadImages.clockTowerOutsideMap,
                                            backgrounds={light=loadImages.clockTowerInside1F},
                                            objects={
                                                        stairs={name="Stairs",x=38,y=35,w=22,h=31,text={look={"Stairs to the second floor."},move="North"},move="North"}
                                                    },
                                            exits={north="Clock Tower Inside Second Floor",south="Clock Tower Outside"},
                                        }
                                        
loadRooms.clockTowerInsideSecondFloor =  {
                                            name="Clock Tower Inside Second Floor",
                                            displayName = "C.T. Inside 2F",
                                            state="Light",
                                            map=loadImages.clockTowerInside2FMap,
                                            backgrounds={light=loadImages.clockTowerInside2F},
                                            objects={
                                                        twelve={name="12",x=44,y=20,w=11,h=6,text={look={"The numeral reads \"12\""}}},
                                                        three={name="3",x=60,y=39,w=11,h=6,text={look={"The numeral reads \"3\""}}},
                                                        six={name="6",x=46,y=57,w=7,h=6,text={look={"The numeral reads \"6\""}}},
                                                        nine={name="9",x=28,y=39,w=7,h=6,text={look={"The numeral reads \"9\""}}},
                                                    },
                                            exits={south="Clock Tower Inside First Floor"},
                                        }

loadRooms.clockTowerOutside =  {
                                    name="Clock Tower Outside",
                                    state="Light",
                                    map=loadImages.clockTowerOutsideMap,
                                    backgrounds={light=loadImages.clockTowerOutside},
                                    objects={
                                                clockTowerOutsideDoor={name="Door",x=33,y=9,w=36,h=60,state="Closed",text={close={"You close the door."},look={"It's a fancy door to the clock", "tower."},open={"You open the door."},move="North"},move="North",img={closed=loadImages.clockTowerOutsideDoorClosed,open=loadImages.clockTowerOutsideDoorOpen}}
                                            },
                                    exits={north="Clock Tower Inside First Floor",south="Street 1"},
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
                                
loadRooms.floodedLabyrinth2 =   {  
                                    name="Flooded Labyrinth 2",
                                    displayName = "Flooded Labyrinth",
                                    state="Dark",
                                    backgrounds={dark=loadImages.emptyRoom},
                                    map=loadImages.sewer1Map,
                                    objects={},
                                    exits={south="Flooded Labyrinth 1"},
                                }

-- Gas Station Bathroom
loadRooms.gasStationBathroom =  {
                                    name="Gas Station Bathroom",
                                    state="Dark",
                                    map=loadImages.gasStationBathroomMap,
                                    backgrounds={dark=loadImages.gasStationBathroomDark,light=loadImages.gasStationBathroomLight},
                                    objects={  
                                                gasStationKey=loadObjects.gasStationKey,
                                                lightSwitch={name="Light Switch",x=44,y=33,w=4,h=6,text=loadGameText.bedroom.lightSwitch,visibleInDark=true,lightSwitch=true},
                                                mirror={name="Mirror",x=20,y=25,w=17,h=15,text={look={"It's a filthy gas station", "mirror."}}},
                                                sink={name="Sink",x=20,y=45,w=17,h=12,text={look={"It's a broken sink."},use={"You turn the handle, but no", "water comes out."}}},
                                                toilet={name="Toilet",x=63,y=46,w=16,h=21,text={look={"It's a vile toilet. A horrific", "stench emanates from the foul", "liquid."},use={"No!"}}},
                                            },
                                    exits={south="Gas Station Outside"},
                                }

-- Gas Station Outside
loadRooms.gasStationOutside =   {
                                    name="Gas Station Outside",
                                    state="Light",
                                    map=loadImages.gasStationOutsideMap,
                                    backgrounds={light=loadImages.gasStationOutside},
                                    objects={
                                                door={name="Door",x=75,y=57,w=7,h=7, move="North", state="Locked", text={look={"It's a double glass door. It's", "dark on the inside."},open={"The door is locked."}}},
                                                light1={name="Light 1",x=15,y=44,w=4,h=2,text={look={"It's a light fixture."}}},
                                                light2={name="Light 2",x=28,y=44,w=4,h=2,text={look={"It's a light fixture."}}},
                                                light3={name="Light 3",x=42,y=44,w=4,h=2,text={look={"It's a light fixture."}}},
                                                pump1={name="Pump 1",x=13,y=59,w=7,h=10,text={look={"It's a gas pump.", use={"The pump doesn't work."}}}},
                                                pump2={name="Pump 2",x=40,y=59,w=7,h=10,text={look={"It's a gas pump.", use={"The pump doesn't work."}}}},
                                                window1={name="Window 1",x=63,y=57,w=5,h=5,text={look={"It's a window. It's too dark to", "see inside."}}},
                                                window2={name="Window 2",x=69,y=57,w=5,h=5,text={look={"It's a window. It's too dark to", "see inside."}}},
                                                window3={name="Window 3",x=83,y=57,w=5,h=5,text={look={"It's a window. It's too dark to", "see inside."}}},
                                                window4={name="Window 4",x=89,y=57,w=5,h=5,text={look={"It's a window. It's too dark to", "see inside."}}},
                                            },
                                    exits={north="Gas Station Inside", south="Car 3",east="Gas Station Bathroom"},
                                }
                                
-- Gas Station Store Inside
loadRooms.gasStationInside =    {
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


loadRooms.graveyard =   {
                            name="Graveyard",
                            state="Light",
                            music=loadMusic.sewers,
                            map=loadImages.graveyardMap,
                            backgrounds={light=loadImages.graveyard},
                            objects={
                                        grave={name="Grave",x=37,y=59,w=26,h=20,text=loadGameText.graveyard.grave,img={normal=loadImages.grave,pushed=loadImages.grave},state="normal"},
                                        graveReligiousIcon={name="Grave Religious Icon",x=38,y=11,w=25,h=25,text={look={"Some sort of religious icon?"}}},
                                        --stairs={name="stairs",x=38,y=69,w=25,h=11,text={look={"Stairs. They lead down into the", "the earth."}}},
                                    },
                            exits={south="Park 3"},
                        }
                        
loadRooms.graveyardUnderground =    {
                                        name="Graveyard Underground",
                                        state="Light",
                                        map=loadImages.graveyardMap,
                                        backgrounds={light=loadImages.emptyRoom},
                                        objects={},
                                        exits={south="Graveyard"},
                                    }

-- Highway 1
loadRooms.highway1 =    {
                            name="Highway 1",
                            displayName = "Highway",
                            state="Light",
                            map=loadImages.highwaySouthEndMap,
                            backgrounds={light=loadImages.highway},
                            objects={},
                            exits={north="Highway 2",east="Car 4"},
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
                            backgrounds={light=loadImages.highwayTIntersection},
                            objects={
                                        sideRoad={name="Side Road",x=65,y=52,w=32,h=8,move="East",text={look={"It's a side road off the", "highway."},move="East"}}
                                    },
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
                                        highwayEng={name="Highway End",x=3,y=60,w=94,h=20,text={look={"The highway simply ends..."}}},
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
                            state="Dark",
                            map=loadImages.livingRoomMap,
                            backgrounds={light=loadImages.livingRoomLight,dark=loadImages.livingRoomDark},
                            objects={
                                        carKey=loadObjects.carKey,
                                        --{name="Kitchen Entrance",x=4,y=22,w=11,h=40,text={look={"It's an opening to the kitchen."},move="West"},visibleInDark=true,move="West"},
                                        patioEntrance={name="Patio Entrance",x=4,y=22,w=11,h=40,text={look={"It's an opening to the patio."},move="West"},visibleInDark=true,move="West"},
                                        livingRoomDoor=loadObjects.livingRoomDoor,
                                        livingRoomLamp=loadObjects.livingRoomLamp
                                    },
                            --exits={north="Car 1", west="Kitchen", south="Bedroom"},
                            exits={north="Car 1", west="Patio", south="Bedroom"},
                            introText={"You enter the living room."}
                        }

-- Mirror room (inside the church)
loadRooms.mirrorRoom =  {
                            name="Mirror Room",
                            state="Light",
                            map=loadImages.mirrorRoomMap,
                            backgrounds={light=loadImages.mirrorRoom},
                            objects={
                                        mirror1={name="Mirror 1",x=23,y=25,w=12,h=34,text={look={"A long mirror."}}},
                                        mirror2={name="Mirror 2",x=44,y=25,w=12,h=34,text={look={"A long mirror."}}},
                                        mirror3={name="Mirror 3",x=65,y=25,w=12,h=34,text={look={"A long mirror."}}},
                                    },
                            exits={south="Church Inside 2"},
                        }

-- Park
loadRooms.park1 =    {
                        name="Park 1",
                        state="Light",
                        map=loadImages.parkEntranceMap,
                        backgrounds={light=loadImages.parkEntrance},
                        objects={},
                        exits={north="Park 2", south="Street 3"},
                    }
                    
loadRooms.park2 =    {
                        name="Park 2",
                        state="Light",
                        map=loadImages.parkEntranceMap,
                        backgrounds={light=loadImages.emptyOutside},
                        objects={},
                        exits={north="Park 3", south="Park 1"},
                    }
                    
loadRooms.park3 =    {
                        name="Park 3",
                        state="Light",
                        music=loadMusic.house,
                        map=loadImages.parkEntranceMap,
                        backgrounds={light=loadImages.emptyOutside},
                        objects={},
                        exits={north="Graveyard", south="Park 2"},
                    }

-- House patio
loadRooms.patio =   {
                        name="Patio",
                        state="Light",
                        objects={
                                    --loadObjects.flashlight,
                                    forest={name="Forest",x=3,y=12,w=94,h=38,text={look={"It's a dead forest."}}},
                                    sun={name="Sun",x=84,y=6,w=5,h=5,text={look={"It's the sun. Don't stare", "directly at it!"},take={"It's too hot to handle!"}}},
                                },
                        backgrounds={light=loadImages.patioLight},
                        map=loadImages.patioMap,
                        --exits={east="Kitchen"},
                        exits={east="Living Room"},
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
                    
-- School 1
loadRooms.school1 =    {  
                            name="School 1",
                            displayName = "School",
                            state="Light",
                            backgrounds={light=loadImages.outsideEvening},
                            map=loadImages.sewer1Map,
                            objects={},
                            exits={south="Car 2", north="School 2"},
                        }
                        
loadRooms.school2 =    {  
                            name="School 2",
                            displayName = "School",
                            state="Light",
                            backgrounds={light=loadImages.outsideEvening},
                            map=loadImages.sewer1Map,
                            objects={},
                            exits={south="School 1", north="School 3"},
                        }
                        
loadRooms.school3 =    {  
                            name="School 3",
                            displayName = "School",
                            state="Light",
                            backgrounds={light=loadImages.outsideEvening},
                            map=loadImages.sewer1Map,
                            objects={},
                            exits={south="School 2", north="Classroom"},
                        }

-- Street 1
loadRooms.street1 =    {  
                            name="Street 1",
                            displayName = "Street",
                            state="Light",
                            backgrounds={light=loadImages.street1},
                            map=loadImages.street1Map,
                            objects={
                                        clockTower={name="Clock Tower",x=43,y=15,w=13,h=33,move="North",text={look={"A clock tower stands tall in", "the distance."},move="North"}}
                                    },
                            exits={west="Highway 4", east="Street 3", north="Clock Tower Outside"},
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
                            objects={
                                        park={name="Park",x=39,y=35,w=21,h=14,move="North",text={look={"A shadowy park lies before you."},move="North"}}
                                    },
                            exits={west="Street 1", east="Street 4", north="Park 1"},
                        }

-- Street 4
loadRooms.street4 =    {  
                            name="Street 4",
                            displayName = "Street",
                            state="Light",
                            backgrounds={light=loadImages.street4},
                            map=loadImages.street4Map,
                            objects={
                                        church={name="Church",x=32,y=39,w=25,h=8,move="North",text={look={"A church sits silently."},move="North"}}
                                    },
                            exits={west="Street 3", east="Street 6", north="Church Outside"},
                        }
                        
-- Street 5
loadRooms.street5 =    {  
                            name="Street 5",
                            displayName = "Street",
                            state="Light",
                            music=loadMusic.house,
                            backgrounds={light=loadImages.street5},
                            map=loadImages.street5Map,
                            objects={},
                            exits={west="Street 4", east="Street 6", north="Railroad Station"},
                        }
                        
loadRooms.street6 =    {  
                            name="Street 6",
                            displayName = "Street",
                            state="Light",
                            music=loadMusic.sewers,
                            backgrounds={light=loadImages.street6},
                            map=loadImages.street6Map,
                            objects={
                                        note={name="Note",x=46,y=48,w=8,h=7,text={look={"Something is etched into the", "wall here:", "\"An endless midnight has been", "visited upon me. Only in a", "dream does light exist for me", "anymore. Am I blind? Even when", "my eyes are open, not even the", "faint sliver of the crescent", "moon is visible to me.\""}}},
                                        silhouetteBody={name="Silhouette body",x=45,y=63,w=20,h=10,text={look={"You're not quite sure what it", "is, but it appears to be a", "silhouette of a person. For", "some reason, you get the", "distinct impression that it's", "not a drawing."}}},
                                    },
                            exits={west="Street 4", east="Street 7"},
                        }
                        
loadRooms.street7 =    {  
                            name="Street 7",
                            displayName = "Street",
                            state="Light",
                            backgrounds={light=loadImages.street7},
                            map=loadImages.street7Map,
                            objects={
                                        sewerGate={name="Sewer Gate",x=45,y=38,w=11,h=22,move="North",state="Locked",text={look={"It's a sewer gate. It looks to", "be rusted in place."},open={"You can't pull it open with", "your bare hands."}}},
                                    },
                            exits={north="Sewer 1", west="Street 6"},
                        }

return loadRooms