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
AdFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
AdFrame.BorderSizePixel = 0
AdFrame.Active = true

UICorner.Parent = AdFrame
UICorner.CornerRadius = UDim.new(0, 10)

UIStroke.Parent = AdFrame
UIStroke.Color = Color3.fromRGB(70, 130, 255)
UIStroke.Thickness = 2.5
UIStroke.Transparency = 0

UIGlow.Name = "Glow"
UIGlow.Parent = AdFrame
UIGlow.AnchorPoint = Vector2.new(0.5, 0.5)
UIGlow.BackgroundTransparency = 1
UIGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
UIGlow.Size = UDim2.new(1.1, 0, 1.1, 0)
UIGlow.ZIndex = -1
UIGlow.Image = "rbxassetid://6015897843"
UIGlow.ImageColor3 = Color3.fromRGB(45, 90, 255)
UIGlow.ImageTransparency = 0.6

local OuterGlow = Instance.new("ImageLabel")
OuterGlow.Name = "OuterGlow"
OuterGlow.Parent = AdFrame
OuterGlow.AnchorPoint = Vector2.new(0.5, 0.5)
OuterGlow.BackgroundTransparency = 1
OuterGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
OuterGlow.Size = UDim2.new(1.2, 0, 1.2, 0)
OuterGlow.ZIndex = -2
OuterGlow.Image = "rbxassetid://6015897843"
OuterGlow.ImageColor3 = Color3.fromRGB(0, 50, 255)
OuterGlow.ImageTransparency = 0.8

DiscordLabel.Name = "DiscordLabel"
DiscordLabel.Parent = AdFrame
DiscordLabel.Size = UDim2.new(1, 0, 0.6, 0)
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Text = "Lurnai Hub"
DiscordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordLabel.TextSize = 28
DiscordLabel.Font = Enum.Font.GothamBold
DiscordLabel.TextWrapped = true

local function CreateTextGlow(textObject)
    for i = 1, 4 do
        local TextGlowClone = Instance.new("TextLabel")
        TextGlowClone.Name = "TextGlow" .. i
        TextGlowClone.Parent = textObject
        TextGlowClone.AnchorPoint = Vector2.new(0.5, 0.5)
        TextGlowClone.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextGlowClone.Size = UDim2.new(1, 0, 1, 0)
        TextGlowClone.BackgroundTransparency = 1
        TextGlowClone.TextColor3 = Color3.fromRGB(0, 150, 255)
        TextGlowClone.Text = textObject.Text
        TextGlowClone.TextSize = textObject.TextSize
        TextGlowClone.Font = textObject.Font
        TextGlowClone.TextTransparency = 0.7
        TextGlowClone.ZIndex = textObject.ZIndex - i
        TextGlowClone.TextXAlignment = textObject.TextXAlignment
        TextGlowClone.TextYAlignment = textObject.TextYAlignment
        TextGlowClone.TextWrapped = textObject.TextWrapped
        
        local offsetX = 0
        local offsetY = 0
        
        if i == 1 then
            offsetX, offsetY = 1, 0
        elseif i == 2 then
            offsetX, offsetY = -1, 0
        elseif i == 3 then
            offsetX, offsetY = 0, 1
        elseif i == 4 then
            offsetX, offsetY = 0, -1
        end
        
        TextGlowClone.Position = UDim2.new(0.5, offsetX, 0.5, offsetY)
    end
    
    local pulseTween = game:GetService("TweenService"):Create(
        textObject,
        TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        {TextColor3 = Color3.fromRGB(220, 235, 255)}
    )
    pulseTween:Play()
end

CreateTextGlow(DiscordLabel)

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

local ExitStroke = Instance.new("UIStroke")
ExitStroke.Parent = ExitButton
ExitStroke.Color = Color3.fromRGB(80, 80, 150)
ExitStroke.Thickness = 1.5
ExitStroke.Transparency = 0.2

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

local WaitStroke = Instance.new("UIStroke")
WaitStroke.Parent = WaitButton
WaitStroke.Color = Color3.fromRGB(80, 80, 150)
WaitStroke.Thickness = 1.5
WaitStroke.Transparency = 0.2

