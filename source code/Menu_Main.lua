require("AutoFocuser.lua")
require("CameraCutDetector.lua")
require("CameraLens.lua")
require("MenuAudioBank.lua")
require("BlockBuilding.lua")
require("Brightness.lua")
require("SessionProperties.lua")
require("AspectRatio.lua")
require("UICamera.lua")
require("PlayerChoice.lua")
if ResourceSetEnabled("CrowdPlay") then
  require("CrowdPlay.lua")
end
require("Menu_DLC.lua")
require("Menu_ListMenu.lua")
require("UI_ListButton.lua")
require("UI_Legend.lua")
require("UI_Popup.lua")
require("UI_Splash.lua")
require("UI_Header.lua")
require("UI_Feed.lua")
require("Menu_EpisodeSelect.lua")
require("Menu_Options.lua")
require("Menu_Saves.lua")
require("Menu_Stats.lua")
require("Menu_Store.lua")
require("Menu_Upsell.lua")
require("Menu_AccountLink.lua")
require("Menu_CharacterSelect.lua")

--david cutscnee
require("Menu_TEST_LoadScene.lua")




if ResourceSetEnabled("CrowdPlay") then
  require("Menu_CrowdPlayMessaging.lua")
end
require("UI_AccountLinkWidget.lua")
require("SaveLoad.lua")
require("RichPresence.lua")
require("ClickText.lua")
require("MenuUtils.lua")
require("MenuCloudSync.lua")
if IsToolBuild() then
  require("ProjectMenu.lua")
end
local mbCrowdPlayResourcesAvailable = ResourceSetEnabled("CrowdPlay")
local CreateAssets = function()
  local fileName = "project_menu.prop"
  if CreateResource(fileName, kDirProperties) then
    PropertyCreate(fileName, "Menu - Trade Show Demo", kBool)
    PropertyCreate(fileName, "Menu - Account Link Splash Shown", kBool)
    PropertyCreate(fileName, "Menu - Enable Cloud Saves", kBool)
    PropertyCreate(fileName, "Menu - Max Save Slots", kInt, 4)
    PropertyCreate(fileName, "Menu - Cloud Save Slot", kString, "saveslot1.bundle")
    PropertyCreate(fileName, "Menu - Cloud Save Locked", kBool)
    PropertyCreate(fileName, "Menu - User Name", kString)
    PropertyCreate(fileName, "Menu - Disc Bonus Episodes Popup Shown", kBool)
    PropertyCreate(fileName, "Debug Menu - Fake Not Connected to License Server", kBool)
    PropertyCreate(fileName, "Debug Menu - Fake Age Restricted", kBool)
    PropertyCreate(fileName, "Debug Menu - Fake User Not Signed In", kBool)
    PropertyCreate(fileName, "Debug Menu - Fake Disc Build", kBool)
    PropertyCreate(fileName, "Debug Menu - Fake Update Required", kBool)
    if mbCrowdPlayResourcesAvailable then
      PropertyCreate(fileName, "Beta Menu - Beta Test Crowd Play", kBool)
      PropertyCreate(fileName, "Menu - Crowd Play Tutorial Shown", kBool)
      PropertyCreate(fileName, "Menu - Crowd Play Decision Authority Tutorial Shown", kBool)
      PropertyCreate(fileName, "Menu - Crowd Play Room Code Shown", kBool)
    end
    Save(fileName)
    PropertyAddGlobal(GetPreferences(), fileName)
  end
end
if IsToolBuild() then
  CreateAssets()
end
if ResourceExists("DebugLoader.lua") then
  require("DebugLoader.lua")
  local OnLoadDebugMenu = function()
    DebugMenu_AddButton(2, 1, "Main Menu", "Menu_Main")
  end
  Callback_OnLoadDebugMenu:Add(OnLoadDebugMenu)
