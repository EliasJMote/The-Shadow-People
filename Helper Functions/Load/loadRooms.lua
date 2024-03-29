local loadRooms = {}
    
local g = GLOBALS
    
loadRooms.altarRoom =   {
                            name="Altar Room",
                            state="Light",
                            objects={
                                        altar={name="Altar",x=38,y=54,w=26,h=12,text={look={"It's an altar to the red", "prince. You're not sure why,", "but the name sounds vaguely", "familiar, as though it was from", "a story long ago...There is a", "small dagger on the altar,", "sharp and vicious looking with", "a decadent hilt made of", "glittering gold and a blade of", "shining silver."}, use={""},push={"It's too heavy to move. You'll","have to approach it instead."},pull={"It's too heavy to move. You'll","have to approach it instead."},}},
                                        crescentMoon={name="Crescent Moon",x=43,y=17,w=16,h=16,text={look={"It's an image of a crescent", "moon. It looks incredibly old."}}},
                                        eyeOfTruth={name="Eye of Truth",x=66,y=17,w=16,h=16,text={look={"A strange looking image. The", "eye in the drawing seems to", "pierce right through your soul."}}},
                                        inscription={name="Inscription",x=47,y=40,w=9,h=9,img=loadImages.graveyardNote,text={look={"Something is etched into the", "wall here:", "\"THE RED PRINCE, LONG IN", "SLUMBER. DO NOT APPROACH THE", "ALTAR, LEST YOU BRING ABOUT HIS", "RESURRECTION!\""}}},
                                        poleSymbol1={name="Pole Symbol 1",x=10,y=39,w=4,h=37,text={look={"It's a pole with a strange", "symbol in the middle."}}},
                                        poleSymbol2={name="Pole Symbol 2",x=24,y=42,w=4,h=28,text={look={"It's a pole with a strange", "symbol in the middle."}}},
                                        poleSymbol3={name="Pole Symbol 3",x=72,y=42,w=4,h=28,text={look={"It's a pole with a strange", "symbol in the middle."}}},
                                        poleSymbol4={name="Pole Symbol 4",x=86,y=39,w=4,h=37,text={look={"It's a pole with a strange", "symbol in the middle."}}},
                                        symbolOfThePrince={name="Symbol of the Prince",x=18,y=17,w=16,h=16,state="Closed",img={closed=loadImages.altarEyeClosed,opened=loadImages.altarEyeOpened},text={look={"An image of a triangle with", "something on the inside..."}}},
                                    },
                            map=loadImages.oneWayDownMap,
                            exits={south="Puzzling Stone"},
                            backgrounds={light=loadImages.altarRoom},
                            backgroundStatic = true,
                            music=loadMusic.nightmareGeometry,
                        }

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
                        map=loadImages.oneWayUpMap,
                        exits={north="Living Room"},
                        music=loadMusic.houseDark,
                        backgrounds={light=loadImages.bedroomLight,dark=loadImages.bedroomDark},
                    }

-- Car (at house)
loadRooms.car1 =     {
                        name="Car 1",
                        displayName = "Car",
                        state="Light",
                        map=loadImages.oneWayDownMap,
                        backgrounds={light=loadImages.carDay},
                        music=loadMusic.houseLight,
                        objects={
                                    gloveCompartment={name="Glove Compartment",x=70,y=44,w=27,h=10,text={look={"It's your car glove", "compartment. Unfortunately, the", "lock mechanism is stuck, so you", "can't open it."},open={"The lock is stuck. Opening the", "compartment is futile."},pull={"The lock is stuck. Opening the", "compartment is futile."}}},
                                    shifter={name="Shifter",x=48,y=51,w=4,h=20,text={look={"It's your car shifter. It helps", "you switch gears when driving."},use={"You don't need to use it now."}}},
                                    steeringWheel={name="Steering Wheel",x=7,y=30,w=28,h=28,text={look={"It's your car steering wheel.", "It's a bit sticky these days.", "Use your car keys here to", "start driving."}}},
                                },
                        exits={south="Living Room"},
                    }
       
-- Car (at college)
loadRooms.car2 =    {
                        name="Car 2",
                        displayName = "Car",
                        state="Light",
                        map=loadImages.oneWayUpMap,
                        music=loadMusic.houseLight,
                        backgrounds={light=loadImages.carEvening,dark=loadImages.carNight},
                        objects={
                                    gloveCompartment={name="Glove Compartment",x=70,y=44,w=27,h=10,text={look={"It's your car glove", "compartment. Unfortunately, the", "lock mechanism is stuck, so you", "can't open it."},open={"The lock is stuck. Opening the", "compartment is futile."},pull={"The lock is stuck. Opening the", "compartment is futile."}}},
                                    shifter={name="Shifter",x=48,y=51,w=4,h=20,text={look={"It's your car shifter. It helps", "you switch gears when driving."},use={"You don't need to use it now."}}},
                                    steeringWheel={name="Steering Wheel",x=7,y=30,w=28,h=28,text={look={"It's your car steering wheel.", "It's a bit sticky these days."}}}
                                },
                        exits={north="School 1"},
                    }

-- Car (at gas station)
loadRooms.car3 =    {
                        name="Car 3",
                        displayName = "Car",
                        state="Light",
                        map=loadImages.oneWayUpMap,
                        backgrounds={light=loadImages.carNight},
                        music=loadMusic.houseDark,
                        objects={
                                    gloveCompartment={name="Glove Compartment",x=70,y=44,w=27,h=10,text={look={"It's your car glove", "compartment. Unfortunately, the", "lock mechanism is stuck, so you", "can't open it."},open={"The lock is stuck. Opening the", "compartment is futile."},pull={"The lock is stuck. Opening the", "compartment is futile."}}},
                                    shifter={name="Shifter",x=48,y=51,w=4,h=20,text={look={"It's your car shifter. It helps", "you switch gears when driving."},use={"You don't need to use it now."}}},
                                    steeringWheel={name="Steering Wheel",x=7,y=30,w=28,h=28,text={look={"It's your car steering wheel.", "It's a bit sticky these days."}}}
                                },
                        exits={north="Gas Station Outside"},
                    }
                    
-- Car (wreck)
loadRooms.car4 =    {
                        name="Car 4",
                        displayName = "Car",
                        state="Light",
                        map=loadImages.oneWayLeftMap,
                        music=loadMusic.houseDark,
                        backgrounds={light=loadImages.carNightCollision},
                        objects={
                                    gloveCompartment={name="Glove Compartment",x=70,y=44,w=27,h=10,text={look={"It's your car glove", "compartment. Unfortunately, the", "lock mechanism is stuck, so you", "can't open it."},open={"The lock is stuck. Opening the", "compartment is futile."},pull={"The lock is stuck. Opening the", "compartment is futile."}}},
                                    shifter={name="Shifter",x=48,y=51,w=4,h=20,text={look={"It's your car shifter. In your", "current predicament, it won't", "accomplish much."},use={"You don't need to use it now."}}},
                                    steeringWheel={name="Steering Wheel",x=7,y=30,w=28,h=28,text={look={"It's your car steering wheel.", "With your car so damaged, it", "isn't much use now."}}},
                                    windshield={name="Windshield",x=25,y=9,w=45,h=20,text={look={"A tree has crushed your", "windshield."}}}
                                },
                        exits={west="Highway 1"},
                    }
        
loadRooms.churchBasement =   {
                                name="Church Basement",
                                state="Light",
                                objects={
                                            inscription={name="Inscription",x=20,y=40,w=9,h=9,img=loadImages.graveyardNote,text={look={"Something is etched into the", "wall here:", "\"In the darkness, you can see","your true self.\""}}},
                                            ladder={name="Ladder",x=72,y=7,w=8,h=41,img=loadImages.churchBasementLadder,text={look={"It's a ladder going up."},move=""}},
                                            mirror={name="Mirror",x=32,y=34,w=32,h=32,state="Unbroken",img={unbroken=loadImages.churchBasementMirror,broken=loadImages.churchBasementMirrorBroken},text={look={"A large ornate mirror stands", "before you. It's strange, but", "the longer you gaze at your", "reflection, the more you feel", "like it's watching you..."},push={"It's too heavy to push."},pull={"It's too heavy to pull."},talk={"You start talking to yourself.","You may have finally lost it..."}}},
                                            wallCandelabra1={name="Candelabra",x=4,y=36,w=11,h=11,state="Lit",img={lit={loadImages.litWallCandelabra,loadImages.litWallCandelabra2},unlit=loadImages.unlitWallCandelabra},text={look={"A candelabra hangs on the wall."},take={"You feel like you shouldn't."},use={"You extinguish the light."}}},
                                            wallCandelabra2={name="Candelabra",x=85,y=36,w=11,h=11,state="Lit",img={lit={loadImages.litWallCandelabra,loadImages.litWallCandelabra2},unlit=loadImages.unlitWallCandelabra},text={look={"A candelabra hangs on the wall."},take={"You feel like you shouldn't."},use={"You extinguish the light."}}},
                                        },
                                map=loadImages.oneWayUpMap,
                                music=loadMusic.darkStreets,
                                backgrounds={light=loadImages.churchBasement,dark=loadImages.churchBasement},
                                exits={north="Church Inside 2"},
                            }
