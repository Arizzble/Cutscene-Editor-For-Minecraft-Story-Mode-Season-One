--[[
-------------------------------------------------------------------------
This script is specific to this mod and how I set it up.
All it is, is basically a script that when the main cutscene level reaches the end of the sequence
it exectues this script which will close the level and return to the main menu.
]]--

do 


    --switch the archive from the FCMData_Library back to the Main Menu.
    SubProject_Switch("Menu");
end