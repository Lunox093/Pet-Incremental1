local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Pet Incremental",
    LoadingTitle = "Menyanety Hub",
    LoadingSubtitle = "by menyanety",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game -- nil 3na4ut net
       FileName = "YoutubeMenyanetyHub"
    },
    Discord = {
       Enabled = true,
       Invite = "https://discord.gg/gbVWxRFtqt", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Pet Incremental | Key",
       Subtitle = "Link In Discord Server",
       Note = "Join Server From Other Tab",
       FileName = "menyanetyhubkey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"https://pastebin.com/raw/3KjRX86z"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image


local Section = MainTab:CreateSection("Auto Farm")


local Button = MainTab:CreateButton({
   Name = "Auto Evolve",
   Callback = function()
   while true do
   local A_1 = "EvolveAll"
   local Event = game:GetService("ReplicatedStorage").RE
   Event:FireServer(A_1)
   wait(1)
 end 
   end,
})  

local Button = MainTab:CreateButton({
   Name = "Auto Equip",
   Callback = function()
   while true do
   local A_1 = "EquipBest"
   local Event = game:GetService("ReplicatedStorage").RE
   Event:FireServer(A_1)
   wait(1)
 end
   end,
})  

local Button = MainTab:CreateButton({
   Name = "Auto Plasma",
   Callback = function()
   while true do
 local A_1 = "Plasma"
 local A_2 = true
 local Event = game:GetService("ReplicatedStorage").RE
 Event:FireServer(A_1, A_2)
   wait(0.1)
 end
   end,
})

local Button = MainTab:CreateButton({
   Name = "Auto Runes",
   Callback = function()
   while true do
 local A_1 = "Rune"
 local A_2 = "Rune1"
 local Event = game:GetService("ReplicatedStorage").RE
 Event:FireServer(A_1, A_2)
   wait(0.1)
 end
   end,
})

local Button = MainTab:CreateButton({
   Name = "Auto Times",
   Callback = function()
   while true do
      local A_1 = "TimeMachine"
      local A_2 = true
      local Event = game:GetService("ReplicatedStorage").RE
      Event:FireServer(A_1, A_2)
   wait(0.5)
 end
   end,
})

local Button = MainTab:CreateButton({
   Name = "Auto Runes In Mine",
   Callback = function()
   while true do
   local A_1 = "Rune"
   local A_2 = "Rune2"
   local Event = game:GetService("ReplicatedStorage").RE
   Event:FireServer(A_1, A_2)
   wait(0.1)
 end
   end,
})  

local Button = MainTab:CreateButton({
   Name = "Auto Rank",
   Callback = function()
   while true do
   local A_1 = "RankUp"
   local Event = game:GetService("ReplicatedStorage").RE
   Event:FireServer(A_1)
   wait(1)
 end
   end,
}) 


local MiscTab = Window:CreateTab("Misc", 4483362458) -- Title, Image


local Button = MiscTab:CreateButton({
   Name = "Anti AFK",
   Callback = function()
   local VirtualUser = game:GetService("VirtualUser")
 local Players = game:GetService("Players")

 local player = Players.LocalPlayer

 local function antiAfk()
    player.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        warn("Anti-AFK working: " .. os.date("%X"))
    end)
 end

 antiAfk()
 print("Anti-AFK working!")
   end,
})  

local Button = MiscTab:CreateButton({
   Name = "Teleport In Mine",
   Callback = function()
   game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(21.9999847, -9.20376682, -68.75, 0, 0, 1, 0, 1, -0, -1, 0, 0)
   end,
})  

local Slider = MiscTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = MiscTab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 150},
   Increment = 1,
   Suffix = "Jump",
   CurrentValue = 50,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})


local OtherTab = Window:CreateTab("Other", nil) 

local Button = OtherTab:CreateButton({
    Name = "Join Discord",
    Callback = function()
        
        local success, err = pcall(function()
            
            if request then
                request({
                    Url = "http://localhost:6463/rpc?v=1",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        ["Origin"] = "https://discord.com"
                    },
                    Body = game:GetService("HttpService"):JSONEncode({
                        cmd = "INVITE_BROWSER",
                        args = {
                            code = "gbVWxRFtqt"
                        },
                        nonce = game:GetService("HttpService"):GenerateGUID(false)
                    })
                })
            else
                
                setclipboard("https://discord.gg/gbVWxRFtqt")
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Discord",
                    Text = "The link has been copied to the clipboard!",
                    Duration = 5
                })
            end
        end)
        
        if not success then
            local http = game:GetService("HttpService")
            http:JSONDecode(game:HttpGet("https://discord.com/api/v9/invites/gbVWxRFtqt?with_counts=true&with_expiration=true"))
        end
    end
})