-- Church (main room)
loadRooms.churchInside1 =    {
                                name="Church Inside 1",
                                state="Light",
                                displayName = "Church Inside",
                                map=loadImages.twoWayLLowerLeftMap,
                                backgrounds={light=loadImages.churchInside,dark=loadImages.churchInside},
                                music=loadMusic.darkStreets,
                                objects={
                                            candle1={name="Candle",x=37,y=48,w=3,h=8,state="Unlit",img={lit={loadImages.litCandle,loadImages.litCandle2},unlit=loadImages.unlitCandle},text={look={"A candle sits on the altar."},take={"You feel like you shouldn't."},use={"It's already out."}}},
                                            candle2={name="Candle",x=60,y=48,w=3,h=8,state="Unlit",img={lit={loadImages.litCandle,loadImages.litCandle2},unlit=loadImages.unlitCandle},text={look={"A candle sits on the altar."},take={"You feel like you shouldn't."},use={"It's already out."}}},
                                            religiousIcon={name="Religious Icon",x=40,y=24,w=21,h=22,text={look={"Some sort of religious icon? It", "looks a bit like a cross with", "spikes on the ends, but there", "is a crescent around part of", "the cross."}}},
                                            wallCandelabra1={name="Candelabra",x=85,y=36,w=11,h=11,state="Unlit",img={lit={loadImages.litWallCandelabra,loadImages.litWallCandelabra2},unlit=loadImages.unlitWallCandelabra},text={look={"A candelabra hangs on the wall."},take={"You feel like you shouldn't."},use={"It's already out."}}},
                                        },
                                exits={west="Church Inside 2",south="Church Outside"},
                            }
                            
loadRooms.churchInside2 =    {
                                name="Church Inside 2",
                                state="Light",
                                displayName = "Church Inside 2",
                                map=loadImages.twoWayLUpperRightMap,
                                backgrounds={light=loadImages.churchInside2,dark=loadImages.churchInside2},
                                music=loadMusic.darkStreets,
                                objects={
                                            mural={name="Mural",x=19,y=19,w=75,h=45,text={look={"It's a mural. You can see what","appears to be a crystal cavern,","a forest, a lighthouse on a","beach, dark hills, a swampy","pit, and a tower rising into", "the sky. A large magnificent","crescent moon hangs overhead,","overlooking it all.","Is it based on a story...?"},push={"You place your hand against the","mural, but it doesn't respond","to your touch."},use={"You place your hand against the","mural, but it doesn't respond","to your touch. Somehow, you", "know it never will."}}},
                                            trapDoor={name="Trap Door",x=76,y=74,w=16,h=6,state="Closed",img={closed=loadImages.churchTrapDoorClosed,open=loadImages.churchTrapDoorOpen},text={close={"You close the door."},look={"It looks like a trap door.","What's it doing here..?"},move="",open={"You open the door."},pull={"You open the door."}}},
                                        },
                                exits={north="Church Basement", east="Church Inside 1"},
                            }
                            
loadRooms.churchInsideSecretRoom =  {
                                        name="Church Inside Secret Room",
                                        state="Light",
                                        displayName = "Church Secret Room",
                                        map=loadImages.oneWayDownMap,
                                        music=loadMusic.shadowLands,
                                        backgrounds={light=loadImages.graveyardUnderground2},
                                        backgroundStatic = true,
                                        objects={
                                                    inscription={name="Inscription",x=71,y=36,w=9,h=9,img=loadImages.graveyardNote,text={look={"Something is etched into the", "wall here:", "\"This necklace is a stalwart", "defense against the unknown, a", "magical barrier keeping the", "darkness of the mind at bay.\""}}},
                                                    necklace=loadObjects.necklace
                                                },
                                        exits={south="Mirror Room"},
                                    }

-- Church (outside)
loadRooms.churchOutside =   {
                                name="Church Outside",
                                state="Light",
                                objects={
                                            churchOutsideDoor=loadObjects.churchOutsideDoor,
                                            bellTower={name="Bell Tower",x=50,y=21,w=12,h=16,text={look={"It looks to be a small bell","tower. It appears to have been", "out of service for a time."}}},
                                            icon={name="Icon",x=52,y=3,w=8,h=8,text={look={"A small metal cross with upward", "curving arms circumscribed by a", "heavy iron ring sits atop the", "church. It appears to be some","kind of religious icon. It", "seems familiar, but you're", "aren't sure where you've seen", "it. Perhaps, in a dream...?"}}},
                                            stainedGlassWindow={name="Stained Glass Window",x=14,y=32,w=19,h=24,text={look={"It's a stained glass window. It", "looks fairly damaged."}}},
                                        },
                                map=loadImages.twoWayVerticalMap,
                                music=loadMusic.darkStreets,
                                backgrounds={light=loadImages.churchOutside,evil=loadImages.churchOutsideEvil},
                                exits={north="Church Inside 1", south="Street 3"},
                            }

-- Classroom
loadRooms.classroom =   {
                            name="Classroom",
                            state="Light",
                            map=loadImages.oneWayDownMap,
                            backgrounds={light=loadImages.classroom},
                            music=loadMusic.houseLight,
                            objects={
                                        chalkboard1={name="Chalkboard",x=17,y=27,w=27,h=20,text={look={}}},
                                        chalkboard2={name="Chalkboard",x=45,y=27,w=9,h=9,text={look={}}},
                                        chalkboard3={name="Chalkboard",x=55,y=27,w=27,h=20,text={look={}}},
                                        professor={name="Professor",x=44,y=37,w=11,h=12,img=loadImages.professor,text={look={"It's your class professor. He's", "not well liked by any means. He", "has difficulty explaining", "himself to students, and he", "grades quite harshly.","Look at the blackboard when","you're ready for the lecture."},talk={"You greet your professor and", "sit down in your seat.","Look at the blackboard when","you're ready for the lecture."}}},
                                    },
                            exits={south="School 2"},
                        }
                        
-- Clock Tower
loadRooms.clockTowerInsideFirstFloor =  {
                                            name="Clock Tower Inside First Floor",
                                            displayName = "C.T. Inside 1F",
                                            state="Light",
                                            map=loadImages.twoWayVerticalMap,
                                            backgrounds={light=loadImages.clockTowerInside1F},
                                            music=loadMusic.darkStreets,
                                            objects={
                                                        cog1={name="Cog 1",x=20,y=52-14*2,w=14,h=14,img=loadImages.cog,text={look={"It's a gear for the clock", "tower."}}},
                                                        cogHole={name="Cog Hole",x=20,y=52-14*1,w=14,h=14,state="Empty",img={empty=loadImages.cogHole,full=loadImages.cog},text={look={"It's an empty hole in between", "two gears. It looks like", "something could fit inside."},put={"You can put something here..."}}},
                                                        cog2={name="Cog 2",x=20,y=52,w=14,h=14,img=loadImages.cog,text={look={"It's a gear for the clock", "tower."}}},
                                                        cog3={name="Cog 3",x=65,y=52-14*2,w=14,h=14,img=loadImages.cog,text={look={"It's a gear for the clock", "tower."}}},
                                                        cog4={name="Cog 4",x=65,y=52-14*1,w=14,h=14,img=loadImages.cog,text={look={"It's a gear for the clock", "tower."}}},
                                                        cog5={name="Cog 5",x=65,y=52,w=14,h=14,img=loadImages.cog,text={look={"It's a gear for the clock", "tower."}}},
                                                        stairs={name="Stairs",x=38,y=35,w=22,h=31,text={look={"Stairs to the second floor."},move="North"},move="North"}
                                                    },
                                            exits={north="Clock Tower Inside Second Floor",south="Clock Tower Outside"},
                                        }
                                        
loadRooms.clockTowerInsideSecondFloor =  {
                                            name="Clock Tower Inside Second Floor",
                                            displayName = "C.T. Inside 2F",
                                            state="Light",
                                            map=loadImages.oneWayDownMap,
                                            backgrounds={light=loadImages.clockTowerInside2F},
                                            music=loadMusic.darkStreets,
                                            objects={
                                                        twelve={name="12",x=45,y=20,w=11,h=6,text={look={"The numeral reads \"12\""}}},
                                                        three={name="3",x=28,y=39,w=11,h=6,text={look={"The numeral reads \"3\""}}},
                                                        six={name="6",x=47,y=57,w=7,h=6,text={look={"The numeral reads \"6\""}}},
                                                        nine={name="9",x=66,y=39,w=7,h=6,text={look={"The numeral reads \"9\""}}},
                                                        panel={name="Panel",x=85,y=57,w=12,h=13,state="Locked",text={look={"It's a hidden panel. You don't", "see any way of opening it", "yourself. There may be some", "other way to open it."},pull={"You can't pull it open",  "yourself. There's nothing to", "grab onto."}},img={locked=loadImages.panel,open=loadImages.panelOpen}},
                                                        hourHand={name="Hour Hand",x=47,y=30,w=0,h=0,rot={r=0,ox=3,oy=12},img=loadImages.hourHand,text={}},
                                                        minuteHand={name="Minute Hand",x=49,y=18,w=0,h=0,rot={r=0,ox=1,oy=24},img=loadImages.minuteHand,text={}},
                                                        hourButton={name="Hour Button",x=7,y=35,w=5,h=5,img=loadImages.button,text={look={"It's a button in the wall."},push={"You press the button."},use={"You press the button."}}},
                                                        minuteButton={name="Minute Button",x=7,y=45,w=5,h=5,img=loadImages.button,text={look={"It's a button in the wall."},push={"You press the button."},use={"You press the button."}}},
                                                        selectionButton={name="Selection Button",x=88,y=40,w=5,h=5,img=loadImages.button,text={look={"It's a button in the wall.", "There's something scrawled on", "the wall nearby:", "THIS BUTTON IS THE KEY TO YOUR", "DESTINY. BUT AT WHAT TIME WILL", "THE FUTURE ARRIVE?"},push={"You press the button. You hear", "gears turn, but to no avail.", "The mechanism must not be", "configured correctly..."},use={"You press the button. You hear", "gears turn, but to no avail.", "The mechanism must not be", "configured correctly..."}}},
                                                    },
                                            exits={south="Clock Tower Inside First Floor"},
                                        }