end
local mbDemo = true
local mbCloudSyncing = false
local mPlayerChoiceAtMenuStart
local kNumEpisodes = PropertyGet("ui_episode_info.prop", "Episode Count")
local kKeyArtScene = "adv_keyArt101.scene"
local kDioramaScene = "ui_diorama.scene"
local kBGMusicScene = "ui_bgMusic_menuMain.scene"
if IsPlatformAndroid() then
  InputMapperActivate("MainMenuBackButton.imap")
end
function Main_AccountLink()
  local connected = MenuUtils_PlatformIsConnectedToLicenseServer()
  local signedIn = MenuUtils_PlatformIsUserSignedIn()
  if MenuUtils_PlatformIsSystemUpdateRequired() or MenuUtils_PlatformIsTitleUpdateRequired() then
    return
  end
  local splashArgs, splashLegendOverride
  if IsPlatformXboxOne() then
    splashLegendOverride = {
      {
        button = "faceButtonDown",
        text = "legend_select"
      },
      {
        button = "faceButtonUp",
        text = Menu_AccountLink_LegendStringForProfileUser(Menu_Text("legend_changeProfile")),
        command = "PlatformOpenAccountPickerUI()"
      }
    }
  end
  local prefs = GetPreferences()
  if MenuUtils_PlatformIsAgeRestricted() then
    splashArgs = {
      message = "AccountLink_AgeRestricted_message",
      buttons = {
        {text = "label_OK", command = "Menu_Pop()"}
      }
    }
    Menu_SplashPopup(splashArgs)
  elseif not connected or not signedIn then
    if MenuUtils_PlatformIsAgeRestricted() then
      splashArgs = {
        message = "AccountLink_AgeRestricted_message",
        buttons = {
          {text = "label_OK", command = "Menu_Pop()"}
        }
      }
      Menu_SplashPopup(splashArgs)
    else
      UI_Notify("ConnectedHeader", "ConnectedMessage")
    end
  elseif PropertyGet("user.prop", "TT User") then
    splashArgs = {
      message = "popupSplash_alreadySignedIn",
      buttons = {
        {text = "label_OK", command = "Menu_Pop()"}
      }
    }
    Menu_SplashPopup(splashArgs)
  elseif MenuUtils_PlatformIsAgeRestricted() then
    splashArgs = {
      message = "AccountLink_AgeRestricted_message",
      buttons = {
        {text = "label_OK", command = "Menu_Pop()"}
      }
    }
    Menu_SplashPopup(splashArgs)
  else
    splashArgs = {
      message = "popupSplash_linking_body",
      buttons = {
        {
          text = "label_signIn",
          command = "Menu_AccountLinkSignIn()",
          eventLog = "TTG Account: Sign In"
        },
        {
          text = "label_join",
          command = "Menu_AccountLinkJoin()",
          eventLog = "TTG Account: Join"
        },
        {
          text = "label_noThankYou",
          command = "Menu_Pop()",
          eventLog = "TTG Account: No Thank You"
        }
      },
      legendOverride = splashLegendOverride
    }
    Menu_SplashPopup(splashArgs)
    Menu_Wait()
  end
end
local bgMain = {
  isMenuMain = true,
  fromCharacterSelect = false,
  skipShow = false
}
function bgMain:transitionTo(otherBG)
  if not otherBG then
    if not self.skipShow then
      ChorePlay("ui_menuMain_show.chore")
    end
  elseif otherBG.isCharacterSelect then
    if otherBG.cancelled then
      ChorePlay("ui_keyArt_show.chore")
    else
      self.fromCharacterSelect = true
    end
    SceneHide(kKeyArtScene, false)
    SceneHide("ui_menuMain.scene", false)
  elseif otherBG.isEpisodeSelect then
    ChorePlay("ui_keyArt_show.chore")
    SceneHide(kKeyArtScene, false)
    SceneHide("ui_menuMain.scene", false)
  end
  if IsPlatformPS4() or IsPlatformVita() then
    PlatformSonyShowStoreIcon("hide")
  end
