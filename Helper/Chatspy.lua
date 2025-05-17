--[[ .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |   _          | || |  _    _      | || |  _______     | || | ____  _____  | || |      _       | || |     _____    | |
| |  | |         | || | | |  | |     | || | |_   __ \    | || ||_   \|_   _| | || |     / \      | || |    |_   _|   | |
| |  | |         | || | | |  | |     | || |   | |__) |   | || |  |   \ | |   | || |    / _ \     | || |      | |     | |
| |  | |         | || | | |  | |     | || |   |  __ /    | || |  | |\ \| |   | || |   / ___ \    | || |      | |     | |
| |  | |____     | || | | `--' |     | || |  _| |  \ \_  | || | _| |_\   |_  | || | _/ /   \ \_  | || |     _| |_    | |
| |  |______|    | || |  \____/      | || | |____| |___| | || ||_____|\____| | || ||____| |____| | || |    |_____|   | |
| |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 

© 2025 LURNAI. All Rights Reserved.
LURNAI is the legal owner of this script and is protected by copyright law.
You may use this script **only for personal, non-commercial purposes.**
Modification, redistribution, or claiming authorship of this script is **strictly prohibited** without explicit permission from the creator (LURNAI).
]]--

repeat wait() until game:GetService("ContentProvider").RequestQueueSize == 0;
repeat wait() until game:IsLoaded();

local Players = game:GetService("Players");
local StarterGui = game:GetService("StarterGui");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local LocalPlayer = Players.LocalPlayer;
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui");
local DefaultChatSystemChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents");
local SayMessageRequest = DefaultChatSystemChatEvents:WaitForChild("SayMessageRequest");
local OnMessageDoneFiltering = DefaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering");
getgenv().Lurnai = {
    Enabled = true,
    SpyOnSelf = true,
    Public = false,
    Chat = {
        Colour  = Color3.fromRGB(255, 0, 0),
        Font = Enum.Font.SourceSans,
        TextSize = 18,
        Text = "",
    },
    IgnoreList = {
        {Message = ":part/1/1/1", ExactMatch = true},
        {Message = ":part/10/10/10", ExactMatch = true},
        {Message = "A?????????", ExactMatch = false},
        {Message = ":colorshifttop 10000 0 0", ExactMatch = true},
        {Message = ":colorshiftbottom 10000 0 0", ExactMatch = true},
        {Message = ":colorshifttop 0 10000 0", ExactMatch = true},
        {Message = ":colorshiftbottom 0 10000 0", ExactMatch = true},
        {Message = ":colorshifttop 0 0 10000", ExactMatch = true},
        {Message = ":colorshiftbottom 0 0 10000", ExactMatch = true},
    },
};

function Lurnai.checkIgnored(message)
    for i = 1, #Lurnai.IgnoreList do
        local v = Lurnai.IgnoreList[i];
        if (v.ExactMatch and message == v.Message) or (not v.ExactMatch and string.match(v.Message, message)) then 
            return true;
        end;
    end;
    return false;
end;

function Lurnai.onChatted(targetPlayer, message)
    if (targetPlayer == LocalPlayer and string.lower(message):sub(1, 4) == "/spy") then
        Lurnai.Enabled = not Lurnai.Enabled; wait(0.3);
        Lurnai.Chat.Text = "[Lurnai] - "..(Lurnai.Enabled and "Enabled." or "Disabled.");

        StarterGui:SetCore("ChatMakeSystemMessage", Lurnai.Chat);
    elseif (Lurnai.Enabled and (Lurnai.SpyOnSelf or targetPlayer ~= LocalPlayer)) then
        local message = message:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ');

        local Hidden = true;
        local Connection = OnMessageDoneFiltering.OnClientEvent:Connect(function(packet, channel)
            if (packet.SpeakerUserId == targetPlayer.UserId and packet.Message == message:sub(#message - #packet.Message + 1) and (channel == "All" or (channel == "Team" and not Lurnai.Public and Players[packet.FromSpeaker].Team == LocalPlayer.Team))) then
                Hidden = false;
            end;
        end);

        wait(1);
        Connection:Disconnect();

        if (Hidden and Lurnai.Enabled and not Lurnai.checkIgnored(message)) then
            if (#message > 1200) then
                message = message:sub(1200) .. "...";
            end;
            Lurnai.Chat.Text = "[Lurnai] - ["..targetPlayer.Name.."]: " .. message;
            if (Lurnai.Public) then SayMessageRequest:FireServer(Lurnai.Chat.Text, "All"); else StarterGui:SetCore("ChatMakeSystemMessage", Lurnai.Chat); end;
        end;
    end;
end;

local AllPlayers = Players:GetPlayers();
for i = 1, #AllPlayers do
    local player = AllPlayers[i];
    player.Chatted:Connect(function(message)
        Lurnai.onChatted(player, message);
    end);
end;

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        Lurnai.onChatted(player, message);
    end);
end);

Lurnai.Chat.Text = "[Lurnai] - "..(Lurnai.Enabled and "Enabled." or "Disabled.");
StarterGui:SetCore("ChatMakeSystemMessage", Lurnai.Chat);

local chatFrame = LocalPlayer.PlayerGui.Chat.Frame;
chatFrame.ChatChannelParentFrame.Visible = true;
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), chatFrame.ChatChannelParentFrame.Size.Y);