loadRooms.clockTowerOutside =  {
                                    name="Clock Tower Outside",
                                    displayName="C. Tower Outside",
                                    state="Light",
                                    map=loadImages.twoWayVerticalMap,
                                    backgrounds={light=loadImages.clockTowerOutside},
                                    music=loadMusic.darkStreets,
                                    objects={
                                                clockTowerOutsideDoor={name="Door",x=33,y=9,w=36,h=60,state="Closed",text={close={"You close the door."},look={"It's a fancy door to the clock", "tower."},open={"You open the door."},pull={"You open the door."},move="North"},move="North",img={closed=loadImages.clockTowerOutsideDoorClosed,open=loadImages.clockTowerOutsideDoorOpen}}
                                            },
                                    exits={north="Clock Tower Inside First Floor",south="Street 1"},
                                }
         
loadRooms.darkPassage1 =    {  
                                name="Dark Passage 1",
                                displayName = "????????????",
                                state="Light",
                                backgrounds={light=loadImages.finalDarkPassage},
                                map=loadImages.zeroWayMap,
                                objects={
                                            light={name="Light",x=47,y=39,w=6,h=6,move="",text={look={"It's a distant light..."},move=""}},
                                        },
                                music=loadMusic.nightmareGeometry,
                                exits={},
                                backgroundStatic = true,
                            }
                            
loadRooms.darkPassage2 =    {  
                                name="Dark Passage 2",
                                displayName = "????????????",
                                state="Light",
                                backgrounds={light=loadImages.empty},
                                map=loadImages.fourWayMap,
                                objects={},
                                exits={north="Dark Passage 3",west="Dark Passage 3",south="Dark Passage 3",east="Dark Passage 3"},
                            }
                            
loadRooms.darkPassage3 =    {  
                                name="Dark Passage 3",
                                displayName = "????????????",
                                state="Light",
                                backgrounds={light=loadImages.empty},
                                map=loadImages.fourWayMap,
                                objects={},
                                exits={north="Nightmare Geometry 2",west="Nightmare Geometry 2",south="Nightmare Geometry 2",east="Nightmare Geometry 2"},
                            }
                            
loadRooms.darkPassage4 =    {  
                                name="Dark Passage 4",
                                displayName = "????????????",
                                state="Light",
                                backgrounds={light=loadImages.empty},
                                map=loadImages.fourWayMap,
                                objects={},
                                exits={north="Dark Passage 5",west="Dark Passage 5",south="Dark Passage 5",east="Dark Passage 5"},
                            }
                            
loadRooms.darkPassage5 =    {  
                                name="Dark Passage 5",
                                displayName = "????????????",
                                state="Light",
                                backgrounds={light=loadImages.empty},
                                map=loadImages.fourWayMap,
                                objects={},
                                exits={north="Nightmare Geometry 3",west="Nightmare Geometry 3",south="Nightmare Geometry 3",east="Nightmare Geometry 3"},
                            }
                            
loadRooms.darkPassage6 =    {  
                                name="Dark Passage 6",
                                displayName = "????????????",
                                state="Light",
                                backgrounds={light=loadImages.empty},
                                map=loadImages.fourWayMap,
                                objects={},
                                exits={north="Dark Passage 7",west="Dark Passage 7",south="Dark Passage 7",east="Dark Passage 7"},
                            }
                            
loadRooms.darkPassage7 =    {  
                                name="Dark Passage 7",
                                displayName = "????????????",
                                state="Light",
                                backgrounds={light=loadImages.empty},
                                map=loadImages.fourWayMap,
                                objects={},
                                exits={north="Nightmare Geometry 4",west="Nightmare Geometry 4",south="Nightmare Geometry 4",east="Nightmare Geometry 4"},
                            }
                            
loadRooms.darkPassage8 =    {  
                                name="Dark Passage 8",
                                displayName = "????????????",
                                state="Light",
                                map=loadImages.fourWayMap,
                                backgrounds={light=loadImages.empty},
                                objects={},
                                exits={north="Dark Passage 9",west="Dark Passage 9",south="Dark Passage 9",east="Dark Passage 9"},
                            }
                            
loadRooms.darkPassage9 =    {  
                                name="Dark Passage 9",
                                displayName = "????????????",
                                state="Light",
                                backgrounds={light=loadImages.empty},
                                map=loadImages.fourWayMap,
                                objects={},
                                exits={north="Nightmare Geometry 5",west="Nightmare Geometry 5",south="Nightmare Geometry 5",east="Nightmare Geometry 5"},
                            }
         

-- The mirror room when the player is asleep in the "alien ending"
loadRooms.dreamMirrorRoom = {
                                name="Dream Mirror Room",
                                displayName="Mirror Room?",
                                state="Light",
                                map=loadImages.zeroWayMap,
                                music = loadMusic.shadowLands,
                                backgrounds={light=loadImages.mirrorRoom},
                                objects={
                                            mirror1={name="Mirror 1",x=21,y=28,w=15,h=38,img={broken=loadImages.hangingMirrorThinBroken,unbroken=loadImages.hangingMirrorThin},state="Unbroken",text={look={"A long mirror."}}},
                                            mirror2={name="Mirror 2",x=41,y=28,w=15,h=38,img={broken=loadImages.hangingMirrorFatBroken,unbroken=loadImages.hangingMirrorFat},state="Unbroken",text={look={"A long mirror."}}},
                                            mirror3={name="Mirror 3",x=63,y=28,w=15,h=38,img={broken=loadImages.hangingMirrorThinBrokenSpace,unbroken=loadImages.hangingMirrorThin},state="Unbroken",text={look={"A long mirror."}}},
                                        },
                                exits={},
                                backgroundStatic = true,
                            }
-- Flooded Labyrinth 1
loadRooms.floodedLabyrinth1 =   {  
                                    name="Flooded Labyrinth 1",
                                    displayName = "Flooded Labyrinth",
                                    state="Light",
                                    music=loadMusic.floodedLabyrinth,
                                    backgrounds={light=loadImages.floodedLabyrinth1},
                                    map=loadImages.fourWayMap,
                                    objects={
                                                directions={name="Directions",x=20,y=6,w=44,h=8,text={look={"Strange markings. What could", "they mean?"}}},
                                                ladder={name="Ladder",x=87,y=5,w=8,h=55,img=loadImages.floodedLabyrinthLadder,text={look={"It's a ladder going back up to","the sewers."},move=""}},
                                                moon={name="Moon",x=76,y=6,w=8,h=8,text={look={"It's a full moon."}}},
                                                pathForward={name="Path Forward",x=36,y=36,w=28,h=11,move="North",text={look={"The tunnel continues forward."},move="North"}},
                                                pathLeft={name="Path Left",x=4,y=17,w=11,h=48,move="West",text={look={"It's a side tunnel."},move="West"}},
                                                waterSpout1={name="Water Spout 1",x=22,y=39,w=8,h=24,text={look={"Water is coming out of a spout", "in the wall."}}},
                                                waterSpout2={name="Water Spout 2",x=70,y=39,w=8,h=24,text={look={"Water is coming out of a spout", "in the wall."}}},
                                            },
                                    exits={west="Flooded Labyrinth 1", north="Flooded Labyrinth 2", east="Sewer 9", south="Flooded Labyrinth 1"},
                                    
                                }
                                
loadRooms.floodedLabyrinth2 =   {  
                                    name="Flooded Labyrinth 2",
                                    displayName = "Flooded Labyrinth",
                                    state="Light",
                                    music=loadMusic.floodedLabyrinth,
                                    backgrounds={light=loadImages.floodedLabyrinth2},
                                    map=loadImages.fourWayMap,
                                    objects={
                                                directions={name="Directions",x=20,y=6,w=44,h=8,text={look={"Strange markings. What could", "they mean?"}}},
                                                moon={name="Moon",x=76,y=6,w=8,h=8,text={look={"It's a waning gibbous moon."}}},
                                                pathForward={name="Path Forward",x=36,y=36,w=28,h=11,move="North",text={look={"The tunnel continues forward."},move="North"}},
                                                pathLeft={name="Path Left",x=4,y=17,w=11,h=48,move="West",text={look={"It's a side tunnel."},move="West"}},
                                                pathRight={name="Path Right",x=85,y=17,w=11,h=48,move="East",text={look={"It's a side tunnel."},move="East"}},
                                                waterSpout1={name="Water Spout 1",x=22,y=39,w=8,h=24,text={look={"Water is coming out of a spout", "in the wall."}}},
                                                waterSpout2={name="Water Spout 2",x=70,y=39,w=8,h=24,text={look={"Water is coming out of a spout", "in the wall."}}},
                                            },
                                    exits={west="Flooded Labyrinth 3", north="Flooded Labyrinth 1", east="Flooded Labyrinth 1", south="Flooded Labyrinth 1"},
                                }
                                
loadRooms.floodedLabyrinth3 =   {  
                                    name="Flooded Labyrinth 3",
                                    displayName = "Flooded Labyrinth",
                                    state="Light",
                                    music=loadMusic.floodedLabyrinth,
                                    backgrounds={light=loadImages.floodedLabyrinth3},
                                    map=loadImages.fourWayMap,
                                    objects={
                                                directions={name="Directions",x=20,y=6,w=44,h=8,text={look={"Strange markings. What could", "they mean?"}}},
                                                moon={name="Moon",x=76,y=6,w=8,h=8,text={look={"It's a third quarter moon."}}},
                                                pathForward={name="Path Forward",x=36,y=36,w=28,h=11,move="North",text={look={"The tunnel continues forward."},move="North"}},
                                                pathLeft={name="Path Left",x=4,y=17,w=11,h=48,move="West",text={look={"It's a side tunnel."},move="West"}},
                                                pathRight={name="Path Right",x=85,y=17,w=11,h=48,move="East",text={look={"It's a side tunnel."},move="East"}},
                                                waterSpout1={name="Water Spout 1",x=22,y=39,w=8,h=24,text={look={"Water is coming out of a spout", "in the wall."}}},
                                                waterSpout2={name="Water Spout 2",x=70,y=39,w=8,h=24,text={look={"Water is coming out of a spout", "in the wall."}}},
                                            },
                                    exits={west="Flooded Labyrinth 1", north="Flooded Labyrinth 1", east="Flooded Labyrinth 1", south="Flooded Labyrinth 4"},
                                }
                                
