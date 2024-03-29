local updateCheckActionLook = {}

local g = GLOBALS

function updateCheckActionLook.update()
    
    -- Easter Egg Ending (looking at the sun on the patio 6 times and go blind)
    if(g.curLocation == loadRooms.patio) then
        if(g.mouse.objectPointedAt == loadRooms.patio.objects.sun) then
            g.playerState.numOfTimesLookedAtSun = g.playerState.numOfTimesLookedAtSun + 1
            
            if(g.playerState.numOfTimesLookedAtSun == 1) then
                loadRooms.patio.objects.sun.text.look = {"You really should not stare at", "the sun."}
            end
            
            if(g.playerState.numOfTimesLookedAtSun == 2) then
                loadRooms.patio.objects.sun.text.look = {"Seriously, it's not a wise", "choice to gaze too long at it."}
            end
            
            if(g.playerState.numOfTimesLookedAtSun == 3) then
                loadRooms.patio.objects.sun.text.look = {"If you keep it up, you'll lose", "your eyesight."}
            end
            
            if(g.playerState.numOfTimesLookedAtSun == 4) then
                loadRooms.patio.objects.sun.text.look = {"Say good-bye to your sight and", "welcome an endless darkness..."}
            end
            
            if(g.playerState.numOfTimesLookedAtSun >= 6) then
                g.timers.global = 90
                g.actionSelected = nil
                g.textBuffer = {}
                createEvent.create({name="Start Screen Transition", x=0, y=0, w=160, h=144,event={name="State Transition", state="easter egg ending"}})
                createEvent.create({name="Play Music", music=loadMusic.darkStreets})
                GLOBALS.endingsFound[4] = true
                local endingsFoundJson = json.encode(GLOBALS.endingsFound)
                love.filesystem.write("Endings_Found.lua", endingsFoundJson)
            end
        end
        
    -- Classroom transition from day to night
    elseif(g.curLocation == loadRooms.classroom) then
        if(g.mouse.objectPointedAt == loadRooms.classroom.objects.chalkboard1
            or g.mouse.objectPointedAt == loadRooms.classroom.objects.chalkboard2
            or g.mouse.objectPointedAt == loadRooms.classroom.objects.chalkboard3) then
            
            -- Class at school is over
            g.playerState.classOver = true
            
            -- The time changes from evening to night at school
            g.schoolEveningToNight()
            
            -- Go to the class transition screen
            g.fromGameToTransition("class transition")
        end
       
    -- Activate a jump scare in the gas station bathroom when looking at the mirror
    elseif(g.curLocation == loadRooms.gasStationBathroom) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.mirror and g.playerState.lookedAtGasStationBathroomMirror ~= true) then
            loadSFX.gasStationMirrorShadowPersonNoise:play()
            g.playerState.lookedAtGasStationBathroomMirror = true
            loadRooms.gasStationBathroom.objects.mirror.text.look = {"It's a filthy gas station", "mirror."}
        end
       
    elseif(g.curLocation == loadRooms.churchBasement) then
        if(g.curLocation.objects.shadow ~= nil and g.mouse.objectPointedAt == g.curLocation.objects.shadow) then
            g.showMessageBox = false
            if(g.curLocation.objects.shadow.state == "One") then
                g.curLocation.objects.shadow.state = "Two"
                g.curLocation.objects.shadow.w=16
                g.curLocation.objects.shadow.h=27
            elseif(g.curLocation.objects.shadow.state == "Two") then
                g.curLocation.objects.shadow.state = "Three"
                g.curLocation.objects.shadow.w=19
                g.curLocation.objects.shadow.h=33
            elseif(g.curLocation.objects.shadow.state == "Three") then
                g.curLocation.objects.shadow.state = "Four"
                g.curLocation.objects.shadow.w=26
                g.curLocation.objects.shadow.h=44
                g.music:stop()
            elseif(g.curLocation.objects.shadow.state == "Four") then
                g.curLocation.objects.shadow.state = "Five"
                g.curLocation.objects.shadow.w=39
                g.curLocation.objects.shadow.h=66
            elseif(g.curLocation.objects.shadow.state == "Five") then
                
                if not(g.playerState.hasNecklace) then
                
                    g.music:stop()
                    g.music=loadMusic.whoAreYouRunningFrom
                    g.music:play()
                    g.state = "who are you running from?"
                    
                -- The magic necklace will save the player
                else
                
                    g.music:stop()
                    g.music=loadMusic.darkStreets
                    g.music:play()
                    
                    g.backgroundStatic = false
                    g.curLocation.objects.shadow = nil
                    g.curLocation.objects.inscription=nil
                    g.curLocation.objects.ladder={name="ladder",x=72,y=7,w=8,h=41,img=loadImages.churchBasementLadder,text={look={"It's a ladder going up."},move=""}}
                    g.curLocation.objects.mirror=nil
                    g.writeToTextDisplay({"The magic necklace protected", "you."})
                end
                
                
            end
        end
       
    -- The symbol of the prince wakes up on looking at it
    elseif(g.curLocation == loadRooms.altarRoom) then
        if(g.mouse.objectPointedAt == loadRooms.altarRoom.objects.symbolOfThePrince) then
            loadRooms.altarRoom.objects.symbolOfThePrince.state = "Opened"
            loadRooms.altarRoom.objects.symbolOfThePrince.text.look = {"A bloodthirsty eye stares at","you."}
        end
        
    elseif(g.curLocation == loadRooms.nightmareGeometry1) then
        if(g.mouse.objectPointedAt == loadRooms.nightmareGeometry1.objects.shadowPeople) then
            loadRooms.nightmareGeometry1.exits={west="Dark Passage 2",east="Dark Passage 2",south="Dark Passage 2"}
            loadRooms.nightmareGeometry1.map = loadImages.threeWayDownMap
        end
       
    -- Staring at the Imperfect
    elseif(g.curLocation == loadRooms.nightmareGeometry2) then
        
        -- Update the beast when looking at it
        if(g.mouse.objectPointedAt == loadRooms.nightmareGeometry2.objects.beast) then
            if(loadRooms.nightmareGeometry2.backgrounds.light==loadImages.nightmareGeometry2) then
                loadRooms.nightmareGeometry2.backgrounds.light=loadImages.nightmareGeometry2_2
                loadRooms.nightmareGeometry2.objects.beast.x = 25
                loadRooms.nightmareGeometry2.objects.beast.y = 9
                loadRooms.nightmareGeometry2.objects.beast.w = 58
                loadRooms.nightmareGeometry2.objects.beast.h = 57
                loadRooms.nightmareGeometry2.objects.beast.text.look = {"..."}
                
            -- The player must look at least 2 times before they can escape
            elseif(loadRooms.nightmareGeometry2.backgrounds.light==loadImages.nightmareGeometry2_2) then
                loadRooms.nightmareGeometry2.backgrounds.light=loadImages.nightmareGeometry2_3
                loadRooms.nightmareGeometry2.objects.beast.y = 3
                loadRooms.nightmareGeometry2.objects.beast.h = 63
                loadRooms.nightmareGeometry2.objects.beast.text.look = {"Just run."}
                loadRooms.nightmareGeometry2.exits={west="Dark Passage 4",south="Dark Passage 4",east="Dark Passage 4"}
                loadRooms.nightmareGeometry2.map=loadImages.threeWayDownMap
            end
        end
        
    -- Looking at the Endless Hallway
    elseif(g.curLocation == loadRooms.nightmareGeometry5 or g.curLocation == loadRooms.nightmareGeometry6) then
        if(g.mouse.objectPointedAt == g.curLocation.objects.endlessHallway) then
            loadSFX.childrenLaughing:stop()
            loadSFX.childrenLaughing:play()
        end
        
    -- Squiggle Man
    elseif(g.curLocation == loadRooms.nightmareGeometry3) then
    
        -- Play audio clips for deep breathing, screaming, crawling (1x, 2x, 3x)
        if(g.mouse.objectPointedAt == loadRooms.nightmareGeometry3.objects.humanHoleInWall) then
            loadSFX.squiggleManScream:stop()
            loadSFX.squiggleManScream:setVolume(0.1)
            loadSFX.squiggleManScream:setPitch(0.8)
            loadSFX.squiggleManScream:play()
            loadRooms.nightmareGeometry3.exits = {west="Dark Passage 6",south="Dark Passage 6",east="Dark Passage 6"}
            loadRooms.nightmareGeometry3.map = loadImages.threeWayDownMap
        end
    
    -- Staring at the snaking wall
    elseif(g.curLocation == loadRooms.nightmareGeometry4) then
    
        -- Play audio clips for deep breathing, screaming, crawling (1x, 2x, 3x)
        if(g.mouse.objectPointedAt == loadRooms.nightmareGeometry4.objects.squiggleHoleInWall and g.playerState.numOfTimesLookedAtWallHole < 5) then
            g.playerState.numOfTimesLookedAtWallHole = g.playerState.numOfTimesLookedAtWallHole + 1
            
            if(g.playerState.numOfTimesLookedAtWallHole == 1) then
                loadRooms.nightmareGeometry4.objects.squiggleHoleInWall.text.look={"You hear crawling and", "screaming."}
                loadSFX.squiggleManScream:stop()
                loadSFX.squiggleManScream:setVolume(0.2)
                loadSFX.squiggleManScream:play()
                
            elseif(g.playerState.numOfTimesLookedAtWallHole == 2) then
                loadRooms.nightmareGeometry4.objects.squiggleHoleInWall.text.look={"The crawling draws near..."}
                loadSFX.squiggleManScream:stop()
                loadSFX.squiggleManScream:setVolume(0.4)
                loadSFX.squiggleManScream:play()
            
            -- If the player looks 4 times, monster eyes will appear
            elseif(g.playerState.numOfTimesLookedAtWallHole == 3) then
                loadRooms.nightmareGeometry4.objects.squiggleHoleInWall.text.look=
                {"Something is in the wall", "looking at you..."}
                loadSFX.squiggleManScream:stop()
                loadSFX.squiggleManScream:setVolume(0.6)
                loadSFX.squiggleManScream:play()
            
            elseif(g.playerState.numOfTimesLookedAtWallHole == 4) then
                loadRooms.nightmareGeometry4.backgrounds.light = loadImages.nightmareGeometry4WithCreature
                loadRooms.nightmareGeometry4.objects.squiggleHoleInWall.text.look={""}
                loadSFX.squiggleManScream:stop()
                loadSFX.squiggleManScream:setVolume(0.8)
                loadSFX.squiggleManScream:play()
                loadRooms.nightmareGeometry4.exits = {west="Dark Passage 8",south="Dark Passage 8",east="Dark Passage 8"}
                loadRooms.nightmareGeometry4.map = loadImages.threeWayDownMap
                
            -- If the player looks at least 5 times, the monster will appear and shriek (jump scare!!!)
            elseif(g.playerState.numOfTimesLookedAtWallHole == 5) then 
                loadRooms.nightmareGeometry4.backgrounds.light = loadImages.nightmareGeometry4
                g.showMessageBox = false
                loadSFX.squiggleManScream:stop()
                loadSFX.squiggleManScream:setVolume(1)
                loadSFX.squiggleManScream:setPitch(2.5)
                loadSFX.squiggleManScream:play()
                g.mouse.objectHover = nil
                g.mouse.objectPointedAt = nil
                loadRooms.nightmareGeometry4.objects.squiggleHoleInWall = nil
                g.mouse.x = -128
                g.mouse.y = -128
            end
        end
    end
    
end

return updateCheckActionLook