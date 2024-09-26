--[[
-------------------------------------------------------------------------
This script is included in the main menu and contains the main function for when pressing the Play Cutscene Button,
It exectues the main cutscene level script.
]]--
--sets some season 2 project settings when we load into the cutscene
local SetSeason2ProjectSettings = function()
    local prefs = GetPreferences();
    PropertySet(prefs, "Animated Lookats Active", true)
    PropertySet(prefs, "Boot Project on Startup", true)
    PropertySet(prefs, "Enable LipSync 2.0", false)
    PropertySet(prefs, "Fix Pop In Additive Idle Transitions", true)
    PropertySet(prefs, "Lang Respect Volume Contribution", true)
    PropertySet(prefs, "Language Sync-- Enable New System for Project", true)
    PropertySet(prefs, "Legacy Chore Camera Layers", false)
    PropertySet(prefs, "Legacy Light Limits", false)
    PropertySet(prefs, "Legacy Use Default Lighting Group", false)
    PropertySet(prefs, "Project Generates Procedural Look At Targets", true)
    PropertySet(prefs, "Remap some Ascii chars to unicode smart chars", true)
    PropertySet(prefs, "Set Default Intensity", true)
    PropertySet(prefs, "Sourcesafe Enable", true)
    PropertySet(prefs, "Strip Dev Only Content", true)
    PropertySet(prefs, "Style Idle Transition In Time Override", 0)
    PropertySet(prefs, "Style Idle Transition Out Time Override", 0)
    PropertySet(prefs, "Style Idle Transition Time", 0.20000000298023)
    PropertySet(prefs, "Text Leading Fix", true)
    PropertySet(prefs, "Use Legacy DOF", false)
    PropertySet(prefs, "Use New Auto Acting", true)

end

--enables some archives that the cutscene uses assets from
local EnableCutsceneArchives = function()
    --enable these archives since the cutscene was built in S2 and uses S2 assets.
    ResourceSetEnable("Project");
    ResourceSetEnable("Minecraft101");
    --ResourceSetEnable("Minecraft102");
    --ResourceSetEnable("Minecraft103");
    --ResourceSetEnable("Minecraft104");
    --ResourceSetEnable("Minecraft105");
    --ResourceSetEnable("Minecraft106");
    --ResourceSetEnable("Minecraft107");
    --ResourceSetEnable("Minecraft108");
    --ResourceSetEnable("Menu");

end

--function that is exectued when the user presses the play cutscene button in the menu
PlayCutscene = function()
    SetSeason2ProjectSettings();
    EnableCutsceneArchives();

    OverlayShow("ui_loadingScreen.overlay", true);

    --execute the cutscene level script
    dofile("FCM_Level_FirstCutscene.lua");
end