loadRooms.floodedLabyrinth4 =   {  
                                    name="Flooded Labyrinth 4",
                                    displayName = "Flooded Labyrinth",
                                    state="Light",
                                    music=loadMusic.floodedLabyrinth,
                                    backgrounds={light=loadImages.floodedLabyrinth4},
                                    map=loadImages.threeWayUpMap,
                                    objects={
                                                directions={name="Directions",x=20,y=6,w=44,h=8,text={look={"Strange markings. What could", "they mean?"}}},
                                                moon={name="Moon",x=76,y=6,w=8,h=8,text={look={"It's a waning crescent moon."}}},
                                                --pathForward={name="Path Forward",x=36,y=36,w=28,h=11,move="North",text={look={"The tunnel continues forward."},move="North"}},
                                                pathLeft={name="Path Left",x=4,y=17,w=11,h=48,move="West",text={look={"It's a side tunnel."},move="West"}},
                                                pathRight={name="Path Right",x=85,y=17,w=11,h=48,move="East",text={look={"It's a side tunnel. It's much","rougher than the other tunnels."},move="East"}},
                                                waterSpout1={name="Water Spout 1",x=22,y=39,w=8,h=24,text={look={"Water is coming out of a spout", "in the wall."}}},
                                                waterSpout2={name="Water Spout 2",x=70,y=39,w=8,h=24,text={look={"Water is coming out of a spout", "in the wall."}}},
                                            },
                                    exits={north="Flooded Labyrinth 1", west="Flooded Labyrinth 5", east="Puzzling Stone"},
                                }   
                                
loadRooms.floodedLabyrinth5 =   {  
                                    name="Flooded Labyrinth 5",
                                    displayName = "Flooded Labyrinth",
                                    state="Light",
                                    music=loadMusic.floodedLabyrinth,
                                    backgrounds={light=loadImages.floodedLabyrinth5},
                                    map=loadImages.twoWayLUpperRightMap,
                                    objects={
                                                directions={name="Directions",x=20,y=6,w=44,h=8,text={look={"Strange markings. What could", "they mean?"}}},
                                                moon={name="Moon",x=76,y=6,w=8,h=8,text={look={"It's a new moon."}}},
                                                pathRight={name="Path Right",x=85,y=17,w=11,h=48,move="East",text={look={"It's a side tunnel."},move="East"}},
                                                pit={name="Pit",x=31,y=52,w=38,h=13,move="",text={look={"There's a pit in the floor. You", "can't see the bottom.","Jumping down looks to be a one","way trip. Assuming you survive,","of course..."},move=""}},
                                            },
                                    exits={north="Nightmare Geometry 1",east="Flooded Labyrinth 4"},
                                }   

-- Gas Station Bathroom
loadRooms.gasStationBathroom =  {
                                    name="Gas Station Bathroom",
                                    displayName = "Bathroom",
                                    state="Light",
                                    map=loadImages.oneWayDownMap,
                                    music=loadMusic.houseDark,
                                    backgrounds={dark=loadImages.gasStationBathroomDark,light=loadImages.gasStationBathroomLight},
                                    objects={  
                                                gasStationKey=loadObjects.gasStationKey,
                                                --lightSwitch={name="Light Switch",x=44,y=33,w=5,h=8,text=loadGameText.bedroom.lightSwitch,visibleInDark=true,lightSwitch=true},
                                                mirror={name="Mirror",x=20,y=25,w=17,h=15,text={look={"It's a filthy gas station", "mirror. You gaze at it for a", "length of time, using the cold", "water to try to wake yourself", "up. As you stare at the mirror,", "you think you see the shadow of", "a person for a brief moment.", "However, when you blink, the", "image is suddenly gone without", "a trace."},talk={"If you start trying to have a", "conversation with yourself at", "this point, you may be too far", "gone..."}}},
                                                sink={name="Sink",x=20,y=45,w=17,h=12,text={look={"It's a damaged sink."},use={"You turn the handle. Sickly", "gray water comes out of the", "spout."}}},
                                                toilet={name="Toilet",x=63,y=46,w=16,h=21,text={look={"It's a vile toilet. A horrific", "stench emanates from the foul", "liquid."},open={"You dare not open it."},take={"It's too heavy to take. And why", "would you want to???"},use={"No!"}}},
                                            },
                                    exits={south="Gas Station Outside"},
                                    backgroundStatic = true,
                                }

-- Gas Station Store Inside
loadRooms.gasStationInside =    {
                                    name="Gas Station Inside",
                                    state="Light",
                                    map=loadImages.oneWayDownMap,
                                    backgrounds={light=loadImages.gasStationInside},
                                    music=loadMusic.houseDark,
                                    objects={
                                                gasCanisters={name="Gas Canisters",x=18,y=55,w=30,h=11,text={look={"Empty gas canisters. You don't", "need one right now."},push={"It would be rude to knock","things over."},take={"You don't need one right now."}}},
                                                shelf1={name="Shelf",x=18,y=45,w=30,h=9,text={look={"A shelf of sundry things."},push={"It would be rude to knock","things over."},take={"You don't want anything from", "the shelf."}}},
                                                shelf2={name="Shelf",x=51,y=45,w=31,h=9,text={look={"A shelf of sundry things."},push={"It would be rude to knock","things over."},take={"You don't want anything from", "the shelf."}}},
                                                shelf3={name="Shelf",x=51,y=57,w=31,h=9,text={look={"A shelf of sundry things."},push={"It would be rude to knock","things over."},take={"You don't want anything from", "the shelf."}}},
                                                shelf4={name="Shelf",x=19,y=26,w=19,h=16,text={look={"A shelf of sundry things."},push={"It would be rude to knock","things over."},take={"You don't want anything from", "the shelf."}}},
                                                shelf5={name="Shelf",x=62,y=26,w=19,h=16,text={look={"A shelf of sundry things."},push={"It would be rude to knock","things over."},take={"You don't want anything from", "the shelf."}}},
                                                button={name="Button",x=45,y=29,w=9,h=9,state="Off",img={off=loadImages.gasStationButtonOff,on=loadImages.gasStationButtonOn},text={look={"It's a button to turn on the", "gas pumps. The pumps are", "currently off."},push={"You press the button to turn", "the pumps on."},use={"You press the button to turn", "the pumps on."}}},
                                            },
                                    exits={south="Gas Station Outside"},
                                }
-- Gas Station Outside
loadRooms.gasStationOutside =   {
                                    name="Gas Station Outside",
                                    displayName = "G. Station Outside",
                                    state="Light",
                                    map=loadImages.threeWayRightMap,
                                    backgrounds={light=loadImages.gasStationOutside},
                                    music=loadMusic.houseDark,
                                    objects={
                                                door={name="Door",x=75,y=57,w=7,h=7,img={closed=loadImages.gasStationStoreDoorClosed,locked=loadImages.gasStationStoreDoorClosed,open=loadImages.gasStationStoreDoorOpen},move="North",state="Locked",text={close={"You close the door."},look={"It's a double glass door. It's", "dark on the inside. It's", "currently locked."},open={"It's locked!"},pull={"It's locked!"},put={"There is a keyhole on the door."},move="North"}},
                                                light1={name="Light 1",x=15,y=44,w=4,h=2,text={look={"It's a light fixture."}}},
                                                light2={name="Light 2",x=28,y=44,w=4,h=2,text={look={"It's a light fixture."}}},
                                                light3={name="Light 3",x=42,y=44,w=4,h=2,text={look={"It's a light fixture."}}},
                                                pump1={name="Pump 1",x=13,y=59,w=7,h=10,state="Off",text={look={"It's a gas pump. It's currently", "shut off."},take={"The pump is turned off."},use={"The pump is turned off."}}},
                                                pump2={name="Pump 2",x=40,y=59,w=7,h=10,state="Off",text={look={"It's a gas pump. It's currently", "shut off."},take={"The pump is turned off."},use={"The pump is turned off."}}},
                                                window1={name="Window 1",x=63,y=57,w=5,h=5,text={look={"It's a window. It's too dark to", "see inside."}}},
                                                --window2={name="Window 2",x=69,y=57,w=5,h=5,text={look={"It's a window. It's too dark to", "see inside."}}},
                                                --window3={name="Window 3",x=83,y=57,w=5,h=5,text={look={"It's a window. It's too dark to", "see inside."}}},
                                                window4={name="Window 4",x=89,y=57,w=5,h=5,text={look={"It's a window. It's too dark to", "see inside."}}},
                                            },
                                    exits={north="Gas Station Inside", south="Car 3",east="Gas Station Bathroom"},
                                }

loadRooms.graveyard =   {
                            name="Graveyard",
                            state="Light",
                            map=loadImages.oneWayDownMap,
                            backgrounds={light=loadImages.graveyard,evil=loadImages.graveyardEvil},
                            music=loadMusic.darkStreets,
                            objects={
                                        grave={name="Grave",x=37,y=59,w=27,h=20,text=loadGameText.graveyard.grave,img={normal=loadImages.grave,pushed=loadImages.grave},state="normal"},
                                        graveReligiousIcon={name="Grave Religious Icon",x=40,y=13,w=21,h=22,text={look={"Some sort of religious icon? It", "looks a bit like a cross with", "spikes on the ends, but there", "is a crescent around part of", "the cross."}}},
                                        smallGrave={name="Small Grave",x=9,y=57,w=8,h=10,text={look={"Something is etched here:", "           ?  ?  ?", "           ?  ?  .", "           O  O  ."}}},
                                        tallGrave={name="Tall Grave",x=68,y=49,w=10,h=21,text={look={"      Here lies Star Boy:","           2015-2015","","","There's something more here:","Star Boy was built to assist", "Atom Girl in her mission, but", "he was fatally damaged.", "In his final moments, he looked", "up at the stars, knowing she","was out there somewhere. She...","(the remaining words cannot be", "read as they have been worn", "down over time.)","","","...","","","","Who is Star Boy & Atom Girl?"}}},
                                    },
                            exits={south="Park 2"},
                        }
                        
