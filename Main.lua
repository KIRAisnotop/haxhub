if your_key = loadstring(game:HttpGet("https://pastebin.com/raw/56twTRwj"))
    --// Rayfield Loader Setup
    print("Hax Hub loading!")
    local loadingmessage = Instance.new("Message")
    loadingmessage.Parent = game.Workspace
    loadingmessage.Text = "Hax Hub loading..."
    task.wait(3)
    loadingmessage:Destroy()
    local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

    --// Create the GUI Window
    local Window = Rayfield:CreateWindow({
        Name = "Hax Hub GUI",
        LoadingTitle = "Loading Hax Hub...",
        LoadingSubtitle = "by KIRAhello90",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "HaxHubData",
            FileName = "HaxHubConfig"
        },
        Discord = {
            Enabled = false,
            Invite = "",
            RememberJoins = true
        },
        KeySystem = false
    })

    --// Define Game Place IDs
    local PRISON_LIFE_ID = 155615604
    local DOORS_ID = 6516141723
    local JAILBREAK_ID = 606849621

    --// Get Current Game Place ID
    local placeId = game.PlaceId

    --// PRISON LIFE Section
    if placeId == PRISON_LIFE_ID then
        local PrisonTab = Window:CreateTab("Prison Life", 4483362458)

        PrisonTab:CreateButton({
            Name = "Kill All",
            Callback = function()
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local Backpack = LocalPlayer:FindFirstChild("Backpack")

                if Backpack then
                    local Gun = Backpack:FindFirstChildOfClass("Tool")
                    if Gun then
                        Gun.Parent = LocalPlayer.Character
                        for _, player in ipairs(Players:GetPlayers()) do
                            if player ~= LocalPlayer then
                                game:GetService("ReplicatedStorage").ShootEvent:FireServer(player.Character.Head.Position)
                            end
                        end
                    else
                        Rayfield:Notify({
                            Title = "Error",
                            Content = "No gun found in your backpack!",
                            Duration = 5
                        })
                    end
                end
            end
        })

        PrisonTab:CreateButton({
            Name = "Infinite Ammo",
            Callback = function()
                local mt = getrawmetatable(game)
                setreadonly(mt, false)
                local oldNamecall = mt.__namecall

                mt.__namecall = newcclosure(function(self, ...)
                    local args = {...}
                    if tostring(self) == "ReloadEvent" then
                        args[1] = math.huge
                    end
                    return oldNamecall(self, unpack(args))
                end)

                Rayfield:Notify({
                    Title = "Success",
                    Content = "Infinite ammo activated!",
                    Duration = 5
                })
            end
        })
    end

    --// DOORS Section
    if placeId == DOORS_ID then
        local DoorsTab = Window:CreateTab("DOORS", 4483362458)

        DoorsTab:CreateButton({
            Name = "Skip Room",
            Callback = function()
                game:GetService("ReplicatedStorage").GameData.LatestRoom.Value += 1
                Rayfield:Notify({
                    Title = "Success",
                    Content = "Skipped to the next room!",
                    Duration = 5
                })
            end
        })

        DoorsTab:CreateButton({
            Name = "Spawn Seek",
            Callback = function()
                local Seek = game:GetService("ReplicatedStorage").Entities.Seek:Clone()
                Seek.Parent = workspace
                Seek:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10))

                Rayfield:Notify({
                    Title = "Spawned",
                    Content = "Seek has been spawned behind you!",
                    Duration = 5
                })
            end
        })

        DoorsTab:CreateButton({
            Name = "Spawn Eyes",
            Callback = function()
                local Eyes = game:GetService("ReplicatedStorage").Entities.Eyes:Clone()
                Eyes.Parent = workspace
                Eyes:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10))

                Rayfield:Notify({
                    Title = "Spawned",
                    Content = "Eyes have been spawned!",
                    Duration = 5
                })
            end
        })

        DoorsTab:CreateButton({
            Name = "Give Crucifix",
            Callback = function()
                local Crucifix = game:GetService("ReplicatedStorage").Tools:FindFirstChild("Crucifix"):Clone()
                local Backpack = game.Players.LocalPlayer:FindFirstChild("Backpack")

                if Crucifix and Backpack then
                    Crucifix.Parent = Backpack
                    Rayfield:Notify({
                        Title = "Success",
                        Content = "Crucifix has been added to your inventory!",
                        Duration = 5
                    })
                else
                    Rayfield:Notify({
                        Title = "Error",
                        Content = "Failed to find Crucifix or Backpack!",
                        Duration = 5
                    })
                end
            end
        })
    end

    --// JAILBREAK Section
    if placeId == JAILBREAK_ID then
        local JailbreakTab = Window:CreateTab("Jailbreak", 4483362458)

        JailbreakTab:CreateButton({
            Name = "Get All Guns",
            Callback = function()
                local gunShop = game:GetService("Workspace").GunShop
                local player = game.Players.LocalPlayer

                for _, gun in ipairs(gunShop:GetChildren()) do
                    local clone = gun:Clone()
                    clone.Parent = player.Backpack
                end

                Rayfield:Notify({
                    Title = "Success",
                    Content = "All guns have been added to your inventory!",
                    Duration = 5
                })
            end
        })

        JailbreakTab:CreateButton({
            Name = "Infinite Nitro",
            Callback = function()
                local mt = getrawmetatable(game)
                setreadonly(mt, false)
                local oldIndex = mt.__index

                mt.__index = newcclosure(function(self, key)
                    if tostring(self) == "Nitro" and key == "Value" then
                        return math.huge
                    end
                    return oldIndex(self, key)
                end)

                Rayfield:Notify({
                    Title = "Activated",
                    Content = "Infinite Nitro enabled!",
                    Duration = 5
                })
            end
        })

        JailbreakTab:CreateButton({
            Name = "Auto Rob",
            Callback = function()
                local placesToRob = {"Bank", "JewelryStore", "Museum", "PowerPlant"}
                for _, place in ipairs(placesToRob) do
                    local robSpot = game:GetService("Workspace"):FindFirstChild(place)
                    if robSpot then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = robSpot.CFrame
                        task.wait(5) -- Simulate robbing time
                    end
                end

                Rayfield:Notify({
                    Title = "Success",
                    Content = "Auto Rob completed!",
                    Duration = 5
                })
            end
        })
    end

    --// Universal Features
    local UniversalTab = Window:CreateTab("Universal", 4483362458)

    UniversalTab:CreateSlider({
        Name = "Walkspeed",
        Range = {16, 100},
        Increment = 1,
        Suffix = "Speed",
        CurrentValue = 16,
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    })

    UniversalTab:CreateSlider({
        Name = "Jump Power",
        Range = {50, 300},
        Increment = 10,
        Suffix = "Power",
        CurrentValue = 50,
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        end
    })

    UniversalTab:CreateButton({
        Name = "Fly",
        Callback = function()
            local player = game.Players.LocalPlayer
            local mouse = player:GetMouse()
            local flying = false
            local speed = 50
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            bodyVelocity.Velocity = Vector3.zero
            
            mouse.KeyDown:Connect(function(key)
                if key == "e" then
                    flying = not flying
                    if flying then
                        bodyVelocity.Parent = player.Character.HumanoidRootPart
                        bodyVelocity.Velocity = Vector3.new
                        bodyVelocity.Velocity = Vector3.new(0, speed, 0)
                    else
                        bodyVelocity.Parent = nil
                    end
                end
            end)

            game:GetService("RunService").RenderStepped:Connect(function()
                if flying then
                    bodyVelocity.Velocity = Vector3.new(mouse.Hit.LookVector.X * speed, bodyVelocity.Velocity.Y, mouse.Hit.LookVector.Z * speed)
                end
            end)

            Rayfield:Notify({
                Title = "Activated",
                Content = "Press 'E' to toggle fly mode!",
                Duration = 5
            })
        end
    })

    Rayfield:Notify({
        Title = "Welcome!",
        Content = "Script Loaded! Enjoy your gameplay!",
        Duration = 5
    })
else:
    local plr = game.Players.LocalPlayer
    plr:Kick("Wrong Key")