local CopyCorner = Instance.new("UICorner")
CopyCorner.Parent = CopyButton
CopyCorner.CornerRadius = UDim.new(0, 8)

CopyButton.Name = "CopyButton"
CopyButton.Parent = AdFrame
CopyButton.Size = UDim2.new(0.4, 0, 0.2, 0)
CopyButton.Position = UDim2.new(0.1, 0, 0.7, 0)
CopyButton.Text = "Join Discord"
CopyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 70)  -- Same as ExitButton background
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.Font = Enum.Font.GothamSemibold
CopyButton.TextSize = 16
CopyButton.AutoButtonColor = false

local CopyStroke = Instance.new("UIStroke")
CopyStroke.Parent = CopyButton
CopyStroke.Color = Color3.fromRGB(80, 80, 150)  -- Same as ExitButton stroke
CopyStroke.Thickness = 1.5
CopyStroke.Transparency = 0.2

local function AnimateGlow()
    local TweenService = game:GetService("TweenService")
    
    local glowTween1 = TweenService:Create(
        UIGlow, 
        TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), 
        {ImageTransparency = 0.4, Size = UDim2.new(1.12, 0, 1.12, 0)}
    )
    
    local glowTween2 = TweenService:Create(
        OuterGlow, 
        TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), 
        {ImageTransparency = 0.7, Size = UDim2.new(1.25, 0, 1.25, 0)}
    )
    
    local strokeTween = TweenService:Create(
        UIStroke,
        TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        {Color = Color3.fromRGB(100, 200, 255)}
    )
    
    glowTween1:Play()
    glowTween2:Play()
    strokeTween:Play()
end

AnimateGlow()

local function AddButtonEffect(button)
    local originalSize = button.Size
    local originalPosition = button.Position
    local buttonStroke = button:FindFirstChildOfClass("UIStroke")
    
    button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {
            Size = UDim2.new(originalSize.X.Scale + 0.02, 0, originalSize.Y.Scale + 0.02, 0),
            BackgroundColor3 = button.BackgroundColor3:Lerp(Color3.fromRGB(70, 70, 120), 0.3)
        }):Play()
        
        if buttonStroke then
            game:GetService("TweenService"):Create(buttonStroke, TweenInfo.new(0.2), {
                Thickness = 2,
                Transparency = 0
            }):Play()
        end
        
        for _, child in pairs(button:GetChildren()) do
            if child:IsA("TextLabel") and child.Name:find("TextGlow") then
                game:GetService("TweenService"):Create(child, TweenInfo.new(0.2), {
                    TextTransparency = 0.4
                }):Play()
            end
        end
    end)
    
    button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {
            Size = originalSize,
            Position = originalPosition,
            BackgroundColor3 = button.BackgroundColor3
        }):Play()
        
        if buttonStroke then
            game:GetService("TweenService"):Create(buttonStroke, TweenInfo.new(0.2), {
                Thickness = 1.5,
                Transparency = 0.2
            }):Play()
        end
        
        for _, child in pairs(button:GetChildren()) do
            if child:IsA("TextLabel") and child.Name:find("TextGlow") then
                game:GetService("TweenService"):Create(child, TweenInfo.new(0.2), {
                    TextTransparency = 0.7
                }):Play()
            end
        end
    end)
    
    button.MouseButton1Down:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.1), {
            Size = UDim2.new(originalSize.X.Scale - 0.01, 0, originalSize.Y.Scale - 0.01, 0)
        }):Play()
        
        if buttonStroke then
            game:GetService("TweenService"):Create(buttonStroke, TweenInfo.new(0.1), {
                Thickness = 1.2,
                Transparency = 0.3
            }):Play()
        end
    end)
    
    button.MouseButton1Up:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.1), {
            Size = originalSize
        }):Play()
        
        if buttonStroke then
            game:GetService("TweenService"):Create(buttonStroke, TweenInfo.new(0.1), {
                Thickness = 1.5,
                Transparency = 0.2
            }):Play()
        end
    end)
    
    CreateTextGlow(button)
end

AddButtonEffect(CopyButton)
AddButtonEffect(ExitButton)
AddButtonEffect(WaitButton)

local dragInput
local dragStart
local startPos

