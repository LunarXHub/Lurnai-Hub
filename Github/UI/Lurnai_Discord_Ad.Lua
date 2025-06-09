local Services = {
    TweenService = game:GetService("TweenService"),
    UserInputService = game:GetService("UserInputService"),
    CoreGui = game:GetService("CoreGui")
}

local Colors = {
    Primary = {
        Background = Color3.fromRGB(18, 18, 24),
        Surface = Color3.fromRGB(25, 25, 35),
        Accent = Color3.fromRGB(88, 166, 255),
        AccentHover = Color3.fromRGB(108, 186, 255),
        AccentPressed = Color3.fromRGB(68, 146, 235)
    },
    Secondary = {
        Success = Color3.fromRGB(34, 197, 94),
        Warning = Color3.fromRGB(251, 191, 36),
        Error = Color3.fromRGB(239, 68, 68),
        ErrorHover = Color3.fromRGB(248, 113, 113)
    },
    Text = {
        Primary = Color3.fromRGB(255, 255, 255),
        Secondary = Color3.fromRGB(156, 163, 175),
        Accent = Color3.fromRGB(88, 166, 255)
    },
    Border = {
        Default = Color3.fromRGB(55, 65, 81),
        Accent = Color3.fromRGB(88, 166, 255),
        Focus = Color3.fromRGB(108, 186, 255)
    }
}

local Config = {
    Discord = {
        InviteLink = "https://discord.gg/lurnai",
        ServerName = "Lurnai Hub Community"
    },
    GitHub = {
        Repository = "https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Github/UI/Execution",
        Author = "HVX-Havoc"
    },
    UI = {
        FrameSize = UDim2.new(0.35, 0, 0.28, 0),
        CornerRadius = UDim.new(0, 12),
        ButtonCornerRadius = UDim.new(0, 8),
        StrokeThickness = 2,
        ShadowOffset = 4,
        WaitTime = 5
    },
    Animations = {
        Fast = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        Medium = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        Slow = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        Entrance = TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        Exit = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    }
}

local Typography = {
    Title = {
        Font = Enum.Font.GothamBold,
        Size = 20
    },
    Button = {
        Font = Enum.Font.GothamSemibold,
        Size = 14
    },
    Body = {
        Font = Enum.Font.Gotham,
        Size = 12
    }
}

local function CreateInstance(className, properties)
    local instance = Instance.new(className)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

local function CreateCorner(radius)
    return CreateInstance("UICorner", {
        CornerRadius = radius or Config.UI.CornerRadius
    })
end

local function CreateStroke(color, thickness)
    return CreateInstance("UIStroke", {
        Color = color or Colors.Border.Default,
        Thickness = thickness or Config.UI.StrokeThickness
    })
end

local function CreateShadow(parent, offset)
    return CreateInstance("Frame", {
        Name = "Shadow",
        Parent = parent,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, offset or Config.UI.ShadowOffset),
        Size = UDim2.new(1, 10, 1, 10),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        ZIndex = -1
    })
end

local GUI = {}

function GUI:Initialize()
    self.ScreenGui = CreateInstance("ScreenGui", {
        Name = "LurnaiHubAd",
        Parent = (gethui and gethui()) or (cloneref and cloneref(Services.CoreGui)) or Services.CoreGui,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    })

    self:CreateMainFrame()
    self:CreateComponents()
    self:SetupAnimations()
    self:SetupEvents()
    self:PlayEntranceAnimation()
end

function GUI:CreateMainFrame()
    self.MainFrame = CreateInstance("Frame", {
        Name = "MainFrame",
        Parent = self.ScreenGui,
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Colors.Primary.Surface,
        BorderSizePixel = 0,
        Active = true
    })

    CreateCorner():Parent = self.MainFrame
    CreateStroke(Colors.Border.Accent):Parent = self.MainFrame
    CreateShadow(self.MainFrame)
end

