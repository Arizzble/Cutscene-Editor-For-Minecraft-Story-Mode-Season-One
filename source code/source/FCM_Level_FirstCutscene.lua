require("FCM_Utilities.lua");
require("FCM_AgentExtensions.lua");
require("FCM_Printing.lua");
require("Arizzble_Freecam_Tools.lua");
require("FCM_Development_AgentBrowser.lua");
require("FCM_DepthOfFieldAutofocus.lua");
require("FCM_Scene_PrepareLevel.lua");
require("FCM_Color.lua");
---agent_name_cutsceneCamera
----CUTSCENE EDITOR EXPERIMENT
require("LIP.lua")
local LIP = require("LIP.lua")
require("CutsceneEditor.lua");
require("CutscenePlayer.lua");

--main level variables
local kScript = "aabitest"; --dont touch (the name of this script and also the name of the level function at the bottom of the script, which will be called as soon as this scene opens)
local kScene = "adv_forestStage"; --dont touch (the name of the scene asset file)
local agent_name_scene = "adv_forestStage.scene"; --dont touch (this is the name of the scene agent object, using it to set post processing effects later)


--cutscene development variables variables (these are variables required by the development scripts)
Custom_CutsceneDev_SceneObject = kScene; --dont touch (the development scripts need to reference the main level)
Custom_CutsceneDev_SceneObjectAgentName = agent_name_scene; --dont touch (the development scripts also need to reference the name of the scene agent)
Custom_CutsceneDev_FreecamUseFOVScale = true; --changes the camera zooming from modifing the FOV directly, to modifying just the FOV scalar (only useful if for some reason the main field of view property is chorelocked or something like that)

--cutscene variables
local MODE_FREECAM = false; --enable freecam rather than the cutscene camera
local agent_name_cutsceneCamera = "myCutsceneCamera"; --cutscene camera agent name
local agent_name_cutsceneCameraParent = "myCutsceneCameraParent"; --cutscene camera parent agent name

