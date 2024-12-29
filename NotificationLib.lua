local UIS = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local ts = game:GetService("TweenService")

function createNotification(text, duration)
	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local ImageLabel = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")

	--Properties:
	ScreenGui.Parent = gethui() or game:GetService("CoreGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(1, Frame.Size.X.Offset, 1, -Frame.Size.Y.Offset - 10)
	Frame.Size = UDim2.new(0, 293, 0, 70)

	ImageLabel.Parent = Frame
	ImageLabel.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0.0585971065, 0, 0.214285716, 0)
	ImageLabel.Size = UDim2.new(0, 40, 0, 40)
	ImageLabel.Image = "rbxassetid://131611104080518"

	TextLabel.Parent = Frame
	TextLabel.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.284482569, 0, 0.114285715, 0)
	TextLabel.Size = UDim2.new(0, 209, 0, 62)
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.Text = text
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 16.000
	TextLabel.TextStrokeTransparency = 0.600
	TextLabel.TextWrapped = true
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.TextYAlignment = Enum.TextYAlignment.Top

	local notificationFrame = Frame

	-- Ensure the anchor point is set to (0, 0) (top-left corner)
	notificationFrame.AnchorPoint = Vector2.new(0, 0)


	local tweenInfo = TweenInfo.new(
		1,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.Out,
		0,
		false,
		0
	)

	-- Ensure the frame is placed off-screen (completely to the right)
	notificationFrame.Position = UDim2.new(1, notificationFrame.Size.X.Offset, 1, -notificationFrame.Size.Y.Offset - 10)

	-- Goal position: bring it back just inside the right edge
	local goal = {
		Position = UDim2.new(1, -notificationFrame.Size.X.Offset, 1, -notificationFrame.Size.Y.Offset - 10)
	}

    local goal2 = {
        Position = UDim2.new(1, notificationFrame.Size.X.Offset, 1, notificationFrame.Size.Y.Offset)
    }


	-- Create and play the tween
	ts:Create(notificationFrame, tweenInfo, goal):Play()
    task.wait(duration)
    ts:Create(notificationFrame, tweenInfo, goal2):Play()
    task.wait(0.5)
    ScreenGui:Destroy()
end
