The Shadow People
Version 1.2.1

Copyright © 2020-2022 Elias Mote
Copyright © 2020-2022 Roc Studios

I. Disclaimer
II. Version History
III. Story
IV. Controls
V. Contact
VI. Credits

I. Disclaimer

This software may be not be reproduced under any circumstances except for personal, private use. It
may not be placed on any web site or otherwise distributed publicly except at the sole discretion of
the author. Placement of this readme or game on any other web site or as a part of any public
display is strictly prohibited, and a violation of copyright.

II. Version History

--------------------------
V1.2.1 - Current Version
--------------------------
-- Changes --
-- Capped frame rate at 60 fps.
-- Added some file creation (will be used later for steam achievements).

-- Bug Fixes --
-- Fixed a bug where the player could not use the "Move" action to move through a particular door
in the church.

--------------------------
V1.2
--------------------------
-- Changes --
-- Added content to the church basement.
-- The world state changes when you get the Shadow Orb.
-- Added some miscellaneous improvements around the game.
-- Improved gas station bathroom content.
-- Improved ending screens.

-- Bug Fixes --
-- Fixed a bug where the player could click on the sun outside the school at night.
-- Fixed a bug where the player couldn't use the Cog or Shadow Orb directly where they could be
placed.
-- Fixed a bug where placing the shadow orb wouldn't update text apporopriately.
-- Fixed a bug where you could move two rooms in the church at the same time when certain conditions
were met.
-- Fixed a bug where a non-interactable switch in the gas station bathroom was left in.

--------------------------
V1.1
--------------------------
-- Changes --
-- Candles in the church now have basic animation when lit.
-- Added secondary room and basement to the church.
-- When an item is equipped and usable, the cursor becomes the item icon.
-- Added new jump scare.

-- Bug Fixes --
-- Fixed a bug where the school door still said to hurry to class when looking at it after class
ends
-- Fixed a bug where going north from the church inside 1 room when the mirror in front of the
church secret room had been smashed would cause the player to move directly to the secret room and
skip the mirror room.
--Fixed a bug where the grave would not have moved properly upon loading into a game that already
moved the grave.
-- Fixed a bug where the door in the statue room would not have revealed itself upon loading a new
game.

--------------------------
V1.0.1
--------------------------
-- Bug Fixes --
-- Fixed a bug where the game would crash when returning to the game from the pause menu in the shed.
-- Fixed a bug where loading into Park 3 would not permit the player to move west until traveling to
the shed first. This was caused by g.mapTransitionIsLegal not being initialized to true when loading
the game. The variable is now initialized to true by default to prevent other possible loading issues.
-- Fixed a bug where picking up the hacksaw, then loading a game before the hacksaw was picked up,
would prevent the hacksaw from spawning in a second time without restarting the game. This was caused
by the hacksaw being put offscreen and therefore unattainable.

--------------------------
V1.0.0.8
--------------------------
-- Changes --
-- Getting a game over now boots you to the title screen rather than shuts the game off. This was
done to make the game more streamer friendly.
-- Getting any ending now allows you to go back to the title screen with a left click. This was
done to make the game more streamer friendly.
-- Added a SFX for the Shadow Child endless hallway

-- Bug Fixes --
-- Fixed a small issue where, when trying to use the eclipse brooch, the text for it would go top far
on the message box.
-- Fixed a bug where sound effects would not stop when travelling between rooms. This meant that
Squiggle Man's moan would not stop even when not in the area anymore.

--------------------------
V1.0.0.7
--------------------------
-- Changes --
-- The save and load screens now display the timestamps for each save file.

-- Bug Fixes --
-- Fixed a bug where loading into the shed from a different room will prevent the music from
starting after leaving the shed.

--------------------------
V1.0.0.6
--------------------------
-- Changes --
-- Updated the title screen to show tiny build changes (such as V1.0.0.6 instead of V1.0.0). This
was done because testers were getting confused by what version was being used.

-- Bug Fixes --
-- Fixed a bug where the Shadow Child cutscene wouldn't trigger. Instead, the game would softlock
after looking at them.
-- Fixed a bug where destroying the mirror that leads to the portal in the dream mirror room
wouldn't update the text for looking at it.
-- Fixed a bug where starting a new game after previously playing a different game and selecting an
item would still cause that item to be selected in a new game.
-- Fixed a bug where the previous fix for loading into the shed would still cause a crash from the
title screen. This bug also likely would have prevented music from loading in on save files
(unconfirmed).

--------------------------
V1.0.0.5
--------------------------
-- Changes --
-- Reduced the screen transition time from 70 frames to 50 frames 

