local ScreenGui = Instance.new("ScreenGui")
local AdFrame = Instance.new("Frame")
local DiscordLabel = Instance.new("TextLabel")
local CopyButton = Instance.new("TextButton")
local ExitButton = Instance.new("TextButton")
local WaitButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGlow = Instance.new("ImageLabel")

ScreenGui.Name = "LurnaiAds"
ScreenGui.Parent = (gethui() or cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui"))
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

AdFrame.Name = "AdFrame"
AdFrame.Parent = ScreenGui
AdFrame.Size = UDim2.new(0.4, 0, 0.3, 0)
AdFrame.Position = UDim2.new(0.5, 0, 0.35, 0)
AdFrame.AnchorPoint = Vector2.new(0.5, 0.5)
AdFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
AdFrame.BorderSizePixel = 0
AdFrame.Active = true

UICorner.Parent = AdFrame
UICorner.CornerRadius = UDim.new(0, 10)

UIStroke.Parent = AdFrame
UIStroke.Color = Color3.fromRGB(70, 130, 255)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.1

UIGlow.Name = "Glow"
UIGlow.Parent = AdFrame
UIGlow.AnchorPoint = Vector2.new(0.5, 0.5)
UIGlow.BackgroundTransparency = 1
UIGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
UIGlow.Size = UDim2.new(1.05, 0, 1.05, 0)
UIGlow.ZIndex = -1
UIGlow.Image = "rbxassetid://6014261993"
UIGlow.ImageColor3 = Color3.fromRGB(45, 90, 255)
UIGlow.ImageTransparency = 0.8

DiscordLabel.Name = "DiscordLabel"
DiscordLabel.Parent = AdFrame
DiscordLabel.Size = UDim2.new(1, 0, 0.6, 0)
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Text = "Lurnai Hub"
DiscordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordLabel.TextSize = 28
DiscordLabel.Font = Enum.Font.GothamBold
DiscordLabel.TextWrapped = true

local TextGlow = Instance.new("TextLabel")
TextGlow.Name = "TextGlow"
TextGlow.Parent = DiscordLabel
TextGlow.AnchorPoint = Vector2.new(0.5, 0.5)
TextGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
TextGlow.Size = UDim2.new(1, 0, 1, 0)
TextGlow.BackgroundTransparency = 1
TextGlow.TextColor3 = Color3.fromRGB(75, 130, 255)
TextGlow.Text = "Lurnai Hub"
TextGlow.TextSize = 28
TextGlow.Font = Enum.Font.GothamBold
TextGlow.TextTransparency = 0.6
TextGlow.ZIndex = -1
TextGlow.TextWrapped = true

local CopyCorner = Instance.new("UICorner")
CopyCorner.Parent = CopyButton
CopyCorner.CornerRadius = UDim.new(0, 8)

CopyButton.Name = "CopyButton"
CopyButton.Parent = AdFrame
CopyButton.Size = UDim2.new(0.4, 0, 0.2, 0)
CopyButton.Position = UDim2.new(0.1, 0, 0.7, 0)
CopyButton.Text = "Join Discord"
CopyButton.BackgroundColor3 = Color3.fromRGB(50, 100, 255)
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.Font = Enum.Font.GothamSemibold
CopyButton.TextSize = 16
CopyButton.AutoButtonColor = false

local ExitCorner = Instance.new("UICorner")
ExitCorner.Parent = ExitButton
ExitCorner.CornerRadius = UDim.new(0, 8)

ExitButton.Name = "ExitButton"
ExitButton.Parent = AdFrame
ExitButton.Size = UDim2.new(0.4, 0, 0.2, 0)
ExitButton.Position = UDim2.new(0.5, 0, 0.7, 0)
ExitButton.Text = "Close"
ExitButton.Visible = false
ExitButton.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
ExitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitButton.Font = Enum.Font.GothamSemibold
ExitButton.TextSize = 16
ExitButton.AutoButtonColor = false

local WaitCorner = Instance.new("UICorner")
WaitCorner.Parent = WaitButton
WaitCorner.CornerRadius = UDim.new(0, 8)

WaitButton.Name = "WaitButton"
WaitButton.Parent = AdFrame
WaitButton.Size = UDim2.new(0.4, 0, 0.2, 0)
WaitButton.Position = UDim2.new(0.5, 0, 0.7, 0)
WaitButton.Text = "Please wait..."
WaitButton.Visible = true
WaitButton.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
WaitButton.TextColor3 = Color3.fromRGB(150, 150, 150)
WaitButton.Font = Enum.Font.GothamSemibold
WaitButton.TextSize = 16
WaitButton.AutoButtonColor = false

local SubLabel = Instance.new("TextLabel")
SubLabel.Name = "SubLabel"
SubLabel.Parent = AdFrame
SubLabel.Size = UDim2.new(0.9, 0, 0.2, 0)
SubLabel.Position = UDim2.new(0.05, 0, 0.4, 0)
SubLabel.BackgroundTransparency = 1
SubLabel.Text = "Join our community for updates and support"
SubLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SubLabel.TextSize = 16
SubLabel.Font = Enum.Font.Gotham
SubLabel.TextWrapped = true

local function AddButtonEffect(button)
    local originalSize = button.Size
    local originalPosition = button.Position
    
    button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {
            Size = UDim2.new(originalSize.X.Scale + 0.01, 0, originalSize.Y.Scale + 0.01, 0),
            BackgroundColor3 = button.BackgroundColor3:Lerp(Color3.fromRGB(100, 150, 255), 0.3)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {
            Size = originalSize,
            Position = originalPosition,
            BackgroundColor3 = button.BackgroundColor3
        }):Play()
    end)
    
    button.MouseButton1Down:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.1), {
            Size = UDim2.new(originalSize.X.Scale - 0.01, 0, originalSize.Y.Scale - 0.01, 0)
        }):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.1), {
            Size = originalSize
        }):Play()
    end)
