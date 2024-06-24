Scene_CleanUpOriginalScene = function(kScene)
    --bulk remove all of the following assets
    Custom_RemovingAgentsWithPrefix(kScene, "light_CHAR_CC"); --character light objects
    Custom_RemovingAgentsWithPrefix(kScene, "lightrig"); --character light rigs
    Custom_RemovingAgentsWithPrefix(kScene, "fx_"); --particle effects
    Custom_RemovingAgentsWithPrefix(kScene, "fxg_"); --particle effects
    Custom_RemovingAgentsWithPrefix(kScene, "fxGroup_"); --particle effects groups
    Custom_RemovingAgentsWithPrefix(kScene, "light_point"); --scene point lights
    Custom_RemovingAgentsWithPrefix(kScene, "templateRig"); --template light rigs
    Custom_RemovingAgentsWithPrefix(kScene, "charLightComposer"); --light composers
    Custom_RemovingAgentsWithPrefix(kScene, "adv_");
    Custom_RemovingAgentsWithPrefix(kScene, "obj_");   
    --get all agents within the scene
    local scene_agents = SceneGetAgents(kScene);

    --loop through all agents inside the scene
    for i, agent_object in pairs(scene_agents) do
        --get the name of the current agent item that we are on in the loop
        local agent_name = tostring(AgentGetName(agent_object));

        --if the name of the agent has an adv_ prefix then its a level mesh, so remove it
        --if the name of the agent has an obj_ prefix then it is an object (ocassionaly a mesh but sometimes its something else like look at targets), so remove it.
        if string.match(agent_name, "adv_") or string.match(agent_name, "obj_") then
            --make sure that the current agent that we are deleting is not a skybox, we will need it
            if not (agent_name == "obj_skydomeTruckStopExterior") then
                Custom_RemoveAgent(agent_name, kScene);
            end
        end
    end
end