local function UpdateDrag(input)
    local delta = input.Position - dragStart
    local dragSpeed = 0.2
    game:GetService("TweenService"):Create(AdFrame, TweenInfo.new(dragSpeed), {
        Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    }):Play()
    
    local glowStrength = math.min(1, delta.Magnitude / 100)
    game:GetService("TweenService"):Create(UIGlow, TweenInfo.new(dragSpeed), {
        ImageTransparency = 0.6 - (glowStrength * 0.3),
        Size = UDim2.new(1.1 + (glowStrength * 0.1), 0, 1.1 + (glowStrength * 0.1), 0)
    }):Play()
end

AdFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragStart = input.Position
        startPos = AdFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragInput = nil
                game:GetService("TweenService"):Create(UIGlow, TweenInfo.new(0.3), {
                    ImageTransparency = 0.6,
                    Size = UDim2.new(1.1, 0, 1.1, 0)
                }):Play()
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
    
    if WaitStroke then
        game:GetService("TweenService"):Create(WaitStroke, TweenInfo.new(0.3), {
            Transparency = 1
        }):Play()
    end
    
    for _, child in pairs(WaitButton:GetChildren()) do
        if child:IsA("TextLabel") and child.Name:find("TextGlow") then
            game:GetService("TweenService"):Create(child, TweenInfo.new(0.3), {
                TextTransparency = 1
            }):Play()
        end
    end
    
    task.wait(0.3)
    WaitButton.Visible = false
    ExitButton.Visible = true
    ExitButton.BackgroundTransparency = 1
    ExitButton.TextTransparency = 1
    
    if ExitStroke then
        ExitStroke.Transparency = 1
    end
    
    for _, child in pairs(ExitButton:GetChildren()) do
        if child:IsA("TextLabel") and child.Name:find("TextGlow") then
            child.TextTransparency = 1
        end
    end
    
    game:GetService("TweenService"):Create(ExitButton, TweenInfo.new(0.3), {
        BackgroundTransparency = 0,
        TextTransparency = 0
    }):Play()
    
    if ExitStroke then
        game:GetService("TweenService"):Create(ExitStroke, TweenInfo.new(0.3), {
            Transparency = 0.2
        }):Play()
    end
    
    for _, child in pairs(ExitButton:GetChildren()) do
        if child:IsA("TextLabel") and child.Name:find("TextGlow") then
            game:GetService("TweenService"):Create(child, TweenInfo.new(0.3), {
                TextTransparency = 0.7
            }):Play()
        end
    end
end)

CopyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/lurnai")
        local originalText = CopyButton.Text
        
        game:GetService("TweenService"):Create(CopyButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        }):Play()
        
        if CopyStroke then 
            game:GetService("TweenService"):Create(CopyStroke, TweenInfo.new(0.3), {
                Color = Color3.fromRGB(100, 230, 150)
            }):Play()
        end
        
        for _, child in pairs(CopyButton:GetChildren()) do
            if child:IsA("TextLabel") and child.Name:find("TextGlow") then
                game:GetService("TweenService"):Create(child, TweenInfo.new(0.3), {
                    TextColor3 = Color3.fromRGB(0, 200, 100)
                }):Play()
            end
        end
        
        CopyButton.Text = "Copied!"
        
        task.wait(1.2)
        
        game:GetService("TweenService"):Create(CopyButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(40, 40, 70)  -- Back to original color
        }):Play()
        
        if CopyStroke then 
            game:GetService("TweenService"):Create(CopyStroke, TweenInfo.new(0.3), {
                Color = Color3.fromRGB(80, 80, 150)  -- Back to original color
            }):Play()
        end
        
        for _, child in pairs(CopyButton:GetChildren()) do
            if child:IsA("TextLabel") and child.Name:find("TextGlow") then
                game:GetService("TweenService"):Create(child, TweenInfo.new(0.3), {
                    TextColor3 = Color3.fromRGB(0, 150, 255)
                }):Play()
            end
        end
        
        CopyButton.Text = originalText
    end
end)

