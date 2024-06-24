----------FREECAM TOOLS INSPIRED BY DAVID M

Arizzble_FreecamTools_InputHorizontalValue = 0;
Arizzble_FreecamTools_InputVerticalValue = 0;
Arizzble_FreecamTools_InputHeightValue = 0;
Arizzble_FreecamTools_PrevCamPos = Vector(0,0,0);
Arizzble_FreecamTools_PrevCamRot = Vector(0,0,0);
Arizzble_FreecamTools_PrevCursorPos = Vector(0,0,0);
Arizzble_FreecamTools_InputMouseAmountX = 0;
Arizzble_FreecamTools_InputMouseAmountY = 0;
Arizzble_FreecamTools_InputFieldOfViewAmount = 90;
Arizzble_FreecamTools_PrevTime = 0;
Arizzble_FreecamTools_CameraName = "Arizzblefreecam";
Arizzble_FreecamTools_FovIncrement = 0.1
--user configruable
Arizzble_FreecamTools_SnappyMovement = false;
Arizzble_FreecamTools_SnappyRotation = false;
Arizzble_FreecamTools_PositionLerpFactor = 5.0;
Arizzble_FreecamTools_RotationLerpFactor = 7.5;
Arizzble_FreecamTools_PositionIncrementDefault = 0.015;
Arizzble_FreecamTools_PositionIncrementShift = 0.15;

--Freecam_keycodes_W = 87
--Freecam_keycodes_S = 83
--Freecam_keycodes_A = 65
--Freecam_keycodes_D = 68
--Freecam_keycodes_Q = 81
--Freecam_keycodes_E = 69

--CREATE THE NEW CAMERA WHEN SCENE LOADED
Arizzble_FreecamTools_CreateFreeCamera = function()
    local cam_prop = "module_camera.prop"
    
    local newPosition = Vector(0,0,0) 
    local newRotation = Vector(0,0,0)  --0,180,0
    
    local cameraAgent = AgentCreate(Arizzble_FreecamTools_CameraName, cam_prop, newPosition, newRotation, Custom_CutsceneDev_SceneObject, false, false)
    
    AgentSetProperty(Arizzble_FreecamTools_CameraName, "Clip Plane - Far", 2500, Custom_CutsceneDev_SceneObject)
    AgentSetProperty(Arizzble_FreecamTools_CameraName, "Clip Plane - Near", 0.05, Custom_CutsceneDev_SceneObject)
    AgentSetProperty(Arizzble_FreecamTools_CameraName, "Lens - Current Lens", nil, Custom_CutsceneDev_SceneObject)

    --Custom_RemovingAgentsWithPrefix(sceneObj, "cam_")

    CameraPush(Arizzble_FreecamTools_CameraName);
end

-- Helper function to convert Euler angles to a direction vector
function EulerToDirectionVector(euler)
    local radX = math.rad(-euler.x)
    local radY = math.rad(-euler.y)
    local radZ = math.rad(-euler.z)

    local cosX = math.cos(radX)
    local sinX = math.sin(radX)
    local cosY = math.cos(radY)
    local sinY = math.sin(radY)
    local cosZ = math.cos(radZ)
    local sinZ = math.sin(radZ)

    local direction = {}
    direction.x = cosY * cosZ
    direction.y = sinX * sinY * cosZ - cosX * sinZ
    direction.z = cosX * sinY * cosZ + sinX * sinZ

    return direction
end


----WHAT IF I USED MAWRAK'S METHOD TO OBJECTS MOVING FUNCTION
Arizzble_FreecamTools_UpdateFreeCamera = function()
 ----------------MOVEMENT

  local positionIncrement = Arizzble_FreecamTools_PositionIncrementDefault;

   if Input_IsVKeyPressed(16) then
      --key shift
      positionIncrement = Arizzble_FreecamTools_PositionIncrementShift;
   end

if Input_IsVKeyPressed(65) then --a key

    local TempPos = AgentGetPos(Arizzble_FreecamTools_CameraName)
    local TempRot = AgentGetRot(Arizzble_FreecamTools_CameraName)
    local direction = EulerToDirectionVector(TempRot)
    TempPos.x = TempPos.x + direction.x * positionIncrement
    TempPos.y = TempPos.y
    TempPos.z = TempPos.z + direction.z * positionIncrement
    AgentSetPos(Arizzble_FreecamTools_CameraName, TempPos, Custom_CutsceneDev_SceneObject)
