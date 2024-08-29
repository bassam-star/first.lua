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
