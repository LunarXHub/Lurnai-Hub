-- By Havoc
-- Please Credit if u use this exact one.

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local VIM = game:GetService("VirtualInputManager")
local Player = Players.LocalPlayer

local function preventAFK()
    VIM:SendMouseButtonEvent(0, 0, 2, true, nil, 0)
    task.wait(0.1)
    VIM:SendMouseButtonEvent(0, 0, 2, false, nil, 0)
end

Player.Idled:Connect(preventAFK)

local p=4;local n127r=18;local h89i=18;local H72n=18;local j12t=129;local Jh1="Random";local on2="Random";local _chars={};_chars[1]=string.char(76);_chars[2]=string.char(117);_chars[3]=string.char(114);_chars[4]=string.char(110);_chars[5]=string.char(97);_chars[6]=string.char(105);_chars[7]=string.char(32);_chars[8]=string.char(79);_chars[9]=string.char(110);_chars[10]=string.char(32);_chars[11]=string.char(84);_chars[12]=string.char(111);_chars[13]=string.char(112);local message="";for i=1,#_chars do message=message.._chars[i]end;local func_name="";func_name=func_name..string.char(112);func_name=func_name..string.char(114);func_name=func_name..string.char(105);func_name=func_name..string.char(110);func_name=func_name..string.char(116);_G[func_name](message)
