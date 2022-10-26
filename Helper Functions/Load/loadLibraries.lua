local loadLibraries = {}
        
function loadLibraries.load()
        
    -- Load game settings
    loadGameSettings = require("Helper Functions/Load/loadGameSettings")
    loadGameSettings.load()
    
    -- Load game variables
    loadVariables = require("Helper Functions/Load/loadVariables")
    loadVariables.load()
        
    -- External functions
    createEvent = require("Helper Functions/Create/createEvent")
    createGame = require("Helper Functions/Create/createGame")
    createRooms = require("Helper Functions/Create/createRooms")

    -- Update helper functions
    updateCheckAction = require("Helper Functions/Update/updateCheckAction")
    updateEnding = require("Helper Functions/Update/updateEnding")
    updateGame = require("Helper Functions/Update/updateGame")
    updateMousePress = require("Helper Functions/Update/updateMousePress")
    updatePlayerAction = require("Helper Functions/Update/updatePlayerAction")
    updateRoom = require("Helper Functions/Update/updateRoom")
    updateRoomLocks = require("Helper Functions/Update/updateRoomLocks")
    updateShadowChild = require("Helper Functions/Update/updateShadowChild")
    updateSquiggleMan = require("Helper Functions/Update/updateSquiggleMan")
    updateTitleScreen = require("Helper Functions/Update/updateTitleScreen")
    updateWindowResize = require("Helper Functions/Update/updateWindowResize")
    updateVideoBadEnding = require("Helper Functions/Update/updateVideoBadEnding")
    updateVideoIntro = require("Helper Functions/Update/updateVideoIntro")
    
    -- Update event functions
    updateLeftClickTitleEvents = require("Helper Functions/Update/Update Events/updateLeftClickTitleEvents")
    updateLeftClickPauseEvents = require("Helper Functions/Update/Update Events/updateLeftClickPauseEvents")
    updateLeftClickTransitionEvents = require("Helper Functions/Update/Update Events/updateLeftClickTransitionEvents")
    updateRightClickEvents = require("Helper Functions/Update/Update Events/updateRightClickEvents")
    updateMousePositionStates = require("Helper Functions/Update/Update Events/updateMousePositionStates")
    updateGameEvents = require("Helper Functions/Update/Update Events/updateGameEvents")
    updateEvents = require("Helper Functions/Update/updateEvents")

    -- Update check item functions
    updateCheckBoltCutters = require("Helper Functions/Update/Check Items/updateCheckBoltCutters")
    updateCheckCarKey = require("Helper Functions/Update/Check Items/updateCheckCarKey")
    updateCheckCog = require("Helper Functions/Update/Check Items/updateCheckCog")
    updateCheckGasStationKey = require("Helper Functions/Update/Check Items/updateCheckGasStationKey")
    updateCheckHacksaw = require("Helper Functions/Update/Check Items/updateCheckHacksaw")
    updateCheckLighter = require("Helper Functions/Update/Check Items/updateCheckLighter")
    updateCheckMallet = require("Helper Functions/Update/Check Items/updateCheckMallet")
    updateCheckMirror = require("Helper Functions/Update/Check Items/updateCheckMirror")
    updateCheckShadowOrb = require("Helper Functions/Update/Check Items/updateCheckShadowOrb")
    updateCheckItem = require("Helper Functions/Update/Check Items/updateCheckItem")
    
    -- Update check word action functions
    updateCheckWordAction = require("Helper Functions/Update/Check Actions/updateCheckWordAction")
    updateCheckIllegalWordAction = require("Helper Functions/Update/Check Actions/updateCheckIllegalWordAction")
    updateCheckActionLook = require("Helper Functions/Update/Check Actions/updateCheckActionLook")
    updateCheckActionOpen = require("Helper Functions/Update/Check Actions/updateCheckActionOpen")
    updateCheckActionPush = require("Helper Functions/Update/Check Actions/updateCheckActionPush")
    updateCheckActionPut = require("Helper Functions/Update/Check Actions/updateCheckActionPut")
    updateCheckActionTake = require("Helper Functions/Update/Check Actions/updateCheckActionTake")
    updateCheckActionUse = require("Helper Functions/Update/Check Actions/updateCheckActionUse")

    -- Draw helper functions
    drawWarningScreen = require("Helper Functions/Draw/drawWarningScreen")
    drawScreenTransition = require("Helper Functions/Draw/drawScreenTransition")
    drawManager = require("Helper Functions/Draw/drawManager")
    drawTitleScreen = require("Helper Functions/Draw/drawTitleScreen")
    drawTitleCreditsScreen = require("Helper Functions/Draw/drawTitleCreditsScreen")
    drawExtrasScreen = require("Helper Functions/Draw/drawExtrasScreen")
    drawItemScreen = require("Helper Functions/Draw/drawItemScreen")
    drawLoadScreen = require("Helper Functions/Draw/drawLoadScreen")
    drawSaveScreen = require("Helper Functions/Draw/drawSaveScreen")
    drawOptionsScreen = require("Helper Functions/Draw/drawOptionsScreen")
    drawInstructionsScreen = require("Helper Functions/Draw/drawInstructionsScreen")
    drawPauseScreen = require("Helper Functions/Draw/drawPauseScreen")
    drawUserInterface = require("Helper Functions/Draw/drawUserInterface")
    drawGame = require("Helper Functions/Draw/drawGame")
    drawInGameTransitions = require("Helper Functions/Draw/drawInGameTransitions")
    drawCursor = require("Helper Functions/Draw/drawCursor")
    drawEnding = require("Helper Functions/Draw/drawEnding")
    drawVideo = require("Helper Functions/Draw/drawVideo")
    drawSquiggleMan = require("Helper Functions/Draw/drawSquiggleMan")
    drawShadowChildCutscene = require("Helper Functions/Draw/drawShadowChildCutscene")
    
    -- Load helper functions
    -- Load image helper functions
    loadBackgroundImages = require("Helper Functions/Load/Images/loadBackgroundImages")
    loadCutsceneImages = require("Helper Functions/Load/Images/loadCutsceneImages")
    loadEndingImages = require("Helper Functions/Load/Images/loadEndingImages")
    loadInventoryImages = require("Helper Functions/Load/Images/loadInventoryImages")
    loadMapImages = require("Helper Functions/Load/Images/loadMapImages")
    loadObjectImages = require("Helper Functions/Load/Images/loadObjectImages")
    loadPickUpImages = require("Helper Functions/Load/Images/loadPickUpImages")
    loadShadowPeopleImages = require("Helper Functions/Load/Images/loadShadowPeopleImages")
    loadUIImages = require("Helper Functions/Load/Images/loadUIImages")
    loadGameImages = require("Helper Functions/Load/Images/loadGameImages")
    loadGameImages.load()
    
    -- Other load helper functions
    loadGameText = require("Helper Functions/Load/loadGameText")
    loadObjects = require("Helper Functions/Load/loadObjects")
    loadHelperFunctions = require("Helper Functions/Load/loadHelperFunctions")
    loadSFX = require("Helper Functions/Load/loadSFX")
    loadMusic = require("Helper Functions/Load/loadMusic")
    loadRooms = require("Helper Functions/Load/loadRooms")
    loadTextBoxes = require("Helper Functions/Load/loadTextBoxes")

    -- JSON4Lua Module
    json = require("Helper Functions/JSON4Lua/json")
    
    -- Miscellaneous text boxes that can be highlighted and selected (start game, options, etc.)
    -- These are loaded later since they depend on images
    loadTextBoxes.load()
end

return loadLibraries