function GUI:CreateComponents()
    self.TitleLabel = CreateInstance("TextLabel", {
        Name = "TitleLabel",
        Parent = self.MainFrame,
        Size = UDim2.new(1, -40, 0.5, 0),
        Position = UDim2.new(0, 20, 0, 20),
        BackgroundTransparency = 1,
        Text = "Lurnai Hub",
        TextColor3 = Colors.Text.Primary,
        TextSize = Typography.Title.Size,
        Font = Typography.Title.Font,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top
    })

    self.SubtitleLabel = CreateInstance("TextLabel", {
        Name = "SubtitleLabel",
        Parent = self.MainFrame,
        Size = UDim2.new(1, -40, 0.3, 0),
        Position = UDim2.new(0, 20, 0, 50),
        BackgroundTransparency = 1,
        Text = "Join our community for updates and support",
        TextColor3 = Colors.Text.Secondary,
        TextSize = Typography.Body.Size,
        Font = Typography.Body.Font,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true
    })

    self.DiscordButton = CreateInstance("TextButton", {
        Name = "DiscordButton",
        Parent = self.MainFrame,
        Size = UDim2.new(0.45, -15, 0.25, 0),
        Position = UDim2.new(0, 20, 1, -60),
        BackgroundColor3 = Colors.Primary.Accent,
        BorderSizePixel = 0,
        Text = "Join Discord",
        TextColor3 = Colors.Text.Primary,
        TextSize = Typography.Button.Size,
        Font = Typography.Button.Font,
        AutoButtonColor = false
    })

    CreateCorner(Config.UI.ButtonCornerRadius):Parent = self.DiscordButton
    CreateStroke(Colors.Border.Focus, 1):Parent = self.DiscordButton

    self.ExitButton = CreateInstance("TextButton", {
        Name = "ExitButton",
        Parent = self.MainFrame,
        Size = UDim2.new(0.45, -15, 0.25, 0),
        Position = UDim2.new(0.55, 5, 1, -60),
        BackgroundColor3 = Colors.Secondary.Error,
        BorderSizePixel = 0,
        Text = "Close",
        TextColor3 = Colors.Text.Primary,
        TextSize = Typography.Button.Size,
        Font = Typography.Button.Font,
        AutoButtonColor = false,
        Visible = false
    })

    CreateCorner(Config.UI.ButtonCornerRadius):Parent = self.ExitButton
    CreateStroke(Colors.Secondary.ErrorHover, 1):Parent = self.ExitButton

    self.WaitButton = CreateInstance("TextButton", {
        Name = "WaitButton",
        Parent = self.MainFrame,
        Size = UDim2.new(0.45, -15, 0.25, 0),
        Position = UDim2.new(0.55, 5, 1, -60),
        BackgroundColor3 = Colors.Border.Default,
        BorderSizePixel = 0,
        Text = "Please wait...",
        TextColor3 = Colors.Text.Secondary,
        TextSize = Typography.Button.Size,
        Font = Typography.Button.Font,
        AutoButtonColor = false
    })

    CreateCorner(Config.UI.ButtonCornerRadius):Parent = self.WaitButton
    CreateStroke(Colors.Border.Default, 1):Parent = self.WaitButton
end

function GUI:SetupAnimations()
    self.Animations = {
        ButtonHover = function(button, hoverColor)
            return Services.TweenService:Create(button, Config.Animations.Fast, {
                BackgroundColor3 = hoverColor,
                Size = button.Size + UDim2.new(0, 2, 0, 1)
            })
        end,

        ButtonLeave = function(button, originalColor, originalSize)
            return Services.TweenService:Create(button, Config.Animations.Fast, {
                BackgroundColor3 = originalColor,
                Size = originalSize
            })
        end,

        ButtonPress = function(button, pressColor)
            return Services.TweenService:Create(button, Config.Animations.Fast, {
                BackgroundColor3 = pressColor,
                Size = button.Size - UDim2.new(0, 1, 0, 1)
            })
        end,

        FadeOut = function(element)
            return Services.TweenService:Create(element, Config.Animations.Medium, {
                BackgroundTransparency = 1,
                TextTransparency = 1
            })
        end,

        FadeIn = function(element)
            return Services.TweenService:Create(element, Config.Animations.Medium, {
                BackgroundTransparency = 0,
                TextTransparency = 0
            })
        end
    }
end