Scene_CleanUpOriginalScene101 = function(kScene)
    AgentDestroy("adv_forestTreehouse_meshesAFoliageGrass");
    AgentDestroy("adv_forestTreehouse_meshesAFoliageTrees");
    AgentDestroy("adv_forestTreehouse_meshesAFoliageTreesFlats");
    AgentDestroy("adv_forestTreehouse_meshesBFoliageGrass");
    AgentDestroy("adv_forestTreehouse_meshesBFoliageTreesFlats");
    AgentDestroy("adv_forestTreehouse_meshesCFoliageTrees");
    AgentDestroy("adv_forestTreehouse_meshesB");
    AgentDestroy("adv_forestTreehouse_meshesC");
    AgentDestroy("adv_forestTreehouse_meshesD");
    AgentDestroy("adv_forestTreehouse_meshesA");
    AgentDestroy("obj_treehouseForestTreehouseA");
    AgentDestroy("obj_treehouseForestTreehouseB");
    AgentDestroy("obj_treehouseForestTreehouseC");
    AgentDestroy("obj_treehouseForestTreehouseD");
    AgentDestroy("obj_treehouseForestTreehouseE");
    AgentDestroy("obj_treehouseForestTreehouseF");
    AgentDestroy("obj_mountainMatteForestTreehouse");
    AgentDestroy("obj_skydomeDayForestStage");
    AgentDestroy("obj_treehouseForestStage_foliageA");
    AgentDestroy("obj_treeForestTreehouseB");
    AgentDestroy("obj_treeForestTreehouseB02");
    AgentDestroy("obj_treeForestTreehouseB03");
    AgentDestroy("obj_treeForestTreehouseB04");
    AgentDestroy("obj_treeForestTreehouseB05");
    AgentDestroy("adv_forestTreehouse_meshesBFoliageTrees");
    
    local tile_group = AgentCreate("env_tile", "group.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);

    local tile2 = AgentCreate("env_tile2", "adv_orderTemple_meshesA.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile3 = AgentCreate("env_tile3", "adv_orderTemple_meshesB.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile4 = AgentCreate("env_tile4", "adv_orderTemple_meshesC.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile5 = AgentCreate("env_tile5", "adv_orderTemple_meshesD.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile6 = AgentCreate("env_tile6", "adv_orderTemple_meshesAFoliageGrass.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile7 = AgentCreate("env_tile7", "adv_orderTemple_meshesBFoliageGrass.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile8 = AgentCreate("env_tile8", "adv_orderTempleMountainsA.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile9 = AgentCreate("env_tile9", "adv_orderTempleMountainsB.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile10 = AgentCreate("env_tile10", "obj_cloudsOrderTempleA.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile11 = AgentCreate("env_tile11", "obj_orderTemple_gardenA.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile12 = AgentCreate("env_tile12", "obj_orderTemple_gardenB.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile13 = AgentCreate("env_tile13", "obj_orderTemple_gardenC.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile14 = AgentCreate("env_tile14", "obj_orderTemple_gardenD.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile15 = AgentCreate("env_tile15", "obj_orderTemple_gardenE.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile16 = AgentCreate("env_tile16", "obj_orderTemple_meshesAFoliageTrees.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile17 = AgentCreate("env_tile17", "obj_orderTemple_meshesBFoliageTrees.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile18 = AgentCreate("env_tile18", "obj_orderTemple_walkwaysA.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile19 = AgentCreate("env_tile19", "obj_orderTemple_walkwaysB.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile20 = AgentCreate("env_tile20", "obj_orderTempleWingA.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile21 = AgentCreate("env_tile21", "obj_orderTempleWingB.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile22 = AgentCreate("env_tile22", "obj_orderTempleWingC.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile23 = AgentCreate("env_tile23", "obj_orderTempleWingD.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);


    AgentAttach(tile2, tile_group);
    AgentAttach(tile3, tile_group);
    AgentAttach(tile4, tile_group);
    AgentAttach(tile5, tile_group);
    AgentAttach(tile6, tile_group);
    AgentAttach(tile7, tile_group);
    AgentAttach(tile8, tile_group);
    AgentAttach(tile9, tile_group);
    AgentAttach(tile10, tile_group);
    AgentAttach(tile11, tile_group);
    AgentAttach(tile12, tile_group);
    AgentAttach(tile13, tile_group);
    AgentAttach(tile14, tile_group);
    AgentAttach(tile15, tile_group);
    AgentAttach(tile16, tile_group);
    AgentAttach(tile17, tile_group);
    AgentAttach(tile18, tile_group);
    AgentAttach(tile19, tile_group);
    AgentAttach(tile20, tile_group);
    AgentAttach(tile21, tile_group);
    AgentAttach(tile22, tile_group);
    AgentAttach(tile23, tile_group);

end

Scene_BetaScene106 = function(kScene)   
    local tile_group = AgentCreate("env_tile", "group.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);

    --local tile2 = AgentCreate("env_tile2", "adv_orderTemple_meshesA.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile3 = AgentCreate("env_tile3", "adv_orderTemple_meshesB.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile4 = AgentCreate("env_tile4", "adv_creepyMansionInteriorChase_meshesE.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile5 = AgentCreate("env_tile5", "adv_creepyMansionInteriorChase_meshesEFoliageTrees.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile6 = AgentCreate("env_tile6", "adv_creepyMansionInteriorChase_meshesF.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);

    AgentAttach(tile2, tile_group);
    AgentAttach(tile3, tile_group);
    AgentAttach(tile4, tile_group);
    AgentAttach(tile5, tile_group);
    AgentAttach(tile6, tile_group);

end


Scene_BetaScene101_nether = function(kScene)   
    local tile_group = AgentCreate("env_tile", "group.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);

    --local tile2 = AgentCreate("env_tile2", "obj_gabrielTowerFloorMoonlightWildernessTile.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile3 = AgentCreate("env_tile3", "obj_gabrielTowerFloorWildernessTile.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile4 = AgentCreate("env_tile4", "obj_gabrielTowerFrontRoomWildernessTile.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile5 = AgentCreate("env_tile5", "obj_gabrielTowerInteriorWildernessTile.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile6 = AgentCreate("env_tile6", "adv_villagePyramidBeacon105_meshesAInteriors.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile7 = AgentCreate("env_tile7", "obj_gateGabrielTowerA.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile8 = AgentCreate("env_tile8", "obj_gateGabrielTowerB.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile9 = AgentCreate("env_tile9", "obj_portalGabrielTowerSoftEdges.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile10 = AgentCreate("env_tile10", "obj_wildernessTile_meshesBFoliageTreesGabrielTower.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile11 = AgentCreate("env_tile11", "obj_wildernessTileGabrielTowerA.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile12 = AgentCreate("env_tile12", "obj_wildernessTileGabrielTowerB.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    local tile13 = AgentCreate("env_tile13", "obj_wildernessTileGabrielTowerLamps.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile14 = AgentCreate("env_tile14", "obj_wildernessTileGabrielTowerA.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile15 = AgentCreate("env_tile15", "adv_villagePyramidBeacon105_meshesD.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile16 = AgentCreate("env_tile16", "adv_villagePyramidBeacon105_meshesE.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile17 = AgentCreate("env_tile17", "adv_villagePyramidBeacon105_meshesF.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile18 = AgentCreate("env_tile18", "adv_villagePyramidBeacon105_meshesG.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile19 = AgentCreate("env_tile19", "adv_villagePyramidBeacon105_meshesH.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile20 = AgentCreate("env_tile20", "adv_villagePyramidBeacon105_meshesI.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile21 = AgentCreate("env_tile21", "adv_villagePyramidBeacon105_meshesJ.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile22 = AgentCreate("env_tile22", "adv_villagePyramidBeacon105_meshesK.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile23 = AgentCreate("env_tile23", "adv_villagePyramidBeacon105_meshesL.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile24 = AgentCreate("env_tile24", "obj_rubbleTempleHub103A.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile25 = AgentCreate("env_tile25", "obj_tableTempleHub103A.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile26 = AgentCreate("env_tile26", "obj_telescopeEllieTempleHub103.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile27 = AgentCreate("env_tile27", "obj_tntPileTempleHub103.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile28 = AgentCreate("env_tile28", "obj_tntPileTempleHub103Blocks.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile29 = AgentCreate("env_tile29", "obj_tntTowerTempleHub103A.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile30 = AgentCreate("env_tile30", "adv_townFair_meshesIFoliageTrees.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile31 = AgentCreate("env_tile31", "adv_townFair_meshesKFoliageTrees.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile32 = AgentCreate("env_tile32", "adv_townFair_meshesIFoliage.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile33 = AgentCreate("env_tile33", "adv_sorenInterior103_meshesK.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile34 = AgentCreate("env_tile34", "adv_sorenInterior103_meshesK.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile35 = AgentCreate("env_tile35", "adv_sorenInterior103_meshesK.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile36 = AgentCreate("env_tile36", "adv_sorenInterior103_meshesK.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile37 = AgentCreate("env_tile37", "adv_sorenInterior103_meshesK.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile38 = AgentCreate("env_tile38", "adv_sorenInterior103_meshesK.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);
    --local tile39 = AgentCreate("env_tile39", "adv_sorenInterior103_meshesK.prop", Vector(0,0,0), Vector(0,0,0), Custom_CutsceneDev_SceneObject, false, false);

    AgentAttach(tile2, tile_group);
    AgentAttach(tile3, tile_group);
    AgentAttach(tile4, tile_group);
    AgentAttach(tile5, tile_group);
    AgentAttach(tile6, tile_group);
    AgentAttach(tile7, tile_group);
    AgentAttach(tile8, tile_group);
    AgentAttach(tile9, tile_group);
    AgentAttach(tile10, tile_group);
    AgentAttach(tile11, tile_group);
    AgentAttach(tile12, tile_group);
    AgentAttach(tile13, tile_group);
    AgentAttach(tile14, tile_group);
    AgentAttach(tile15, tile_group);
    AgentAttach(tile16, tile_group);
    AgentAttach(tile17, tile_group);
    AgentAttach(tile18, tile_group);
    AgentAttach(tile19, tile_group);
    AgentAttach(tile20, tile_group);
    AgentAttach(tile21, tile_group);
    AgentAttach(tile22, tile_group);
    AgentAttach(tile23, tile_group);
    AgentAttach(tile24, tile_group);
    AgentAttach(tile25, tile_group);
    AgentAttach(tile26, tile_group);
    AgentAttach(tile27, tile_group);
    AgentAttach(tile28, tile_group);
    AgentAttach(tile29, tile_group);
    AgentAttach(tile30, tile_group);
    AgentAttach(tile31, tile_group);
    AgentAttach(tile32, tile_group);
    AgentAttach(tile33, tile_group);
    AgentAttach(tile34, tile_group);
    AgentAttach(tile35, tile_group);
    AgentAttach(tile36, tile_group);
    AgentAttach(tile37, tile_group);
    AgentAttach(tile38, tile_group);
    AgentAttach(tile39, tile_group);

end


Scene_CleanUpOriginalScene101AndPlayChoreForTest = function(kScene)
    AgentDestroy("adv_forestTreehouse_meshesAFoliageGrass");
    AgentDestroy("adv_forestTreehouse_meshesAFoliageTrees");
    AgentDestroy("adv_forestTreehouse_meshesAFoliageTreesFlats");
    AgentDestroy("adv_forestTreehouse_meshesBFoliageGrass");
    AgentDestroy("adv_forestTreehouse_meshesBFoliageTrees")
    AgentDestroy("adv_forestTreehouse_meshesBFoliageTreesFlats");
    AgentDestroy("adv_forestTreehouse_meshesCFoliageTrees");
    AgentDestroy("adv_forestTreehouse_meshesB");
    AgentDestroy("adv_forestTreehouse_meshesC");
    AgentDestroy("adv_forestTreehouse_meshesD");
    AgentDestroy("adv_forestTreehouse_meshesA");
    AgentDestroy("obj_treehouseForestTreehouseA");
    AgentDestroy("obj_treehouseForestTreehouseB");
    AgentDestroy("obj_treehouseForestTreehouseC");
    AgentDestroy("obj_treehouseForestTreehouseD");
    AgentDestroy("obj_treehouseForestTreehouseE");
    AgentDestroy("obj_treehouseForestTreehouseF");
    AgentDestroy("obj_mountainMatteForestTreehouse");
    AgentDestroy("obj_skydomeDayForestStage");
    AgentDestroy("obj_treehouseForestStage_foliageA");
    AgentDestroy("obj_treeForestTreehouseB");
    AgentDestroy("obj_treeForestTreehouseB02");
    AgentDestroy("obj_treeForestTreehouseB03");
    AgentDestroy("obj_treeForestTreehouseB04");
    AgentDestroy("obj_treeForestTreehouseB05");
    AgentDestroy("adv_forestTreehouse_meshesBFoliageTrees");
    AgentDestroy("fx_water_forestTreehouse");
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
    AgentDestroy();
end

Scene_BetaScene106CleanUp = function(kScene)   

    AgentDestroy("adv_creepyMansionInterior_meshesA");
    AgentDestroy("adv_creepyMansionInterior_meshesB");
    AgentDestroy("adv_creepyMansionInterior_meshesC");
    AgentDestroy("adv_creepyMansionInterior_meshesD");
    AgentDestroy("adv_creepyMansionInterior_meshesE");
    AgentDestroy("adv_creepyMansionInterior_meshesF");
    AgentDestroy("obj_exteriorFrontDoorCreepyMansionInterior");
    AgentDestroy("obj_doorIronMainHallCreepyMansionRight");
    AgentDestroy("obj_doorIronMainHallCreepyMansionLeft");

end


Scene_RelightScene_Treehouse = function(kScene, agent_name_scene)

    local light_prop = "module_scene_lightenv.prop"


    --AgentSetProperty(light_prop, "LightEnv Intensity", 1.200, kScene); -- only on charater...
    --AgentSetProperty(light_prop, "LightEnv Reflection Intensity", 1.200, kScene);
    --AgentSetProperty(light_prop, "LightEnv Saturation", 1.200, kScene); --only on charater
    --AgentSetProperty(light_prop, "LightEnv Enabled", true, kScene);
    --AgentSetProperty(light_prop, "LightEnv Reflection Enabled", true, kScene);

    --modify the scene post processing
    AgentSetProperty(agent_name_scene, "LightEnv Intensity", 1.200, kScene); -- only on charater...
    AgentSetProperty(agent_name_scene, "LightEnv Reflection Intensity", 1.200, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Saturation", 1.200, kScene); --only on charater
    AgentSetProperty(agent_name_scene, "LightEnv Enabled", true, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Reflection Enabled", true, kScene);
    --LightEnv Background Color - COLOR
    --LightEnv Reflection Tint - COLOR
    --LightEnv Tint -COLOR

    --LightEnv Reflection Texture -unknown texture
    --LightEnv Probe Data -unknown
    --AgentSetProperty(light_prop, "Light Render Layer", 1, kScene);
    --AgentSetProperty(light_prop, "Light Shadow Cascades", 1, kScene);
    --AgentSetProperty(light_prop, "Light Ambient Occlusion", 1, kScene);
    --AgentSetProperty(light_prop, "Light Color Correction", 1, kScene);
    --AgentSetProperty(light_prop, "Light Dimmer", 20.000, kScene);
    --AgentSetProperty(light_prop, "Light Intensity", 20.000, kScene);
    --AgentSetProperty(light_prop, "Light Intensity Diffuse", 20.000, kScene);
    --AgentSetProperty(light_prop, "Light Intensity Specular", 20.000, kScene);
    --AgentSetProperty(light_prop, "Light Max Distance", 2.000, kScene);
    --AgentSetProperty(light_prop, "Light Min Distance", 0.010, kScene);
    --AgentSetProperty(light_prop, "Light Rim Intensity", 20.000, kScene);
    --AgentSetProperty(light_prop, "Light Rim Occlusion", 20.000, kScene);
    --AgentSetProperty(light_prop, "Light Rim Wrap Around", 20.000, kScene);
    --AgentSetProperty(light_prop, "Light Shadow Bias", 1.000, kScene);
    --AgentSetProperty(light_prop, "Light Shadow Distance Falloff", 1.000, kScene);
    --AgentSetProperty(light_prop, "Light Shadow Max Distance", 100.000, kScene);
    --AgentSetProperty(light_prop, "Light Spot Alpha", 20.000, kScene);
    --AgentSetProperty(light_prop, "Light Spot Inner Radius",20.200, kScene);
    --AgentSetProperty(light_prop, "Light Spot Outer Radius", 20.000, kScene);
    --AgentSetProperty(light_prop, "Light Spot Texture Rotate", 20.000, kScene);
    --AgentSetProperty(light_prop, "Light Toon Opacity", 20.000, kScene);
    --AgentSetProperty(light_prop, "Light Toon Priority", 20.000, kScene);
    --AgentSetProperty(light_prop, "Light Wrap Around", 20.000, kScene);
    --AgentSetProperty(light_prop, "Dynamic on LightMap", true, kScene);
    --AgentSetProperty(light_prop, "Light Key Light", true, kScene);
    --AgentSetProperty(light_prop, "Light Static", true, kScene);
    --AgentSetProperty(light_prop, "Light Turned On", true, kScene);
    --Light Color - COLOR

    AgentSetProperty(agent_name_scene, "FX anti-aliasing", true, kScene);
    --AgentSetProperty(agent_name_scene, "FX Sharp Shadows Enabled", true, kScene);
    AgentSetProperty(agent_name_scene, "FX Ambient Occlusion Enabled", true, kScene);
    --AgentSetProperty(agent_name_scene, "FX Tonemap Intensity", 1, kScene);
    --AgentSetProperty(agent_name_scene, "FX Tonemap White Point", 8.0, kScene); --8.0
    --AgentSetProperty(agent_name_scene, "FX Tonemap Black Point", 0.005, kScene); --0.005
    AgentSetProperty(agent_name_scene, "FX Tonemap Filmic Toe Intensity", 1, kScene);
    AgentSetProperty(agent_name_scene, "FX Tonemap Filmic Shoulder Intensity", 0.75, kScene);
    --AgentSetProperty(agent_name_scene, "FX Tonemap Type", 2, kScene);
    --AgentSetProperty(agent_name_scene, "FX Tonemap Filmic Pivot", 0, kScene);
    --AgentSetProperty(agent_name_scene, "FX Tonemap Filmic Shoulder Intensity", 0.8, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Enabled", true, kScene);
    --AgentSetProperty(agent_name_scene, "HBAO Intensity", 5, kScene);
    --AgentSetProperty(agent_name_scene, "HBAO Radius", 0.75, kScene);
    --AgentSetProperty(agent_name_scene, "HBAO Max Radius Percent", 0.5, kScene);
    --AgentSetProperty(agent_name_scene, "HBAO Max Distance", 35.5, kScene);
    --AgentSetProperty(agent_name_scene, "HBAO Distance Falloff", 0, kScene);
    --AgentSetProperty(agent_name_scene, "HBAO Hemisphere Bias", -0.6, kScene); --
    AgentSetProperty(agent_name_scene, "FX Bloom Threshold", -0.5, kScene); --
    AgentSetProperty(agent_name_scene, "FX Bloom Intensity", 0.15, kScene); --

    --AgentSetProperty(agent_name_scene, "FX Vignette Tint Enabled", true, kScene);
    --AgentSetProperty(agent_name_scene, "FX Vignette Tint", RGBColor(0, 0, 0, 255), kScene);
    --AgentSetProperty(agent_name_scene, "FX Vignette Falloff", 1.0, kScene);
    --AgentSetProperty(agent_name_scene, "FX Vignette Center", 0, kScene);
    --AgentSetProperty(agent_name_scene, "FX Vignette Corners", 1.0, kScene);

    --AgentSetProperty(agent_name_scene, "LightEnv Reflection Intensity Shadow", 1.0, kScene);
    --AgentSetProperty(agent_name_scene, "LightEnv Reflection Intensity", 1.0, kScene);
    --AgentSetProperty(agent_name_scene, "LightEnv Shadow Max Distance", 20.0, kScene);
    --AgentSetProperty(agent_name_scene, "LightEnv Dynamic Shadow Max Distance", 25.0, kScene);
    --AgentSetProperty(agent_name_scene, "LightEnv Shadow Position Offset Bias", 0.0, kScene);
    --AgentSetProperty(agent_name_scene, "LightEnv Shadow Depth Bias", -1.0, kScene);
    --AgentSetProperty(agent_name_scene, "LightEnv Shadow Auto Depth Bounds", false, kScene);
    --AgentSetProperty(agent_name_scene, "LightEnv Shadow Light Bleed Reduction", 0.8, kScene);
    --AgentSetProperty(agent_name_scene, "LightEnv Shadow Moment Bias", 0.0, kScene);

    --AgentSetProperty(agent_name_scene, "Specular Multiplier Enabled", true, kScene);
    --AgentSetProperty(agent_name_scene, "Specular Color Multiplier", 55, kScene);
    --AgentSetProperty(agent_name_scene, "Specular Intensity Multiplier", 1, kScene);
    --AgentSetProperty(agent_name_scene, "Specular Exponent Multiplier", 1, kScene);
end

Scene_RelightScene_ForestStage = function(kScene, agent_name_scene)

    local light_prop = "module_scene_lightenv.prop"


    AgentSetProperty(light_prop, "LightEnv Intensity", 1.200, kScene); -- only on charater...
    AgentSetProperty(light_prop, "LightEnv Reflection Intensity", 1.200, kScene);
    AgentSetProperty(light_prop, "LightEnv Saturation", 1.200, kScene); --only on charater
    AgentSetProperty(light_prop, "LightEnv Enabled", true, kScene);
    AgentSetProperty(light_prop, "LightEnv Reflection Enabled", true, kScene);

    --modify the scene post processing
    --AgentSetProperty(agent_name_scene, "LightEnv Intensity", 1.200, kScene); -- only on charater...
    --AgentSetProperty(agent_name_scene, "LightEnv Reflection Intensity", 1.200, kScene);
    --AgentSetProperty(agent_name_scene, "LightEnv Saturation", 1.200, kScene); --only on charater
    --AgentSetProperty(agent_name_scene, "LightEnv Enabled", true, kScene);
    --AgentSetProperty(agent_name_scene, "LightEnv Reflection Enabled", true, kScene);
    --LightEnv Background Color - COLOR
    --LightEnv Reflection Tint - COLOR
    --LightEnv Tint -COLOR

    --LightEnv Reflection Texture -unknown texture
    --LightEnv Probe Data -unknown
    --AgentSetProperty(agent_name_scene, "Light Render Layer", 1, kScene);
    --AgentSetProperty(agent_name_scene, "Light Shadow Cascades", 1, kScene);
    --AgentSetProperty(agent_name_scene, "Light Ambient Occlusion", 1, kScene);
    --AgentSetProperty(agent_name_scene, "Light Color Correction", 1, kScene);
    --AgentSetProperty(agent_name_scene, "Light Dimmer", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Intensity", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Intensity Diffuse", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Intensity Specular", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Max Distance", 2.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Min Distance", 0.010, kScene);
    --AgentSetProperty(agent_name_scene, "Light Rim Intensity", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Rim Occlusion", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Rim Wrap Around", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Shadow Bias", 1.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Shadow Distance Falloff", 1.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Shadow Max Distance", 100.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Spot Alpha", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Spot Inner Radius",20.200, kScene);
    --AgentSetProperty(agent_name_scene, "Light Spot Outer Radius", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Spot Texture Rotate", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Toon Opacity", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Toon Priority", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Wrap Around", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Dynamic on LightMap", true, kScene);
    --AgentSetProperty(agent_name_scene, "Light Key Light", true, kScene);
    --AgentSetProperty(agent_name_scene, "Light Static", true, kScene);
    --AgentSetProperty(agent_name_scene, "Light Turned On", true, kScene);
    --Light Color - COLOR

    AgentSetProperty(agent_name_scene, "FX anti-aliasing", true, kScene);
    --AgentSetProperty(agent_name_scene, "FX Sharp Shadows Enabled", true, kScene);
    AgentSetProperty(agent_name_scene, "FX Ambient Occlusion Enabled", true, kScene);
    --AgentSetProperty(agent_name_scene, "FX Tonemap Intensity", 1, kScene);
    --AgentSetProperty(agent_name_scene, "FX Tonemap White Point", 8.0, kScene); --8.0
    --AgentSetProperty(agent_name_scene, "FX Tonemap Black Point", 0.005, kScene); --0.005
    AgentSetProperty(agent_name_scene, "FX Tonemap Filmic Toe Intensity", 1, kScene);
    AgentSetProperty(agent_name_scene, "FX Tonemap Filmic Shoulder Intensity", 0.75, kScene);
    --AgentSetProperty(agent_name_scene, "FX Tonemap Type", 2, kScene);
    --AgentSetProperty(agent_name_scene, "FX Tonemap Filmic Pivot", 0, kScene);
    --AgentSetProperty(agent_name_scene, "FX Tonemap Filmic Shoulder Intensity", 0.8, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Enabled", true, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Intensity", 5, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Radius", 0.75, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Max Radius Percent", 0.5, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Max Distance", 35.5, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Distance Falloff", 0, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Hemisphere Bias", -0.6, kScene); --
    AgentSetProperty(agent_name_scene, "FX Bloom Threshold", -0.9, kScene); --
    AgentSetProperty(agent_name_scene, "FX Bloom Intensity", 0.16, kScene); --
    AgentSetProperty(agent_name_scene, "FX Vignette Tint Enabled", true, kScene);
    --AgentSetProperty(agent_name_scene, "FX Vignette Tint", RGBColor(0, 0, 0, 255), kScene);
    AgentSetProperty(agent_name_scene, "FX Vignette Falloff", 1.0, kScene);
    AgentSetProperty(agent_name_scene, "FX Vignette Center", 0, kScene);
    AgentSetProperty(agent_name_scene, "FX Vignette Corners", 1.0, kScene);

    AgentSetProperty(agent_name_scene, "LightEnv Reflection Intensity Shadow", 1.0, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Reflection Intensity", 1.0, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Shadow Max Distance", 20.0, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Dynamic Shadow Max Distance", 25.0, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Shadow Position Offset Bias", 0.0, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Shadow Depth Bias", -1.0, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Shadow Auto Depth Bounds", false, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Shadow Light Bleed Reduction", 0.8, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Shadow Moment Bias", 0.0, kScene);

    AgentSetProperty(agent_name_scene, "Specular Multiplier Enabled", true, kScene);
    AgentSetProperty(agent_name_scene, "Specular Color Multiplier", 55, kScene);
    AgentSetProperty(agent_name_scene, "Specular Intensity Multiplier", 1, kScene);
    AgentSetProperty(agent_name_scene, "Specular Exponent Multiplier", 1, kScene);
end


Scene_RelightScene_Endercon = function(kScene, agent_name_scene)
    --LIGHTING FOR PROPS TEST
    --maze lighting
    --AgentSetProperty("light_ENV_Maze_amb", "Light Intensity", 0.75, kScene);
    --fill?
    --AgentSetProperty("light_ENV_Maze_amb", "Light Turned On", false, kScene);
    --AgentSetProperty("light_env_courtyardFillB", "Light Intensity", 1.5, kScene);
    --skydome
    --AgentSetProperty("light_env_skydome", "Light Intensity", 10.00, kScene);
    --water
    --AgentSetProperty("light_env_waterA", "Light Intensity", 1.50, kScene);
    --AgentSetProperty("light_env_waterMainRoom", "Light Intensity", 1.50, kScene);
    --AgentSetProperty("light_env_waterMaze", "Light Intensity", 1.50, kScene);
    --AgentSetProperty("light_env_glass_amb", "Light Intensity", 2.00, kScene);
    --AgentSetProperty("light_env_glass_amb", "Light Intensity", 2.00, kScene);
    --AgentSetProperty("light_env_grass_amb", "Light Intensity", 1.5, kScene);
    --AgentSetProperty("light_env_sand_amb", "Light Intensity", 100, kScene);
    -------------------TEST-------------------
    --skydome
    --AgentSetProperty("light_env_skydome01", "Light Intensity", 0.2, kScene);
    --AgentSetProperty("light_env_skydome02", "Light Intensity", 0.4, kScene);
    
    --Stars
    --AgentSetProperty("light_env_skydomeStarsAmb", "Light Intensity", 0.650, kScene);
    --AgentSetProperty("light_env_sun_amb", "Light Intensity", 5.00, kScene);
    --Moon
    --AgentSetProperty("light_env_moon_amb", "Light Intensity", 0.50, kScene);

    --modify the scene post processing
    AgentSetProperty(agent_name_scene, "LightEnv Intensity", 1.200, kScene); -- only on charater...
    AgentSetProperty(agent_name_scene, "LightEnv Reflection Intensity", 1.200, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Saturation", 1.200, kScene); --only on charater
    AgentSetProperty(agent_name_scene, "LightEnv Enabled", true, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Reflection Enabled", true, kScene);
    --LightEnv Background Color - COLOR
    --LightEnv Reflection Tint - COLOR
    --LightEnv Tint -COLOR

    --LightEnv Reflection Texture -unknown texture
    --LightEnv Probe Data -unknown
    --AgentSetProperty(agent_name_scene, "Light Render Layer", 1, kScene);
    --AgentSetProperty(agent_name_scene, "Light Shadow Cascades", 1, kScene);
    --AgentSetProperty(agent_name_scene, "Light Ambient Occlusion", 1, kScene);
    --AgentSetProperty(agent_name_scene, "Light Color Correction", 1, kScene);
    --AgentSetProperty(agent_name_scene, "Light Dimmer", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Intensity", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Intensity Diffuse", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Intensity Specular", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Max Distance", 2.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Min Distance", 0.010, kScene);
    --AgentSetProperty(agent_name_scene, "Light Rim Intensity", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Rim Occlusion", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Rim Wrap Around", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Shadow Bias", 1.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Shadow Distance Falloff", 1.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Shadow Max Distance", 100.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Spot Alpha", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Spot Inner Radius",20.200, kScene);
    --AgentSetProperty(agent_name_scene, "Light Spot Outer Radius", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Spot Texture Rotate", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Toon Opacity", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Toon Priority", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Light Wrap Around", 20.000, kScene);
    --AgentSetProperty(agent_name_scene, "Dynamic on LightMap", true, kScene);
    --AgentSetProperty(agent_name_scene, "Light Key Light", true, kScene);
    --AgentSetProperty(agent_name_scene, "Light Static", true, kScene);
    --AgentSetProperty(agent_name_scene, "Light Turned On", true, kScene);
    --Light Color - COLOR

    AgentSetProperty(agent_name_scene, "FX anti-aliasing", true, kScene);
    --AgentSetProperty(agent_name_scene, "FX Sharp Shadows Enabled", true, kScene);
    AgentSetProperty(agent_name_scene, "FX Ambient Occlusion Enabled", true, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Enabled", true, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Intensity", 3, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Radius", 0.55, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Max Radius Percent", 0.5, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Max Distance", 35.5, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Distance Falloff", 0, kScene);
    AgentSetProperty(agent_name_scene, "HBAO Hemisphere Bias", -0.1, kScene); --
    AgentSetProperty(agent_name_scene, "FX Bloom Threshold", -0.9, kScene); --
    AgentSetProperty(agent_name_scene, "FX Bloom Intensity", 0.18, kScene); --

    AgentSetProperty(agent_name_scene, "LightEnv Reflection Intensity Shadow", 1.0, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Reflection Intensity", 1.0, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Shadow Max Distance", 20.0, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Dynamic Shadow Max Distance", 25.0, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Shadow Position Offset Bias", 0.0, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Shadow Depth Bias", -1.0, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Shadow Auto Depth Bounds", false, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Shadow Light Bleed Reduction", 0.8, kScene);
    AgentSetProperty(agent_name_scene, "LightEnv Shadow Moment Bias", 0.0, kScene);

end