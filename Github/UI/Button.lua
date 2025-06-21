local MinimizeButton = Instance.new("ImageButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = ScreenGui
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderColor3 = Color3.fromRGB(70, 130, 255)
MinimizeButton.Position = UDim2.new(0.17, 70, 0.0743, 0) -- You can adjust the position if you need
MinimizeButton.Size = UDim2.new(0, 59, 0, 49)
MinimizeButton.Image = "rbxassetid://129069615357738"
MinimizeButton.Visible = true
MinimizeButton.ZIndex = 50

local MinBtnCorner = Instance.new("UICorner")
MinBtnCorner.CornerRadius = UDim.new(0, 9)
MinBtnCorner.Parent = MinimizeButton

local isMinimized = false
local originalAdFrameSize = AdFrame.Size
local originalAdFramePosition = AdFrame.Position

local TweenService = game:GetService("TweenService")
local minimizeTween -- to prevent conflicts

local function MinimizeUI()
	isMinimized = true

	if minimizeTween then minimizeTween:Cancel() end
	minimizeTween = TweenService:Create(AdFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
		{ Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.05, 0), BackgroundTransparency = 1 }
	)
	minimizeTween:Play()
	
	for _, obj in pairs(AdFrame:GetDescendants()) do
		if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("ImageLabel") then
			TweenService:Create(obj, TweenInfo.new(0.3), {TextTransparency = 1, BackgroundTransparency = 1, ImageTransparency = 1}):Play()
		end
		if obj:IsA("UIStroke") then
			TweenService:Create(obj, TweenInfo.new(0.3), {Transparency = 1}):Play()
		end
	end
end

local function ShowUI()
	isMinimized = false

	AdFrame.Visible = true
	if minimizeTween then minimizeTween:Cancel() end
	minimizeTween = TweenService:Create(AdFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
		{ Size = originalAdFrameSize, Position = originalAdFramePosition, BackgroundTransparency = 0 }
	)
	minimizeTween:Play()
	for _, obj in pairs(AdFrame:GetDescendants()) do
		if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("ImageLabel") then
			TweenService:Create(obj, TweenInfo.new(0.3), {TextTransparency = 0, BackgroundTransparency = 0, ImageTransparency = 0.6}):Play()
		end
		if obj:IsA("UIStroke") then
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