end

if Input_IsVKeyPressed(68) then --d key
    local TempPos = AgentGetPos(Arizzble_FreecamTools_CameraName)
    local TempRot = AgentGetRot(Arizzble_FreecamTools_CameraName)
    local direction = EulerToDirectionVector(TempRot)
    TempPos.x = TempPos.x - direction.x * positionIncrement
    TempPos.y = TempPos.y
    TempPos.z = TempPos.z - direction.z * positionIncrement
    AgentSetPos(Arizzble_FreecamTools_CameraName, TempPos, Custom_CutsceneDev_SceneObject)
end

if Input_IsVKeyPressed(87) then --w key
    local TempPos = AgentGetPos(Arizzble_FreecamTools_CameraName)
    local TempRot = AgentGetRot(Arizzble_FreecamTools_CameraName)
    local direction = EulerToDirectionVector(TempRot)
    TempPos.x = TempPos.x - direction.z * positionIncrement
    TempPos.y = TempPos.y
    TempPos.z = TempPos.z + direction.x * positionIncrement
    AgentSetPos(Arizzble_FreecamTools_CameraName, TempPos, Custom_CutsceneDev_SceneObject)
end

if Input_IsVKeyPressed(83) then --s key
    local TempPos = AgentGetPos(Arizzble_FreecamTools_CameraName)
    local TempRot = AgentGetRot(Arizzble_FreecamTools_CameraName)
    local direction = EulerToDirectionVector(TempRot)
    TempPos.x = TempPos.x + direction.z * positionIncrement
    TempPos.y = TempPos.y
    TempPos.z = TempPos.z - direction.x * positionIncrement
    AgentSetPos(Arizzble_FreecamTools_CameraName, TempPos, Custom_CutsceneDev_SceneObject)
