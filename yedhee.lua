local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local Camera = require(game.ReplicatedStorage.Util.CameraShaker)
Camera:Stop()
coroutine.wrap(function()
    game:GetService("RunService").Stepped:Connect(function()
        if getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack then
            getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack = 0
            getupvalues(CombatFramework)[2]['activeController'].hitboxMagnitude = 25
        end
    end)
end)()

function checklevel()
    local level = game.Players.LocalPlayer.Data.Level.Value
    if level == 2300 or level <= 2324 then
    Mons = "Cocoa Warrior [Lv. 2325]"
    Q = "ChocQuest1"
    QN = 1
    elseif level == 2325 or level <= 2349 then
    Mons = "Chocolate Bar Battler [Lv. 2350]"
    Q = "ChocQuest1"
    QN = 2
    elseif level == 2350 or level <= 2374 then
    Mons = "Sweet Thief [Lv. 2375]"
    Q = "ChocQuest2"
    QN = 1
    elseif level >= 2375 then
    Mons = "Candy Rebel [Lv. 2400]"
    Q = "ChocQuest2"
    QN = 2
end
end

local Weaponlist = {}
local Weapon = nil

for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    table.insert(Weaponlist,v.Name)
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("5TX4Z | BF 20 Bath | For New Update", 5013109572)
 
 
local page = venyx:addPage("Auto Farm", 5012544693)
local farm = page:addSection("Auto Farm")
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

farm:addToggle("Auto Farm", "", function(value)
_G.Fa = value
_G.Fa2 = value
_G.Fa3 = value
end)

farm:addDropdown("Select Weapon", Weaponlist, function(abcd)
    Weapon = abcd
end)

farm:addButton("Refresh", function()
        table.clear(Weaponlist)
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
   table.insert(Weaponlist,v.Name)
end
end)

farm:addToggle("Auto Equip", "", function(value)
_G.Equip = value
end)


farm:addKeybind("Toggle Keybind", Enum.KeyCode.RightControl, function()
print("Activated Keybind")
venyx:toggle()
end, function()
print("Changed Keybind")
end)


spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa then
            checklevel()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies[Mons].HumanoidRootPart.CFrame * CFrame.new(0,15,0)            
            
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
    
local args = {
    [1] = "StartQuest",
    [2] = Q,
    [3] = QN
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

end

        end
    end)
   end)
end)

spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa3 then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    v.HumanoidRootPart.Size = Vector3.new(120,60,120)

v.HumanoidRootPart.CanCollide = false
end
end
end)
        end)
    end)

spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa2 then
getupvalues(CombatFramework)[2]['activeController']:attack()
        end
    end)
end) 
end)

spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa then
            checklevel()
Method = CFrame.new(0,20,0)

spawn(function()
   while wait(3) do
       if Methodnow == 1 then
        Methodnow = 2
        Method = CFrame.new(0,0,20)
        else
        Methodnow = 1
        Method = CFrame.new(0,20,0)
       end
    end
end)

for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    for i2,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == Mons and v2.Name == Mons then
                            v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                            v2.HumanoidRootPart.CanCollide = false
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * Method
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
end
            
                    end
    end)
   end)
end)

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and _G.Fa then
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end)

spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Equip then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Weapon))
        end
    end)
   end)
end)

local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(60, 0, 200),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(241, 146, 255)
}
 
 
for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end
 
-- load
venyx:SelectPage(venyx.pages[1], true)
