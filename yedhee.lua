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
    Mons = "Cocoa Warrior [Lv. 2300]"
    Q = "ChocQuest1"
    QN = 1
    CF = CFrame.new(81.6123581, 73.4885483, -12310.6084, -0.493183434, 0, 0.86992532, 0, 1, 0, -0.86992532, 0, -0.493183434)
    elseif level == 2325 or level <= 2349 then
    Mons = "Chocolate Bar Battler [Lv. 2325]"
    Q = "ChocQuest1"
    QN = 2
    CF = CFrame.new(465.203979, 83.0556335, -12584.0361, -0.971542656, 0, -0.236864984, 0, 1, 0, 0.236864984, 0, -0.971542656)
    elseif level == 2350 or level <= 2374 then
    Mons = "Sweet Thief [Lv. 2350]"
    Q = "ChocQuest2"
    QN = 1
    CF = CFrame.new(70.9168167, 77.2218246, -12641.0205, -0.923700452, 0, 0.38311547, 0, 1, 0, -0.38311547, 0, -0.923700452)
    elseif level >= 2375 then
    Mons = "Candy Rebel [Lv. 2375]"
    Q = "ChocQuest2"
    QN = 2
    CF = CFrame.new(136.819168, 77.2219086, -12879.0732, 0.977967858, -2.05951114e-08, -0.208755463, 7.68816621e-10, 1, -9.50548866e-08, 0.208755463, 9.28001214e-08, 0.977967858)
end
end

local Weaponlist = {}
local Weapon = nil

for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    table.insert(Weaponlist,v.Name)
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("5TX4Z | BF 20 Bath | For New Update", 5013109572)
 
 
local page = venyx:addPage("Auto Farm", 7251993295)
local farm = page:addSection("Auto Farm")
local page = venyx:addPage("Auto Stats", 7252023075)
local stat = page:addSection("Auto Stats")
local theme = venyx:addPage("Theme", 7040347038)
local colors = theme:addSection("Colors")

farm:addToggle("Auto Farm", "", function(value)
_G.Fa = value
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

stat:addToggle("Melee", "", function(value)
    _G.M = value
while _G.M do wait(0.1)

local args = {
    [1] = "AddPoint",
    [2] = "Melee",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

end
end)

stat:addToggle("Defense", "", function(value)
    _G.D = value
while _G.D do wait(0.1)

local args = {
    [1] = "AddPoint",
    [2] = "Defense",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

end
end)

stat:addToggle("Sword", "", function(value)
    _G.S = value
while _G.S do wait(0.1)

local args = {
    [1] = "AddPoint",
    [2] = "Sword",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

end
end)

stat:addToggle("Gun", "", function(value)
    _G.G = value
while _G.G do wait(0.1)

local args = {
    [1] = "AddPoint",
    [2] = "Gun",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

end
end)

stat:addToggle("Demon Fruit", "", function(value)
    _G.DF = value
while _G.DF do wait(0.1)

local args = {
    [1] = "AddPoint",
    [2] = "Demon Fruit",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


end
end)

spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa then
            checklevel()
            if game:GetService("Workspace").Enemies[Mons].Humanoid.Health == 0 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CF
elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CF
local args = {
    [1] = "StartQuest",
    [2] = Q,
    [3] = QN
}   

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies[Mons].HumanoidRootPart.CFrame * CFrame.new(0,30,15)
getupvalues(CombatFramework)[2]['activeController']:attack()
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
    v.HumanoidRootPart.Size = Vector3.new(45,90,45)

v.HumanoidRootPart.CanCollide = false
end
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
