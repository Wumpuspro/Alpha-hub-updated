local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Wumpuspro/Alpha-hub-updated/main/lib"))()

local UI = GUI:CreateWindow("Alpha Hub", "https://discord.gg/m4EjaHF67T")

local Main = UI:addPage("Main", 1, true, 6)
local Main2 = UI:addPage("Auto Farm", 1, true, 6)
local Main3 = UI:addPage("Stats", 1, true, 6)
local Main4 = UI:addPage("Combat", 1, true, 6)
local Main5 = UI:addPage("Teleport", 1, true, 6)
local Main6 = UI:addPage("Player", 1, true, 6)
local Main7 = UI:addPage("Extra", 1, true, 6)

Main:addLabel("This is a Label", "Lol this funny")

Main:addButton("This is a button", function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Clicked",
        Text = "Lo",
    })
end)

Main:addToggle("This is a Toggle", function(value)
    print(value)
    if value == false then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Toggle",
            Text = "false",
        })
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Toggle",
            Text = "true",
        })
    end
end)

Main:addSlider("This is a Slider", 16, 100, function(value)
    print(value)
end)

Main:addTextBox("This is a TextBox", "Um", function(value)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Wrote",
        Text = value,
    })
end)

Main:addDropdown("This is a Dropdown", { "Um", "Yep", "Lop", "GG" }, 1, function(value)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Selected :",
        Text = value,
    })
end)

-- Player

Main6:addLabel("Player", "For player related things")

Main6:addButton("DIE", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

-- Toggle

Main6:addToggle("Sprint", function(value)
    if value == false then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 24
    end
end)

-- Slider

Main6:addSlider("WalkSpeed", 16, 150, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

-- TextBox

Main6:addTextBox("Jump Power / 50 is default", "Number here", function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(value) or 50
end)

-- Dropdown 

local PLIST = {}

for _, player in ipairs(game.Players:GetPlayers()) do
    table.insert(PLIST, player.DisplayName)
end

Main6:addDropdown("Teleport to Player", PLIST, 4, function(value)
    local selectedPlayer = game.Players:FindFirstChild(value)
    if selectedPlayer then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = selectedPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 1)
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Teleport",
            Text = "Player not found!",
        })
    end
end)
