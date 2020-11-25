local loadGameText = {}

loadGameText.opening =  {
                          "You are in a small, dim room.",
                          "You can barely just make out",
                          "the door opposite your bed.",
                          "You had trouble sleeping last",
                          "night, and you know that you",
                          "have a difficult day ahead of",
                          "you. Today marks the third day",
                          "of finals week, and you know",
                          "there's no rest for the wicked.",
                        }
                        
loadGameText.bedroom =  {
                            door =  {
                                        close={"You close the door."},
                                        open={"You open the door."},
                                        look={"It's your bedroom door."},
                                        move="North"
                                    },
                                        
                            lightSwitch = {look={"It's a light switch."},use={"You flipped the light switch."}},
                            mirror = {look={"You look in the mirror. You", "instantly regretted doing so.", "Your hair is messed up after", "tossing and turning so much", "last night. Will you ever get a", "good night's sleep?"},talk={"You're not sure that's such a", "good idea..."},take={"You take the mirror."}},
                            mountainPicture = {look={"You examine the picture. It's","Mt. Fuji, you scaled it last", "year with some friends."}},
                            portraitPicture = {look={"You examine the portrait. It's", "a friend of yours, a tall man", "with light brown hair and a", "woodcutter axe slung over his", "shoulder."}},
                            textBook = {look={"You open the book. It's a", "research book on the effects of", "insomnia on the human body. You", "read a passage from the book:", "Insomnia is a condition where", "the person cannot go to sleep,", "even when they want to. It", "affects millions of people each", "year for various reasons. Some", "side effects of sleep", "deprivation include dizziness,", "nausea, migraines and", "hallucinations."},take={"You don't need that textbook", "today."}},
                            window = {look={"You look at the day sky. While", "the sun is shining, the light", "doesn't feel particularly warm."},talk={"You try talking to the window,", "but your words simply pass from", "one side to the other."}},
                        }
                        
loadGameText.churchOutside =    {
                                    door =  {
                                                close={"You close the door."},
                                                open={"You open the door."},
                                                look={"It's a small church door."},
                                                move="North"
                                            },
                                }
                                
loadGameText.graveyard =    {
                                grave=  {
                                            look={  "A decrept grave long worn down", "by the sands of time. It looks", "like it was moved recently.", 
                                                    "You expect to read about", "whoever's grave this is, but", "instead something else is", "carved into the stone:", "",
                                                    "ETERNAL SHADOWE IN THE TWILIGHT", "OF A DARK SUN.", "CREATURES THAT DANCE IN THE", "PERIPHERAL OF THE MIND.",
                                                    "A FORGOTTEN LAND THAT EXISTS", "AMONG THE STARS.", "GIVE YOUR FLESH TO THE HOLY", "ALTAR AND BE REBORN WITH AN",
                                                    "UNYIELDING IMMORTALITY."
                                                },
                                            pull={"It's too heavy to pull, but you", "may be able to push it."},
                                            push={"You push the grave, revealing", "an underground stairwell."}
                                        },
                            }
                            
loadGameText.goodCreditsText =  {
                                    "It's been a long and harrowing",
                                    "day, but you finally make it",
                                    "back home to your bedroom. You",
                                    "stumble wildly to your bed as", 
                                    "you slip in and out of",
                                    "consciousness. You slam down",
                                    "hard onto your mattress and",
                                    "pass out. When you awaken,",
                                    "the sun is shining",
                                    "magnificently in the azure sky,",
                                    "and all the blackness of the",
                                    "night has been banished to",
                                    "another day. You peaceably",
                                    "lie in your bed, and reflect on",
                                    "all the difficulties you just",
                                    "overcame. You vow to do your",
                                    "best to catch up on sleep, even",
                                    "if it means your grades suffer",
                                    "a bit. Because nothing is more",
                                    "important than a life."
                                }
            
loadGameText.badCreditsText =   {
                                    "You finally get back home and",
                                    "enter through the front door.",
                                    "You quickly collapse on your",
                                    "bed, while sleep quickly",
                                    "invades your mind. After an",
                                    "unknown stretch of time, you",
                                    "suddenly wake with a jolt.",
                                    "Immediately you realize with",
                                    "mounting terror that your body",
                                    "is completely immobilized. You",
                                    "strain your eyes this way and",
                                    "that, searching for anything.",
                                    "A black body presses down on",
                                    "your chest. Several others,",
                                    "including children, hold your",
                                    "limbs down fast with",
                                    "unrelenting strength. The",
                                    "tallest one stands seven feet",
                                    "tall in the encroaching dark",
                                    "space. It doesn't move at all.",
                                    "It doesn't need to. It stares",
                                    "without eyes, as all the others",
                                    "do, at your helpless body.",
                                    "",
                                    "YOU ATTEMPT TO SCREAM.",
                                    "YOU CAN'T MOVE YOUR MOUTH.",
                                    "THE MINUTES PASS.",
                                    "THE SHADOWS WATCH.",
                                    "",
                                    "YOUR MIND GOES BLACK AND YOU",
                                    "PASS INTO A DREAMSCAPE.",
                                }
            
loadGameText.easterEggCreditsText = {
                                        "You have gone blind from",
                                        "looking at the sun too many",
                                        "times!"
                                    }
                                    
loadGameText.alienCreditsText = {
                                    "Your body dissolves in a flash",
                                    "of bright gray light. All that",
                                    "remains is a shadowy form. Your",
                                    "mind remains, but your memories",
                                    "quickly fade into a thick fog."
                                }
                

return loadGameText