local assetId = "rbxassetid://129069615357738"

local player = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local gui = Instance.new("ScreenGui")
gui.Name = "Spinner"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local btn = Instance.new("ImageButton")
btn.Name = "DragSpin"
btn.Parent = gui
btn.Image = assetId
btn.Size = UDim2.new(0, 64, 0, 64)
btn.Position = UDim2.new(0.1, 0, 0.1, 0)
btn.BackgroundTransparency = 1

local dragging = false
local dragStart, startPos, dragInput

btn.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = btn.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

btn.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		local delta = input.Position - dragStart
		btn.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

local function spin()
	while btn.Parent do
		local tw = TweenService:Create(btn, TweenInfo.new(1, Enum.EasingStyle.Linear), {Rotation = btn.Rotation + 360})
		tw:Play()
		tw.Completed:Wait()
		if btn.Rotation >= 360 then
			btn.Rotation = btn.Rotation % 360
		end
	end
end

spawn(spin)