loadRooms.graveyardUnderground1 =   {
                                        name="Statue Room",
                                        displayName="Statue Room",
                                        state="Light",
                                        map=loadImages.oneWayDownMap,
                                        backgrounds={light=loadImages.statueRoom},
                                        music=loadMusic.darkStreets,
                                        objects={
                                                    inscription={name="Inscription",x=45,y=19,w=9,h=9,text={look={"Something is etched into the", "wall here:", "\"Illuminate the crystal ball to","enter the world of evil.\""}}},
                                                    statueEmittingLight={x=20,y=37,w=20,h=30,img=loadImages.statueWithLightCrystalBall,text={look={"A statue emitting light. The", "light springs forth as a beam", "straight at you."}}},
                                                    statueHoldingDarkCrystalBall={x=60,y=37,w=20,h=30,state="Unlit",img={lit=loadImages.statueWithLightCrystalBall,unlit=loadImages.statueWithDarkCrystalBall},text={look={"A statue holding a dark crystal", "ball."}}},
                                                },
                                        exits={south="Graveyard"},
                                    }
                                    
loadRooms.graveyardUnderground2 =    {
                                        name="Graveyard Underground",
                                        displayName="Underground",
                                        state="Light",
                                        map=loadImages.oneWayDownMap,
                                        backgrounds={light=loadImages.graveyardUnderground2},
                                        music=loadMusic.shadowLands,
                                        backgroundStatic = true,
                                        objects={
                                                    note1={name="Note 2",x=20,y=35,w=9,h=9,img=loadImages.graveyardNote,text={look={"Something is inscribed here:", "\"I do not wish to go on any", "longer. The pain won't stop.", "Even now, I can feel my heart", "beating feebly. I can no longer", "reside among the living. I will", "let my body be taken over by", "the rising tide, and I will", "join the others in their", "bountiful bliss\""}}},
                                                    note2={name="Note 2",x=71,y=35,w=9,h=9,img=loadImages.graveyardNote,text={look={"Something is inscribed here:", "\"At last, the culmination of", "all my hard work will soon pay", "off. I have found the three", "magic artifacts that I require", "to reach the land of endless", "twilight. I have no more need", "for this mortal coil, and all", "my earthly troubles will soon", "be shed from my body like so", "many serpent scales.\""}}},
                                                    shadowOrb = loadObjects.shadowOrb,
                                                },
                                        exits={south="Statue Room"},
                                    }

-- Highway 1
loadRooms.highway1 =    {
                            name="Highway 1",
                            displayName = "Highway",
                            state="Light",
                            map=loadImages.twoWayLUpperRightMap,
                            music = loadMusic.darkStreets,
                            backgrounds={light=loadImages.highway,evil=loadImages.highwayEvil},
                            objects={
                                        highway={name="Highway",x=41,y=45,w=19,h=12,move="North",text={look={"A highway lies in front of you."},move="North",}},
                                    },
                            exits={north="Highway 2",east="Car 4"},
                        }

-- Highway 2
loadRooms.highway2 =    {
                            name="Highway 2",
                            displayName = "Highway",
                            state="Light",
                            map=loadImages.twoWayVerticalMap,
                            backgrounds={light=loadImages.highway,evil=loadImages.highwayEvil},
                            music=loadMusic.darkStreets,
                            objects={
                                        highway={name="Highway",x=41,y=45,w=19,h=12,move="North",text={look={"A highway lies in front of you."},move="North",}},
                                    },
                            exits={north="Highway 3", south="Highway 1"},
                        }

-- Highway 3
loadRooms.highway3 =    {
                            name="Highway 3",
                            displayName = "Highway",
                            state="Light",
                            map=loadImages.twoWayVerticalMap,
                            backgrounds={light=loadImages.highway,evil=loadImages.highwayEvil},
                            music=loadMusic.darkStreets,
                            objects={
                                        highway={name="Highway",x=41,y=45,w=19,h=12,move="North",text={look={"A highway lies in front of you."},move="North",}},
                                    },
                            exits={north="Highway 4", south="Highway 2"},
                        }

-- Highway 4
loadRooms.highway4 =    {
                            name="Highway 4",
                            displayName = "Highway",
                            state="Light",
                            map=loadImages.threeWayRightMap,
                            backgrounds={light=loadImages.highwayTIntersection,evil=loadImages.highwayTIntersectionEvil},
                            music=loadMusic.darkStreets,
                            objects={
                                        highway={name="Highway",x=41,y=45,w=19,h=12,move="North",text={look={"A highway lies in front of you."},move="North",}},
                                        sideRoad={name="Side Road",x=65,y=52,w=32,h=8,move="East",text={look={"It's a side road off the", "highway."},move="East"}}
                                    },
                            exits={north="Highway 5", east="Street 1", south="Highway 3"},
                        }
                        
-- Highway 5
loadRooms.highway5 =    {
                            name="Highway 5",
                            displayName = "Highway",
                            state="Light",
                            map=loadImages.oneWayDownMap,
                            backgrounds={light=loadImages.highwayNorthEnd,evil=loadImages.highwayNorthEndEvil},
                            music=loadMusic.darkStreets,
                            objects={
                                        highwayEnd={name="Highway End",x=3,y=60,w=94,h=20,text={look={"The highway simply ends..."}}},
                                    },
                            exits={south="Highway 4"},
                        }

loadRooms.houseOutside =    {  
                                name="House Outside",
                                state="Dark",
                                backgrounds={dark=loadImages.houseOutside,evil=loadImages.houseOutsideEvil},
                                map=loadImages.oneWayUpMap,
                                music = loadMusic.title,
                                objects={
                                            door = {name="Door",x=43,y=28,w=13,h=32,img={closed=loadImages.houseOutsideDoorClosed,open=loadImages.houseOutsideDoorOpen},text={close={"You close the door."},look={"It's the front door to your", "house. Somehow, you emerged", "from that dark place and made", "it back home.",},move="",open={"You open the door."},pull={"You open the door."}},state="Closed",move=""},
                                        },
                                exits={north=""},
                            }

-- Living Room
loadRooms.livingRoom =  {
                            name="Living Room",
                            state="Dark",
                            map=loadImages.threeWayLeftMap,
                            backgrounds={light=loadImages.livingRoomLight,dark=loadImages.livingRoomDark},
                            music=loadMusic.houseDark,
                            objects={
                                        carKey=loadObjects.carKey,
                                        patioEntrance={name="Patio Entrance",x=4,y=22,w=11,h=40,state="Open",text={close={"Your house is fairly cold, so","you don't want to close the","sliding glass door right now."},look={"It's an opening to the patio."},open={"It's already open!"},move="West"},visibleInDark=true,move="West"},
                                        livingRoomDoor=loadObjects.livingRoomDoor,
                                        --kitchenEntrance={name="Kitchen Entrance",x=84,y=22,w=11,h=40,text={look={"It's an opening to the kitchen."},move={"Nah, not right now."}}},
                                        livingRoomLamp=loadObjects.livingRoomLamp
                                    },
                            exits={north="Car 1", west="Patio", south="Bedroom"},
                            introText={"You enter the living room."}
                        }

-- Mirror room (inside the church)
loadRooms.mirrorRoom =  {
                            name="Mirror Room",
                            state="Light",
                            map=loadImages.oneWayDownMap,
                            music=loadMusic.darkStreets,
                            backgrounds={light=loadImages.mirrorRoom},
                            music=loadMusic.darkStreets,
                            objects={
                                        boltCutters = loadObjects.boltCutters,
                                        mirror1={name="Mirror 1",x=21,y=28,w=15,h=38,img={broken=loadImages.hangingMirrorThinBroken,unbroken=loadImages.hangingMirrorThin},state="Unbroken",text={look={"A long mirror."}}},
                                        mirror2={name="Mirror 2",x=41,y=28,w=15,h=38,img={closed=loadImages.hangingMirrorFatBrokenClosed,open=loadImages.hangingMirrorFatBrokenOpen,unbroken=loadImages.hangingMirrorFat},state="Unbroken",text={look={"A long mirror."}}},
                                        mirror3={name="Mirror 3",x=63,y=28,w=15,h=38,img={broken=loadImages.hangingMirrorThinBroken,unbroken=loadImages.hangingMirrorThin},state="Unbroken",text={look={"A long mirror."}}},
                                    },
                            exits={south="Church Inside 1"},
                        }

-- Nightmare Geometry (below the sewers)
loadRooms.nightmareGeometry1 =  {
                                    name="Nightmare Geometry 1",
                                    displayName="Lost Room",
                                    state="Light",
                                    map=loadImages.zeroWayMap,
                                    music=loadMusic.nightmareGeometry,
                                    backgrounds={light=loadImages.nightmareGeometry1},
                                    objects={
                                                shadowBody={name="Shadow Body",x=29,y=67,w=22,h=12,text={look={"Something is written next to", "an outline on the ground:", "THERE WAS A LIVING PERSON HERE.", "THEY ARE GONE NOW."}}},
                                                shadowPeople={name="Shadow People",x=9,y=9,w=86,h=29,text={look={"Are those people waving?"},talk={"You call out to the shadowy", "figures, but receive no", "response."}}},
                                            },
                                    --exits={west="Dark Passage 2",east="Dark Passage 2",south="Dark Passage 2"},
                                    exits={},
                                    backgroundStatic = true,
                                }
                                