end
function bgMain:transitionFrom(otherBG)
  if not otherBG then
    ChorePlayAndWait("ui_menuMain_hide.chore")
  elseif otherBG.isCharacterSelect then
    if not self.skipShow then
      ChorePlayAndWait("ui_keyArt_hide.chore")
    end
    SceneHide(kKeyArtScene, true)
    SceneHide("ui_menuMain.scene", true)
  elseif otherBG.isEpisodeSelect then
    if not self.fromCharacterSelect and not self.skipShow then
      ChorePlayAndWait("ui_keyArt_hide.chore")
    else
      self.fromCharacterSelect = false
    end
    SceneHide(kKeyArtScene, true)
    SceneHide("ui_menuMain.scene", true)
  end
  self.skipShow = false
end
function StartKeyArt()
  local scene = kKeyArtScene
  if SceneIsActive(scene) then
    SceneHide(scene, false)
  else
    MenuUtils_AddScene(scene)
    SceneHide(scene, false)
  end
  scene = kDioramaScene
  if SceneIsActive(scene) then
    SceneHide(scene, true)
  else
    MenuUtils_AddScene(scene)
    SceneHide(scene, true)
  end
  local controller = ChorePlay("ui_keyArt_aspectRatio.chore")
  ControllerPause(controller)
  local theTime = (RenderGetAspectRatio() - 1.3333334) / 0.44444442
  ControllerSetTime(controller, theTime)
  ChorePlay("ui_keyArt101.chore")
end
function StopKeyArt()
  local scene = kKeyArtScene
  if SceneIsActive(scene) then
    SceneHide(scene, true)
  end
end
function StartBGMusic()
  local scene = kBGMusicScene
  if not SceneIsActive(scene) then
    MenuUtils_AddScene(scene)
  end
  SceneHide(scene, false)
end
function StopBGMusic()
  local scene = kBGMusicScene
  SceneHide(scene, true)
end
local GetExitText = function()
  if not PropertyGet("user.prop", "Licensed") then
    return "label_exitdemo"
  else
    return "label_exitgame"
  end
end
function Menu_Main_Store()
  local doUpsell = not PropertyGet("user.prop", "Licensed")
  if doUpsell then
    Menu_Upsell(true)
  else
    Menu_Store()
  end
end
function Menu_Main_Stats()
  local statsFunction = "Menu_Stats()"
  if (not ResourceExists("choice.prop") or not MenuUtils_PlatformIsConnectedToInternet()) and not ChoiceStats_IsDebugActive() then
    statsFunction = "Menu_SplashPopup({['message']='popupSplash_statsOffline_body',['buttons']={{['text']='label_ok',['command']='Menu_Pop()'}}})"
  end
  DoString(statsFunction)
end
local mbDoCloudSync = true
function Menu_Main_ContinueWithCloudSync()
  PropertySet(GetPreferences(), "Menu - Cloud Save Locked", false)
end
function Menu_Main_CancelCloudSync()
  PropertySet(GetPreferences(), "Menu - Cloud Save Locked", false)
  mbDoCloudSync = false
  PropertySet(GetPreferences(), "Menu - Enable Cloud Saves", false)
end
function Menu_Main_ReloadAfterCloudSync(bSuccess)
  if not bSuccess then
    return
  end
  local menuAgent = AgentFind("ui_menuMain")
  local menuWidget = menuAgent.widget
  if Menu_GetCurrentMenu() == menuWidget then
    menuWidget:Populate()
  end
  mbCloudSyncing = false
end
function Menu_Main_DisableCloudSync()
  PropertySet(GetPreferences(), "Menu - Enable Cloud Saves", false)
  mbCloudSyncing = false
