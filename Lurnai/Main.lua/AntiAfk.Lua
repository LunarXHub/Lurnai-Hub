local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local function setupAntiAFK()
    local GC = getconnections or get_signal_cons
    if GC then
        for _, connection in pairs(GC(LocalPlayer.Idled)) do
            connection:Disable()
        end
    else
        LocalPlayer.Idled:Connect(function()
            VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    end
    
    print("Anti-AFK has been enabled")
end

setupAntiAFK()

local function simulateActivity()
    RunService.Heartbeat:Connect(function()
        if tick() % 300 < 1 then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(50, 50))
        end
    end)
end

simulateActivity()

if game:GetService("CoreGui"):FindFirstChild("Library") then
    Library:Notify{
        Title = "Anti-AFK",
        Content = "Anti-AFK system has been activated",
        Duration = 5
    }
else
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Anti-AFK",
        Text = "Anti-AFK system has been activated",
        Duration = 5
    })
end

return {
    Enabled = true,
    Disable = function()
        RunService:UnbindFromRenderStep("AntiAFK")
        return "Anti-AFK has been disabled"
    end
}
