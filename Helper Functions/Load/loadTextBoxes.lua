local loadTextBoxes = {}

local g = GLOBALS

function loadTextBoxes.load()
    
    g.textBoxes =   {
                        instructionsScreen =    {
                                                    startGame = {x=58,y=128,w=47,h=6,text="Start Game"},
                                                },
                        loadGameScreen =    {
                                                loadGame1 = {x=20,y=32,w=52,h=5,text="Load Game 1"},
                                                loadGame2 = {x=20,y=64,w=52,h=5,text="Load Game 2"},
                                                loadGame3 = {x=20,y=96,w=52,h=5,text="Load Game 3"},
                                                back = {x=20,y=128,w=18,h=5,text="Back"},
                                            },
                        optionsScreen = {
                                            back = {x=72,y=128,w=19,h=6,text="Back"},
                                            increaseWindowScale = {x=152,y=24,w=3,h=6,text="+"},
                                            decreaseWindowScale = {x=120,y=24,w=3,h=6,text="-"},
                                        },  
                        pauseScreen =   {
                                            resumeGame = {x=56,y=40,w=52,h=5,text="Resume Game"},
                                            checkItems = {x=56,y=56,w=52,h=5,text="Check Items"},
                                            loadGame = {x=56,y=72,w=42,h=5,text="Load Game"},
                                            saveGame = {x=56,y=88,w=42,h=5,text="Save Game"},
                                            quitGame = {x=56,y=104,w=42,h=5,text="Quit Game"},
                                        },
                        itemScreen =    {
                                            back = {x=3,y=136,w=18,h=6,text="Back"},
                                            items=  {
                                                        -- Row 1
                                                        boltCutters = {x=4-1,y=18-1,w=34,h=34,name="B. Cutters",longName="Bolt Cutters",img=loadImages.inventoryBoltCutters},
                                                        carKey = {x=4+40*1-1,y=18-1,w=34,h=34,name="Car Key",img=loadImages.inventoryCarKey},
                                                        cog = {x=4+40*2-1,y=18-1,w=34,h=34,name="Cog",img=loadImages.inventoryCog},
                                                        gasStationKey = {x=4+40*3-1,y=18-1,w=34,h=34,name="G.S. Key",longName="Gas Station Key",img=loadImages.inventoryGasStationKey},
                                                        
                                                        -- Row 2
                                                        hacksaw = {x=4+40*0-1,y=18+40*1-1,w=34,h=34,name="Hacksaw",img=loadImages.inventoryHacksaw},
                                                        mallet = {x=4+40*1-1,y=18+40*1-1,w=34,h=34,name="Mallet",img=loadImages.inventoryHammer},
                                                        lighter = {x=4+40*2-1,y=18+40*1-1,w=34,h=34,name="Lighter",img=loadImages.inventoryLighter},
                                                        mirror = {x=4+40*3-1,y=18+40*1-1,w=34,h=34,name="Mirror",img=loadImages.inventoryMirror},
                                                        
                                                        -- Row 3
                                                        eclipseBrooch = {x=24-1,y=18+40*2-1,w=34,h=34,name="E. Brooch",longName="Eclipse Brooch",img=loadImages.inventoryEclipseBrooch},
                                                        necklace = {x=24+40*1-1,y=18+40*2-1,w=34,h=34,name="Necklace",img=loadImages.inventoryNecklace},
                                                        shadowOrb = {x=24+40*2-1,y=18+40*2-1,w=34,h=34,name="Shadow Orb",img=loadImages.inventoryShadowOrb},
                                                    }
                                        },
                        saveGameScreen =    {
                                                saveGame1 = {x=20,y=32,w=52,h=5,text="Save Game 1"},
                                                saveGame2 = {x=20,y=64,w=52,h=5,text="Save Game 2"},
                                                saveGame3 = {x=20,y=96,w=52,h=5,text="Save Game 3"},
                                                back = {x=20,y=128,w=18,h=5,text="Back"},
                                            },
                        titleCreditsScreen =    {
                                                    downArrow = {x=134,y=120,w=18,h=6,text="Down"},
                                                    titleScreen = {x=4,y=128,w=19,h=6,text="Back"},
                                                    upArrow = {x=134,y=16,w=9,h=6,text="Up"},
                                                },
                        titleScreen =   {
                                            startGame = {x=52,y=82,w=59,h=6,text="Start Game"},
                                            loadGame = {x=52,y=96,w=53,h=6,text="Load Game"},
                                            options = {x=52,y=110,w=41,h=6,text="Options"},
                                            credits = {x=52,y=124,w=41,h=6,text="Credits"},
                                        },
                                        
                        transitionScreens = {
                                                car1={startGame = {x=30,y=128,w=101,h=6,text="Click to Continue"}},
                                                car2={startGame = {x=30,y=128,w=101,h=6,text="Click to Continue"}},
                                                car3={startGame = {x=30,y=128,w=101,h=6,text="Click to Continue"}},
                                                class={startGame = {x=30,y=128,w=101,h=6,text="Click to Continue"}},
                                                dream={startGame = {x=30,y=128,w=101,h=6,text="Click to Continue"}},
                                                space={startGame = {x=30,y=128,w=101,h=6,text="Click to Continue"}},
                                                night={startGame = {x=30,y=128,w=101,h=6,text="Click to Continue"}},
                                                dark={startGame = {x=30,y=128,w=101,h=6,text="Click to Continue"}},
                                            },
                                        
                        warningScreen = {
                                            continue = {x=42,y=128,w=81,h=5,text="Click to Continue"},
                                        }, 
                    }
    
end

return loadTextBoxes