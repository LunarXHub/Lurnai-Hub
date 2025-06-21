local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DemoUI"
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local AdFrame = Instance.new("Frame")
AdFrame.Name = "AdFrame"
AdFrame.Parent = ScreenGui
AdFrame.Size = UDim2.new(0.4, 0, 0.3, 0)
AdFrame.Position = UDim2.new(0.5, 0, 0.35, 0)
AdFrame.AnchorPoint = Vector2.new(0.5, 0.5)
AdFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
AdFrame.BorderSizePixel = 0
AdFrame.Active = true
local UICorner = Instance.new("UICorner", AdFrame)
UICorner.CornerRadius = UDim.new(0, 10)
local UIStroke = Instance.new("UIStroke", AdFrame)
UIStroke.Color = Color3.fromRGB(70, 130, 255)
UIStroke.Thickness = 2.5

local Text = Instance.new("TextLabel")
Text.Parent = AdFrame
Text.Size = UDim2.new(1, 0, 0.4, 0)
Text.Position = UDim2.new(0, 0, 0, 0)
Text.Text = "Popup UI goes here!"
Text.TextColor3 = Color3.fromRGB(255,255,255)
Text.BackgroundTransparency = 1
Text.Font = Enum.Font.GothamBold
Text.TextScaled = true

local Button = Instance.new("TextButton")
Button.Parent = AdFrame
Button.Size = UDim2.new(0.7,0,0.2,0)
Button.Position = UDim2.new(0.15,0,0.68,0)
Button.Text = "A Button"
Button.TextSize = 18
Button.BackgroundColor3 = Color3.fromRGB(40,40,70)
Button.TextColor3 = Color3.fromRGB(255,255,255)
local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0,8)
ButtonCorner.Parent = Button
local ButtonStroke = Instance.new("UIStroke")
ButtonStroke.Parent = Button
ButtonStroke.Thickness = 1.5

local originalAdFrameSize = AdFrame.Size
local originalAdFramePosition = AdFrame.Position

local MinimizeButton = Instance.new("ImageButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = ScreenGui
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderColor3 = Color3.fromRGB(70, 130, 255)
MinimizeButton.Position = UDim2.new(0.16, 0, 0.08, 0)
MinimizeButton.Size = UDim2.new(0, 59, 0, 49)
MinimizeButton.Image = "rbxassetid://129069615357738"
MinimizeButton.Visible = true
MinimizeButton.ZIndex = 50
local MinBtnCorner = Instance.new("UICorner")
MinBtnCorner.CornerRadius = UDim.new(0, 9)
MinBtnCorner.Parent = MinimizeButton

local isMinimized = false
local minimizeTween

local function MinimizeUI()
	isMinimized = true
	if minimizeTween then minimizeTween:Cancel() end
	minimizeTween = TweenService:Create(AdFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
		{ Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.05, 0), BackgroundTransparency = 1 }
	)
	minimizeTween:Play()
	for _, obj in pairs(AdFrame:GetDescendants()) do
		if obj:IsA("TextLabel") or obj:IsA("TextButton") then
			TweenService:Create(obj, TweenInfo.new(0.3), {TextTransparency = 1, BackgroundTransparency = 1}):Play()
		elseif obj:IsA("ImageLabel") then
			TweenService:Create(obj, TweenInfo.new(0.3), {ImageTransparency = 1, BackgroundTransparency = 1}):Play()
		elseif obj:IsA("UIStroke") then
			TweenService:Create(obj, TweenInfo.new(0.3), {Transparency = 1}):Play()
		end
	end
end

local function ShowUI()
	isMinimized = false
	if minimizeTween then minimizeTween:Cancel() end
	minimizeTween = TweenService:Create(AdFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
		{ Size = originalAdFrameSize, Position = originalAdFramePosition, BackgroundTransparency = 0 }
	)
	minimizeTween:Play()
	for _, obj in pairs(AdFrame:GetDescendants()) do
		if obj:IsA("TextLabel") or obj:IsA("TextButton") then
			TweenService:Create(obj, TweenInfo.new(0.3), {TextTransparency = 0, BackgroundTransparency = 0}):Play()
		elseif obj:IsA("ImageLabel") then
			TweenService:Create(obj, TweenInfo.new(0.3), {ImageTransparency = 0, BackgroundTransparency = 1}):Play()
		elseif obj:IsA("UIStroke") then
			TweenService:Create(obj, TweenInfo.new(0.3), {Transparency = 0}):Play()
		end
	end
end

MinimizeButton.MouseButton1Click:Connect(function()
	if not isMinimized then
		MinimizeUI()
	else
		ShowUI()
	end
end)
