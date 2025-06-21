local BUTTON_IMAGE = "rbxassetid://129069615357738"
local player = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local gui = Instance.new("ScreenGui")
gui.Name = "RightCtrlSpinBtn"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local btn = Instance.new("ImageButton")
btn.Name = "DragSpinBtn"
btn.Parent = gui
btn.Image = BUTTON_IMAGE
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

local isSpinning = false
btn.MouseButton1Click:Connect(function()
    if isSpinning then return end
    isSpinning = true

    if firekeydown then
        firekeydown(Enum.KeyCode.RightControl)
    elseif firekey then
        firekey(Enum.KeyCode.RightControl)
    elseif keypress then
        keypress(0xA3)
    elseif Input then
        Input.SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
    elseif keyevent then
        keyevent(0xA3)
    end

    local resetTween = TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {Rotation = 0})
    resetTween:Play()
    resetTween.Completed:Wait()
    local spinTween = TweenService:Create(btn, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Rotation = 360})
    spinTween:Play()
    spinTween.Completed:Wait()
    btn.Rotation = 0
    isSpinning = false
end)