end

  if Input_IsVKeyPressed(69) then --e key
   TempPos = AgentGetPos(Arizzble_FreecamTools_CameraName);
    TempPos.y = TempPos.y + positionIncrement;
    AgentSetPos(Arizzble_FreecamTools_CameraName, TempPos, Custom_CutsceneDev_SceneObject);
  end

  if Input_IsVKeyPressed(81) then --q key
   TempPos = AgentGetPos(Arizzble_FreecamTools_CameraName);
    TempPos.y = TempPos.y - positionIncrement;
    AgentSetPos(Arizzble_FreecamTools_CameraName, TempPos, Custom_CutsceneDev_SceneObject);
  end
 ---------------------ROTATION---- OLD

   --if Input_IsVKeyPressed(40) then --left arrow key
   --TempRot = AgentGetWorldRot(Arizzble_FreecamTools_CameraName);
    --TempRot.x = TempRot.x + positionIncrement;
    --AgentSetWorldRot(Arizzble_FreecamTools_CameraName, TempRot, Custom_CutsceneDev_SceneObject);
  --end

  --if Input_IsVKeyPressed(38) then --right arrow key
   --TempRot = AgentGetWorldRot(Arizzble_FreecamTools_CameraName);
    --TempRot.x = TempRot.x - positionIncrement;
    --AgentSetWorldRot(Arizzble_FreecamTools_CameraName, TempRot, Custom_CutsceneDev_SceneObject);
  --end

  --if Input_IsVKeyPressed(37) then --up arrow key
   --TempRot = AgentGetWorldRot(Arizzble_FreecamTools_CameraName);
    --TempRot.y = TempRot.y + positionIncrement;
    --AgentSetWorldRot(Arizzble_FreecamTools_CameraName, TempRot, Custom_CutsceneDev_SceneObject);
  --end

  --if Input_IsVKeyPressed(39) then --down arrow key
   --TempRot = AgentGetWorldRot(Arizzble_FreecamTools_CameraName);
    --TempRot.y = TempRot.y - positionIncrement;
    --AgentSetWorldRot(Arizzble_FreecamTools_CameraName, TempRot, Custom_CutsceneDev_SceneObject);
  --end
  --ROTATION POS RESET (CBA)
  --if Input_IsVKeyPressed(101) then --5 num key
    --RotReset = Vector(0,0,0)
    --AgentSetWorldRot(Arizzble_FreecamTools_CameraName, RotReset, Custom_CutsceneDev_SceneObject);
  --end
 -------------------FOV

 ---REMEMBER THE VALUES
 --Arizzble_FreecamTools_FovIncrement = 0.1
 --Arizzble_FreecamTools_InputFieldOfViewAmount = 90;
 
  local fovScale = Arizzble_FreecamTools_InputFieldOfViewAmount / 50.0;
  local fovIncrement = Arizzble_FreecamTools_FovIncrement
    
    if Input_IsVKeyPressed(1) then
        --left mouse (decrease)
        Arizzble_FreecamTools_InputFieldOfViewAmount = Arizzble_FreecamTools_InputFieldOfViewAmount - fovIncrement;

        if(Arizzble_FreecamTools_InputFieldOfViewAmount > 180) then
         Arizzble_FreecamTools_InputFieldOfViewAmount = 180
        end

    elseif Input_IsVKeyPressed(2) then
        --right mouse (increase)
        Arizzble_FreecamTools_InputFieldOfViewAmount = Arizzble_FreecamTools_InputFieldOfViewAmount + fovIncrement;

        if(Arizzble_FreecamTools_InputFieldOfViewAmount < 0) then
         Arizzble_FreecamTools_InputFieldOfViewAmount  = 0
        end
    end


    if (Custom_CutsceneDev_FreecamUseFOVScale == true) then
        local fovScale = Arizzble_FreecamTools_InputFieldOfViewAmount / 50.0;

        AgentSetProperty(Arizzble_FreecamTools_CameraName, "Field of View Scale", fovScale, Custom_CutsceneDev_SceneObject);
    else
        AgentSetProperty(Arizzble_FreecamTools_CameraName, "Field of View", Arizzble_FreecamTools_InputFieldOfViewAmount, Custom_CutsceneDev_SceneObject);
    end

    ------------------------------MOUSELOOK FOR ROTATION
    local currCursorPos = CursorGetPos()
    
    local minThreshold = 0.01
    local maxThreshold = 0.99
    
    --reset the cursor pos to the center of the screen when they get near the edges of the screen
    if (currCursorPos.x > maxThreshold) or (currCursorPos.x < minThreshold) or (currCursorPos.y > maxThreshold) or (currCursorPos.y < minThreshold) then
        CursorSetPos(Vector(0.5, 0.5, 0));
    end
    
    local xCursorDifference = currCursorPos.x - Arizzble_FreecamTools_PrevCursorPos.x
    local yCursorDifference = currCursorPos.y - Arizzble_FreecamTools_PrevCursorPos.y
    
    local sensitivity = 180.0
    Arizzble_FreecamTools_InputMouseAmountX = Arizzble_FreecamTools_InputMouseAmountX - (xCursorDifference * sensitivity)
    Arizzble_FreecamTools_InputMouseAmountY = Arizzble_FreecamTools_InputMouseAmountY + (yCursorDifference * sensitivity)

    local newRotation = Vector(Arizzble_FreecamTools_InputMouseAmountY - 90, Arizzble_FreecamTools_InputMouseAmountX, 0);
    
    if newRotation.x > 90 then
        newRotation.x = 90;
    elseif newRotation.x < -90 then
        newRotation.x = -90;
    end

    Arizzble_FreecamTools_PrevCamRot = newRotation
    AgentSetWorldRot(Arizzble_FreecamTools_CameraName, Arizzble_FreecamTools_PrevCamRot, Custom_CutsceneDev_SceneObject);
    Arizzble_FreecamTools_PrevCursorPos = CursorGetPos();
end






