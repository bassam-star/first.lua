 local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Venox Hub",
   LoadingTitle = "Venox Scripts",
   LoadingSubtitle = "by Iamokplees",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Home🏡", nil) -- Title, Image
local Section = MainTab:CreateSection("Main")
local Slider = MainTab:CreateSlider({
   Name = "PlayerSpeed",
   Range = {0, 100},
   Increment = 5,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "SpeedSlider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   getgenv().WalkSpeedValue = 100; --set your desired walkspeed here
local Player = game:service'Players'.LocalPlayer;
Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
end)
Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue; 
   end,
})


local Button = MainTab:CreateButton({
   Name = "Fly",
   Callback = function(Value)
--// Services

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

--// Variables

local Key = Enum.KeyCode.E
local Flying = false
local Typing = false

--// Typing Check

UserInputService.TextBoxFocused:Connect(function()
    Typing = true
end)

UserInputService.TextBoxFocusReleased:Connect(function()
    Typing = false
end)

--// Main

RunService.RenderStepped:Connect(function()
    local player = Players.LocalPlayer
    if not player or not player.Character or not player.Character:FindFirstChild("Humanoid") then
        return
    end

    local humanoid = player.Character.Humanoid
    
    if Flying then
        if not Typing then
            -- Disable gravity while flying
            player.Character.HumanoidRootPart.Anchored = true
            humanoid.PlatformStand = true
            -- Set the position based on user input
            local moveDirection = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDirection = moveDirection + Vector3.new(0, 0, -1)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDirection = moveDirection + Vector3.new(0, 0, 1)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDirection = moveDirection + Vector3.new(-1, 0, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDirection = moveDirection + Vector3.new(1, 0, 0)
            end
            -- Normalize direction to ensure consistent movement speed
            if moveDirection.Magnitude > 0 then
                moveDirection = moveDirection.Unit * 50 -- Adjust the speed as needed
            end
            -- Update the position
            player.Character.HumanoidRootPart.Position = player.Character.HumanoidRootPart.Position + moveDirection * RunService.RenderStepped:Wait()
        end
    else
        -- Reset properties when not flying
        if player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.Anchored = false
        end
        humanoid.PlatformStand = false
        humanoid.WalkSpeed = 16
    end
end)

UserInputService.InputBegan:Connect(function(Input, gameProcessedEvent)
    if gameProcessedEvent then return end -- Ignore input if the game has already processed it

    if Input.KeyCode == Key then
        Flying = not Flying
        
        if not Flying then
            local player = Players.LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = 16 
            end
        end
    end
end)

        end,
})