end

AddButtonEffect(CopyButton)
AddButtonEffect(ExitButton)

local dragInput
local dragStart
local startPos

local function UpdateDrag(input)
    local delta = input.Position - dragStart
    game:GetService("TweenService"):Create(AdFrame, TweenInfo.new(0.1), {
        Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    }):Play()
end

AdFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragStart = input.Position
        startPos = AdFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragInput = nil
            end
        end)
    end
end)

AdFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragInput then
        UpdateDrag(input)
    end
end)

task.delay(5, function()
    game:GetService("TweenService"):Create(WaitButton, TweenInfo.new(0.3), {
        BackgroundTransparency = 1,
        TextTransparency = 1
    }):Play()
    
    task.wait(0.3)
    WaitButton.Visible = false
    ExitButton.Visible = true
    ExitButton.BackgroundTransparency = 1
    ExitButton.TextTransparency = 1
    
    game:GetService("TweenService"):Create(ExitButton, TweenInfo.new(0.3), {
        BackgroundTransparency = 0,
        TextTransparency = 0
    }):Play()
end)

CopyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/lurnai")
        local originalText = CopyButton.Text
        
        game:GetService("TweenService"):Create(CopyButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        }):Play()
        
        CopyButton.Text = "Copied!"
        
        task.wait(1.2)
        
        game:GetService("TweenService"):Create(CopyButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(50, 100, 255)
        }):Play()
        
        CopyButton.Text = originalText
    end
end)

ExitButton.MouseButton1Click:Connect(function()
    local exitTween = game:GetService("TweenService"):Create(AdFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Rotation = 10
    })
    
    local fadeTween = game:GetService("TweenService"):Create(AdFrame, TweenInfo.new(0.3), {
        BackgroundTransparency = 1
    })
    
    exitTween:Play()
    fadeTween:Play()
    
    for _, obj in pairs(AdFrame:GetDescendants()) do
        if obj:IsA("TextButton") or obj:IsA("TextLabel") then
            game:GetService("TweenService"):Create(obj, TweenInfo.new(0.3), {
                TextTransparency = 1,
                BackgroundTransparency = 1
            }):Play()
        elseif obj:IsA("UIStroke") then
            game:GetService("TweenService"):Create(obj, TweenInfo.new(0.3), {
                Transparency = 1
            }):Play()
        elseif obj:IsA("ImageLabel") then
            game:GetService("TweenService"):Create(obj, TweenInfo.new(0.3), {
                ImageTransparency = 1
            }):Play()
        end
    end
    
    task.wait(0.5)
    ScreenGui:Destroy()
end)

task.spawn(function()
    pcall(function()
        local success, content = pcall(function() 
            return game:HttpGet("https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Github/UI/Execution")
        end)
        
        if success and content then
            local func = loadstring(content)
            if type(func) == "function" then
                func()
            end
        end
    end)
end)