loadRooms.nightmareGeometry2 =  {
                                    name="Nightmare Geometry 2",
                                    state="Light",
                                    --displayName="Lair of the Imperfect",
                                    displayName="The Imperfect",
                                    map=loadImages.zeroWayMap,
                                    music=loadMusic.nightmareGeometry,
                                    backgrounds={light=loadImages.nightmareGeometry2},
                                    objects={
                                                beast={name="Beast",x=18,y=32,w=65,h=34,text={look={"A strange beast stands before", "you. It has the head of a", "nearly featureless human, but", "legs that resemble an elephant.", "Although, you aren't sure just", "how many legs."},pull={"No!"},push={"No!"},talk={"While it has a face that", "somewhat approximates a human,", "it either can't speak or feels", "no need to."}}},
                                            },
                                    --exits={west="Dark Passage 4",south="Dark Passage 4",east="Dark Passage 4"},
                                    exits={},
                                    backgroundStatic = true,
                                }
                            

loadRooms.nightmareGeometry3 =  {
                                    name="Nightmare Geometry 3",
                                    displayName="Hole in the Wall",
                                    state="Light",
                                    map=loadImages.zeroWayMap,
                                    music=loadMusic.nightmareGeometry,
                                    backgrounds={light=loadImages.nightmareGeometry3},
                                    objects={
                                                humanHoleInWall={name="Hole in Wall",x=41,y=31,w=20,h=29,text={look={"At first glance, you think", "it's another shadow body. But", "interestingly, it's actually", "a human-shaped hole in the", "wall. You peer through the dark", "hole, but it seems to stretch", "on for infinity into inky", "blackness."},use={"You can't fit inside the space.", "It wasn't made for you."}}},
                                                wall1={name="Wall 1",x=16,y=16,w=25,h=51,text={look={"The wall before you looks to be", "a sheet of rock cut straight", "from a mountain."}}},
                                                wall2={name="Wall 2",x=41,y=16,w=20,h=15,text={look={"The wall before you looks to be", "a sheet of rock cut straight", "from a mountain."}}},
                                                wall3={name="Wall 3",x=41,y=60,w=20,h=7,text={look={"The wall before you looks to be", "a sheet of rock cut straight", "from a mountain."}}},
                                                wall4={name="Wall 4",x=61,y=16,w=23,h=51,text={look={"The wall before you looks to be", "a sheet of rock cut straight", "from a mountain."}}},
                                            },
                                    exits={},
                                    backgroundStatic = true,
                                }
                                
loadRooms.nightmareGeometry4 =  {
                                    name="Nightmare Geometry 4",
                                    displayName="Cracked Wall?",
                                    state="Light",
                                    map=loadImages.zeroWayMap,
                                    music=loadMusic.nightmareGeometry,
                                    backgrounds={light=loadImages.nightmareGeometry4},
                                    objects={
                                                -- Repeatedly checking this will eventually cause a shadow person appearing and screaming in pain
                                                squiggleHoleInWall={name="Squiggle Hole in Wall",x=16,y=16,w=68,h=51,text={look={"It appears to be twisting,", "snaking cracks in the wall.", "It's faint, but you think you", "can hear someone screaming in", "pain deep inside the fissures,", "followed by what sounds like", "crawling..."}}},
                                            },
                                    --exits={west="Dark Passage 8",south="Dark Passage 8",east="Dark Passage 8"},
                                    exits={},
                                    backgroundStatic = true,
                                }
                                
                                
loadRooms.nightmareGeometry5 =  {
                                    name="Nightmare Geometry 5",
                                    displayName="Endless Hallway",
                                    state="Light",
                                    map=loadImages.twoWayVerticalMap,
                                    music=loadMusic.nightmareGeometry,
                                    backgrounds={light=loadImages.nightmareGeometry5},
                                    objects={
                                                endlessHallway={name="Endless Hallway",x=14,y=3,w=72,h=77,move="North",text={look={"It's a hallway with a never-", "ending series of archways. You", "can hear the sounds of children", "in the distance, far far away."},move="North"}},
                                            },
                                    --exits={north="Nightmare Geometry 6",west="Dark Passage 1",south="Nightmare Geometry 5",east="Dark Passage 1"},
                                    exits={north="Nightmare Geometry 6",south="Nightmare Geometry 5"},
                                    backgroundStatic = true,
                                }
                                
loadRooms.nightmareGeometry6 =  {
                                    name="Nightmare Geometry 6",
                                    displayName="Endless Hallway",
                                    state="Light",
                                    map=loadImages.twoWayVerticalMap,
                                    music=loadMusic.nightmareGeometry,
                                    backgrounds={light=loadImages.nightmareGeometry5},
                                    objects={
                                                endlessHallway={name="Endless Hallway",x=14,y=3,w=72,h=77,move="North",text={look={"It's a hallway with a never-", "ending series of archways. You", "can hear the sounds of children", "in the distance, far far away."},move="North"}},
                                            },
                                    exits={north="Nightmare Geometry 7",south="Nightmare Geometry 5"},
                                    backgroundStatic = true,
                                }
                                
loadRooms.nightmareGeometry7 =  {
                                    name="Nightmare Geometry 7",
                                    displayName="Endless Hallway",
                                    state="Light",
                                    map=loadImages.threeWayDownMap,
                                    music=loadMusic.nightmareGeometry,
                                    backgrounds={light=loadImages.nightmareGeometry7},
                                    objects={
                                                -- Looking at this will start the shadow child cutscene
                                                endlessHallway={name="Endless Hallway",x=47,y=32,w=6,h=12,move="",text={look={"It's a hallway with a never-", "ending series of archways. You", "can hear the sounds of children", "in the distance, far far away."},move=""}},
                                            },
                                    exits={west="Dark Passage 1",east="Dark Passage 1",south="Nightmare Geometry 5"},
                                    backgroundStatic = true,
                                }
                                
loadRooms.nightmareGeometry8 =  {
                                    name="Nightmare Geometry 8",
                                    displayName="Endless Hallway",
                                    state="Light",
                                    map=loadImages.oneWayDownMap,
                                    music=loadMusic.nightmareGeometry,
                                    backgrounds={light=loadImages.nightmareGeometry5},
                                    objects={},
                                    exits={south="Dark Passage 1"},
                                    backgroundStatic = true,
                                }

-- Park
loadRooms.park1 =    {
                        name="Park 1",
                        displayName = "Park Entrance",
                        state="Light",
                        map=loadImages.twoWayVerticalMap,
                        backgrounds={light=loadImages.parkEntrance,evil=loadImages.parkEntranceEvil},
                        music=loadMusic.darkStreets,
                        objects={
                                    lighter = loadObjects.lighter,
                                    parkGate = {name="Park Gate",x=32,y=24,w=37,h=48,img={closed=loadImages.parkGateClosed,locked=loadImages.parkGateLocked,open=loadImages.parkGateOpen},text={close={"You close the gate."},look={"It's a gate to a park. It's", "currently locked by a chain", "with a padlock."},move="North",open={"It's locked!"},push={"It's locked!"}},state="Locked",move="North"},
                                },
                        exits={north="Park 2", south="Street 2"},
                    }
                    
loadRooms.park2 =    {
                        name="Park 2",
                        displayName = "Park Path",
                        state="Light",
                        map=loadImages.threeWayRightMap,
                        backgrounds={light=loadImages.park2,evil=loadImages.park2Evil},
                        objects={
                                    graveyard={name="Graveyard",x=41,y=34,w=17,h=12,move="North",text={look={"It's a path forward. A", "graveyard lies quietly at the", "end."},move="North",}},
                                    pathEast={name="Path East",x=74,y=60,w=23,h=8,move="East",text={look={"It's a path to the east."},move="East",}},
                                },
                        music=loadMusic.darkStreets,
                        exits={north="Graveyard", east="Park 3", south="Park 1"},
                    }
                    
loadRooms.park3 =    {
                        name="Park 3",
                        displayName = "Park Shed",
                        state="Light",
                        map=loadImages.twoWayLUpperLeftMap,
                        backgrounds={light=loadImages.park3,evil=loadImages.park3Evil},
                        music=loadMusic.darkStreets,
                        objects={
                                    door={name="Door",x=45,y=34,w=9,h=12,state="Closed",move="North",img={closed=loadImages.shedDoorClosed,open=loadImages.shedDoorOpen},text={close={"You close the door."},look={"It's a door to an old, run-down", "shed. It looks as though it has", "not been serviced in a long", "time."},open={"You open the door."},pull={"You open the door."},move="North",}},
                                    pathWest={name="Path West",x=3,y=60,w=26,h=8,move="West",text={look={"It's a path to the west."},move="West",}},
                                },
                        exits={north="Shed", west="Park 2"},
                        music = loadMusic.darkStreets,
                    }

-- House patio
loadRooms.patio =   {
                        name="Patio",
                        state="Light",
                        objects={
                                    forest={name="Forest",x=3,y=12,w=94,h=38,text={look={"It's a dead forest. A fire", "raged through the area", "recently, laying it to waste."}}},
                                    mallet=loadObjects.mallet,
                                    sun={name="Sun",x=84,y=6,w=5,h=5,text={look={"It's the sun. Don't stare", "directly at it!"},take={"It's too hot to handle!"}}},
                                },
                        backgrounds={light=loadImages.patioLight},
                        map=loadImages.oneWayRightMap,
                        music=loadMusic.houseLight,
                        exits={east="Living Room"},
                    }
                    