-- Bug Fixes --
-- Fixed a bug where saving a game with an item currently selected from the player's inventory, then
loading a different game would still cause the game to think that item was selected, even for save
files where the player has not acquired that item yet. This could lead to softlocking.
-- Fixed a bug where loading the game in the living room would not allow the player to move south
to the bedroom until a different room was entered first.
-- Fixed a typo for one of the transition text screens.
-- Fixed overlapping text in the credits screen.

--------------------------
V1.0.0.4
--------------------------
-- Improvements --
-- Removed multiple map images to eliminate redundancy.
-- Code refactoring (removing old unnecessary code, adding more functions and variables to reduce 
code repetition and coupling) This includes:
--- Separating the check items and actions into separate functions (in their own files)

-- Bug Fixes --
-- Fixed a bug where the wrong music would play in the dream mirror room.
-- Fixed some bugs involving not updating the map upon loading the game after some secret doors have
 been opened

--------------------------
V1.0.0.3
--------------------------
-- Content --
-- Secret doors are now selectable from the map
-- Edited the image for the "Return of the Prince" ending
-- Added text to the "Eternal Twilight" ending
-- Animated the "Midnight Shadows" ending
-- Added clickable objects for the flooded labyrinth (movement sequence and phase of the moon)
-- Added "dark transition" at the end of the dark passage connecting it to the house outside
-- Added text for the "Lair of the Imperfect" and "House Outside" rooms
-- Changed the gas station bathroom to flicker instead of being dark

-- Bug Fixes --
-- Fixed a bug where the player could move through the sewer gate early if they used map movement.
-- Fixed a bug where the description for the Eclipse Brooch in the inventory used the car keys
description
-- Fixed a typo in the Puzzling Stone room
-- Fixed a bug in the House Outside room where the player could move through the door before opening
it

--------------------------
V1.0.0.2 - Current Version
--------------------------
-- Content --
-- Changed the size of the collision box for seeing the Shadow Child at the end of the Endless
Hallway.
-- Added a fps cap of 60
-- Slowed down the credits text to 12 seconds per page, instead of 10
-- Added an icon for the windows version of The Shadow People

-- Bug Fixes --
-- Fixed a bug where trying to open a door that's already open wouldn't update the text to let the
player know that the door was already open.
-- Fixed a bug with the gas station outside door where if the player tried to open the door while it
was locked, the text would incorrectly read "Opened the Door" instead of "It's locked".
-- Fixed a bug where loading the game at the "Cracked Wall?" (Nightmare Geometry 4) would load the
room incorrectly.
-- Fixed a bug where the "Night Transition" would not correctly set the mouse cursor.

--------------------------
V1.0.0.1
--------------------------
-- Content --
-- Added some extra dialogue when staring at the sun from the patio. This is to clue the
player in that staring at the sun is a bad idea.

-- Misc. --
-- Added LICENCE.txt for the JSON4Lua Module. The MIT License applies only to that module.

-------------------------
V1.0.0
-------------------------
-- Content --
-- Added an intro cutscene
-- Added to the Nightmare Geometry area
-- Updated in-game graphics
-- Updated in-game sfx
-- Updated in-game text
-- Updated in-game objects
-- Changed the clock tower puzzle to require pushing a third button to solve it, rather than just
using the hour and minute hand buttons. This will make it much harder for people to solve it by
trying each combination.

-- Bug Fixes --
-- Fixed a bug where trying to load a game that didn't exist crashed the game.
-- Fixed a bug where loading a game at the school after class is over didn't update the classroom
properly.
-- Fixed a bug where right clicking before the game loaded would cause a crash.
-- Fixed a bug where placing an item didn't correctly decrement the total number of items in the
inventory.
-- Fixed a bug where loading a game after pushing the grave didn't update the grave or create the
stairs leading into the crypt.
-- Fixed a bug where the mallet would not appear in the item screen after acquiring it.
-- Fixed a bug where cutting open the sewer gate didn't update the text to properly reflect it's
new "broken" state.

-------------------------
V0.9.12
-------------------------
-- Content --
-- Improved instructions screen.
-- Updated clickable area for the "cog" in the item menu.
-- Updated clickable area for some menu text.
-- The save and load game screens will use the hand cursor when hovering over games
that can be saved or loaded.
-- If the player tries to use the "put" action without selecting an item, the game will
tell them to "select an item to put down".
-- Removed unnecessary commented-out code.
-- Added music to the shadow child jump scare.
-- Added a cutscene for the bad ending.
-- Added an bad ending picture.

