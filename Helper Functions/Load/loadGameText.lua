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
                                    },
                                        
                            lightSwitch = {look={"It's a light switch."},use={"You activated the light switch."}},
                            mirror = {look={"You look in the mirror. You", "instantly regretted doing so.", "Your hair is messed up after", "tossing and turning so much", "last night."}},
                            mountainPicture = {look={"You examine the picture. It's","Mt. Fuji, you scaled it last", "year with some friends."}},
                            portraitPicture = {look={"You examine the portrait. It's", "a friend of yours, a tall man", "with light brown hair and a", "woodcutter axe slung over his", "shoulder."}},
                            textBook = {look={"You open the book. It's a", "research book on the effects of", "insomnia on the human body. You", "read a passage from the book:", "Insomnia is a condition where", "the person cannot go to sleep,", "even when they want to. It", "affects millions of people each", "year for various reasons. Some", "side effects of sleep", "deprivation include dizziness,", "nausea, migraines and", "hallucinations."}},
                            window = {look={"You look at the day sky. While", "the sun is shining, the light", "doesn't feel particularly warm."}},
                        }
                        
loadGameText.churchOutside =    {
                                    door =  {
                                                close={"You close the door."},
                                                open={"You open the door."},
                                                look={"It's a small church door."},
                                                move="North"
                                            },
                                }

return loadGameText