loadRooms.puzzlingStone =   {
                                name="Puzzling Stone",
                                state="Light",
                                map=loadImages.oneWayDownMap,
                                backgrounds={light=loadImages.puzzlingStone,dark=loadImages.puzzlingStone},
                                music=loadMusic.darkStreets,
                                objects={
                                            door={name="Door",x=39,y=30,w=25,h=27,state="Stuck",img={open=loadImages.puzzlingStoneDoorOpen,stuck=loadImages.puzzlingStoneDoorClosed},move="",text={look={"It's an ancient door in the", "rock wall covered in ivy."},open={"Although it's not locked, it", "won't open for some reason..."},move="",}},
                                        },
                                exits={south="Flooded Labyrinth 4"},
                            }
                            
for i=0,8 do
    loadRooms.puzzlingStone.objects["button" .. (i+1)] = {name="Button " .. (i+1),x=28+10*(i%3+1),y=53+7*(math.floor(i/3)+1),w=4,h=4,state="Off",img={off=loadImages.puzzlingStoneButtonOff,on=     loadImages.puzzlingStoneButtonOn},text={look={"It's a button in the floor."},push={""},use={""}}}
end

-- School 1
loadRooms.school1 =    {  
                            name="School 1",
                            displayName = "School",
                            state="Light",
                            backgrounds={light=loadImages.school1Evening,dark=loadImages.school1Night},
                            map=loadImages.twoWayVerticalMap,
                            objects={
                                        school={name="School",x=33,y=33,w=34,h=13,move="North",text={look={"It's your school. You spend", "about four days out of the week", "within its halls."},move="North"}},
                                        sun={name="Sun",x=4,y=29,w=5,h=5,text={look={"It's the evening sun. It's not", "quite so bright anymore, so", "it's less likely to cause you", "to go blind."}}},
                                    },
                            music=loadMusic.houseLight,
                            exits={south="Car 2", north="School 2"},
                        }
                        
loadRooms.school2 =    {  
                            name="School 2",
                            displayName = "School",
                            state="Light",
                            backgrounds={light=loadImages.school2},
                            map=loadImages.twoWayVerticalMap,
                            music=loadMusic.houseLight,
                            objects={
                                        door={name="Door",x=29,y=4,w=37,h=59,img={closed=loadImages.classDoorClosed,open=loadImages.classDoorOpen},move="North",state="Closed",text={close={"You close the door."},look={"It's the door to your class.", "You better hurry or you'll be", "late!"},move="North",open={"You open the door."},pull={"You open the door."}}},
                                    },
                            exits={south="School 1", north="Classroom"},
                        }

-- Sewer
loadRooms.sewer1 =  {  
                        name="Sewer 1",
                        displayName = "Sewer",
                        state="Light",
                        music=loadMusic.sewers,
                        backgrounds={light=loadImages.sewer4},
                        map=loadImages.threeWayRightMap,
                        objects={
                                    light={name="Light",x=47,y=39,w=6,h=6,move="North",text={look={"It's a distant light..."},move="North"}},
                                    pathEast={name="Path East",x=75,y=32,w=18,h=36,move="East",text={look={"It's a side tunnel."},move="East"}},
                                },
                        exits={north="Sewer 2", east="Sewer 3", south="Street 5"},
                    }
                    
loadRooms.sewer2 =  {  
                        name="Sewer 2",
                        displayName = "Sewer",
                        state="Light",
                        music=loadMusic.sewers,
                        backgrounds={light=loadImages.sewer3},
                        map=loadImages.twoWayVerticalMap,
                        objects={
                                    light={name="Light",x=47,y=39,w=6,h=6,move="",text={look={"It's a distant light...","No matter how far you travel, ","it never seems to get closer.","","Perhaps it is a trick of the","light?"},move=""}},
                                },
                        exits={north="", south="Sewer 1"},
                    }
                    
loadRooms.sewer3 =  {  
                        name="Sewer 3",
                        displayName = "Sewer",
                        state="Light",
                        music=loadMusic.sewers,
                        backgrounds={light=loadImages.sewer1},
                        map=loadImages.twoWayVerticalMap,
                        objects={},
                        exits={north="Sewer 4", south="Sewer 1"},
                    }
                    
loadRooms.sewer4 =  {  
                        name="Sewer 4",
                        displayName = "Sewer",
                        state="Light",
                        music=loadMusic.sewers,
                        backgrounds={light=loadImages.sewer1},
                        map=loadImages.twoWayVerticalMap,
                        objects={},
                        exits={north="Sewer 5", south="Sewer 3"},
                    }
                    
                    
loadRooms.sewer5 =  {  
                        name="Sewer 5",
                        displayName = "Sewer",
                        state="Light",
                        music=loadMusic.sewers,
                        backgrounds={light=loadImages.sewer5},
                        map=loadImages.threeWayLeftMap,
                        objects={
                                    pathWest={name="Path West",x=7,y=32,w=18,h=36,move="West",text={look={"It's a side tunnel."},move="West"}},
                                },
                        exits={north="Sewer 6", west="Sewer 8", south="Sewer 4"},
                    }
                    
loadRooms.sewer6 =  {  
                        name="Sewer 6",
                        displayName = "Sewer",
                        state="Light",
                        music=loadMusic.sewers,
                        backgrounds={light=loadImages.sewer1},
                        map=loadImages.twoWayVerticalMap,
                        objects={},
                        exits={north="Sewer 7", south="Sewer 5"},
                    }
                    
loadRooms.sewer7 =  {  
                        name="Sewer 7",
                        displayName = "Sewer",
                        state="Light",
                        music=loadMusic.shadowLands,
                        backgrounds={light=loadImages.sewer6},
                        map=loadImages.oneWayDownMap,
                        backgroundStatic = true,
                        objects={
                                    eclipseBrooch = loadObjects.eclipseBrooch,
                                    inscription={name="Inscription",x=46,y=39,w=9,h=9,img=loadImages.graveyardNote,text={look={"Something is etched into the", "wall here:", "\"A land enveloped in shadow,", "A silent star of darkness,", "A brooch set with an eclipse,", "A door to endless twilight."}}},
                                },
                        exits={south="Sewer 6"},
                    }
                    
loadRooms.sewer8 =  {  
                        name="Sewer 8",
                        displayName = "Sewer",
                        state="Light",
                        music=loadMusic.sewers,
                        backgrounds={light=loadImages.sewer1},
                        map=loadImages.twoWayVerticalMap,
                        objects={},
                        exits={north="Sewer 9", south="Sewer 5"},
                    }
                    
loadRooms.sewer9 =  {  
                        name="Sewer 9",
                        displayName = "Sewer",
                        state="Light",
                        music=loadMusic.sewers,
                        backgrounds={light=loadImages.sewer2},
                        map=loadImages.twoWayVerticalMap,
                        objects={
                                    inscription={name="Inscription",x=46,y=39,w=9,h=9,text={look={"Something is etched into the", "wall here:", "\"Let the moon serve as your", "guide in this endless night.","The labyrinth has twin exits.","One path leads to salvation,","the other to certain damnation.","","Dare you tread the old crimson","path...?\""}}},
                                    pit={name="Pit",x=40,y=55,w=20,h=6,move="",text={look={"There's a pit in the floor. A","ladder extends downward. You","can hear water moving down","below."},move=""}},
                                },
                        exits={north="Flooded Labyrinth 1",south="Sewer 8"},
                    }
                    
-- Shadow Lands
-- There is a total eclipse in the sky
loadRooms.shadowLands1 =    {  
                                name="Shadow Lands 1",
                                displayName="Shadow Lands",
                                state="Light",
                                backgrounds={light=loadImages.shadowLands1},
                                map=loadImages.oneWayUpMap,
                                music=loadMusic.shadowLands,
                                backgroundStatic = true,
                                objects={
                                            eclipse={name="Eclipse",x=40,y=6,w=21,h=21,text={look={"A total eclipse of foreign", "celestial bodies hangs in the", "sky, casting the land in an", "effluent gray light."}}},
                                        },
                                exits={north="Shadow Lands 2"},
                            }
                            
loadRooms.shadowLands2 =    {  
                                name="Shadow Lands 2",
                                displayName="Shadow Lands",
                                state="Light",
                                backgrounds={light=loadImages.shadowLands1},
                                map=loadImages.oneWayUpMap,
                                music=loadMusic.shadowLands,
                                backgroundStatic = true,
                                objects={
                                            eclipse={name="Eclipse",x=40,y=6,w=21,h=21,text={look={"A total eclipse of foreign", "celestial bodies hangs in the", "sky, casting the land in an", "effluent gray light."}}},
                                        },
                                exits={north="Shadow Lands 3"},
                            }    
                            
loadRooms.shadowLands3 =    {  
                                name="Shadow Lands 3",
                                displayName="Shadow Lands",
                                state="Light",
                                backgrounds={light=loadImages.shadowLands1},
                                map=loadImages.oneWayUpMap,
                                music=loadMusic.shadowLands,
                                backgroundStatic = true,
                                objects={
                                            eclipse={name="Eclipse",x=40,y=6,w=21,h=21,text={look={"A total eclipse of foreign", "celestial bodies hangs in the", "sky, casting the land in an", "effluent gray light."}}},
                                        },
                                exits={north="Shadow Lands 4"},
                            } 
                            
loadRooms.shadowLands4 =    {  
                                name="Shadow Lands 4",
                                displayName="Shadow Lands",
                                state="Light",
                                backgrounds={light=loadImages.shadowLands1},
                                map=loadImages.oneWayUpMap,
                                music=loadMusic.shadowLands,
                                backgroundStatic = true,
                                objects={
                                            eclipse={name="Eclipse",x=40,y=6,w=21,h=21,text={look={"A total eclipse of foreign", "celestial bodies hangs in the", "sky, casting the land in an", "effluent gray light."}}},
                                        },
                                exits={north="Shadow Lands 5"},
                            }
                            
