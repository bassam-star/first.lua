loadstring(game:HttpGet("https://raw.githubusercontent.com/bassam-star/first.lua/main/easyobby.lua"))()


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Venox Hub",
   LoadingTitle = "Venox Scripts",
   LoadingSubtitle = "by Iamokplees",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub
   }
})

local MainTab = Window:CreateTab("Home🏡", nil) -- Title, Image
local Section = MainTab:CreateSection("Main")

local Button = MainTab:CreateButton({
   Name = "inf jump",
   Callback = function()
   local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
   end,
})


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

local Tab = Window:CreateTab("Credit",nil) -- Title, Image

local Section = Tab:CreateSection("")
local Label = Tab:CreateLabel("made by Iamokplees")
local Paragraph = Tab:CreateParagraph({Title = "", Content = "This is my first cript iam sorry if there are bugs😔"})