function GUI:CreateButtonEffects(button, colors)
    local originalSize = button.Size
    local originalColor = button.BackgroundColor3

    button.MouseEnter:Connect(function()
        self.Animations.ButtonHover(button, colors.hover):Play()
    end)

    button.MouseLeave:Connect(function()
        self.Animations.ButtonLeave(button, originalColor, originalSize):Play()
    end)

    button.MouseButton1Down:Connect(function()
        self.Animations.ButtonPress(button, colors.pressed):Play()
    end)

    button.MouseButton1Up:Connect(function()
        self.Animations.ButtonHover(button, colors.hover):Play()
    end)
end

function GUI:SetupDragging()
    local dragging = false
    local dragStart = nil
    local startPos = nil

    self.MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = self.MainFrame.Position
        end
    end)

    self.MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - dragStart
            local newPos = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
            Services.TweenService:Create(self.MainFrame, Config.Animations.Fast, {Position = newPos}):Play()
        end
    end)

    self.MainFrame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

function GUI:SetupEvents()
    self:CreateButtonEffects(self.DiscordButton, {
        hover = Colors.Primary.AccentHover,
        pressed = Colors.Primary.AccentPressed
    })

    self:CreateButtonEffects(self.ExitButton, {
        hover = Colors.Secondary.ErrorHover,
        pressed = Color3.fromRGB(220, 38, 38)
    })

    self.DiscordButton.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(Config.Discord.InviteLink)
            local originalText = self.DiscordButton.Text
            self.DiscordButton.Text = "Copied!"

            Services.TweenService:Create(self.DiscordButton, Config.Animations.Medium, {
                BackgroundColor3 = Colors.Secondary.Success
            }):Play()

            task.wait(1.5)

            Services.TweenService:Create(self.DiscordButton, Config.Animations.Medium, {
                BackgroundColor3 = Colors.Primary.Accent
            }):Play()

            self.DiscordButton.Text = originalText
        end
    end)

    self.ExitButton.MouseButton1Click:Connect(function()
        self:PlayExitAnimation()
    end)

    self:SetupDragging()
    self:SetupWaitTimer()
end

function GUI:SetupWaitTimer()
    task.delay(Config.UI.WaitTime, function()
        local fadeOut = self.Animations.FadeOut(self.WaitButton)
        fadeOut:Play()

        fadeOut.Completed:Connect(function()
            self.WaitButton.Visible = false
            self.ExitButton.Visible = true
            self.ExitButton.BackgroundTransparency = 1
            self.ExitButton.TextTransparency = 1

            self.Animations.FadeIn(self.ExitButton):Play()
        end)
    end)
end

function GUI:PlayEntranceAnimation()
    Services.TweenService:Create(self.MainFrame, Config.Animations.Entrance, {
        Size = Config.UI.FrameSize
    }):Play()
end

function GUI:PlayExitAnimation()
    local exitTween = Services.TweenService:Create(self.MainFrame, Config.Animations.Exit, {
        Size = UDim2.new(0, 0, 0, 0),
        Rotation = 180
    })

    local fadeTween = Services.TweenService:Create(self.MainFrame, Config.Animations.Exit, {
        BackgroundTransparency = 1
    })

    exitTween:Play()
    fadeTween:Play()

    exitTween.Completed:Connect(function()
        self.ScreenGui:Destroy()
    end)
end

function GUI:LoadMainScript()
    task.spawn(function()
        pcall(function()
            local httpSuccess, httpResult = pcall(function()
                return game:HttpGet(Config.GitHub.Repository)
            end)

            if httpSuccess and httpResult then
                local loadSuccess, loadResult = pcall(function()
                    local scriptFunction = loadstring(httpResult)
                    if type(scriptFunction) == "function" then
                        return scriptFunction()
                    else
                        error("Failed to loadstring: result is not a function")
                    end
                end)

                if not loadSuccess then
                    warn("Failed to load script:", loadResult)
                end
            else
                warn("Failed to fetch script:", httpResult)
            end
        end)
    end)
end

function GUI:Start()
    self:Initialize()
    self:LoadMainScript()
    return true 
end

local success, result = pcall(function()
    return GUI:Start()
end)

if not success then
    warn("Error starting GUI:", result)
end

return true