end
ScenePreload(kKeyArtScene, 1, 1, true)
ScenePreload(kDioramaScene, 1, 1, true)
ScenePreload(kBGMusicScene, 1, 1, true)
function Menu_Main(bSkipCloudSave)
  StartKeyArt()
  local slot = SaveLoad_GetSlot()
  ChoiceStats_Init()
  EventLog_Stop(slot)
  SaveLoad_SetSlot(slot)
  SceneHide("ui_menuMain", false)
  local menu = Menu_Create(ListMenu, "ui_menuMain", "ui_menuMain.scene")
  menu.align = "left"
  menu.background = bgMain
  mbDemo = not PropertyGet("user.prop", "Licensed")
  function menu:Show()
    Menu.Show(self)
    RichPresence_Set("richPresence_mainMenu", false)
  end
  function menu:Populate()
    if not IsPlatformSmallScreen() then
      Menu_Add(Widget, "title")
    else
      AgentHide("ui_menuMain_title", true)
    end
    local playBtn
    if mbDemo then
      playBtn = Menu_Add(ListButton, "play", "label_playdemo", "Menu_Main_Play()")
    elseif SaveLoad_GetSlotDisplayName(SaveLoad_GetSlot()) and SaveLoad_GetSlotDisplayName(SaveLoad_GetSlot()) ~= "" then
      playBtn = Menu_Add(ListButton, "play", "label_playSavefile", "Menu_Main_Play()")
      AgentSetProperty(Clone_Find(playBtn.agent, "label"), "Text Leading", 0.65)
      local thePlaySaveText = Menu_Text("label_playSavefile")
      local saveName = SaveLoad_GetSlotDisplayName(SaveLoad_GetSlot())
      saveName = EscapeText2(saveName)
      thePlaySaveText = thePlaySaveText .. " " .. saveName
      AgentSetProperty(Clone_Find(playBtn.agent, "label"), "Text String", thePlaySaveText)
    else
      playBtn = Menu_Add(ListButton, "play", "label_play", "Menu_Main_Play()")
      AgentSetProperty(Clone_Find(playBtn.agent, "label"), "Text String", Menu_Text("label_play"))
    end
    local bIsNew = false
    for i = 1, kNumEpisodes do
      if Menu_DLC_Check(i, "installed") and table.getn(SaveLoad_GetSaves(nil, i)) <= 0 then
        bIsNew = true
        break
      end
    end
    playBtn:SetIsNew(bIsNew)
    local store
    if not IsRunningSteam() or IsToolBuild() then
      store = Menu_Add(ListButton, "episodes", "label_store", "Menu_Main_Store()")
    end
    if MenuUtils_PlatformIsUserSignedIn() and PropertyGet("user.prop", "Licensed") and not IsPlatformWiiU() and (IsToolBuild() or not IsPlatformTTG()) then
      local button = Menu_Add(ListButton, "accountlink", "label_accountLinking", "Main_AccountLink()")
      if not PropertyGet("user.prop", "TT User") and MenuUtils_PlatformIsConnectedToInternet() then
        button:SetIsNew(true)
      else
        button:SetIsNew(false)
      end
    end
    if store then
      bIsNew = false
      if mbDemo then
        bIsNew = true
      else
        for i = 1, kNumEpisodes do
          if Menu_DLC_Check(i, "available") and not Menu_DLC_Check(i, "installed") then
            bIsNew = true
            break
          end
        end
      end
      store:SetIsNew(bIsNew)
    end
    if not mbDemo and PlatformIsUserSpaceAvailable() then
      Menu_Add(ListButton, "savesFiles", "label_saveFiles", "Menu_Saves()")
    end
    if (IsPlatformXbox360() or IsPlatformXboxOne()) and MenuUtils_PlatformIsUserSignedIn() then
      Menu_Add(ListButton, "achievements", "label_achievements", "PlatformOpenAchievementUI()")
    end
    if not mbDemo then
      local statsButton = Menu_Add(ListButton, "stats", "label_stats", "Menu_Main_Stats()")
      statsButton:SetIsLocked(ChoiceStats_IsEmpty())
    end
    Menu_Add(ListButton, "settings", "label_settings", "Menu_Options()")
    ---------------------------------modddd
    Menu_Add(ListButton, "firstcutscenelevel", "Launch Freecam Mode", "PlayCutscene()")
    if IsPlatformXboxOne() then
      Menu_Add(ListButton, "help", "label_help", "PlatformOpenHelpUI()")
    end
    if (IsPlatformXbox360() or IsPlatformPC() or IsPlatformMac()) and not IsPlatformXboxOne() and not IsPlatformPS4() then
      Menu_Add(ListButton, "exit", GetExitText(), "Menu_Main_Exit()")
    end
    local feed = Menu_Add(Feed, "feed")
    feed.alignmentH = "right"
    feed.alignmentV = "bottom"
    Legend_Add("faceButtonDown", "legend_select")
    if IsPlatformXboxOne() then
      Legend_Add("faceButtonUp", Menu_AccountLink_LegendStringForProfileUser(Menu_Text("legend_changeProfile")), "PlatformOpenAccountPickerUI()")
    end
    if PropertyGet("user.prop", "Licensed") then
      Menu_Add(AccountLinkWidget, "InfoAccountLink")
    end
  end
  Menu_Show(menu)
  if bSkipCloudSave then
    return
  end
  local prefs = GetPreferences()
  if IsToolBuild() and not IsPlatformIOS() and not IsPlatformAndroid() and not IsPlatformPC() and not IsPlatformMac() then
    PropertySet(prefs, "Menu - Enable Cloud Saves", false)
  end
  if PropertyGet(prefs, "Menu - Enable Cloud Saves") and PropertyGet(prefs, "Menu - Cloud Save Locked") then
    UI_Confirm("popup_cloudSyncLockOut_header", "popup_cloudSyncLockOut_message", "Menu_Main_ContinueWithCloudSync()", "Menu_Main_CancelCloudSync()", "label_continue", "label_disableCloudSave")
    while PropertyGet(prefs, "Menu - Cloud Save Locked") do
      Yield()
    end
  end
  if PropertyGet(prefs, "Menu - Enable Cloud Saves") and mbDoCloudSync then
    mbCloudSyncing = SaveLoad_SyncToCloudSave(false, "Menu_Main_ReloadAfterCloudSync")
  end
