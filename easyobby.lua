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
local JumpCount = 0
local MaxJumps = 2
local FlySpeed = 50 -- Adjust flying speed here

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
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")

    if not hrp then
        return
    end

    if Flying then
        if not Typing then
            -- Disable gravity and allow manual movement
            hrp.Anchored = true
            humanoid.PlatformStand = true
            
            -- Handle flying movement
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
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveDirection = moveDirection + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                moveDirection = moveDirection + Vector3.new(0, -1, 0)
            end
            -- Normalize direction to ensure consistent movement speed
            if moveDirection.Magnitude > 0 then
                moveDirection = moveDirection.Unit * FlySpeed
            end
            -- Update the position
            hrp.Position = hrp.Position + moveDirection * RunService.RenderStepped:Wait()
        end
    else
        -- Reset properties when not flying
        if hrp then
            hrp.Anchored = false
        end
        humanoid.PlatformStand = false
        humanoid.WalkSpeed = 16
    end
end)

UserInputService.InputBegan:Connect(function(Input, gameProcessedEvent)
    if gameProcessedEvent then return end -- Ignore input if the game has already been processed

    local player = Players.LocalPlayer
    if not player or not player.Character or not player.Character:FindFirstChild("Humanoid") then
        return
    end

    local humanoid = player.Character.Humanoid

    -- Check for jump
    if Input.KeyCode == Enum.KeyCode.Space then
        if humanoid:GetState() == Enum.HumanoidStateType.Physics or humanoid:GetState() == Enum.HumanoidStateType.Freefall then
            JumpCount = JumpCount + 1
        end

        if JumpCount >= MaxJumps then
            if not Flying then
                Flying = true
                JumpCount = 0 -- Reset jump count after starting to fly
            end
        end
    end

    -- Toggle flying mode with the key
    if Input.KeyCode == Key then
        Flying = not Flying
        
        if not Flying then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Anchored = false
            end
            humanoid.PlatformStand = false
            humanoid.WalkSpeed = 16
            JumpCount = 0 -- Reset jump count when flying is disabled
        end
    end
end)

-- Reset jump count when touching the ground
Players.LocalPlayer.Character.Humanoid.Jumping:Connect(function()
    JumpCount = 0
end)

Players.LocalPlayer.Character.Humanoid.FreeFalling:Connect(function()
    JumpCount = 0
end)

Players.LocalPlayer.Character.Humanoid.Seated:Connect(function()
    JumpCount = 0
end)

        end,
})