-- Bug Fixes --

-------------------------
V0.9.11
-------------------------
-- Content --
-- Added a cog that is required for operating the clock tower.
-- Added an inventory screen with pictures of acquired items. Mouse over will show the name
of the item.

-- Bug Fixes --
-- Fixed a bug where pausing the game in the shed would cause a crash.

-------------------------
V0.9.10
-------------------------
-- Content --

-- Bug Fixes --
-- Fixed a bug where starting a new game did not refresh the rooms back to a clean state.

------------------------
V0.9.9
------------------------
-- Content --
- Added a pause menu that has options for saving, loading, quitting the game, and checking items
(not complete yet).
- The player can save the game to any of 3 slots.
- The player can load the game from any of 3 slots.

------------------------
V0.9.8
------------------------
-- Content --
- Gas station puzzle has changed from picking up a gas station can to
pushing a button to activate the gas pumps. After activation, the gas pumps
can be used by the player.
- Made the gas station bathroom dark, so the player must search for the
light switch.
- Added SFX for lighting a candle, closing a door, opening a door, attempting to open a locked door
- Added a seizure warning at the start of the game.

------------------------
V0.9.7
------------------------
-- Content --
-- Added music, images and interactable objects to the Shadow Lands, House 
Outside, Dream Mirror Room
-- Added to the "Eternal Twilight" ending
-- Added code so that the player must place the shadow orb in the statue at
the end of the Shadow Lands (then use the altar) to unlock the
"Eternal Twilight" ending.

------------------------
V0.9.6
------------------------
-- Content --
-- Added puzzling stone room to gate altar room
-- Added ending with the red prince
-- Added "evil" update to highway 5 after getting the Shadow Orb
-- Added some easter egg content at the graveyard
-- Added clues for solving the "puzzling stone" room

-- Bug Fixes --
-- Fixed a bug where the sewer music would keep playing if you went back to the
street from the sewer
-- Fixed a bug with the clock puzzle where numbers "III" and "IX" had the wrong
descriptions when looking at them
-- Fixed a bug in the graveyard underground where there was an invisible message
left in by accident

------------------------
V0.9.5
------------------------
-- Content --
-- Added altar room in the flooded labyrinth
-- Added Shadow Child jump scare down the endless hallway
-- Added minimalistic background "music" to sewers, flooded labyrinth

-- Bug Fixes --
-- Fixed the clock tower puzzle
-- Hotfix: Accidentally set the g.playerState.hasNecklace to "true" in V0.9.4. Set it back to
"false" in V0.9.5
-- Hotfix: Fixed a bug with Squiggle Man where the player could remove the image by clicking after
he appears

------------------------
V0.9.4
------------------------
-- Added to the Nightmare Geometry area
-- The holy necklace protects the player from Squiggle Man

------------------------
V0.9.3
------------------------
-- Added the Flooded Labyrinth (with empty Altar Room)
-- Added the first (empty) room of the Nightmare Geometry
-- Added the Number Radio Station to the radio in the shed
-- Added the Clock Tower puzzle (to get the hacksaw)

------------------------
V0.9.2
------------------------
-- Added the Dark Passage after the Flooded Labyrinth.
-- Added a bad ending, which is received when the player doesn't find the necklace.
-- Added the alien ending at the end of the Shadow Lands.
-- Added names for all the endings.
-- Added a candle lighting puzzle to reveal a hidden door in the church. The puzzle is solved with
the lighter.
-- Obtaining the Shadow Orb, the Eclipse Brooch and the Necklace transports the player to the Shadow
Lands at the end of the game. This place leads to the alien ending.
-- Added a series of railroad tracks. They will lead to the train.
-- Added a street road that leads to the burnt house.
-- Added the shed in the park
-- Fixed a bug where repeatedly using the mirror to solve the statue puzzle wouldn't properly update
the text on subsequent uses.

------------------------
V0.9.1
------------------------
-- Fixed a bug where the player could accidentally scroll through text during a screen transition
event
-- Make an improvement fix where the player only needs a single click to change which item is
selected
-- Updated backgrounds for the sewers, park
-- Changed the layout of the sewers.
-- Changed the underground graveyard section to the statue room.
-- The mirror is used now to solve the statue room puzzle.
-- Increased the size of the park by one screen