end
function Menu_Main_Start()
  mPlayerChoiceAtMenuStart = PlayerChoice_Get()
  StartBGMusic()
  if Input_UseTouch() then
    ClickText_Enable(true)
  end
  local prefs = GetPreferences()
  local dimensions
  if not IsPlatformPC() and not IsPlatformMac() then
    dimensions = RenderGetDeviceResolution()
  else
    dimensions = prefs.Windowed and prefs["Window Size"] or prefs["Fullscreen Size"]
  end
  RenderSetAspectRatio(dimensions.x / dimensions.y)
  RenderDelay(1)
  Yield()
  local menu = SessionProperties_Get("Menu")
  SessionProperties_Set("Menu", "")
  if menu == "play" then
    Menu_Main()
    while mbCloudSyncing do
      Yield()
    end
    Menu_Main_Play()
  elseif menu == "playSkipCloud" then
    bgMain.skipShow = true
    Menu_Main(true)
    Menu_Main_Play()
  elseif PropertyGet("user.prop", "Licensed") and (IsToolBuild() or not IsPlatformTTG()) then
    local prefs = GetPreferences()
    local connected = MenuUtils_PlatformIsConnectedToInternet()
    local signedIn = MenuUtils_PlatformIsUserSignedIn()
    local updateRequired = MenuUtils_PlatformIsSystemUpdateRequired() or MenuUtils_PlatformIsTitleUpdateRequired()
    if not prefs["Menu - Account Link Splash Shown"] and connected and signedIn and not updateRequired and not MenuUtils_PlatformIsAgeRestricted() then
      prefs["Menu - Account Link Splash Shown"] = true
      SavePrefs()
      if not PropertyGet("user.prop", "TT User") then
        local splashLegendOverride
        if IsPlatformXboxOne() then
          splashLegendOverride = {
            {
              button = "faceButtonDown",
              text = "legend_select"
            },
            {
              button = "faceButtonUp",
              text = Menu_AccountLink_LegendStringForProfileUser(Menu_Text("legend_changeProfile")),
              command = "PlatformOpenAccountPickerUI()"
            }
          }
        end
        local splashArgs = {
          message = "popupSplash_linking_body",
          buttons = {
            {
              text = "label_signIn",
              command = "Menu_AccountLinkSignIn(true)",
              eventLog = "First Splash: Sign In"
            },
            {
              text = "label_join",
              command = "Menu_AccountLinkJoin(true)",
              eventLog = "First Splash: Join"
            },
            {
              text = "label_noThankYou",
              command = "Menu_Hide();Menu_Main()",
              eventLog = "First Splash: No Thank You"
            }
          },
          legendOverride = splashLegendOverride
        }
        Menu_SplashPopup(splashArgs)
      elseif IsPlatformIOS() or IsPlatformAndroid() or IsPlatformPC() or IsPlatformMac() then
        Menu_AccountLinkCloudSyncAgreement()
      else
        Menu_Main()
      end
    else
      local bPartialInstall = false
      for i = 2, kNumEpisodes do
        local prefs = GetPreferences().DLC["Episode" .. i]
        local isSimulatedPartialDownload = IsToolBuild() and PropertyGet(prefs, "Partially Downloaded") > 0
        if isSimulatedPartialDownload or Menu_Store_CanUninstall() and 0 < (DownloadManager_LocalSize("Episode" .. i) or 0) and not Menu_DLC_Check(i, "installed") then
          bPartialInstall = true
          break
        end
      end
      if bPartialInstall then
        Menu_Main()
        while mbCloudSyncing do
          Yield()
        end
        UI_Notify("store_popup_partialdownloadHeader", "store_popup_partialdownloadWarningMessage", "Menu_Store()")
      else
        Menu_Main()
      end
    end
  else
    Menu_Main()
  end
