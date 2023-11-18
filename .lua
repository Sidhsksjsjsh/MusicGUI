if game.Players.LocalPlayer.PlayerGui:FindFirstChild("CLOCK") then
    game.Players.LocalPlayer.PlayerGui:FindFirstChild("CLOCK"):Destroy()
end

local player = game.Players.LocalPlayer
local gui = player.PlayerGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = gui
screenGui.Name = "CLOCK"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 20)
frame.Position = UDim2.new(0.5, -100, 0.9, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = screenGui

local timeLabel = Instance.new("TextLabel")
timeLabel.Size = UDim2.new(1, 0, 1, 0)
timeLabel.Text = "--:--:--"
timeLabel.TextColor3 = Color3.new(1, 1, 1)
timeLabel.Parent = frame
timeLabel.BackgroundTransparency = 1

local musicIdTextBox = Instance.new("TextBox")
musicIdTextBox.Size = UDim2.new(0, 150, 0, 20)
musicIdTextBox.Position = UDim2.new(0, 25, 0, 40)
musicIdTextBox.PlaceholderText = "Masukkan ID Musik"
musicIdTextBox.Parent = screenGui
musicIdTextBox.Visible = false

local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(0, 50, 0, 20)
playButton.Position = UDim2.new(0, 180, 0, 40)
playButton.Text = "Putar"
playButton.Parent = screenGui
playButton.Visible = false

local musicLength = 0
local currentTime = 0

--[[playButton.MouseButton1Click:Connect(function()
    local success, result = pcall(function()
        musicLength = game:GetService("SoundService"):GetWaveUploadedDuration(tonumber(musicIdTextBox.Text))
    end)

    if success and result then
        currentTime = 0
        updateLabelText()
    else
        warn("Gagal mendapatkan durasi musik.")
    end
end)

function updateLabelText()
    local minutes = math.floor(currentTime / 60)
    local seconds = currentTime % 60
    local totalMinutes = math.floor(musicLength / 60)
    local totalSeconds = musicLength % 60
    timeLabel.Text = string.format("%d:%02d / %d:%02d", minutes, seconds, totalMinutes, totalSeconds)
end]]

while wait() do
    timeLabel.Text = os.date("%X")
end
