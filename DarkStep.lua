-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Prebuilt Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create UI Window
local Window = Rayfield:CreateWindow({
    Name = "Admin Hub",
    LoadingTitle = "Admin Hub",
    LoadingSubtitle = "by Lil Bro",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AdminHub",
        FileName = "AdminHubSettings"
    },
    Discord = {
        Enabled = false
    },
    Keybind = Enum.KeyCode.RightControl
})

-- === Main Tab ===
local MainTab = Window:CreateTab("Executor", 4483362458)
MainTab:CreateSection("Scripts")

MainTab:CreateButton({
    Name = "Load Infinite Yield",
    Description = "Loads Infinite Yield Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

MainTab:CreateButton({
    Name = "Load DarkDex V5",
    Description = "Loads DarkDex Explorer",
    Callback = function()
        local success, result = pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/AlterX404/DarkDEX-V5/refs/heads/main/DarkDEX-V5"))()
        end)
        if not success then
            Rayfield:Notify({
                Title = "DarkDex Load Failed",
                Content = tostring(result),
                Duration = 5,
                Image = "alert-triangle"
            })
        end
    end,
})

-- === RemoteEvent Tab ===
local RemotesTab = Window:CreateTab("Remote Tools", "radio")
RemotesTab:CreateSection("RemoteEvent Trigger")

local remoteName, remoteArgs = "", ""

RemotesTab:CreateInput({
    Name = "RemoteEvent Name",
    PlaceholderText = "Ex: GiveReward",
    RemoveTextAfterFocusLost = false,
    Callback = function(txt)
        remoteName = txt
    end
})

RemotesTab:CreateInput({
    Name = "Remote Arguments (comma-separated)",
    PlaceholderText = 'Ex: 1000, true, "some string"',
    RemoveTextAfterFocusLost = false,
    Callback = function(txt)
        remoteArgs = txt
    end
})

RemotesTab:CreateButton({
    Name = "Fire RemoteEvent",
    Description = "Fires the RemoteEvent with the given arguments",
    Callback = function()
        local remote = ReplicatedStorage:FindFirstChild(remoteName, true)
        if remote and remote:IsA("RemoteEvent") then
            local success, args = pcall(function()
                return loadstring("return {" .. remoteArgs .. "}")()
            end)

            if success then
                remote:FireServer(unpack(args))
                Rayfield:Notify({
                    Title = "Remote Fired",
                    Content = "Successfully fired RemoteEvent.",
                    Duration = 4,
                    Image = "check"
                })
            else
                Rayfield:Notify({
                    Title = "Invalid Arguments",
                    Content = "Check your syntax: comma-separated values, use quotes for strings.",
                    Duration = 5,
                    Image = "alert-triangle"
                })
            end
        else
            Rayfield:Notify({
                Title = "Remote Not Found",
                Content = "Could not find RemoteEvent: " .. remoteName,
                Duration = 5,
                Image = "x"
            })
        end
    end
})