Cutscene_CreateCutsceneCamera = function()
    --generic camera prop (prefab) asset
    local cam_prop = "module_camera.prop";
    
    --set a default position/rotation for the camera. (in theory this doesn't matter, but if the script somehow breaks during update the camera will stay in this position).
    local newPosition = Vector(0,0,0);
    local newRotation = Vector(0,0,0);
    
    --instaniate our cutscene camera object
    cameraAgent = AgentCreate(agent_name_cutsceneCamera, cam_prop, newPosition, newRotation, kScene, false, false);
    --local cameraParentAgent = AgentCreate(agent_name_cutsceneCameraParent, "group.prop", newPosition, newRotation, kScene, false, false);

    --AgentAttach(cameraAgent, cameraParentAgent);

    --set the clipping planes of the camera (how close the camera can see objects, and how far the camera can see)
    --if the near is set too high we start loosing objects in the foreground.
    --if the far is set to low we will only see part or no skybox at all
    AgentSetProperty(agent_name_cutsceneCamera, "Clip Plane - Far", 2500, kScene);
    AgentSetProperty(agent_name_cutsceneCamera, "Clip Plane - Near", 0.05, kScene);
    AgentSetProperty(agent_name_cutsceneCamera, "Lens - Current Lens", nil, Custom_CutsceneDev_SceneObject)

    AgentSetProperty(agent_name_cutsceneCamera, "Field of View", 70, Custom_CutsceneDev_SceneObject); --FOV correction for S2

    --bulk remove the original cameras that were in the scene
    --Custom_RemovingAgentsWithPrefix(kScene, "cam_");

    --push our new current camera to the scene camera layer stack (since we basically removed all of the original cameras just the line before this)
    CameraPush(agent_name_cutsceneCamera);
end

--KNOLLED'S CUSTOM D3DMESH FUNCTION
AddMesh = function(agent, model)
  local meshFound = false
  local meshes = AgentGetProperty(agent, "D3D Mesh List")

  for i = 0, ContainerGetNumElements(c) - 1 do
    local meshlookedup = ContainerGetElement(meshes, i)
    if ResourceGetName(meshlookedup) == model then  
      meshFound = true
    end
  end

  if not meshFound then
    ContainerInsertElement(meshes, model);
    AgentSetProperty(agent, "D3D Mesh List");
  end
end

RemoveMesh = function(agent, model)
  local meshes = AgentGetProperty(agent, "D3D Mesh List")

  for i = 0, ContainerGetNumElements(meshes) - 1 do
    local meshlookedup = ContainerGetElement(meshes, i)
    if ResourceGetName(meshlookedup) == model then  
      ContainerRemoveElement(meshes, i);
    end
  end
    AgentSetProperty(agent, "D3D Mesh List");
end

aabitest = function()
    --Scene_RelightScene_Treehouse(kScene, agent_name_scene); --DO NOT TOUCH THIS BECAUSE IT WILL CRASHED MCSM S1
    --Scene_RelightScene_ForestStage(kScene, agent_name_scene);
    --Scene_RelightScene_Endercon(kScene, agent_name_scene);
    --Scene_CleanUpOriginalScene(kScene); 
    --Scene_CleanUpOriginalScene101(kScene);
    --Scene_BetaScene106(kScene);
    --Scene_BetaScene101(kScene);
    --Scene_BetaScene101_nether(kScene);
    --Scene_CleanUpOriginalScene101AndPlayChoreForTest(kScene);
    --Scene_BetaScene106CleanUp(kScene);

    --==use these resources to create any props from episode to other episode if u like==--
    ResourceSetEnable("Project");
    --ResourceSetEnable("Minecraft101");
    --ResourceSetEnable("Minecraft102");
    --ResourceSetEnable("Minecraft103");
    --ResourceSetEnable("Minecraft104");
    --ResourceSetEnable("Minecraft105"); 
    --ResourceSetEnable("Minecraft106"); 
    --ResourceSetEnable("Minecraft107"); 
    --ResourceSetEnable("Minecraft108"); 
    --ResourceSetEnable("Menu"); 

    --==SOME FUNCTIONS EXAMPLES==--
    --toliet = AgentCreate("Toliet", "ui_boot_title.prop", Vector(0, 0, 0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --ShaderSwapTexture(toliet, "ui_boot_title.d3dtx", "toilethead.d3dtx");
    --AgentCreate("Gill", "skM1_gill.prop", Vector(0, 0, 0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --aiden = AgentCreate("Aiden", "skM1_aiden.prop", Vector(0, 0, 0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --AgentCreate("SwordDiamond", "obj_swordDiamond.prop", Vector(0, 0, 0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);

    --UNUSED COSTUMES FOR GILL AND MAYA AND AIDEN
    --local gillsoren = AgentGetProperty("Gill","D3D Mesh List")
    --ContainerInsertElement(gillsoren,"skM1_gill_beard.d3dmesh")
    --AgentSetProperty("Gill","D3D Mesh List")
    --local gillwig = AgentGetProperty("Gill","D3D Mesh List")
    --ContainerInsertElement(gillwig,"skM1_gill_wig.d3dmesh")
    --AgentSetProperty("Gill","D3D Mesh List")
    --local gillmustache = AgentGetProperty("Gill","D3D Mesh List")
    --ContainerInsertElement(gillmustache,"skM1_gill_mustache.d3dmesh")
    --AgentSetProperty("Gill","D3D Mesh List")
    --local mayahelmet = AgentGetProperty("Maya","D3D Mesh List")
    --ContainerInsertElement(mayahelmet,"skM1_maya_helmet.d3dmesh")
    --AgentSetProperty("Maya","D3D Mesh List")
    --local mayagoggle = AgentGetProperty("Maya","D3D Mesh List")
    --ContainerInsertElement(mayagoggle,"skM1_maya_goggles.d3dmesh")
    --AgentSetProperty("Maya","D3D Mesh List")
    --local aidenhat = AgentGetProperty("Aiden","D3D Mesh List")
    --ContainerInsertElement(aidenhat,"skM1_aiden_fishbowl.d3dmesh")
    --AgentSetProperty("Aiden","D3D Mesh List")

    MODE_FREECAM = true;

    if (MODE_FREECAM == false) then
      Cutscene_CreateCutsceneCamera(); --create our cutscene camera in the scene
      --create our free camera and our cutscene dev tools
    else
        --Custom_CutsceneDev_CreateFreeCamera();
        Arizzble_FreecamTools_CreateFreeCamera(); --IMPORTANT
        Custom_CutsceneDev_InitalizeCutsceneTools();
        --add these development update functions, and have them run every frame
        --Callback_OnPostUpdate:Add(Custom_CutsceneDev_UpdateFreeCamera);
        Callback_OnPostUpdate:Add(Arizzble_FreecamTools_UpdateFreeCamera); --IMPORTANT
        --Callback_OnPostUpdate:Add(Custom_CutsceneDev_UpdateCutsceneTools_Input); -WIP
        --Callback_OnPostUpdate:Add(Custom_CutsceneDev_UpdateCutsceneTools_Main); -WIP
    end

    --skM1_action_aidenAndActorsRaiseSwords
    --skM1_mineCraftGMStandAction_armsUp_add
    --skM1_mineCraftGMStandA_pointLeft_add

    --== SIMPLE PROP EXAMPLE ==--
    --AgentCreate("StandArmor", "obj_standArmor.prop", Vector(0, 0, 0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local chorecontroller = ChorePlay("skM1_idle_jesseSwingingOnRope");
    --ControllerSetLooping(chorecontroller, true);

    --Custom_PrintSceneListToTXT(kScene, "skytowen.txt");

    --create our free camera and our cutscene dev tools
    --Arizzble_FreecamTools_CreateFreeCamera(); --IMPORTANT
    --Custom_CutsceneDev_InitalizeCutsceneTools(); --IT WORK, BUT IT CAN BROKE MY FREECAM TOOLS
    --Callback_OnPostUpdate:Add(Arizzble_FreecamTools_UpdateFreeCamera); --IMPORTANT   
    --Callback_OnPostUpdate:Add(Arizzble_FreecamTools_UpdateFreeCamera_Old); --DOSENT WORKS
    --Callback_OnPostUpdate:Add(Custom_CutsceneDev_UpdateCutsceneTools_Input); --WIP (DONT TOUCH)
    --Callback_OnPostUpdate:Add(Custom_CutsceneDev_UpdateCutsceneTools_Main); --WIP (DONT TOUCH)
    --Custom_RemovingAgentsWithPrefix(kScene, "cam_") --DOESNT WORK

    CutsceneEditor("cutscene_s2","skM1_jesse.prop");
    --CutscenePlayer("cutscene_s2", 0, 1, 0);
end

--open the scene with this script
SceneOpen(kScene, kScript);