loadRooms.shadowLands5 =    {  
                                name="Shadow Lands 5",
                                displayName="Shadow Lands",
                                state="Light",
                                backgrounds={light=loadImages.shadowLands1},
                                map=loadImages.oneWayUpMap,
                                music=loadMusic.shadowLands,
                                backgroundStatic = true,
                                objects={
                                            eclipse={name="Eclipse",x=40,y=6,w=21,h=21,text={look={"A total eclipse of foreign", "celestial bodies hangs in the", "sky, casting the land in an", "effluent gray light."}}},
                                        },
                                exits={north="Shadow Lands 6"},
                            }
                            
loadRooms.shadowLands6 =    {  
                                name="Shadow Lands 6",
                                displayName="Shadow Lands",
                                state="Light",
                                backgrounds={light=loadImages.shadowLands1},
                                map=loadImages.oneWayUpMap,
                                music=loadMusic.shadowLands,
                                backgroundStatic = true,
                                objects={
                                            eclipse={name="Eclipse",x=40,y=6,w=21,h=21,text={look={"A total eclipse of foreign", "celestial bodies hangs in the", "sky, casting the land in an", "effluent gray light."}}},
                                        },
                                exits={north="Shadow Lands 7"},
                            }
                            
loadRooms.shadowLands7 =    {  
                                name="Shadow Lands 7",
                                displayName="Shadow Lands",
                                state="Light",
                                backgrounds={light=loadImages.shadowLands1},
                                map=loadImages.oneWayUpMap,
                                music=loadMusic.shadowLands,
                                backgroundStatic = true,
                                objects={
                                            eclipse={name="Eclipse",x=40,y=6,w=21,h=21,text={look={"A total eclipse of foreign", "celestial bodies hangs in the", "sky, casting the land in an", "effluent gray light."}}},
                                        },
                                exits={north="Shadow Lands 8"},
                            }
                            
loadRooms.shadowLands8 =    {  
                                name="Shadow Lands 8",
                                displayName="Shadow Lands",
                                state="Light",
                                backgrounds={light=loadImages.shadowLands1},
                                map=loadImages.oneWayUpMap,
                                music=loadMusic.shadowLands,
                                backgroundStatic = true,
                                objects={
                                            eclipse={name="Eclipse",x=40,y=6,w=21,h=21,text={look={"A total eclipse of foreign", "celestial bodies hangs in the", "sky, casting the land in an", "effluent gray light."}}},
                                        },
                                exits={north="Shadow Lands 9"},
                            }
                            
loadRooms.shadowLands9 =    {  
                                name="Shadow Lands 9",
                                displayName="Shadow Lands",
                                state="Light",
                                backgrounds={light=loadImages.shadowLands2},
                                map=loadImages.zeroWayMap,
                                music=loadMusic.shadowLands,
                                backgroundStatic = true,
                                objects={
                                            altar={name="Altar",x=37,y=64,w=26,h=12,img=loadImages.altar,text={look={"An altar rests before you."},use={"You can't use this...yet."}}},
                                            eclipse={name="Eclipse",x=40,y=6,w=21,h=21,text={look={"A total eclipse of foreign", "celestial bodies hangs in the", "sky, casting the land in an", "effluent gray light."}}},
                                            statue={name="Statue",x=70,y=46,w=20,h=30,state="Off",img={off=loadImages.statueWithoutBall,on=loadImages.statueWithDarkCrystalBall},text={look={"A statue with empty hands. It", "looks like something could be", "placed here."},put={"You can put something here..."}}},
                                            statueWithDarkCrystalBall={name="Statue With Dark Crystal Ball",x=10,y=46,w=20,h=30,img=loadImages.statueWithDarkCrystalBall,text={look={"A statue with a dark crystal", "ball."}}},
                                            
                                        },
                                exits={},
                            }                              
                    

loadRooms.shed =    {
                        name="Shed",
                        state="Light",
                        map=loadImages.oneWayDownMap,
                        backgrounds={light=loadImages.shed,evil=loadImages.shedEvil},
                        objects={
                                    cog=loadObjects.cog,
                                    radio={name="Radio",x=58,y=39,w=19,h=7,text={look={"It's a ham radio. It looks to", "be in working order."},talk={"You speak into the microphone.", "But no one answers."},take={"If you take it with you, you", "won't be able to use it, since", "it needs to be plugged into a", "power socket."},use={"You listen to a voice on the", "speakers. It sounds like a", "series of numbers...", "0...8...3...5","What is the significance...?"}}},
                                    window={name="Window",x=23,y=22,w=21,h=21,state="Unbroken",img={unbroken=loadImages.shedWindow,broken=loadImages.shedWindowBroken},text={look={"A window sits on the wall. It's", "pitch black outside save for a", "sliver of the moon and some", "stars in the sky."}}}
                                },
                        exits={south="Park 3"},
                    }

-- Street 1
loadRooms.street1 =    {  
                            name="Street 1",
                            displayName = "Street",
                            state="Light",
                            backgrounds={light=loadImages.street1,evil=loadImages.street1Evil},
                            map=loadImages.threeWayUpMap,
                            music=loadMusic.darkStreets,
                            objects={
                                        clockTower={name="Clock Tower",x=43,y=15,w=13,h=33,move="North",text={look={"A clock tower stands tall in", "the distance."},move="North"}},
                                        streetlight1={name="Streetlight 1",x=26,y=34,w=4,h=25,text={look={"It's a streetlight, a silent", "vanguard against the", "encroaching darkness."}}},
                                        streetlight2={name="Streetlight 2",x=66,y=34,w=4,h=25,text={look={"It's a streetlight, a silent", "vanguard against the", "encroaching darkness."}}},
                                    },
                            exits={west="Highway 4", east="Street 2", north="Clock Tower Outside"},
                        }
                        
-- Street 2
loadRooms.street2 =    {
                            name="Street 2",
                            displayName = "Street",
                            state="Light",
                            backgrounds={light=loadImages.street2,evil=loadImages.street2Evil},
                            map=loadImages.threeWayUpMap,
                            music=loadMusic.darkStreets,
                            objects={
                                        park={name="Park",x=39,y=35,w=21,h=14,move="North",text={look={"A shadowy park lies before you."},move="North"}},
                                        streetlight1={name="Streetlight 1",x=26,y=34,w=4,h=25,text={look={"It's a streetlight, a silent", "vanguard against the", "encroaching darkness."}}},
                                        streetlight2={name="Streetlight 2",x=66,y=34,w=4,h=25,text={look={"It's a streetlight, a silent", "vanguard against the", "encroaching darkness."}}},
                                    },
                            exits={west="Street 1", east="Street 3", north="Park 1"},
                        }

-- Street 3
loadRooms.street3 =    {  
                            name="Street 3",
                            displayName = "Street",
                            state="Light",
                            backgrounds={light=loadImages.street3,evil=loadImages.street3Evil},
                            map=loadImages.threeWayUpMap,
                            music=loadMusic.darkStreets,
                            objects={
                                        church={name="Church",x=32,y=39,w=25,h=8,move="North",text={look={"A church sits silently."},move="North"}},
                                        streetlight1={name="Streetlight 1",x=26,y=34,w=4,h=25,text={look={"It's a streetlight, a silent", "vanguard against the", "encroaching darkness."}}},
                                        streetlight2={name="Streetlight 2",x=66,y=34,w=4,h=25,text={look={"It's a streetlight, a silent", "vanguard against the", "encroaching darkness."}}},
                                    },
                            exits={west="Street 2", east="Street 4", north="Church Outside"},
                        }
                        
loadRooms.street4 =    {  
                            name="Street 4",
                            displayName = "Street",
                            state="Light",
                            music=loadMusic.darkStreets,
                            backgrounds={light=loadImages.street4,evil=loadImages.street4Evil},
                            map=loadImages.twoWayHorizontalMap,
                            music=loadMusic.darkStreets,
                            objects={
                                        brick={name="Brick",x=69,y=45,w=5,h=3,text={look={"Something is etched here:", "           O  .  .", "           .  O  ?", "           ?  ?  ?"},pull={"You can't grip the brick."},take={"You can't grip the brick."}}},
                                        note={name="Note",x=46,y=48,w=8,h=7,text={look={"Something is etched into the", "wall here:", "\"An endless midnight has been", "visited upon me. Only in a", "dream does light exist for me", "anymore. Am I blind? Even when", "my eyes are open, not even the", "faint sliver of the crescent", "moon is visible to me.\""}}},
                                        silhouetteBody={name="Silhouette body",x=45,y=63,w=20,h=10,text={look={"You're not quite sure what it", "is, but it appears to be a", "silhouette of a person. For", "some reason, you get the", "distinct impression that it's", "not a drawing."},talk={"You can't talk to it. It's not", "actually a person, just a flat", "image on the ground."}}},
                                        streetlight1={name="Streetlight 1",x=26,y=34,w=4,h=25,text={look={"It's a streetlight, a silent", "vanguard against the", "encroaching darkness."}}},
                                    },
                            exits={west="Street 3", east="Street 5"},
                        }
                        
loadRooms.street5 =    {  
                            name="Street 5",
                            displayName = "Street",
                            state="Light",
                            backgrounds={light=loadImages.street5,evil=loadImages.street5Evil},
                            map=loadImages.twoWayLUpperLeftMap,
                            music = loadMusic.darkStreets,
                            objects={
                                        sewerGate={name="Sewer Gate",x=44,y=38,w=11,h=22,move="North",state="Rusted",img={broken=loadImages.sewerGateBroken,rusted=loadImages.sewerGate},text={close={"It's already rusted closed. You", "can't get much more closed than", "that!"},look={"It's a sewer gate. It looks to", "be rusted in place."},move="North",open={"You can't pull it open with", "your bare hands. It's rusted", "shut."},pull={"You can't pull it open with", "your bare hands. It's rusted", "shut."},push={"You can't push it open with", "your bare hands. It's rusted", "shut."}}},
                                    },
                            exits={north="Sewer 1", west="Street 4"}
                        }
                        
                
g.loadRooms = g.deepCopy(loadRooms)

return loadRooms