end
MenuAudioBank_AddActor("ui_menuMain.scene")
SceneOpen("ui_menuMain.scene", "Menu_Main_Start")
function Menu_StartEpisode(episode)
  if mbCrowdPlayResourcesAvailable and CrowdPlay_IsSupported() and Menu_CrowdPlayMessaging_PreBeginPlay(Menu_StartEpisode, episode) == true then
    return
  end
  InputMapperDeactivateAll()
  if type(episode) == "string" then
    episode = tonumber(string.sub(episode, -2))
  end
  local slot = SaveLoad_GetSlot()
  EventLog_Start(slot)
  EventLog_SetNonPurgable(slot, true)
  local episodeFullName = "Minecraft10" .. episode
  CreateEventLogEvent("Begin Episode", episodeFullName, true)
  SubProject_StartEpisode(episodeFullName)
end
function BackButtonMainMenuAndroid(event)
  print("BackButtonMainMenuAndroid")
  InputMapperDeactivate("MainMenuBackButton.imap")
  local activeMenu = AgentGetName(Menu_GetCurrentMenu().agent)
  if activeMenu == "ui_menu_main" then
    Menu_Main_Exit()
  elseif activeMenu == "ui_popupSplash_reference" then
    InputMapperActivate("MainMenuBackButton.imap")
    return
  elseif activeMenu == "ui_accountLinking_parent" then
    InputMapperActivate("MainMenuBackButton.imap")
    return
  elseif "" ~= activeMenu and not mbActivating and not mbDeactivating then
    Menu_Pop()
  end
  InputMapperActivate("MainMenuBackButton.imap")
end
function Menu_Main_Play()
  local characterSelected = PlayerChoice_Get()
  if mPlayerChoiceAtMenuStart ~= characterSelected and characterSelected ~= nil then
    SessionProperties_Set("Menu", "playSkipCloud")
    SubProject_Switch("Menu", FileSetExtension("Menu_Main", "lua"))
  end
  local showCharacterSelect = not characterSelected or mbDemo or IsToolBuild() and characterSelected == 0
  if showCharacterSelect then
    Menu_CharacterSelect()
  else
    Menu_EpisodeSelect()
  end
end
function Menu_Main_Exit()
  local doUpsell = not PropertyGet("user.prop", "Licensed")
  if doUpsell then
    Menu_Upsell()
  else
    UI_Confirm("popup_quit_header", "popup_quit_message", "EngineQuit()")
  end
end