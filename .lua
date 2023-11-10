local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = gui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 20)
frame.Position = UDim2.new(0.5, -100, 0.9, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = screenGui

local timeLabel = Instance.new("TextLabel")
timeLabel.Size = UDim2.new(1, 0, 1, 0)
timeLabel.Text = "0:00 / 0:00"
timeLabel.TextColor3 = Color3.new(1, 1, 1)
timeLabel.Parent = frame

local musicIdTextBox = Instance.new("TextBox")
musicIdTextBox.Size = UDim2.new(0, 150, 0, 20)
musicIdTextBox.Position = UDim2.new(0, 25, 0, 40)
musicIdTextBox.PlaceholderText = "Masukkan ID Musik"
musicIdTextBox.Parent = screenGui

local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(0, 50, 0, 20)
playButton.Position = UDim2.new(0, 180, 0, 40)
playButton.Text = "Putar"
playButton.Parent = screenGui

local musicLength = 0
local currentTime = 0

playButton.MouseButton1Click:Connect(function()
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
end

while wait(1) do
    if currentTime < musicLength then
        currentTime = currentTime + 1
        updateLabelText()
    else
        warn("Musik selesai.")
        break
    end
end