--OLD FUNCTION(THIS IS DAVID M'S FREECAM TOOLS)

----CANT USE THIS FUNCTION BECAUSE OF CUSTOM_VECTORLERP
Arizzble_FreecamTools_UpdateFreeCamera_Old = function()
    local currFrameTime = GetFrameTime();
    local deltaTime = math.abs(Arizzble_FreecamTools_PrevTime - currFrameTime);

    ------------------------------MOVEMENT------------------------------
    local positionIncrement = Arizzble_FreecamTools_PositionIncrementDefault;
    
    if Input_IsVKeyPressed(16) then
        --key shift
        positionIncrement = Arizzble_FreecamTools_PositionIncrementShift;
    end
    
    if Input_IsVKeyPressed(81) then
        --key q (decrease)
        Arizzble_FreecamTools_InputHeightValue = -positionIncrement;
    elseif Input_IsVKeyPressed(69) then
        --key e (increase)
        Arizzble_FreecamTools_InputHeightValue = positionIncrement;
    else
        Arizzble_FreecamTools_InputHeightValue = 0;
    end
    
    if Input_IsVKeyPressed(87) then
        --key w (increase)
        Arizzble_FreecamTools_InputVerticalValue = positionIncrement;
    elseif Input_IsVKeyPressed(83) then
        --key s (decrease)
        Arizzble_FreecamTools_InputVerticalValue = -positionIncrement;
    else
        Arizzble_FreecamTools_InputVerticalValue = 0;
    end
    
    if Input_IsVKeyPressed(65) then
        --key a (decrease)
        Arizzble_FreecamTools_InputHorizontalValue = positionIncrement;
    elseif Input_IsVKeyPressed(68) then
        --key d (increase)
        Arizzble_FreecamTools_InputHorizontalValue = -positionIncrement;
    else
        Arizzble_FreecamTools_InputHorizontalValue = 0;
    end
    
    ------------------------------MOUSELOOK------------------------------
    local currCursorPos = CursorGetPos()
    
    local minThreshold = 0.01
    local maxThreshold = 0.99
    
    --reset the cursor pos to the center of the screen when they get near the edges of the screen
    if (currCursorPos.x > maxThreshold) or (currCursorPos.x < minThreshold) or (currCursorPos.y > maxThreshold) or (currCursorPos.y < minThreshold) then
        CursorSetPos(Vector(0.5, 0.5, 0));
    end
    
    local xCursorDifference = currCursorPos.x - Arizzble_FreecamTools_PrevCursorPos.x
    local yCursorDifference = currCursorPos.y - Arizzble_FreecamTools_PrevCursorPos.y
    
    local sensitivity = 180.0
    Arizzble_FreecamTools_InputMouseAmountX = Arizzble_FreecamTools_InputMouseAmountX - (xCursorDifference * sensitivity)
    Arizzble_FreecamTools_InputMouseAmountY = Arizzble_FreecamTools_InputMouseAmountY + (yCursorDifference * sensitivity)

    local newRotation = Vector(Arizzble_FreecamTools_InputMouseAmountY - 90, Arizzble_FreecamTools_InputMouseAmountX, 0);
    
    if newRotation.x > 90 then
        newRotation.x = 90;
    elseif newRotation.x < -90 then
        newRotation.x = -90;
    end
    
    ------------------------------BUILD FINAL MOVEMENT/ROTATION------------------------------
    local newPosition = Vector(Arizzble_FreecamTools_InputHorizontalValue, Arizzble_FreecamTools_InputHeightValue, Arizzble_FreecamTools_InputVerticalValue);

    --if (Arizzble_FreecamTools_SnappyMovement == true) then
        --Arizzble_FreecamTools_PrevCamPos = newPosition;
     --else
        --Arizzble_FreecamTools_PrevCamPos = Custom_VectorLerp(Arizzble_FreecamTools_PrevCamPos, newPosition, currFrameTime * Arizzble_FreecamTools_PositionLerpFactor);
    --end
    
    --if (Arizzble_FreecamTools_SnappyRotation == true) then
        --Arizzble_FreecamTools_PrevCamRot = newRotation;
     --else
        --Arizzble_FreecamTools_PrevCamRot = Custom_VectorLerp(Arizzble_FreecamTools_PrevCamRot, newRotation, currFrameTime * Arizzble_FreecamTools_RotationLerpFactor);
    --end
    Arizzble_FreecamTools_PrevCamRot = newRotation;
    Arizzble_FreecamTools_PrevCamPos = newPosition;
    ------------------------------ASSIGNMENT------------------------------
    local myCameraAgent = AgentFindInScene(Arizzble_FreecamTools_CameraName, Custom_CutsceneDev_SceneObject); --Agent type
    local result = AgentLocalToWorld(myCameraAgent, Arizzble_FreecamTools_PrevCamPos);
    
    AgentSetPos(Arizzble_FreecamTools_CameraName, result, Custom_CutsceneDev_SceneObject)
    AgentSetWorldRot(Arizzble_FreecamTools_CameraName, Arizzble_FreecamTools_PrevCamRot, Custom_CutsceneDev_SceneObject)

    Arizzble_FreecamTools_PrevCursorPos = CursorGetPos();
    Arizzble_FreecamTools_PrevTime = GetFrameTime();
end