------------------------
V0.9.0
------------------------
-- Added/changed backgrounds for inside the gas station, church, school, classroom, living room
-- Added the gas canister, shadow orb, necklace, hacksaw, eclipse brooch and hammer as pickups
-- Added the ability to scroll between item pages (if the player has more than 4 items)
-- Added text to the 2nd and 3rd car transitions
-- Added a sfx for smashing the mirrors
-- The player must look at the chalkboard to transition to nighttime and leave the school
-- Gas canister must now be picked up to leave the gas station
-- The clock hands can be manipulated by nearby buttons
-- The hammer can smash the central mirror in the mirror room to enter a secret room
-- The gas station key allows access to the gas station inside
-- The hacksaw can be used to cut open the entrance to the sewer gate
-- Fixed a bug where action text highlighting was occurring during screen transitions if the mouse
was over the action text

------------------------
V0.8.0
------------------------
-- Added new music (title screen, house light 8-bit, house dark 8-bit, highway, good ending)
-- Added good ending credits sequence (temporarily accessible from the outside of the house just
past the flooded labyrinth)
-- Added easter egg credits sequence (accessed by looking at the sun 5 times)
-- Added/improved some backgrounds
-- Added bolt cutters object to cut the chain on the park gate
-- Added the ability to push the grave at the park graveyard

------------------------
V0.7.0
------------------------
-- Added new backgrounds
-- Added to clock tower
-- Added to park (the graveyard)
-- Added the ability to select items.
-- The car keys are now used to start the car and drive to campus.

------------------------
V0.6.0
------------------------
-- Added new mouse icons for actions that have been selected
-- Updated some backgrounds and objects (Living room, car, gas station bathroom, clock tower)
-- Removed the kitchen from the game temporarily

------------------------
V0.5.0
------------------------
-- Worked on backgrounds, objects
-- Added car transitions, rooms

------------------------
V0.4.0
------------------------
-- Code refactoring
-- Move action is selectable; objects in the environment can be selected to move through.
-- Actions are now required for interacting with the background
-- Clicking no longer deselects a selected action
-- Actions can be deselected
-- Fixed a bug where bedroom objects were selectable on the title screen, changing the mouse to a
hand cursor
-- Decoupled some update code from draw functions

------------------------
V0.3.0
------------------------
-- Changed UI: added text description for each area
-- Added in boilerplate locations that can be traveled to be the player
-- Added highway image
-- Added church image

------------------------
V0.2.1
------------------------
-- Added music for the main house (from Taylor)
-- Added room transitions
-- Highlighting action text
-- Changed some in-game text
-- Updated some object, map and background images

------------------------
V0.2.0
------------------------
-- Added map navigation
-- Added items
-- Added dialogue
-- Added actions
-- Added rooms

------------------------
V0.1.1
------------------------
-- Mouse cursor changes when hovering over objects
-- Objects are selectable
-- Clicking on objects generates text
-- Added some basic room logic

------------------------
V0.1.0
------------------------
-- Added intro screen
-- Added title screen
-- Added blank instructions screen
-- Added bedroom (dark) location
-- Added user interface for the player

III. Story
The Shadow People is a #pointandclick #horror #adventure game where you wake up exhausted the week
before finals week. Gathering your things, you head to campus to attend class, and then after
sitting through a lengthy lecture, you head back home.

After refueling at a gas station on the way back, you're driving alone in the dark and doing your
best to keep yourself awake. Suddenly, you think you see someone in the road, and you violently
swerve out of the way to avoid them. Unfortunately, your car gets smashed pretty badly in the wreck,
 leaving you stranded on a lonely section of highway.

Your cell phone is unable to get any signal, so you decide to hoof it, looking for any sign of
civilization or cell phone signal. You reach a nearby town that you swear used to be just empty
grassland. You navigate the silent streets, trying your best to figure out a way back home.

IV. Controls
Use the left mouse to click through the game. Select text or objects within the game to perform
certain actions. Use the right click during the game to access the pause menu. You can select up to
10 different actions, including the "Move" action.

V. Contact
Contact me with questions or comments at rulerofchaosstudios@gmail.com
Twitter: twitter.com/Roc_Studios
Itch.io page: rocstudios.itch.io
Game jolt page: gamejolt.com/@Roc_Studios


VI. Credits

Producer: Elias Mote
Programmer: Elias Mote
Musicians: Taylor Fielder, Elias Mote
Testers: Dred4170, Raistlarn, Taylor Fielder, Aluminati, BeanWagon, David Harper, Elias Mote
Special Thanks: My loving and supportive family.

Software:
Engine: Love2d
Programming language: Lua
Music: Famitracker
Sound effects: Sfxr
Font: "Press Start" font by codeman38 http://www.zone38.net/
JSON4Lua: Craig Mason-Jones http://github.com/craigmj/json4lua/