ExitButton.MouseButton1Click:Connect(function()
    local TweenService = game:GetService("TweenService")
    
    -- Create the spinning icon
    local SpinningIcon = Instance.new("ImageLabel")
    SpinningIcon.Name = "LurnaiLogo"
    SpinningIcon.Parent = ScreenGui
    SpinningIcon.BackgroundTransparency = 1
    SpinningIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    SpinningIcon.Size = UDim2.new(0, 0, 0, 0)  -- Start small
    SpinningIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    SpinningIcon.Image = "rbxassetid://129069615357738"  -- The icon ID you provided
    SpinningIcon.ImageTransparency = 1
    
    -- Add glow to the icon
    local IconGlow = Instance.new("ImageLabel")
    IconGlow.Name = "IconGlow"
    IconGlow.Parent = SpinningIcon
    IconGlow.BackgroundTransparency = 1
    IconGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
    IconGlow.Size = UDim2.new(1.4, 0, 1.4, 0)
    IconGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    IconGlow.Image = "rbxassetid://6015897843"
    IconGlow.ImageColor3 = Color3.fromRGB(0, 100, 255)
    IconGlow.ImageTransparency = 1
    IconGlow.ZIndex = -1
    
    -- Exit animation for the frame
    local exitTween = TweenService:Create(AdFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Rotation = 10
    })
    
    local glowTween = TweenService:Create(UIGlow, TweenInfo.new(0.5), {
        Size = UDim2.new(0, 0, 0, 0),
        ImageTransparency = 1
    })
    
    local outerGlowTween = TweenService:Create(OuterGlow, TweenInfo.new(0.7), {
        Size = UDim2.new(0, 0, 0, 0),
        ImageTransparency = 1
    })
    
    local fadeTween = TweenService:Create(AdFrame, TweenInfo.new(0.4), {
        BackgroundTransparency = 1
    })
    
    local strokeTween = TweenService:Create(UIStroke, TweenInfo.new(0.3), {
        Transparency = 1
    })
    
    -- Fade out all elements in the AdFrame
    for _, obj in pairs(AdFrame:GetDescendants()) do
        if obj:IsA("TextButton") or obj:IsA("TextLabel") then
            TweenService:Create(obj, TweenInfo.new(0.3), {
                TextTransparency = 1,
                BackgroundTransparency = 1
            }):Play()
        elseif obj:IsA("UIStroke") then
            TweenService:Create(obj, TweenInfo.new(0.3), {
                Transparency = 1
            }):Play()
        elseif obj:IsA("ImageLabel") then
            TweenService:Create(obj, TweenInfo.new(0.3), {
                ImageTransparency = 1
            }):Play()
        end
    end
    
    -- Play the exit animations
    glowTween:Play()
    outerGlowTween:Play()
    strokeTween:Play()
    fadeTween:Play()
    exitTween:Play()
    
    -- Animation sequence for the icon
    task.wait(0.3)  -- Short delay before showing the icon
    
    -- First make the icon appear and grow
    TweenService:Create(SpinningIcon, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0.15, 0, 0.15, 0),
        ImageTransparency = 0
    }):Play()
    
    TweenService:Create(IconGlow, TweenInfo.new(0.3), {
        ImageTransparency = 0.7
    }):Play()
    
    -- Spin the icon very fast initially
    local fastSpin = TweenService:Create(SpinningIcon, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
        Rotation = 720
    })
    fastSpin:Play()
    
    fastSpin.Completed:Connect(function()
        -- Then slow down the spin
        local slowSpin = TweenService:Create(SpinningIcon, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Rotation = SpinningIcon.Rotation + 360
        })
        slowSpin:Play()
        
        -- Pulse the glow while spinning
        TweenService:Create(IconGlow, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 2, true), {
            Size = UDim2.new(1.6, 0, 1.6, 0),
            ImageTransparency = 0.5
        }):Play()
        
        -- Finally fade out the icon
        task.delay(1.2, function()
            TweenService:Create(SpinningIcon, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                ImageTransparency = 1,
                Rotation = SpinningIcon.Rotation + 180
            }):Play()
            
            TweenService:Create(IconGlow, TweenInfo.new(0.6), {
                Size = UDim2.new(0, 0, 0, 0),
                ImageTransparency = 1
            }):Play()
            
            task.delay(0.8, function()
                ScreenGui:Destroy()
            end)
        end)
    end)
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
