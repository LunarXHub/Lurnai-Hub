local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local ProtectGui = protectgui or (syn and syn.protect_gui) or function(f) end

local mainColor = Color3.fromRGB(52, 114, 237)
local secondaryColor = Color3.fromRGB(25, 33, 50)

local ScreenGui = Instance.new("ScreenGui")
local AdFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local CopyButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

ScreenGui.Name = "AdsGui"
ScreenGui.Parent = (gethui() or cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui"))
ScreenGui.ResetOnSpawn = false
ProtectGui(ScreenGui)

AdFrame.Name = "AdFrame"
AdFrame.Parent = ScreenGui
AdFrame.Size = UDim2.new(0, 400, 0, 240)
AdFrame.Position = UDim2.new(0.5, -200, 0.5, -120)
AdFrame.AnchorPoint = Vector2.new(0.5, 0.5)
AdFrame.BackgroundColor3 = secondaryColor
AdFrame.BorderSizePixel = 0
AdFrame.ClipsDescendants = true

TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = AdFrame
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Lurnai Hub | Discord Ad"
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextColor3 = mainColor
TitleLabel.TextSize = 24
TitleLabel.TextWrapped = true
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.TextYAlignment = Enum.TextYAlignment.Center

CopyButton.Name = "CopyButton"
CopyButton.Parent = AdFrame
CopyButton.Size = UDim2.new(0, 150, 0, 40)
CopyButton.Position = UDim2.new(0.5, -75, 0.5, -60)
CopyButton.Text = "Join Discord"
CopyButton.BackgroundColor3 = mainColor
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.Font = Enum.Font.GothamSemibold
CopyButton.BorderSizePixel = 0
CopyButton.AutoButtonColor = false


CloseButton.Name = "CloseButton"
CloseButton.Parent = AdFrame
CloseButton.Size = UDim2.new(0, 150, 0, 40)
CloseButton.Position = UDim2.new(0.5,-75, 0.5, 20)
CloseButton.Text = "Close"
CloseButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CloseButton.TextColor3 = Color3.fromRGB(255,255,255)
CloseButton.Font = Enum.Font.GothamSemibold
CloseButton.BorderSizePixel = 0
CloseButton.AutoButtonColor = false

local function smoothTransition(instance, properties, duration, easingStyle, easingDirection)
    local tweenInfo = TweenInfo.new(duration, easingStyle, easingDirection)
    local tween = TweenService:Create(instance, tweenInfo, properties)
    tween:Play()
end

local function roundCorners(frame, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = frame
end

roundCorners(AdFrame, 12)
roundCorners(CopyButton, 8)
roundCorners(CloseButton, 8)

CopyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("discord.gg/jWpUjJta4u")
        smoothTransition(CopyButton, {BackgroundColor3 = mainColor * 0.8}, 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        CopyButton.Text = "Copied!"
        wait(1)
        CopyButton.Text = "Join Discord"
        smoothTransition(CopyButton, {BackgroundColor3 = mainColor}, 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    end
end)


CloseButton.MouseButton1Click:Connect(function()
    smoothTransition(AdFrame, {BackgroundTransparency = 1, Size = UDim2.new(0,400,0,0)}, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    smoothTransition(TitleLabel, {TextTransparency = 1}, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    smoothTransition(CopyButton, {BackgroundTransparency = 1, TextTransparency = 1}, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    smoothTransition(CloseButton, {BackgroundTransparency = 1, TextTransparency = 1}, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    wait(0.3)
    ScreenGui:Destroy()
end)

task.spawn(function()
    pcall(function()
        (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Github/UI/Execution"))()
    end)
end)
