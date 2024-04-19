
if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
else
print('Not Support Game')
end

repeat
    task.wait()
until game:IsLoaded()
repeat
    task.wait()
until game.Players
repeat
    task.wait()
until game.Players.LocalPlayer
if game.Players.LocalPlayer.Team==nil then repeat pcall(function()task.wait()if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam")then if string.find(tostring(getgenv().Team),"Pirate")then for a,a in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated))do a.Function()end elseif string.find(tostring(getgenv().Team),"Marine")then for a,a in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated))do a.Function()end else for a,a in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated))do a.Function()end end end end)until game.Players.LocalPlayer.Team~=nil end
local plr = game.Players.LocalPlayer
local CbFw = debug.getupvalues(require(game.Players.LocalPlayer.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

require(game.ReplicatedStorage.Util.CameraShaker):Stop()

function GetBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then 
        return 
    end
    while ret.Parent ~= game.Players.LocalPlayer.Character do 
        ret = ret.Parent 
    end
    return ret
end
DeoCanOxy = 0
function CheckOxy()
  if type(DeoCanOxy) ~= "number" or not DeoCanOxy then
    DeoCanOxy = 0
  end
  DeoCanOxy = DeoCanOxy + 1
  if DeoCanOxy < 200 then
    return "VanOK"
  else
    return "Cuuchiemoi"
  end
end
function Hitoxy()
if not OxyChuanBiNap then
  OxyChuanBiNap = true
  wait(5)
  DeoCanOxy = 0
  OxyChuanBiNap = false
else
  return 'Dangnapoxy'
end
end
function AttackNoCD(Num)
    if Num == 1 then
        if CheckOxy() == "Cuuchiemoi" then
           Hitoxy()
           return "tutubinhtinh"
        end
        local AC = CbFw2.activeController
        for i = 1,1 do 
            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                plr.Character,
                {plr.Character.HumanoidRootPart},
                55
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    table.insert(cac, v.Parent.HumanoidRootPart)
                    hash[v.Parent] = true
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                local u8 = debug.getupvalue(AC.attack, 5)
                local u9 = debug.getupvalue(AC.attack, 6)
                local u7 = debug.getupvalue(AC.attack, 4)
                local u10 = debug.getupvalue(AC.attack, 7)
                local u12 = (u8 * 798405 + u7 * 727595) % u9
                local u13 = u7 * 798405
                (function()
                    u12 = (u12 * u9 + u13) % 1099511627776
                    u8 = math.floor(u12 / u9)
                    u7 = u12 - u8 * u9
                end)()
                u10 = u10 + 1
                debug.setupvalue(AC.attack, 5, u8)
                debug.setupvalue(AC.attack, 6, u9)
                debug.setupvalue(AC.attack, 4, u7)
                debug.setupvalue(AC.attack, 7, u10)
                pcall(function()
                    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                        AC.animator.anims.basic[1]:Play(0.001,0.001,0.001)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetBlade()))
                        game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
                    end
                end)
            end
        end
    elseif Num == 0 then
        local AC = CbFw2.activeController
        for i = 1,1 do 
            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                plr.Character,
                {plr.Character.HumanoidRootPart},
                55
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    table.insert(cac, v.Parent.HumanoidRootPart)
                    hash[v.Parent] = true
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                pcall(function()
                    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                        for i,CombatFrameworkR in pairs(CbFw) do
                            pcall(function()
                                if i == 2 then
                                    CombatFrameworkR.activeController.increment = 4
                                    CombatFrameworkR.activeController.hitboxMagnitude = 55
                                    CombatFrameworkR.activeController.timeToNextAttack = tick()
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(1300,760))
                                end
                            end)
                        end
                    end
                end)
            end
        end
    end
end

local STOP = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle)
local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)

if not shared.orl then
    shared.orl = STOPRL.wrapAttackAnimationAsync
end

if not shared.cpc then
    shared.cpc = STOP.play 
end

spawn(function()
    while task.wait() do
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)                
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end         
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end      
        end
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)                
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end         
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end      
        end
    end
end)

spawn(function()
    while task.wait() do
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = function() end
                a:Play(0.01,0.01,0.01)
                func(Hits)                
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end             
        end
    end
end)

spawn(function()
    while task.wait() do
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = shared.cpc
                func(Hits)   
            end             
        end
    end
end)

spawn(function()
    while task.wait() do 
        pcall(function()
            if true or false then
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    AttackNoCD(0)
                end
            end
        end)
    end
end)

b2 = tick()
spawn(function()
    while wait(0.1) do
        if b2 - tick() > 1.5 then
            wait(0.01)
            b2 = tick()
        end
        pcall(function()
            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
                AttackNoCD(1)
            end
        end)
    end
end)
local library = {}
local titlefunc = {}
local UIConfig = {
  Bind = Enum.KeyCode.RightControl
}
    
    for _, Interface in ipairs(game.CoreGui:GetChildren()) do
   if Interface.Name == "UICloud" or Interface.Name == "TurnCloud" then
      Interface:Destroy()
   end
end


local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
local length = 20
local randomString = ""
math.randomseed(os.time())
charTable = {}
for c in chars:gmatch "." do
table.insert(charTable, c)
end
for i = 1, length do
randomString = randomString .. charTable[math.random(1, #charTable)]
end
for i, v in pairs(game.CoreGui:GetChildren()) do
if v.ClassName == "ScreenGui" then
for i1, v1 in pairs(v:GetChildren()) do
if v1.Name == "Main" then
do
local ui = v
if ui then
ui:Destroy()
end
end
end
end
end
end

_G.Color = Color3.fromRGB(0, 0, 255)
function Turn_function(config,config1)
task.spawn(function()
 while wait() do
   if config then
    config1()
   end
 end
end)
end
function CircleClick(Button, X, Y)
coroutine.resume(
  coroutine.create(
    function()
    local Circle = Instance.new("ImageLabel")
    Circle.Parent = Button
    Circle.Name = "Circle"
    Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Circle.BackgroundTransparency = 1.000
    Circle.ZIndex = 10
    Circle.Image = "rbxassetid://16991318748"
    Circle.ImageColor3 = Color3.fromRGB(255, 255, 255)
    Circle.ImageTransparency = 0.7
    Circle.Visible = false
    local NewX = X - Circle.AbsolutePosition.X
    local NewY = Y - Circle.AbsolutePosition.Y
    Circle.Position = UDim2.new(0, NewX, 0, NewY)
    local Time = 0.2
    Circle:TweenSizeAndPosition(
      UDim2.new(0, 30.25, 0, 30.25),
      UDim2.new(0, NewX - 15, 0, NewY - 10),
      "Out",
      "Quad",
      Time,
      false,
      nil
    )
    for i = 1, 10 do
    Circle.ImageTransparency = Circle.ImageTransparency + 0.01
    wait(Time / 10)
    end
    Circle:Destroy()
    end
  )
)
end

local NexusApi = "Gojo 1/2 Hub"
local filename = "BloxFruits.json"
local foldername = "Gojo 1/2 Hub"
_G.Settings = {
    DropRaceDoor = "Automatic",
    TweenSpeed = 300,
    ["Attack No CD Aura"] = false,
    ["Ignore Y"] = false,
    ["CDAAT"] = 80,
    ["TimeWait"] = 10,
    ["ChoosenRaid"] = {"Flame"},
    AutoExecutes = true,
    AutoRejoin = true,
    DeleteEffect = true,
    FastAttack = true,
    PostionZ = 15,
    PostionX = 15,
    PostionY = 15,
    VisualsMelee = {"BlackLeg"},
    VisualsSword = {"Cutlass Katana"},
    VisualsGun = {"Slingshot"},
    VisualsHaki = {"Buso"}

}
function saveSettings()
    local HttpService = game:GetService("HttpService")
    local json = HttpService:JSONEncode(_G.Settings)
    if (writefile) then
        if isfolder(foldername) then
            if isfile(foldername.."\\"..filename) then
                writefile(foldername.."\\"..filename, json)
            else
                writefile(foldername.."\\"..filename, json)
            end
        else
            makefolder(foldername)
            writefile(foldername.."\\"..filename, json)
        end
    end
end
function loadSettings()
    local HttpService = game:GetService("HttpService")
    if isfile(foldername.."\\"..filename) then
        _G.Settings = HttpService:JSONDecode(readfile(foldername.."\\"..filename))
    end
end
loadSettings()
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
function dragify(Frame, object)
dragToggle = nil
dragSpeed = .25
dragInput = nil
dragStart = nil
dragPos = nil
function updateInput(input)
Delta = input.Position - dragStart
Position =
UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
game:GetService("TweenService"):Create(object, TweenInfo.new(dragSpeed), {
  Position = Position
}):Play()
end
Frame.InputBegan:Connect(
  function(input)
  if
    (input.UserInputType == Enum.UserInputType.MouseButton1 or
    input.UserInputType == Enum.UserInputType.Touch)
  then
  dragToggle = true
  dragStart = input.Position
  startPos = object.Position
  input.Changed:Connect(
    function()
    if (input.UserInputState == Enum.UserInputState.End) then
    dragToggle = false
    end
    end
  )
  end
  end
)
Frame.InputChanged:Connect(
  function(input)
  if
    (input.UserInputType == Enum.UserInputType.MouseMovement or
    input.UserInputType == Enum.UserInputType.Touch)
  then
  dragInput = input
  end
  end
)
game:GetService("UserInputService").InputChanged:Connect(
  function(input)
  if (input == dragInput and dragToggle) then
  updateInput(input)
  end
  end
)
end

for _, Interface in ipairs(game.CoreGui:GetChildren()) do
  if Interface.Name == "UICloud" or Interface.Name == "TurnCloud" then
     Interface:Destroy()
  end
end
local ThunderScreen = Instance.new("ScreenGui")
local ThunderToggleUI = Instance.new("TextButton")
local ThunderImageUI = Instance.new("ImageLabel")
ThunderScreen.Name = "TurnCloud"
ThunderScreen.Parent = game.CoreGui
ThunderScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ThunderToggleUI.Name = "ThunderToggleUI"
ThunderToggleUI.Parent = ThunderScreen
ThunderToggleUI.BackgroundColor3 = Color3.fromRGB(31,31,31)
ThunderToggleUI.BorderSizePixel = 0
ThunderToggleUI.Position = UDim2.new(0.03, 0, 0.02, 0)
ThunderToggleUI.Size = UDim2.new(0, 50, 0, 50)
ThunderToggleUI.Font = Enum.Font.SourceSansBold
ThunderToggleUI.Text = ""
ThunderToggleUI.TextColor3 = Color3.fromRGB(0, 0, 0)
ThunderToggleUI.TextSize = 14.000
ThunderToggleUI.Draggable = true
ThunderToggleUI.MouseButton1Click:Connect(function()
game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)
local ThunderCornerUI = Instance.new("UICorner")
ThunderCornerUI.Name = "ThunderCornerUI"
ThunderCornerUI.Parent = ThunderToggleUI
ThunderImageUI.Name = "MODILEMAGE"
ThunderImageUI.Parent = ThunderToggleUI
ThunderImageUI.BackgroundColor3 = Color3.fromRGB(192,192,192)
ThunderImageUI.BackgroundTransparency = 1.000
ThunderImageUI.BorderSizePixel = 0
ThunderImageUI.Position = UDim2.new(0.0, 0, 0.0, 0)
ThunderImageUI.Size = UDim2.new(0, 50, 0, 50)
ThunderImageUI.Image = "rbxassetid://16991318748"
local ThunderCornerUI = Instance.new("UICorner")
ThunderCornerUI.Name = "ThunderCornerUI"
ThunderCornerUI.Parent = ThunderImageUI
local UI = Instance.new("ScreenGui")
UI.Name = "UICloud"
UI.Parent = game.CoreGui
UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if syn then
syn.protect_gui(UI)
end

function library:CreateLibrary()
local Main = Instance.new("Frame")
local Imgaemain = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Top = Instance.new("Frame")
local TabHolder = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")
local TabContainer = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local Title = Instance.new("TextLabel")

Main.Name = "Main"
Main.Parent = UI
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.Size = UDim2.new(0, 520, 0, 320)
Main.ClipsDescendants = true
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundTransparency = 0
local SizeMini = Instance.new("TextButton")
SizeMini.BorderSizePixel = 0
SizeMini.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SizeMini.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SizeMini.Position = UDim2.new(0.913462, 0, 0.853125, 0)
SizeMini.TextSize = 14
SizeMini.Size = UDim2.new(0, 45, 0, 45)
SizeMini.Name = "SizeMini"
SizeMini.TextColor3 = Color3.fromRGB(0, 0, 0)
SizeMini.BorderColor3 = Color3.fromRGB(0, 0, 0)
SizeMini.Text = ""
SizeMini.TextTransparency = 1
SizeMini.BackgroundTransparency = 1
SizeMini.Parent = Main
local isResizing = false
local originalMousePosition = nil
local originalFrameSize = Main.Size
SizeMini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isResizing = true
        originalMousePosition = input.Position
        originalFrameSize = Main.Size
    end
end)
SizeMini.InputChanged:Connect(function(input)
    if isResizing and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - originalMousePosition
        local newWidth = originalFrameSize.X.Offset + delta.X
        local newHeight = originalFrameSize.Y.Offset + delta.Y
        newWidth = math.max(newWidth, 280) 
        newHeight = math.max(newHeight, 30)
        Main.Size = UDim2.new(0, newWidth, 0, newHeight)
    end
end)
SizeMini.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isResizing = false
    end
end)
local UiToggle_UiStroke256 = Instance.new("UIStroke")
UiToggle_UiStroke256.Color = Color3.fromRGB(0, 0, 255)
UiToggle_UiStroke256.Thickness = 3
UiToggle_UiStroke256.Transparency = 0.9
UiToggle_UiStroke256.Name = "UiToggle_UiStroke1"
UiToggle_UiStroke256.Parent = Main

UICorner.CornerRadius = UDim.new(0, 2)
UICorner.Parent = Main

local uitoggled = false
UserInputService.InputBegan:Connect(
    function(io, p)
    if io.KeyCode == UIConfig.Bind then
    if uitoggled == false then
    Main:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1, true)
    uitoggled = true
    wait(.5)
    UI.Enabled = false
    else
        Main:TweenSize(
        UDim2.new(0, 520, 0, 350),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quart,
        1,
        true
    )
    UI.Enabled = true
    uitoggled = false
    end
    end
    end)

local HeaderTop = Instance.new("Frame")
HeaderTop.Name = "Top"
HeaderTop.Parent = Main
HeaderTop.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
HeaderTop.BackgroundTransparency = 0
HeaderTop.Position = UDim2.new(0, 0, 0, 0)
HeaderTop.Size = UDim2.new(0, 520, 0, 35)

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = HeaderTop

Title.Name = "Title"
Title.Parent = HeaderTop
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.02, 0, 0.02, 0)
Title.Size = UDim2.new(0, 483, 0, 31)
Title.Font = Enum.Font.LuckiestGuy
Title.Text = "Gojo 1/2 Hub | ".."<font color='rgb(0, 0, 255)'>[Testings]</font> 🇻🇳"
Title.RichText = true;
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 12.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Main
Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top.BackgroundTransparency = 1.000
Top.Position = UDim2.new(0.021956088, 0, 0.1833337, 0)
Top.Size = UDim2.new(0, 490, 0, 39)


local ClickFrame = Instance.new("Frame")
ClickFrame.Name = "Top"
ClickFrame.Parent = Main
ClickFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClickFrame.BackgroundTransparency = 1
ClickFrame.Position = UDim2.new(0, 0, 0, 0)
ClickFrame.Size = UDim2.new(0, 520, 0, 50)
TabHolder.Name = "TabHolder"
TabHolder.Parent = Top
TabHolder.Position = UDim2.new(-0.010309278, 6, -0.5323075824, 0)
TabHolder.Size = UDim2.new(0, 495, 0, 38)
TabHolder.BackgroundTransparency = 1
UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = TabHolder
TabContainer.Name = "TabContainer"
TabContainer.Parent = TabHolder
TabContainer.Active = true
TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabContainer.BackgroundTransparency = 1.000
TabContainer.Size = UDim2.new(0, 495, 0, 38)
TabContainer.CanvasSize = UDim2.new(2, 0, 0, 0)
TabContainer.ScrollBarThickness = 0
TabContainer.VerticalScrollBarInset = Enum.ScrollBarInset.Always
UIListLayout.Parent = TabContainer
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 15)
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
  function()
  TabContainer.CanvasSize = UDim2.new(0, UIListLayout.AbsoluteContentSize.X, 0, 0)
  end
)
UIPadding.Parent = TabContainer
UIPadding.PaddingLeft = UDim.new(0, 3)
UIPadding.PaddingTop = UDim.new(0, 3)
local Bottom = Instance.new("Frame")
Bottom.Name = "Bottom"
Bottom.Parent = Main
Bottom.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Bottom.BackgroundTransparency = 1.000
Bottom.Position = UDim2.new(0.0119760484, 7, 0.2416666687, 0)
Bottom.Size = UDim2.new(0, 500, 0, 200)

local Menu_Setting = Instance.new("ImageButton")
Menu_Setting.Name = "Menu_Setting"
Menu_Setting.Parent = HeaderTop
Menu_Setting.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Menu_Setting.BackgroundTransparency = 1
Menu_Setting.Position = UDim2.new(0, 450, 0, 7)
Menu_Setting.Size = UDim2.new(0, 25, 0, 25)
Menu_Setting.Image = "http://www.roblox.com/asset/?id=14479606771"

Menu_Setting.ImageColor3 = Color3.fromRGB(255, 255, 255)
Menu_Setting.ZIndex = 10

local Settings = Instance.new("ImageButton")
Settings.Name = "Settings"
Settings.Parent = Main
Settings.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Settings.BackgroundTransparency = 1
Settings.Position = UDim2.new(0, 480, 0, 7)
Settings.Size = UDim2.new(0, 25, 0, 25)
Settings.Image = "http://www.roblox.com/asset/?id=14479568523"
Settings.ImageColor3 = Color3.fromRGB(255, 255, 255)
Settings.ZIndex = 10

local UserImageCorner1 = Instance.new("UICorner")
UserImageCorner1.CornerRadius = UDim.new(0, 60)
UserImageCorner1.Name = "UserImageCorner"
UserImageCorner1.Parent = Menu_Setting

local BtnStroke = Instance.new("UIStroke")
BtnStroke.Name = "BtnStroke"
BtnStroke.Parent = Menu_Setting
BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
BtnStroke.Color = _G.Color
BtnStroke.LineJoinMode = Enum.LineJoinMode.Round
BtnStroke.Thickness = 0
BtnStroke.Transparency = 0
BtnStroke.Enabled = true
BtnStroke.Archivable = true

local MainPage = Instance.new("Frame")
MainPage.Name = "MainPage"
MainPage.Parent = Main
MainPage.ClipsDescendants = true
MainPage.AnchorPoint = Vector2.new(0,0)
MainPage.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
MainPage.Position = UDim2.new(0, -250, 0, 50)
MainPage.BackgroundTransparency = 0
MainPage.Size = UDim2.new(0, 240, 0, 240)
MainPage.ZIndex = 6

local postog123 = Instance.new("UIStroke")

postog123.Name = "UIStroke"
postog123.Parent = MainPage
postog123.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
postog123.Color = _G.Color
postog123.LineJoinMode = Enum.LineJoinMode.Round
postog123.Thickness = 2
postog123.Transparency = 0.5
postog123.Enabled = true
postog123.Archivable = true

Menu_Setting.MouseButton1Click:Connect(function()
  if MainPageclose == false then
  MainPageclose = true
  MainPage:TweenPosition(UDim2.new(0, -250, 0, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.8, true)
  else
    MainPageclose = false
  MainPage:TweenPosition(UDim2.new(0, 10, 0, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.8, true)
  end
  end)

local StaminaBarUICorner1 = Instance.new("UICorner")
StaminaBarUICorner1.CornerRadius = UDim.new(0, 10)
StaminaBarUICorner1.Name = "StaminaBarUICorner1"
StaminaBarUICorner1.Parent = MainPage


local UserID = game.Players.LocalPlayer.UserId

local ThumbType = Enum.ThumbnailType.HeadShot
local ThumbSize = Enum.ThumbnailSize.Size420x420
local Content = game.Players:GetUserThumbnailAsync(UserID,ThumbType,ThumbSize)

local PlayerInfoFrame = Instance.new("Frame")
local PlayerInfoFrameUICorner = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Name = Instance.new("TextLabel")
local Lvl = Instance.new("TextLabel")
local Fruit = Instance.new("TextLabel")

local Line = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")

Line.Name = "Line"
Line.Parent = PlayerInfoFrame
Line.AnchorPoint = Vector2.new(0.5, 0.5)
Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line.BorderSizePixel = 0
Line.BackgroundTransparency = 1
Line.Position = UDim2.new(0.5, 0, 0.311723471, 0)
Line.Size = UDim2.new(0, 300, 0, 1)

UIGradient.Color = ColorSequence.new {
  ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30,30,30)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.68, Color3.fromRGB(170, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30,30,30))}
UIGradient.Parent = Line

PlayerInfoFrame.Name = "PlayerInfoFrame"
PlayerInfoFrame.Parent = MainPage
PlayerInfoFrame.Active = true
PlayerInfoFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
PlayerInfoFrame.BackgroundTransparency = 1
PlayerInfoFrame.BorderSizePixel = 0
PlayerInfoFrame.Size = UDim2.new(0, 300, 0, 285)

PlayerInfoFrameUICorner.Name = "PlayerInfoFrameUICorner"
PlayerInfoFrameUICorner.Parent = PlayerInfoFrame

ImageLabel.Parent = PlayerInfoFrame
ImageLabel.Active = true
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0, 40, 0, 45)
ImageLabel.Size = UDim2.new(0, 70, 0, 70)
ImageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"

local UserImageCorner = Instance.new("UICorner")
UserImageCorner.CornerRadius = UDim.new(0, 40)
UserImageCorner.Name = "UserImageCorner"
UserImageCorner.Parent = ImageLabel

UICorner.Parent = ImageLabel

Name.Name = "Name"
Name.Parent = PlayerInfoFrame
Name.Active = true
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0.22916666, 0, 0, 0)
Name.Size = UDim2.new(0, 150, 0, 27)
Name.Font = Enum.Font.SourceSansBold
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextSize = 9.000
Name.Text = game.Players.LocalPlayer.Name.. " ("..game.Players.LocalPlayer.DisplayName..")"
Name.TextXAlignment = Enum.TextXAlignment.Left

local HealthBar = Instance.new("Frame")
local HealthBarUICorner = Instance.new("UICorner")
local HealthText = Instance.new("TextLabel")
local Line = Instance.new("Frame")
local LineHealth = Instance.new("Frame")

HealthBar.Name = "HealthBar"
HealthBar.Parent = PlayerInfoFrame
HealthBar.BackgroundColor3 = Color3.fromRGB(40,40,40)
HealthBar.BorderSizePixel = 0
HealthBar.BackgroundTransparency = 1
HealthBar.Position = UDim2.new(0.0187500007, 0, 0.340836018, 0)
HealthBar.Size = UDim2.new(0, 150, 0, 45)

HealthBarUICorner.CornerRadius = UDim.new(0, 4)
HealthBarUICorner.Name = "HealthBarUICorner"
HealthBarUICorner.Parent = HealthBar

HealthText.Name = "HealthText"
HealthText.Parent = HealthBar
HealthText.Active = true
HealthText.BackgroundColor3 = _G.Color
HealthText.BackgroundTransparency = 1.000
HealthText.Position = UDim2.new(0.0260000005, 0, 0.100000001, 0)
HealthText.Size = UDim2.new(0, 300, 0, 22)
HealthText.Font = Enum.Font.SourceSansBold
HealthText.Text = "N/A"
HealthText.TextColor3 = _G.Color
HealthText.TextSize = 12.000
HealthText.TextWrapped = true
HealthText.TextXAlignment = Enum.TextXAlignment.Left

Line.Name = "Line"
Line.Parent = HealthBar
Line.AnchorPoint = Vector2.new(0.5, 0.5)
Line.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0.498908311, 0, 0.766666651, 0)
Line.Size = UDim2.new(0, 150, 0, 5)

LineHealth.Name = "LineHealth"
LineHealth.Parent = Line
LineHealth.BackgroundColor3 = _G.Color
LineHealth.BorderSizePixel = 0
LineHealth.Size = UDim2.new(0, 200, 0, 5)

Lvl.Name = "Time"
Lvl.Parent = PlayerInfoFrame
Lvl.Active = true
Lvl.BackgroundColor3 = _G.Color
Lvl.BackgroundTransparency = 1.000
Lvl.Position = UDim2.new(0, 85, 0.113057934, 0)
Lvl.Size = UDim2.new(0, 200, 0, 27)
Lvl.TextTransparency = 0
Lvl.Font = Enum.Font.SourceSansBold
Lvl.TextColor3 = _G.Color
Lvl.TextSize = 11.000
Lvl.TextXAlignment = Enum.TextXAlignment.Left

Fruit.Name = "UsedTime"
Fruit.Parent = PlayerInfoFrame
Fruit.Active = true
Fruit.BackgroundColor3 = _G.Color
Fruit.BackgroundTransparency = 1.000
Fruit.Position = UDim2.new(0, 85, 0.199820146, 0)
Fruit.Size = UDim2.new(0, 200, 0, 27)
Fruit.Font = Enum.Font.SourceSansBold
Fruit.TextTransparency = 0
Fruit.TextColor3 = _G.Color
Fruit.TextSize = 11.000
Fruit.TextXAlignment = Enum.TextXAlignment.Left

local StaminaBar = Instance.new("Frame")
local StaminaBarUICorner = Instance.new("UICorner")
local StaminaText = Instance.new("TextLabel")
local StaminaLine = Instance.new("Frame")
local LineStamina = Instance.new("Frame")

StaminaBar.Name = "StaminaBar"
StaminaBar.Parent = PlayerInfoFrame
StaminaBar.BackgroundColor3 = Color3.fromRGB(40,40,40)
StaminaBar.BorderSizePixel = 0
StaminaBar.BackgroundTransparency = 1
StaminaBar.Position = UDim2.new(0.0166666675, 0, 0.50803858, 0)
StaminaBar.Size = UDim2.new(0, 150, 0, 45)

StaminaBarUICorner.CornerRadius = UDim.new(0, 4)
StaminaBarUICorner.Name = "StaminaBarUICorner"
StaminaBarUICorner.Parent = StaminaBar

StaminaText.Name = "StaminaText"
StaminaText.Parent = StaminaBar
StaminaText.Active = true
StaminaText.BackgroundColor3 = _G.Color
StaminaText.BackgroundTransparency = 1.000
StaminaText.Position = UDim2.new(0.0260000005, 0, 0.100000001, 0)
StaminaText.Size = UDim2.new(0, 300, 0, 22)
StaminaText.Font = Enum.Font.SourceSansBold
StaminaText.Text = "N/A"
StaminaText.TextColor3 = _G.Color
StaminaText.TextSize = 12.000
StaminaText.TextWrapped = true
StaminaText.TextXAlignment = Enum.TextXAlignment.Left

StaminaLine.Name = "StaminaLine"
StaminaLine.Parent = StaminaBar
StaminaLine.AnchorPoint = Vector2.new(0.5, 0.5)
StaminaLine.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
StaminaLine.BorderSizePixel = 0
StaminaLine.Position = UDim2.new(0.498908311, 0, 0.766666651, 0)
StaminaLine.Size = UDim2.new(0, 150, 0, 5)

LineStamina.Name = "LineStamina"
LineStamina.Parent = StaminaLine
LineStamina.BackgroundColor3 = _G.Color
LineStamina.BorderSizePixel = 0
LineStamina.Size = UDim2.new(0, 200, 0, 5)

local Beli = Instance.new("TextLabel")
local Fragment = Instance.new("TextLabel")
local Bounty = Instance.new("TextLabel")

Beli.Name = "Beli"
Beli.Parent = PlayerInfoFrame
Beli.Active = true
Beli.BackgroundColor3 = _G.Color
Beli.BackgroundTransparency = 1.000
Beli.Position = UDim2.new(0.018749997, 0, 0.62897433, 0)
Beli.Size = UDim2.new(0, 200, 0, 27)
Beli.Font = Enum.Font.SourceSansBold
Beli.TextColor3 = _G.Color
Beli.TextSize = 12.000
Beli.TextXAlignment = Enum.TextXAlignment.Left

Fragment.Name = "Fragment"
Fragment.Parent = PlayerInfoFrame
Fragment.Active = true
Fragment.BackgroundColor3 = _G.Color
Fragment.BackgroundTransparency = 1.000
Fragment.Position = UDim2.new(0.018749997, 0, 0.695191059, 0)
Fragment.Size = UDim2.new(0, 200, 0, 25)
Fragment.Font = Enum.Font.SourceSansBold
Fragment.TextColor3 = _G.Color
Fragment.TextSize = 12.000
Fragment.TextXAlignment = Enum.TextXAlignment.Left

Bounty.Name = "Bounty"
Bounty.Parent = PlayerInfoFrame
Bounty.Active = true
Bounty.BackgroundColor3 = _G.Color
Bounty.BackgroundTransparency = 1.000
Bounty.Position = UDim2.new(0.018749997, 0, 0.752607787, 0)
Bounty.Size = UDim2.new(0, 200, 0, 27)
Bounty.Font = Enum.Font.SourceSansBold
Bounty.TextColor3 = _G.Color
Bounty.TextSize = 12.000
Bounty.Text = "Exploit: ".. identifyexecutor()
Bounty.TextXAlignment = Enum.TextXAlignment.Left

spawn(function()
  while wait(0.001) do
      local character = game.Players.LocalPlayer.Character
      if character and character:FindFirstChild("Humanoid") then
        local humanoid = character.Humanoid
        Beli.Text = "Beli: " .. math.floor(game.Players.LocalPlayer.Data.Beli.Value)
        Fragment.Text = "Fragment: " .. math.floor(game.Players.LocalPlayer.Data.Fragments.Value)
        StaminaText.Text = "Health: " .. humanoid.Health .. "/" .. humanoid.MaxHealth
        local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        HealthText.Text = "Postion: " .. string.format("%.0f", rootPart.Position.X) .. ", " .. string.format("%.0f", rootPart.Position.Y) .. ", " .. string.format("%.0f", rootPart.Position.Z)
      end
  end
end)

spawn(function()
  while wait(0.001) do
    pcall(function()
      game:GetService("TweenService"):Create(
        LineHealth,
        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
          Size = UDim2.new(game.Players.LocalPlayer.Character.Humanoid.Health/game.Players.LocalPlayer.Character.Humanoid.MaxHealth, 0, 0, 5)
        }
      ):Play()
      
      game:GetService("TweenService"):Create(
        LineStamina,
        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
          Size = UDim2.new(game.Players.LocalPlayer.Character.Humanoid.Health/game.Players.LocalPlayer.Character.Humanoid.MaxHealth, 0, 0, 5)
        }
      ):Play()
    end)
  end
end)

spawn(function()
  local startTime = tick()
  while true do
      local elapsedTime = tick() - startTime
      local roundedTime = math.floor(elapsedTime)
      Fruit.Text = "Used Time: " .. roundedTime .. " Seconds"
      Lvl.Text = "Time:" .. os.date(" %H:%M:%S - %d/%m/2023")
    wait(0.001)
  end
end)


local Settingcorner = Instance.new("UICorner")
Settingcorner.CornerRadius = UDim.new(0, 60)
Settingcorner.Name = "UserImageCorner"
Settingcorner.Parent = Settings

local BtnStroke = Instance.new("UIStroke")
BtnStroke.Name = "BtnStroke"
BtnStroke.Parent = Settings
BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
BtnStroke.Color = _G.Color
BtnStroke.LineJoinMode = Enum.LineJoinMode.Round
BtnStroke.Thickness = 0
BtnStroke.Transparency = 0
BtnStroke.Enabled = true
BtnStroke.Archivable = true

local SettingFrame = Instance.new("Frame")
SettingFrame.Name = "SettingFrame"
SettingFrame.Parent = Main
SettingFrame.ClipsDescendants = true
SettingFrame.AnchorPoint = Vector2.new(0,0)
SettingFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
SettingFrame.Position = UDim2.new(0, -250, 0, 50)
SettingFrame.BackgroundTransparency = 0
SettingFrame.Size = UDim2.new(0, 210, 0, 240)
SettingFrame.ZIndex = 6

local SettingStroke = Instance.new("UIStroke")

SettingStroke.Name = "UIStroke"
SettingStroke.Parent = SettingFrame
SettingStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
SettingStroke.Color = _G.Color
SettingStroke.LineJoinMode = Enum.LineJoinMode.Round
SettingStroke.Thickness = 2
SettingStroke.Transparency = 0.5
SettingStroke.Enabled = true
SettingStroke.Archivable = true

Settings.MouseButton1Click:Connect(function()
  if SettingFrameclose == false then
  SettingFrameclose = true
  SettingFrame:TweenPosition(UDim2.new(0, -250, 0, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.8, true)
  else
    SettingFrameclose = false
  SettingFrame:TweenPosition(UDim2.new(0, 10, 0, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.8, true)
  end
  end)

local SettingCornerrr = Instance.new("UICorner")
SettingCornerrr.CornerRadius = UDim.new(0, 10)
SettingCornerrr.Name = "SettingCornerrr"
SettingCornerrr.Parent = SettingFrame

local StaminaText = Instance.new("TextLabel")
StaminaText.Name = "StaminaText"
StaminaText.Parent = SettingFrame
StaminaText.Active = true
StaminaText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StaminaText.BackgroundTransparency = 1.000
StaminaText.Position = UDim2.new(0.0260000005, 0, 0.00000001, 0)
StaminaText.Size = UDim2.new(0, 200, 0, 22)
StaminaText.Font = Enum.Font.SourceSansBold
StaminaText.Text = "Menu V3VN"
StaminaText.TextColor3 = _G.Color
StaminaText.TextSize = 12.000
StaminaText.TextWrapped = true
StaminaText.TextXAlignment = Enum.TextXAlignment.Center

local Butn2 = Instance.new("Frame")
local Ui2 = Instance.new("UICorner")
local Text2 = Instance.new("TextLabel")
local Textbtn2 = Instance.new("TextButton")

Butn2.Name = "Butn2"
Butn2.Parent = SettingFrame
Butn2.BackgroundColor3 = _G.Color
Butn2.Size = UDim2.new(0, 190, 0, 30)
Butn2.Position = UDim2.new(0, 10, 0, 40)
Butn2.ZIndex = 16

Ui2.CornerRadius = UDim.new(0, 4)
Ui2.Parent = Butn2

Text2.Parent = Butn2
Text2.AnchorPoint = Vector2.new(0.5, 0.5)
Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text2.BackgroundTransparency = 1.000
Text2.Position = UDim2.new(0.5, 0, 0.5, 0)
Text2.Size = UDim2.new(0, 40, 0, 12)
Text2.ZIndex = 16
Text2.Font = Enum.Font.SourceSansBold
Text2.Text = "Bay"
Text2.TextColor3 = Color3.fromRGB(255, 255, 255)
Text2.TextSize = 14.000

Textbtn2.Parent = Butn2
Textbtn2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Textbtn2.BackgroundTransparency = 1.000
Textbtn2.BorderSizePixel = 0
Textbtn2.ClipsDescendants = true
Textbtn2.Size = UDim2.new(1, 0, 1, 0)
Textbtn2.ZIndex = 16
Textbtn2.AutoButtonColor = false
Textbtn2.Font = Enum.Font.SourceSansBold
Textbtn2.Text = ""
Textbtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
Textbtn2.TextSize = 14.000

Textbtn2.MouseEnter:Connect(function()
  TweenService:Create(
    Butn2,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      BackgroundTransparency = 0.5
    }
  ):Play()
  end)

Textbtn2.MouseLeave:Connect(function()
  TweenService:Create(
    Butn2,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      BackgroundTransparency = 0
    }
  ):Play()
  end)

Textbtn2.MouseButton1Click:Connect(function()
  CircleClick(Butn2, Mouse.X, Mouse.Y)
  Text2.TextSize = 0
  TweenService:Create(
    Text2,
    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      TextSize = 12
    }
  ):Play()
  local main = Instance.new("ScreenGui")
  local Frame = Instance.new("Frame")
  local up = Instance.new("TextButton")
  local down = Instance.new("TextButton")
  local onof = Instance.new("TextButton")
  local TextLabel = Instance.new("TextLabel")
  local plus = Instance.new("TextButton")
  local speed = Instance.new("TextLabel")
  local mine = Instance.new("TextButton")
  local closebutton = Instance.new("TextButton")
  local mini = Instance.new("TextButton")
  local mini2 = Instance.new("TextButton")
  
  main.Name = "main"
  main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
  main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  main.ResetOnSpawn = false
  
  Frame.Parent = main
  Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
  Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
  Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
  Frame.Size = UDim2.new(0, 190, 0, 57)
  
  up.Name = "up"
  up.Parent = Frame
  up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
  up.Size = UDim2.new(0, 44, 0, 28)
  up.Font = Enum.Font.SourceSans
  up.Text = "UP"
  up.TextColor3 = Color3.fromRGB(0, 0, 0)
  up.TextSize = 14.000
  
  down.Name = "down"
  down.Parent = Frame
  down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
  down.Position = UDim2.new(0, 0, 0.491228074, 0)
  down.Size = UDim2.new(0, 44, 0, 28)
  down.Font = Enum.Font.SourceSans
  down.Text = "DOWN"
  down.TextColor3 = Color3.fromRGB(0, 0, 0)
  down.TextSize = 14.000
  
  onof.Name = "onof"
  onof.Parent = Frame
  onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
  onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
  onof.Size = UDim2.new(0, 56, 0, 28)
  onof.Font = Enum.Font.SourceSans
  onof.Text = "FLY"
  onof.TextColor3 = Color3.fromRGB(0, 0, 0)
  onof.TextSize = 14.000
  
  TextLabel.Parent = Frame
  TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
  TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
  TextLabel.Size = UDim2.new(0, 100, 0, 28)
  TextLabel.Font = Enum.Font.SourceSans
  TextLabel.Text = "Gojo 1/2 Hub"
  TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
  TextLabel.TextScaled = true
  TextLabel.TextSize = 14.000
  TextLabel.TextWrapped = true
  
  plus.Name = "plus"
  plus.Parent = Frame
  plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
  plus.Position = UDim2.new(0.231578946, 0, 0, 0)
  plus.Size = UDim2.new(0, 45, 0, 28)
  plus.Font = Enum.Font.SourceSans
  plus.Text = "+"
  plus.TextColor3 = Color3.fromRGB(0, 0, 0)
  plus.TextScaled = true
  plus.TextSize = 14.000
  plus.TextWrapped = true
  
  speed.Name = "speed"
  speed.Parent = Frame
  speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
  speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
  speed.Size = UDim2.new(0, 44, 0, 28)
  speed.Font = Enum.Font.SourceSans
  speed.Text = "1"
  speed.TextColor3 = Color3.fromRGB(0, 0, 0)
  speed.TextScaled = true
  speed.TextSize = 14.000
  speed.TextWrapped = true
  
  mine.Name = "mine"
  mine.Parent = Frame
  mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
  mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
  mine.Size = UDim2.new(0, 45, 0, 29)
  mine.Font = Enum.Font.SourceSans
  mine.Text = "-"
  mine.TextColor3 = Color3.fromRGB(0, 0, 0)
  mine.TextScaled = true
  mine.TextSize = 14.000
  mine.TextWrapped = true
  
  closebutton.Name = "Close"
  closebutton.Parent = main.Frame
  closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
  closebutton.Font = "SourceSans"
  closebutton.Size = UDim2.new(0, 45, 0, 28)
  closebutton.Text = "X"
  closebutton.TextSize = 30
  closebutton.Position =  UDim2.new(0, 0, -1, 27)
  
  mini.Name = "minimize"
  mini.Parent = main.Frame
  mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
  mini.Font = "SourceSans"
  mini.Size = UDim2.new(0, 45, 0, 28)
  mini.Text = "-"
  mini.TextSize = 40
  mini.Position = UDim2.new(0, 44, -1, 27)
  
  mini2.Name = "minimize2"
  mini2.Parent = main.Frame
  mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
  mini2.Font = "SourceSans"
  mini2.Size = UDim2.new(0, 45, 0, 28)
  mini2.Text = "+"
  mini2.TextSize = 40
  mini2.Position = UDim2.new(0, 44, -1, 57)
  mini2.Visible = false
  
  speeds = 1
  
  local speaker = game:GetService("Players").LocalPlayer
  
  local chr = game.Players.LocalPlayer.Character
  local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
  
  nowe = false
  
  Frame.Active = true -- main = gui
  Frame.Draggable = true
  
  onof.MouseButton1Down:connect(function()
  
    if nowe == true then
      nowe = false
  
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
      speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    else 
      nowe = true
  
  
  
      for i = 1, speeds do
        spawn(function()
  
          local hb = game:GetService("RunService").Heartbeat	
  
  
          tpwalking = true
          local chr = game.Players.LocalPlayer.Character
          local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
          while tpwalking and hb:Wait() and chr and hum and hum.Parent do
            if hum.MoveDirection.Magnitude > 0 then
              chr:TranslateBy(hum.MoveDirection)
            end
          end
  
        end)
      end
      game.Players.LocalPlayer.Character.Animate.Disabled = true
      local Char = game.Players.LocalPlayer.Character
      local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
  
      for i,v in next, Hum:GetPlayingAnimationTracks() do
        v:AdjustSpeed(0)
      end
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
      speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
      speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
    end
  
  
  
  
    if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
  
  
  
      local plr = game.Players.LocalPlayer
      local torso = plr.Character.Torso
      local flying = true
      local deb = true
      local ctrl = {f = 0, b = 0, l = 0, r = 0}
      local lastctrl = {f = 0, b = 0, l = 0, r = 0}
      local maxspeed = 50
      local speed = 0
  
  
      local bg = Instance.new("BodyGyro", torso)
      bg.P = 9e4
      bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
      bg.cframe = torso.CFrame
      local bv = Instance.new("BodyVelocity", torso)
      bv.velocity = Vector3.new(0,0.1,0)
      bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
      if nowe == true then
        plr.Character.Humanoid.PlatformStand = true
      end
      while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
        game:GetService("RunService").RenderStepped:Wait()
  
        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
          speed = speed+.5+(speed/maxspeed)
          if speed > maxspeed then
            speed = maxspeed
          end
        elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
          speed = speed-1
          if speed < 0 then
            speed = 0
          end
        end
        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
          bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
          lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
        elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
          bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
        else
          bv.velocity = Vector3.new(0,0,0)
        end
        --	game.Players.LocalPlayer.Character.Animate.Disabled = true
        bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
      end
      ctrl = {f = 0, b = 0, l = 0, r = 0}
      lastctrl = {f = 0, b = 0, l = 0, r = 0}
      speed = 0
      bg:Destroy()
      bv:Destroy()
      plr.Character.Humanoid.PlatformStand = false
      game.Players.LocalPlayer.Character.Animate.Disabled = false
      tpwalking = false
  
  
  
  
    else
      local plr = game.Players.LocalPlayer
      local UpperTorso = plr.Character.UpperTorso
      local flying = true
      local deb = true
      local ctrl = {f = 0, b = 0, l = 0, r = 0}
      local lastctrl = {f = 0, b = 0, l = 0, r = 0}
      local maxspeed = 50
      local speed = 0
  
  
      local bg = Instance.new("BodyGyro", UpperTorso)
      bg.P = 9e4
      bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
      bg.cframe = UpperTorso.CFrame
      local bv = Instance.new("BodyVelocity", UpperTorso)
      bv.velocity = Vector3.new(0,0.1,0)
      bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
      if nowe == true then
        plr.Character.Humanoid.PlatformStand = true
      end
      while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
        wait()
  
        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
          speed = speed+.5+(speed/maxspeed)
          if speed > maxspeed then
            speed = maxspeed
          end
        elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
          speed = speed-1
          if speed < 0 then
            speed = 0
          end
        end
        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
          bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
          lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
        elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
          bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
        else
          bv.velocity = Vector3.new(0,0,0)
        end
  
        bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
      end
      ctrl = {f = 0, b = 0, l = 0, r = 0}
      lastctrl = {f = 0, b = 0, l = 0, r = 0}
      speed = 0
      bg:Destroy()
      bv:Destroy()
      plr.Character.Humanoid.PlatformStand = false
      game.Players.LocalPlayer.Character.Animate.Disabled = false
      tpwalking = false
  
  
  
    end
  
  
  
  
  
  end)
  
  local tis
  
  up.MouseButton1Down:connect(function()
    tis = up.MouseEnter:connect(function()
      while tis do
        wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
      end
    end)
  end)
  
  up.MouseLeave:connect(function()
    if tis then
      tis:Disconnect()
      tis = nil
    end
  end)
  
  local dis
  
  down.MouseButton1Down:connect(function()
    dis = down.MouseEnter:connect(function()
      while dis do
        wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
      end
    end)
  end)
  
  down.MouseLeave:connect(function()
    if dis then
      dis:Disconnect()
      dis = nil
    end
  end)
  
  
  game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
    wait(0.7)
    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
    game.Players.LocalPlayer.Character.Animate.Disabled = false
  
  end)
  
  
  plus.MouseButton1Down:connect(function()
    speeds = speeds + 1
    speed.Text = speeds
    if nowe == true then
  
  
      tpwalking = false
      for i = 1, speeds do
        spawn(function()
  
          local hb = game:GetService("RunService").Heartbeat	
  
  
          tpwalking = true
          local chr = game.Players.LocalPlayer.Character
          local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
          while tpwalking and hb:Wait() and chr and hum and hum.Parent do
            if hum.MoveDirection.Magnitude > 0 then
              chr:TranslateBy(hum.MoveDirection)
            end
          end
  
        end)
      end
    end
  end)
  mine.MouseButton1Down:connect(function()
    if speeds == 1 then
      speed.Text = 'Cannot Be Less Than 1'
      wait(1)
      speed.Text = speeds
    else
      speeds = speeds - 1
      speed.Text = speeds
      if nowe == true then
        tpwalking = false
        for i = 1, speeds do
          spawn(function()
  
            local hb = game:GetService("RunService").Heartbeat	
  
  
            tpwalking = true
            local chr = game.Players.LocalPlayer.Character
            local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
            while tpwalking and hb:Wait() and chr and hum and hum.Parent do
              if hum.MoveDirection.Magnitude > 0 then
                chr:TranslateBy(hum.MoveDirection)
              end
            end
  
          end)
        end
      end
    end
  end)
  
  closebutton.MouseButton1Click:Connect(function()
    main:Destroy()
  end)
  
  mini.MouseButton1Click:Connect(function()
    up.Visible = false
    down.Visible = false
    onof.Visible = false
    plus.Visible = false
    speed.Visible = false
    mine.Visible = false
    mini.Visible = false
    mini2.Visible = true
    main.Frame.BackgroundTransparency = 1
    closebutton.Position =  UDim2.new(0, 0, -1, 57)
  end)
  
  mini2.MouseButton1Click:Connect(function()
    up.Visible = true
    down.Visible = true
    onof.Visible = true
    plus.Visible = true
    speed.Visible = true
    mine.Visible = true
    mini.Visible = true
    mini2.Visible = false
    main.Frame.BackgroundTransparency = 0 
    closebutton.Position =  UDim2.new(0, 0, -1, 27)
  end)
  end)

local Butn3 = Instance.new("Frame")
local Ui3 = Instance.new("UICorner")
local Textlavel3 = Instance.new("TextLabel")
local Texbob3 = Instance.new("TextButton")

Butn3.Name = "Butn3"
Butn3.Parent = SettingFrame
Butn3.BackgroundColor3 = _G.Color
Butn3.Size = UDim2.new(0, 190, 0, 30)
Butn3.Position = UDim2.new(0, 10, 0, 80)
Butn3.ZIndex = 16

Ui3.CornerRadius = UDim.new(0, 4)
Ui3.Parent = Butn3

Textlavel3.Parent = Butn3
Textlavel3.AnchorPoint = Vector2.new(0.5, 0.5)
Textlavel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Textlavel3.BackgroundTransparency = 1.000
Textlavel3.Position = UDim2.new(0.5, 0, 0.5, 0)
Textlavel3.Size = UDim2.new(0, 40, 0, 12)
Textlavel3.ZIndex = 16
Textlavel3.Font = Enum.Font.SourceSansBold
Textlavel3.Text = "Esp"
Textlavel3.TextColor3 = Color3.fromRGB(255, 255, 255)
Textlavel3.TextSize = 14.000

Texbob3.Parent = Butn3
Texbob3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Texbob3.BackgroundTransparency = 1.000
Texbob3.BorderSizePixel = 0
Texbob3.ClipsDescendants = true
Texbob3.Size = UDim2.new(1, 0, 1, 0)
Texbob3.ZIndex = 16
Texbob3.AutoButtonColor = false
Texbob3.Font = Enum.Font.SourceSansBold
Texbob3.Text = ""
Texbob3.TextColor3 = Color3.fromRGB(255, 255, 255)
Texbob3.TextSize = 14.000

Texbob3.MouseEnter:Connect(function()
  TweenService:Create(
    Butn3,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      BackgroundTransparency = 0.5
    }
  ):Play()
  end)

Texbob3.MouseLeave:Connect(function()
  TweenService:Create(
    Butn3,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      BackgroundTransparency = 0
    }
  ):Play()
  end)

Texbob3.MouseButton1Click:Connect(function()
  CircleClick(Butn3, Mouse.X, Mouse.Y)
  Textlavel3.TextSize = 0
  TweenService:Create(
    Textlavel3,
    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      TextSize = 12
    }
  ):Play()
  end)

local Buton4 = Instance.new("Frame")
local Ui4 = Instance.new("UICorner")
local Textlval3 = Instance.new("TextLabel")
local Texbslb4 = Instance.new("TextButton")

Buton4.Name = "Buton4"
Buton4.Parent = SettingFrame
Buton4.BackgroundColor3 = _G.Color
Buton4.Size = UDim2.new(0, 190, 0, 30)
Buton4.Position = UDim2.new(0, 10, 0, 120)
Buton4.ZIndex = 16

Ui4.CornerRadius = UDim.new(0, 4)
Ui4.Parent = Buton4

Textlval3.Parent = Buton4
Textlval3.AnchorPoint = Vector2.new(0.5, 0.5)
Textlval3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Textlval3.BackgroundTransparency = 1.000
Textlval3.Position = UDim2.new(0.5, 0, 0.5, 0)
Textlval3.Size = UDim2.new(0, 40, 0, 12)
Textlval3.ZIndex = 16
Textlval3.Font = Enum.Font.SourceSansBold
Textlval3.Text = "KeyBoard"
Textlval3.TextColor3 = Color3.fromRGB(255, 255, 255)
Textlval3.TextSize = 14.000

Texbslb4.Parent = Buton4
Texbslb4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Texbslb4.BackgroundTransparency = 1.000
Texbslb4.BorderSizePixel = 0
Texbslb4.ClipsDescendants = true
Texbslb4.Size = UDim2.new(1, 0, 1, 0)
Texbslb4.ZIndex = 16
Texbslb4.AutoButtonColor = false
Texbslb4.Font = Enum.Font.SourceSansBold
Texbslb4.Text = ""
Texbslb4.TextColor3 = Color3.fromRGB(255, 255, 255)
Texbslb4.TextSize = 14.000

Texbslb4.MouseEnter:Connect(function()
  TweenService:Create(
    Buton4,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      BackgroundTransparency = 0.5
    }
  ):Play()
  end)

Texbslb4.MouseLeave:Connect(function()
  TweenService:Create(
    Buton4,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      BackgroundTransparency = 0
    }
  ):Play()
  end)

Texbslb4.MouseButton1Click:Connect(function()
  CircleClick(Buton4, Mouse.X, Mouse.Y)
  Textlval3.TextSize = 0
  TweenService:Create(
    Textlval3,
    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      TextSize = 12
    }
  ):Play()
           loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  end)
  
  local Buton5 = Instance.new("Frame")
local Ui5 = Instance.new("UICorner")
local Textlval4 = Instance.new("TextLabel")
local Texbslb5 = Instance.new("TextButton")

Buton5.Name = "Buton5"
Buton5.Parent = SettingFrame
Buton5.BackgroundColor3 = _G.Color
Buton5.Size = UDim2.new(0, 190, 0, 30)
Buton5.Position = UDim2.new(0, 10, 0, 160)
Buton5.ZIndex = 16

Ui5.CornerRadius = UDim.new(0, 4)
Ui5.Parent = Buton5

Textlval4.Parent = Buton5
Textlval4.AnchorPoint = Vector2.new(0.5, 0.5)
Textlval4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Textlval4.BackgroundTransparency = 1.000
Textlval4.Position = UDim2.new(0.5, 0, 0.5, 0)
Textlval4.Size = UDim2.new(0, 40, 0, 12)
Textlval4.ZIndex = 16
Textlval4.Font = Enum.Font.SourceSansBold
Textlval4.Text = "INFNITE YEILD"
Textlval4.TextColor3 = Color3.fromRGB(255, 255, 255)
Textlval4.TextSize = 14.000

Texbslb5.Parent = Buton5
Texbslb5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Texbslb5.BackgroundTransparency = 1.000
Texbslb5.BorderSizePixel = 0
Texbslb5.ClipsDescendants = true
Texbslb5.Size = UDim2.new(1, 0, 1, 0)
Texbslb5.ZIndex = 16
Texbslb5.AutoButtonColor = false
Texbslb5.Font = Enum.Font.SourceSansBold
Texbslb5.Text = ""
Texbslb5.TextColor3 = Color3.fromRGB(255, 255, 255)
Texbslb5.TextSize = 14.000

Texbslb5.MouseEnter:Connect(function()
  TweenService:Create(
    Buton5,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      BackgroundTransparency = 0.5
    }
  ):Play()
  end)

Texbslb5.MouseLeave:Connect(function()
  TweenService:Create(
    Buton5,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      BackgroundTransparency = 0
    }
  ):Play()
  end)

Texbslb5.MouseButton1Click:Connect(function()
  CircleClick(Buton5, Mouse.X, Mouse.Y)
  Textlval4.TextSize = 0
  TweenService:Create(
    Textlval4,
    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      TextSize = 12
    }
  ):Play()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() 
  end)
  
  local Buton6 = Instance.new("Frame")
local Ui6 = Instance.new("UICorner")
local Textlval5 = Instance.new("TextLabel")
local Texbslb6 = Instance.new("TextButton")

Buton6.Name = "Buton6"
Buton6.Parent = SettingFrame
Buton6.BackgroundColor3 = _G.Color
Buton6.Size = UDim2.new(0, 190, 0, 30)
Buton6.Position = UDim2.new(0, 10, 0, 200)
Buton6.ZIndex = 16

Ui6.CornerRadius = UDim.new(0, 4)
Ui6.Parent = Buton6

Textlval5.Parent = Buton6
Textlval5.AnchorPoint = Vector2.new(0.5, 0.5)
Textlval5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Textlval5.BackgroundTransparency = 1.000
Textlval5.Position = UDim2.new(0.5, 0, 0.5, 0)
Textlval5.Size = UDim2.new(0, 40, 0, 12)
Textlval5.ZIndex = 16
Textlval5.Font = Enum.Font.SourceSansBold
Textlval5.Text = "ẨN LIBRARY"
Textlval5.TextColor3 = Color3.fromRGB(255, 255, 255)
Textlval5.TextSize = 14.000

Texbslb6.Parent = Buton6
Texbslb6.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Texbslb6.BackgroundTransparency = 1.000
Texbslb6.BorderSizePixel = 0
Texbslb6.ClipsDescendants = true
Texbslb6.Size = UDim2.new(1, 0, 1, 0)
Texbslb6.ZIndex = 16
Texbslb6.AutoButtonColor = false
Texbslb6.Font = Enum.Font.SourceSansBold
Texbslb6.Text = ""
Texbslb6.TextColor3 = Color3.fromRGB(255, 255, 255)
Texbslb6.TextSize = 14.000

Texbslb6.MouseEnter:Connect(function()
  TweenService:Create(
    Buton6,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      BackgroundTransparency = 0.5
    }
  ):Play()
  end)

Texbslb6.MouseLeave:Connect(function()
  TweenService:Create(
    Buton6,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      BackgroundTransparency = 0
    }
  ):Play()
  end)

Texbslb6.MouseButton1Click:Connect(function()
  CircleClick(Buton6, Mouse.X, Mouse.Y)
  Textlval5.TextSize = 0
  TweenService:Create(
    Textlval5,
    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      TextSize = 12
    }
  ):Play()
           UI:Destroy()
           ThunderScreen:Destroy()
  end)
  
dragify(ClickFrame, Main)
local tabs = {}
local S = false
function tabs:Tab(Name, icon)
local FrameTab = Instance.new("Frame")
local Tab = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local UICorner_Tab = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
FrameTab.Name = "FrameTab"
FrameTab.Parent = Tab
FrameTab.BackgroundColor3 = Color3.fromRGB(255,255,255)
FrameTab.Position = UDim2.new(0.3, 0, 0.9, 0)
FrameTab.Size = UDim2.new(0, 0, 0, 0)
FrameTab.BackgroundTransparency = 0
FrameTab.Visible = false


UICorner_Tab.CornerRadius = UDim.new(0, 3)
UICorner_Tab.Parent = FrameTab
Tab.Name = "Tab"
Tab.Parent = TabContainer
Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tab.Size = UDim2.new(0, 114, 0, 30)
Tab.BackgroundTransparency = 0
Tab.Text = ""
UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = Tab
local UIGradient2 = Instance.new("UIGradient")
UIGradient2.Color = ColorSequence.new {
  ColorSequenceKeypoint.new(0.00, Color3.fromRGB(29, 29, 29)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(50, 50, 50))}
UIGradient2.Parent = Tab

local ImageLabel1 = Instance.new("ImageLabel")
ImageLabel1.Name = "ImageLabel"
ImageLabel1.Parent = Tab
ImageLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel1.BackgroundTransparency = 1.000
ImageLabel1.Position = UDim2.new(0, 5, 0.2, 0)
ImageLabel1.Size = UDim2.new(0, 20, 0, 20)
ImageLabel1.Image = "rbxassetid://16985318195" .. tostring(icon)
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "ImageLabel"
ImageLabel.Parent = Tab
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0, 5, 0.2, 0)
ImageLabel.Size = UDim2.new(0, 20, 0, 20)
ImageLabel.Image = "rbxassetid://16985318195"

TextLabel.Parent = Tab
TextLabel.Text = Name
local UiToggle_UiStroke901 = Instance.new("UIStroke")
UiToggle_UiStroke901.Color = _G.Color
UiToggle_UiStroke901.Thickness = 2
UiToggle_UiStroke901.Name = "UiToggle_UiStroke901"
UiToggle_UiStroke901.Parent = Tab
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.252105269, 0, 0.100000001, 0)
TextLabel.Size = UDim2.new(0, 10, 0, 27)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 12.300
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.TextTransparency = 0.200
TextLabel.Text = Name

local Page = Instance.new("ScrollingFrame")
local Left = Instance.new("ScrollingFrame")
local Right = Instance.new("ScrollingFrame")
local UIListLayout_5 = Instance.new("UIListLayout")
local UIPadding_5 = Instance.new("UIPadding")
Page.Name = "Page"
Page.Parent = Bottom
Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Page.BackgroundTransparency = 1.000
Page.Size = UDim2.new(0, 500, 0, 300)
Page.ScrollBarThickness = 0
Page.CanvasSize = UDim2.new(0, 0, 0, 0)
Page.Visible = false

Left.Name = "Left"
Left.Parent = Page
Left.Active = true
Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Left.BackgroundTransparency = 1
Left.Size = UDim2.new(0, 240, 0, 260)
Left.ScrollBarThickness = 0
Left.CanvasSize = UDim2.new(0, 0, 0, 0)
Right.Name = "Right"
Right.Parent = Page
Right.Active = true
Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Right.BackgroundTransparency = 1
Right.Size = UDim2.new(0, 240, 0, 260)
Right.ScrollBarThickness = 0
Right.CanvasSize = UDim2.new(0, 0, 0, 0)
local LeftList = Instance.new("UIListLayout")
local RightList = Instance.new("UIListLayout")
LeftList.Parent = Left
LeftList.SortOrder = Enum.SortOrder.LayoutOrder
LeftList.Padding = UDim.new(0, 5)
RightList.Parent = Right
RightList.SortOrder = Enum.SortOrder.LayoutOrder
RightList.Padding = UDim.new(0, 5)
UIListLayout_5.Parent = Page
UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_5.Padding = UDim.new(0, 13)
UIPadding_5.Parent = Page
if S == false then
S = true
Page.Visible = true
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextTransparency = 0
ImageLabel.ImageTransparency = 0
ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
FrameTab.Size = UDim2.new(0, 40, 0, 2)
FrameTab.Visible = true
end

Tab.MouseButton1Click:Connect(
  function()
  for _, x in next, TabContainer:GetChildren() do
  if x.Name == "Tab" then
  TweenService:Create(
    x.TextLabel,
    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {
      TextColor3 = Color3.fromRGB(255, 255, 255)}
  ):Play()
  TweenService:Create(
    x.TextLabel,
    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {
      TextTransparency = 0.2
    }
  ):Play()
  TweenService:Create(
    x.FrameTab,
    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {
      Size = UDim2.new(0, 0, 0, 2)}
  ):Play()
  for index, y in next, Bottom:GetChildren() do
  TweenService:Create(
    y,
    TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      Position = UDim2.new(0,1500,0,0)}
  ):Play()
  y.Visible = false
  end
  x.FrameTab.Visible = false
  end
  end
  TweenService:Create(
    TextLabel,
    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {
      TextColor3 = _G.Color
    }
  ):Play()
  TweenService:Create(
    TextLabel,
    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {
      TextTransparency = 0
    }
  ):Play()
  FrameTab.Visible = true
  TweenService:Create(
    FrameTab,
    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {
      Size = UDim2.new(0, 40, 0, 2)}
  ):Play()
  Page.Position = UDim2.new(0,0,0,1500)
  TweenService:Create(
    Page,
    TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      Position = UDim2.new(0,0,0,0)}
  ):Play()
  Page.Visible = true
  end
)

function GetType(value)
if value == 1 then
return Left
elseif value == 2 then
return Right
else
  return Left
end
end

game:GetService("RunService").Stepped:Connect(function()
  pcall(function()
    Right.CanvasSize = UDim2.new(0,0,0,RightList.AbsoluteContentSize.Y + 5)
    Left.CanvasSize = UDim2.new(0,0,0,LeftList.AbsoluteContentSize.Y + 5)
    end)
  end)

local sections = {}
function sections:CraftPage(side)

if side == nil then
return Left
end
local Section = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local Top_2 = Instance.new("Frame")
local Line = Instance.new("Frame")
local Sectionname = Instance.new("TextLabel")
local SectionContainer = Instance.new("Frame")
local SectionContainer_2 = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local UIPadding_2 = Instance.new("UIPadding")
local UIGradient_S = Instance.new("UIGradient")
Section.Name = "Section"
Section.Parent = GetType(side)
Section.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
Section.ClipsDescendants = true
Section.Size = UDim2.new(0, 240, 0, 343)
Section.BackgroundTransparency = 0
UICorner_5.CornerRadius = UDim.new(0, 10)
UICorner_5.Parent = Section
Top_2.Name = "Top"
Top_2.Parent = Section
Top_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top_2.BackgroundTransparency = 1.000
Top_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Top_2.Size = UDim2.new(0, 238, 0, 8)
Line.Name = "Line"
Line.Parent = Top_2
Line.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Line.BorderSizePixel = 0
Line.Size = UDim2.new(0, 239, 0, 1)
Line.Visible = false

SectionContainer.Name = "SectionContainer"
SectionContainer.Parent = Top_2
SectionContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionContainer.BackgroundTransparency = 1.000
SectionContainer.BorderSizePixel = 0
SectionContainer.Position = UDim2.new(0, 0, 0.716416223, 0)
SectionContainer.Size = UDim2.new(0, 239, 0, 200)

SectionContainer_2.Name = "SectionContainer_2"
SectionContainer_2.Parent = Top_2
SectionContainer_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionContainer_2.BackgroundTransparency = 1.000
SectionContainer_2.BorderSizePixel = 0
SectionContainer_2.Position = UDim2.new(0, 0, 0.716416223, 0)
SectionContainer_2.Size = UDim2.new(0, 239, 0, 230)
UIListLayout_2.Parent = SectionContainer
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 11)
UIPadding_2.Parent = SectionContainer
UIPadding_2.PaddingLeft = UDim.new(0, 5)
UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
  function()
  Section.Size = UDim2.new(1, 0, 0, UIListLayout_2.AbsoluteContentSize.Y + 35)
  end
)
functionitem = {}
function functionitem:Label(text)
local Label = Instance.new("TextLabel")
local PaddingLabel = Instance.new("UIPadding")
local labelfunc = {}

Label.Name = "Label"
Label.Parent = SectionContainer
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.Size = UDim2.new(0, 200, 0, 20)
Label.Font = Enum.Font.SourceSansBold
Label.TextColor3 = Color3.fromRGB(225, 225, 225)
Label.TextSize = 9.000
Label.Text = text
Label.TextXAlignment = Enum.TextXAlignment.Left

PaddingLabel.PaddingLeft = UDim.new(0,10)
PaddingLabel.Parent = Label
PaddingLabel.Name = "PaddingLabel"

function labelfunc:Set(newtext)
Label.Text = newtext
end
return labelfunc
end

function functionitem:Seperator(text)
local textas = {}
local Label = Instance.new("Frame")
local Text = Instance.new("TextLabel")
Label.Name = "Label"
Label.Parent = SectionContainer
Label.AnchorPoint = Vector2.new(0.5, 0.5)
Label.BackgroundTransparency = 1.000
Label.Size = UDim2.new(0, 240, 0, 15)

local Label22 = Instance.new("Frame")
Label22.Name = "Label22"
Label22.Parent = Label
Label22.AnchorPoint = Vector2.new(0, 0.5)
Label22.BackgroundColor3 = _G.Color
Label22.Position = UDim2.new(0,30,0.5,0)
Label22.Size = UDim2.new(0, 30, 0, 2)

local Label23 = Instance.new("Frame")
Label23.Name = "Label23"
Label23.Parent = Label
Label23.AnchorPoint = Vector2.new(0, 0.5)
Label23.BackgroundColor3 = _G.Color
Label23.Position = UDim2.new(0,180,0.5,0)
Label23.Size = UDim2.new(0, 30, 0, 2)

Text.Name = "Text"
Text.Parent = Label
Text.AnchorPoint = Vector2.new(0.5, 0.5)
Text.BackgroundColor3 = _G.Color
Text.BackgroundTransparency = 1.000
Text.Position = UDim2.new(0.5, 0, 0.5, 0)
Text.Size = UDim2.new(0, 53, 0, 150)
Text.ZIndex = 16
Text.Font = Enum.Font.SourceSansBold
Text.Text = text
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.TextSize = 12.000
function textas.Refresh(newtext)
Text.Text = newtext
end
return textas
end

function functionitem:LabelColor(text,color)
local textas = {}
local Label = Instance.new("Frame")
local Text = Instance.new("TextLabel")
Label.Name = "Label"
Label.Parent = SectionContainer
Label.AnchorPoint = Vector2.new(0.5, 0.5)
Label.BackgroundTransparency = 1.000
Label.Size = UDim2.new(0.975000024, 0, 0, 30)
Text.Name = "Text"
Text.Parent = Label
Text.AnchorPoint = Vector2.new(0.5, 0.5)
Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text.BackgroundTransparency = 1.000
Text.Position = UDim2.new(0.5, 0, 0.5, 0)
Text.Size = UDim2.new(0, 53, 0, 12)
Text.ZIndex = 16
Text.Font = Enum.Font.SourceSansBold
Text.Text = text
Text.TextColor3 = Color3.fromRGB(color)
Text.TextSize = 12.000
function textas:Change(newtext)
Text.Text = newtext
end
return textas
end
function functionitem:ButtonTog(Title, default, callback)
local b3Func = {}
local callback = callback or function()
end
local Tgs = default
local Button_2 = Instance.new("Frame")
local UICorner_21 = Instance.new("UICorner")
local TextLabel_4 = Instance.new("TextLabel")
local TextButton_4 = Instance.new("TextButton")
Button_2.Name = "Button"
Button_2.Parent = SectionContainer
Button_2.BackgroundColor3 = Color3.fromRGB(33, 132, 112)
Button_2.Size = UDim2.new(0.975000024, 0, 0, 25)
Button_2.ZIndex = 16
if default then
Button_2.BackgroundColor3 = Color3.fromRGB(33, 132, 112)
else
  Button_2.BackgroundColor3 = _G.Color
end
UICorner_21.CornerRadius = UDim.new(0, 3)
UICorner_21.Parent = Button_2
TextLabel_4.Parent = Button_2
TextLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.Position = UDim2.new(0.5, 0, 0.5, 0)
TextLabel_4.Size = UDim2.new(0, 40, 0, 12)
TextLabel_4.ZIndex = 16
TextLabel_4.Font = Enum.Font.SourceSansBold
TextLabel_4.Text = tostring(Title)
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextSize = 12.000
TextButton_4.Parent = Button_2
TextButton_4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextButton_4.BackgroundTransparency = 1.000
TextButton_4.BorderSizePixel = 0
TextButton_4.ClipsDescendants = true
TextButton_4.Size = UDim2.new(1, 0, 1, 0)
TextButton_4.ZIndex = 16
TextButton_4.AutoButtonColor = false
TextButton_4.Font = Enum.Font.SourceSansBold
TextButton_4.Text = ""
TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_4.TextSize = 14.000
TextButton_4.MouseButton1Click:Connect(
  function()
  Tgs = not Tgs
  b3Func:Update(Tgs)
  CircleClick(Button_2, Mouse.X, Mouse.Y)
  end
)
if default then
TweenService:Create(
  Button_2,
  TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
  {
    BackgroundColor3 = state and _G.Color or Color3.fromRGB(33, 132, 112)
  }
):Play()
callback(default)
Tgs = default
end
function b3Func:Update(state)
TweenService:Create(
  Button_2,
  TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
  {
    BackgroundColor3 = state and Color3.fromRGB(33, 132, 112) or _G.Color
  }
):Play()
callback(state)
Tgs = state
end
return b3Func
end
function functionitem:Button(Name, callback)
local Button = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local TextLabel_3 = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")

Button.Name = "Button"
Button.Parent = SectionContainer
Button.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
Button.Size = UDim2.new(0.975000024, 0, 0, 30)
Button.ZIndex = 16
Button.BackgroundTransparency = 0

local UiToggle_UiStroke2 = Instance.new("UIStroke")
UiToggle_UiStroke2.Color = Color3.fromRGB(60, 60, 60)
UiToggle_UiStroke2.Thickness = 1
UiToggle_UiStroke2.Name = "UiToggle_UiStroke1"
UiToggle_UiStroke2.Parent = Button

UICorner_6.CornerRadius = UDim.new(0, 4)
UICorner_6.Parent = Button

TextLabel_3.Parent = Button
TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
TextLabel_3.Size = UDim2.new(0, 40, 0, 12)
TextLabel_3.ZIndex = 16
TextLabel_3.Font = Enum.Font.SourceSansBold
TextLabel_3.Text = Name
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextSize = 10.000

TextButton.Parent = Button
TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderSizePixel = 0
TextButton.ClipsDescendants = true
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.ZIndex = 16
TextButton.AutoButtonColor = false
TextButton.Font = Enum.Font.SourceSansBold
TextButton.Text = ""
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

TextButton.MouseEnter:Connect(function()
  TweenService:Create(
    Button,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      BackgroundTransparency = 0.5
    }
  ):Play()
  end)

TextButton.MouseLeave:Connect(function()
  TweenService:Create(
    Button,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      BackgroundTransparency = 0
    }
  ):Play()
  end)

TextButton.MouseButton1Click:Connect(function()
  CircleClick(Button, Mouse.X, Mouse.Y)
  TextLabel_3.TextSize = 0
  TweenService:Create(
    TextLabel_3,
    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      TextSize = 12
    }
  ):Play()
  callback()
  end)
end
function functionitem:CreateMoonPage(ImageMoon)
local MoonPage = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local funcmoonpage = {}
MoonPage.BorderSizePixel = 0
MoonPage.Size = UDim2.new(0, 240, 0, 200)
MoonPage.Position = UDim2.new(0.0384615, 0, 0.15, 0)
MoonPage.BackgroundTransparency = 1
MoonPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
MoonPage.Name = "MoonPage"
MoonPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MoonPage.Parent = SectionContainer
ImageLabel.BorderSizePixel = 0
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.Image = "rbxassetid://"..ImageMoon
ImageLabel.Size = UDim2.new(0, 220, 0, 181)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.Position = UDim2.new(0.0410257, 0, 0.043125, 0)
ImageLabel.Parent = MoonPage
function funcmoonpage:Set(ImageMoon)
    ImageLabel.Image = "rbxassetid://"..ImageMoon
end
return funcmoonpage
end
function functionitem:Toggle(Name, default, callback)
local ToglFunc = {}
local Tgo = default
local MainToggle = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Text = Instance.new("TextLabel")
local MainToggle_2 = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local MainToggle_3 = Instance.new("ImageLabel")
local UICorner_3 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
MainToggle.Name = "MainToggle"
MainToggle.Parent = SectionContainer
MainToggle.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
MainToggle.BackgroundTransparency = 0
MainToggle.BorderSizePixel = 0
MainToggle.ClipsDescendants = true
MainToggle.Size = UDim2.new(0.975000024, 0, 0, 35)
MainToggle.ZIndex = 16

local UiToggle_UiStroke1 = Instance.new("UIStroke")
UiToggle_UiStroke1.Color = Color3.fromRGB(60, 60, 60)
UiToggle_UiStroke1.Thickness = 1
UiToggle_UiStroke1.Name = "UiToggle_UiStroke1"
UiToggle_UiStroke1.Parent = MainToggle

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = MainToggle
Text.Name = "Text"
Text.Parent = MainToggle
Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text.BackgroundTransparency = 1.000
Text.Position = UDim2.new(0, 10, 0, 10)
Text.Size = UDim2.new(0, 100, 0, 12)
Text.ZIndex = 16
Text.Font = Enum.Font.SourceSansBold
Text.Text = Name
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.TextSize = 12.000
Text.TextTransparency = 0.4
Text.TextXAlignment = Enum.TextXAlignment.Left
MainToggle_2.Name = "MainToggle"
MainToggle_2.Parent = MainToggle
MainToggle_2.AnchorPoint = Vector2.new(0.5, 0.5)
MainToggle_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainToggle_2.ClipsDescendants = true
MainToggle_2.Position = UDim2.new(0.899999976, 0, 0.5, 0)
MainToggle_2.Size = UDim2.new(0, 23, 0, 23)
MainToggle_2.ZIndex = 16
UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = MainToggle_2
MainToggle_3.Name = "MainToggle"
MainToggle_3.Parent = MainToggle_2
MainToggle_3.AnchorPoint = Vector2.new(0.5, 0.5)
MainToggle_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainToggle_3.BackgroundTransparency = 0
MainToggle_3.ClipsDescendants = true
MainToggle_3.Position = UDim2.new(0.5, 0, 0.5, 0)
MainToggle_3.Size = UDim2.new(0, 0, 0, 0)
MainToggle_3.ZIndex = 16
MainToggle_3.Image = "http://www.roblox.com/asset/?id=6031068421"
MainToggle_3.ImageColor3 = _G.Color
MainToggle_3.Visible = false
UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = MainToggle_3
TextButton.Name = ""
TextButton.Parent = MainToggle
TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.ZIndex = 16
TextButton.AutoButtonColor = false
TextButton.Font = Enum.Font.SourceSansBold
TextButton.Text = ""
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000
TextButton.MouseButton1Click:Connect(
  function()
  Tgo = not Tgo
  ToglFunc:Update(Tgo)
  CircleClick(Button, Mouse.X, Mouse.Y)
  end
)
if default then
if default then
MainToggle_3.Visible = default
end
TweenService:Create(
  Text,
  TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
  {
    TextTransparency = default and 0 or 0.4
  }
):Play()
local we = TweenService:Create(
  MainToggle_3,
  TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
  {
    Size = default and UDim2.new(0, 25, 0, 25) or UDim2.new(0, 0, 0, 0)
  }
)
we:Play()
we.Completed:Wait()
if default == false then
MainToggle_3.Visible = default
end
callback(default)
Tgo = default
end
function ToglFunc:Update(state)
if state then
MainToggle_3.Visible = state
end
TweenService:Create(
  Text,
  TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
  {
    TextTransparency = state and 0 or 0.4
  }
):Play()
local we = TweenService:Create(
  MainToggle_3,
  TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
  {
    Size = state and UDim2.new(0, 25, 0, 25) or UDim2.new(0, 0, 0, 0)
  }
)
we:Play()
we.Completed:Wait()
if state == false then
MainToggle_3.Visible = state
end
callback(state)
Tgo = state
end
return ToglFunc
end
function functionitem:Textbox(Name, Placeholder, callback)
local Textbox = Instance.new("Frame")
local UICorner_16 = Instance.new("UICorner")
local Text_5 = Instance.new("TextLabel")
local TextboxHoler = Instance.new("Frame")
local UICorner_17 = Instance.new("UICorner")
local UICorner_18 = Instance.new("UICorner")
local HeadTitle = Instance.new("TextBox")
Textbox.Name = "Textbox"
Textbox.Parent = SectionContainer
Textbox.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
Textbox.BackgroundTransparency = 0
Textbox.BorderSizePixel = 0
Textbox.ClipsDescendants = true
Textbox.Size = UDim2.new(0.975000024, 0, 0, 35)
Textbox.ZIndex = 16

local UiToggle_UiStroke23 = Instance.new("UIStroke")
UiToggle_UiStroke23.Color = Color3.fromRGB(60, 60, 60)
UiToggle_UiStroke23.Thickness = 1
UiToggle_UiStroke23.Name = "UiToggle_UiStroke1"
UiToggle_UiStroke23.Parent = Textbox

UICorner_16.CornerRadius = UDim.new(0, 3)
UICorner_16.Parent = Textbox
Text_5.Name = "Text"
Text_5.Parent = Textbox
Text_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_5.BackgroundTransparency = 1.000
Text_5.Position = UDim2.new(0, 10, 0, 10)
Text_5.Size = UDim2.new(0, 43, 0, 12)
Text_5.ZIndex = 16
Text_5.Font = Enum.Font.SourceSansBold
Text_5.Text = Name
Text_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_5.TextSize = 11.000
Text_5.TextXAlignment = Enum.TextXAlignment.Left
TextboxHoler.Name = "TextboxHoler"
TextboxHoler.Parent = Textbox
TextboxHoler.AnchorPoint = Vector2.new(0.5, 0.5)
TextboxHoler.BackgroundColor3 = Color3.fromRGB(13, 13, 15)
TextboxHoler.BackgroundTransparency = 1.000
TextboxHoler.BorderSizePixel = 0
TextboxHoler.Position = UDim2.new(0.5, 0, 0.5, 13)
TextboxHoler.Size = UDim2.new(0.970000029, 0, 0, 30)
UICorner_17.CornerRadius = UDim.new(0, 3)
UICorner_17.Parent = TextboxHoler
HeadTitle.Name = "HeadTitle"
HeadTitle.Parent = TextboxHoler
HeadTitle.AnchorPoint = Vector2.new(0.5, 0.5)
HeadTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
HeadTitle.BackgroundTransparency = 0.000
HeadTitle.BorderSizePixel = 0.400
HeadTitle.ClipsDescendants = true
HeadTitle.Position = UDim2.new(0.74, 0, 0.04, 0)
HeadTitle.Size = UDim2.new(0, 100, 0, 28)
HeadTitle.ZIndex = 16
HeadTitle.Font = Enum.Font.SourceSansBold
HeadTitle.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
HeadTitle.PlaceholderText = Placeholder
HeadTitle.Text = ""
HeadTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HeadTitle.TextSize = 13.000
HeadTitle.TextTransparency = 0
HeadTitle.TextXAlignment = Enum.TextXAlignment.Center
UICorner_18.CornerRadius = UDim.new(0, 5)
UICorner_18.Parent = HeadTitle
HeadTitle.FocusLost:Connect(
  function(ep)
  if ep then
  if #HeadTitle.Text > 0 then
  callback(HeadTitle.Text)
  HeadTitle.Text = ""
  end
  end
  end)
end


function functionitem:Dropdown(Name,option,default,callback)
local isdropping = false
local Dropdown = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UICorner1 = Instance.new("UICorner")
local DropTitle = Instance.new("TextLabel")
local DropScroll = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local DropButton = Instance.new("TextButton")
local DropImage = Instance.new("ImageLabel")
local posto1 = Instance.new("UIStroke")

Dropdown.Name = "Dropdown"
Dropdown.Parent = SectionContainer
Dropdown.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
Dropdown.BackgroundTransparency = 0
Dropdown.ClipsDescendants = true
Dropdown.Size = UDim2.new(0, 228, 0, 30)

local UiToggle_UiStroke25 = Instance.new("UIStroke")
UiToggle_UiStroke25.Color = Color3.fromRGB(60, 60, 60)
UiToggle_UiStroke25.Thickness = 1
UiToggle_UiStroke25.Name = "UiToggle_UiStroke1"
UiToggle_UiStroke25.Parent = Dropdown

UICorner.CornerRadius = UDim.new(0, 2)
UICorner.Parent = Dropdown

function getpro()
if default then
if table.find(option, default) then
callback(default)
return "   "..Name .. " : " .. default
else
  return "   "..Name .. " : "
end
else
  return "   "..Name .. " : "
end
end

DropTitle.Name = "DropTitle"
DropTitle.Parent = Dropdown
DropTitle.BackgroundColor3 = Color3.fromRGB(224,224,224)
DropTitle.BackgroundTransparency = 1.000
DropTitle.Size = UDim2.new(0, 240, 0, 31)
DropTitle.Font = Enum.Font.SourceSansBold
DropTitle.Text = getpro()
DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
DropTitle.TextSize = 12.000
DropTitle.TextXAlignment = Enum.TextXAlignment.Left

DropScroll.Name = "DropScroll"
DropScroll.Parent = DropTitle
DropScroll.Active = true
DropScroll.BackgroundColor3 = Color3.fromRGB(224,224,224)
DropScroll.BackgroundTransparency = 1.000
DropScroll.BorderSizePixel = 0
DropScroll.Position = UDim2.new(0, 0, 0, 31)
DropScroll.Size = UDim2.new(0, 240, 0, 100)
DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
DropScroll.ScrollBarThickness = 3

UIListLayout.Parent = DropScroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

UIPadding.Parent = DropScroll
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)

DropImage.Name = "DropImage"
DropImage.Parent = Dropdown
DropImage.BackgroundColor3 = Color3.fromRGB(224,224,224)
DropImage.BackgroundTransparency = 1.000
DropImage.Position = UDim2.new(0, 200, 0, 6)
DropImage.Rotation = 180.000
DropImage.Size = UDim2.new(0, 20, 0, 20)
DropImage.Image = "rbxassetid://16991318748"

DropButton.Name = "DropButton"
DropButton.Parent = Dropdown
DropButton.BackgroundColor3 = Color3.fromRGB(224,224,224)
DropButton.BackgroundTransparency = 1.000
DropButton.Size = UDim2.new(0, 240, 0, 31)
DropButton.Font = Enum.Font.SourceSansBold
DropButton.Text = ""
DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DropButton.TextSize = 14.000

for i,v in next,option do
local Item = Instance.new("TextButton")

Item.Name = "Item"
Item.Parent = DropScroll
Item.BackgroundColor3 = Color3.fromRGB(30,30,30)
Item.BackgroundTransparency = 0.000
Item.Size = UDim2.new(0, 225, 0, 18)
Item.BorderSizePixel = 0
Item.Font = Enum.Font.SourceSansBold
Item.Text = tostring(v)
Item.TextColor3 = Color3.fromRGB(225, 225, 225)
Item.TextSize = 13.000
Item.TextTransparency = 0

UICorner1.CornerRadius = UDim.new(0, 4)
UICorner1.Parent = item

Item.MouseEnter:Connect(function()
  TweenService:Create(
    Item,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      TextTransparency = 0
    }
  ):Play()
  end)

Item.MouseLeave:Connect(function()
  TweenService:Create(
    Item,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      TextTransparency = 0.5
    }
  ):Play()
  end)

Item.MouseButton1Click:Connect(function()
  isdropping = false
  Dropdown:TweenSize(UDim2.new(0,228,0,31),"Out","Quad",0.3,true)
  TweenService:Create(
    DropImage,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      Rotation = 180
    }
  ):Play()
  callback(Item.Text)
  DropTitle.Text = "   "..Name.." : "..Item.Text
  end)
end

DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

DropButton.MouseButton1Click:Connect(function()
  if isdropping == false then
  isdropping = true
  Dropdown:TweenSize(UDim2.new(0,228,0,131),"Out","Quad",0.3,true)
  TweenService:Create(
    DropImage,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      Rotation = 0
    }
  ):Play()
  else
    isdropping = false
  Dropdown:TweenSize(UDim2.new(0,228,0,31),"Out","Quad",0.3,true)
  TweenService:Create(
    DropImage,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      Rotation = 180
    }
  ):Play()
  end
  end)

local dropfunc = {}
function dropfunc:Add(t)
local Item = Instance.new("TextButton")
Item.Name = "Item"
Item.Parent = DropScroll
Item.BackgroundColor3 = Color3.fromRGB(30,30,30)
Item.BackgroundTransparency = 0.000
Item.Size = UDim2.new(0, 225, 0, 18)
Item.BorderSizePixel = 0
Item.Font = Enum.Font.SourceSansBold
Item.Text = tostring(t)
Item.TextColor3 = Color3.fromRGB(225, 225, 225)
Item.TextSize = 13.000
Item.TextTransparency = 0

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 4)
UICorner2.Parent = item

Item.MouseEnter:Connect(function()
  TweenService:Create(
    Item,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      TextTransparency = 0
    }
  ):Play()
  end)

Item.MouseLeave:Connect(function()
  TweenService:Create(
    Item,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      TextTransparency = 0.5
    }
  ):Play()
  end)

Item.MouseButton1Click:Connect(function()
  isdropping = false
  Dropdown:TweenSize(UDim2.new(0,228,0,31),"Out","Quad",0.3,true)
  TweenService:Create(
    DropImage,
    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {
      Rotation = 180
    }
  ):Play()
  callback(Item.Text)
  DropTitle.Text = "   "..Name.." : "..Item.Text
  end)
end
function dropfunc:Clear()
DropTitle.Text = "   ".."Refresh Successfully"
DropTitle.TextColor3 = Color3.fromRGB(0, 225, 0)
wait(.5)
DropTitle.Text = tostring("   "..Name).." : "
DropTitle.TextColor3 = Color3.fromRGB(225, 225, 255)
isdropping = false
Dropdown:TweenSize(UDim2.new(0,228,0,31),"Out","Quad",0.3,true)
TweenService:Create(
  DropImage,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
    Rotation = 180
  }
):Play()
for i,v in next, DropScroll:GetChildren() do
if v:IsA("TextButton") then
v:Destroy()
end
end
end
return dropfunc
end

function functionitem:MultiDropdown(Name, list, default, callback)
local Dropfunc = {}
local MainDropDown = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local MainDropDown_2 = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local v = Instance.new("TextButton")
local Text_2 = Instance.new("TextLabel")
local ImageButton = Instance.new("ImageButton")
local Scroll_Items = Instance.new("ScrollingFrame")
local UIListLayout_3 = Instance.new("UIListLayout")
local UIPadding_3 = Instance.new("UIPadding")
MainDropDown.Name = "MainDropDown"
MainDropDown.Parent = SectionContainer
MainDropDown.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
MainDropDown.BackgroundTransparency = 0
MainDropDown.BorderSizePixel = 0
MainDropDown.ClipsDescendants = true
MainDropDown.Size = UDim2.new(0.975000024, 0, 0, 30)
MainDropDown.ZIndex = 16

local UiToggle_UiStroke26 = Instance.new("UIStroke")
UiToggle_UiStroke26.Color = Color3.fromRGB(60, 60, 60)
UiToggle_UiStroke26.Thickness = 1
UiToggle_UiStroke26.Name = "UiToggle_UiStroke1"
UiToggle_UiStroke26.Parent = MainDropDown

UICorner_7.CornerRadius = UDim.new(0, 3)
UICorner_7.Parent = MainDropDown
MainDropDown_2.Name = "MainDropDown"
MainDropDown_2.Parent = MainDropDown
MainDropDown_2.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
MainDropDown_2.BackgroundTransparency = 0
MainDropDown_2.BorderSizePixel = 0
MainDropDown_2.ClipsDescendants = true
MainDropDown_2.Size = UDim2.new(1, 0, 0, 30)
MainDropDown_2.ZIndex = 16
UICorner_8.CornerRadius = UDim.new(0, 3)
UICorner_8.Parent = MainDropDown_2
v.Name = "v"
v.Parent = MainDropDown_2
v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v.BackgroundTransparency = 1.000
v.BorderSizePixel = 0
v.Size = UDim2.new(1, 0, 1, 0)
v.ZIndex = 16
v.AutoButtonColor = false
v.Font = Enum.Font.SourceSansBold
v.Text = ""
v.TextColor3 = Color3.fromRGB(255, 255, 255)
v.TextSize = 12.000
function getpro()
if default then
for i, v in next, default do
if table.find(list, v) then
callback(default)
return Name .. " : " .. table.concat(default, ", ")
else
  return Name
end
end
else
  return Name
end
end
Text_2.Name = "Text"
Text_2.Parent = MainDropDown_2
Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_2.BackgroundTransparency = 1.000
Text_2.Position = UDim2.new(0, 10, 0, 10)
Text_2.Size = UDim2.new(0, 62, 0, 12)
Text_2.ZIndex = 16
Text_2.Font = Enum.Font.SourceSansBold
Text_2.Text = getpro()
Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_2.TextSize = 12.000
Text_2.TextXAlignment = Enum.TextXAlignment.Left
ImageButton.Parent = MainDropDown_2
ImageButton.AnchorPoint = Vector2.new(0, 0.5)
ImageButton.BackgroundTransparency = 1.000
ImageButton.Position = UDim2.new(1, -25, 0.5, 0)
ImageButton.Size = UDim2.new(0, 12, 0, 12)
ImageButton.ZIndex = 16
ImageButton.Image = "http://www.roblox.com/asset/?id=6282522798"
local DropTable = {}
Scroll_Items.Name = "Scroll_Items"
Scroll_Items.Parent = MainDropDown
Scroll_Items.Active = true
Scroll_Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Scroll_Items.BackgroundTransparency = 1.000
Scroll_Items.BorderSizePixel = 0
Scroll_Items.Position = UDim2.new(0, 0, 0, 35)
Scroll_Items.Size = UDim2.new(1, 0, 1, -35)
Scroll_Items.ZIndex = 16
Scroll_Items.CanvasSize = UDim2.new(0, 0, 0, 265)
Scroll_Items.ScrollBarThickness = 0
UIListLayout_3.Parent = Scroll_Items
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 5)
UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
  function()
  Scroll_Items.CanvasSize = UDim2.new(1, 0, 0, UIListLayout_2.AbsoluteContentSize.Y+40)
  end
)
UIPadding_3.Parent = Scroll_Items
UIPadding_3.PaddingLeft = UDim.new(0, 10)
UIPadding_3.PaddingTop = UDim.new(0, 5)
function Dropfunc:TogglePanel(state)
TweenService:Create(
  MainDropDown,
  TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
  {
    Size = state and UDim2.new(0.975000024, 0, 0, 200) or UDim2.new(0.975000024, 0, 0, 30)}
):Play()
TweenService:Create(
  ImageButton,
  TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
  {
    Rotation = state and 180 or 0
  }
):Play()
end
local Tof = false
ImageButton.MouseButton1Click:Connect(
  function()
  Tof = not Tof
  Dropfunc:TogglePanel(Tof)
  end
)
v.MouseButton1Click:Connect(
  function()
  Tof = not Tof
  Dropfunc:TogglePanel(Tof)
  end
)
function Dropfunc:Add(Text)
local _5 = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
_5.Name = Text
_5.Parent = Scroll_Items
_5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
_5.BorderSizePixel = 0
_5.ClipsDescendants = true
_5.Size = UDim2.new(1, -10, 0, 20)
_5.ZIndex = 17
_5.AutoButtonColor = false
_5.Font = Enum.Font.SourceSansBold
_5.Text = Text
_5.TextColor3 = Color3.fromRGB(255, 255, 255)
_5.TextSize = 12.000
UICorner_9.CornerRadius = UDim.new(0, 3)
UICorner_9.Parent = _5
_5.MouseButton1Click:Connect(
  function()
  if not table.find(DropTable, Text) then
  table.insert(DropTable, Text)
  callback(DropTable, Text)
  Text_2.Text = Name .. " : " .. table.concat(DropTable, ", ")
  TweenService:Create(
    _5,
    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {
      TextColor3 = _G.Color
    }
  ):Play()
  else
    TweenService:Create(
    _5,
    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {
      TextColor3 = _G.Color
    }
  ):Play()
  for i2, v2 in pairs(DropTable) do
  if v2 == Text then
  table.remove(DropTable, i2)
  Text_2.Text = Name .. " : " .. table.concat(DropTable, ", ")
  end
  end
  callback(DropTable, Text)
  end
  end
)
end
function Dropfunc:Clear()
for i, v in next, Scroll_Items:GetChildren() do
if v:IsA("TextButton") then
v:Destroy()
end
end
end
for i, v in next, list do
Dropfunc:Add(v)
end
return Dropfunc
end
function functionitem:Slider(text,floor,min,max,de,callback)
local SliderFrame = Instance.new("Frame")
local LabelNameSlider = Instance.new("TextLabel")
local ShowValueFrame = Instance.new("Frame")
local CustomValue = Instance.new("TextBox")
local ShowValueFrameUICorner = Instance.new("UICorner")
local ValueFrame = Instance.new("Frame")
local ValueFrameUICorner = Instance.new("UICorner")
local PartValue = Instance.new("Frame")
local PartValueUICorner = Instance.new("UICorner")
local MainValue = Instance.new("Frame")
local MainValueUICorner = Instance.new("UICorner")
local sliderfunc = {}

SliderFrame.Name = "SliderFrame"
SliderFrame.Parent = SectionContainer
SliderFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
SliderFrame.Position = UDim2.new(0.109489053, 0, 0.708609283, 0)
SliderFrame.Size = UDim2.new(0.975000024, 0, 0, 45)
SliderFrame.BackgroundTransparency = 0

local UiToggle_UiStroke28 = Instance.new("UIStroke")
UiToggle_UiStroke28.Color = Color3.fromRGB(60, 60, 60)
UiToggle_UiStroke28.Thickness = 1
UiToggle_UiStroke28.Name = "UiToggle_UiStroke1"
UiToggle_UiStroke28.Parent = SliderFrame

local UICorner_7 = Instance.new("UICorner")
UICorner_7.CornerRadius = UDim.new(0, 4)
UICorner_7.Parent = SliderFrame

LabelNameSlider.Name = "LabelNameSlider"
LabelNameSlider.Parent = SliderFrame
LabelNameSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LabelNameSlider.BackgroundTransparency = 1.000
LabelNameSlider.Position = UDim2.new(0.0729926974, 0, 0.0396823473, 0)
LabelNameSlider.Size = UDim2.new(0, 182, 0, 25)
LabelNameSlider.Font = Enum.Font.SourceSansBold
LabelNameSlider.Text = tostring(text)
LabelNameSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
LabelNameSlider.TextSize = 11.000
LabelNameSlider.TextXAlignment = Enum.TextXAlignment.Left

ShowValueFrame.Name = "ShowValueFrame"
ShowValueFrame.Parent = SliderFrame
ShowValueFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
ShowValueFrame.BackgroundTransparency = 1
ShowValueFrame.Position = UDim2.new(0.733576655, 0, 0.0656082779, 0)
ShowValueFrame.Size = UDim2.new(0, 58, 0, 21)

CustomValue.Name = "CustomValue"
CustomValue.Parent = ShowValueFrame
CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
CustomValue.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CustomValue.Position = UDim2.new(0.3, 0, 0.5, 0)
CustomValue.Size = UDim2.new(0, 55, 0, 21)
CustomValue.Font = Enum.Font.SourceSansBold
CustomValue.Text = "50"
CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
CustomValue.TextSize = 11.000

ShowValueFrameUICorner.CornerRadius = UDim.new(0, 4)
ShowValueFrameUICorner.Name = "ShowValueFrameUICorner"
ShowValueFrameUICorner.Parent = CustomValue


ValueFrame.Name = "ValueFrame"
ValueFrame.Parent = SliderFrame
ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ValueFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ValueFrame.Position = UDim2.new(0.5, 0, 0.8, 0)
ValueFrame.Size = UDim2.new(0, 200, 0, 5)

ValueFrameUICorner.CornerRadius = UDim.new(0, 30)
ValueFrameUICorner.Name = "ValueFrameUICorner"
ValueFrameUICorner.Parent = ValueFrame

PartValue.Name = "PartValue"
PartValue.Parent = ValueFrame
PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
PartValue.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
PartValue.BackgroundTransparency = 1.000
PartValue.Position = UDim2.new(0.5, 0, 0.8, 0)
PartValue.Size = UDim2.new(0, 200, 0, 5)

PartValueUICorner.CornerRadius = UDim.new(0, 30)
PartValueUICorner.Name = "PartValueUICorner"
PartValueUICorner.Parent = PartValue

MainValue.Name = "MainValue"
MainValue.Parent = ValueFrame
MainValue.BackgroundColor3 = _G.Color
MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
MainValue.BorderSizePixel = 0

MainValueUICorner.CornerRadius = UDim.new(0, 30)
MainValueUICorner.Name = "MainValueUICorner"
MainValueUICorner.Parent = MainValue


local ConneValue = Instance.new("Frame")
ConneValue.Name = "ConneValue"
ConneValue.Parent = PartValue
ConneValue.AnchorPoint = Vector2.new(0.7, 0.7)
ConneValue.BackgroundColor3 = _G.Color
ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.5,0, 0)
ConneValue.Size = UDim2.new(0, 10, 0, 10)
ConneValue.BorderSizePixel = 0

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ConneValue


if floor == true then
CustomValue.Text = tostring(de and string.format((de / max) * (max - min) + min) or 0)
else
  CustomValue.Text = tostring(de and math.floor((de / max) * (max - min) + min) or 0)
end

function move(input)
local pos =
UDim2.new(
  math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
  0,
  0.5,
  0
)
local pos1 =
UDim2.new(
  math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
  0,
  0,
  5
)
MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)
ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
if floor == true then
local value = string.format("%.0f",((pos.X.Scale * max) / max) * (max - min) + min)
CustomValue.Text = tostring(value)
callback(value)
else
  local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
CustomValue.Text = tostring(value)
callback(value)
end
end
local dragging = false
ConneValue.InputBegan:Connect(
  function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1 then
  dragging = true
  end
  end)
ConneValue.InputEnded:Connect(
  function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1 then
  dragging = false
  end
  end)
SliderFrame.InputBegan:Connect(
  function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1 then
  dragging = true
  end
  end)
SliderFrame.InputEnded:Connect(
  function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1 then
  dragging = false
  end
  end)
ValueFrame.InputBegan:Connect(
  function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1 then
  dragging = true
  end
  end)
ValueFrame.InputEnded:Connect(
  function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1 then
  dragging = false
  end
  end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
  if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
  move(input)
  end
  end)
CustomValue.FocusLost:Connect(function()
  if CustomValue.Text == "" then
  CustomValue.Text = de
  end
  if tonumber(CustomValue.Text) > max then
  CustomValue.Text = max
  end
  MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
  ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.6, 0) , "Out", "Sine", 0.2, true)
  if floor == true then
  CustomValue.Text = tostring(CustomValue.Text and string.format("%.0f",(CustomValue.Text / max) * (max - min) + min))
  else
    CustomValue.Text = tostring(CustomValue.Text and math.floor((CustomValue.Text / max) * (max - min) + min))
  end
  pcall(callback, CustomValue.Text)
  end)

function sliderfunc:Update(value)
MainValue:TweenSize(UDim2.new((value or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
ConneValue:TweenPosition(UDim2.new((value or 0)/max, 0.5, 0.5,0, 0) , "Out", "Sine", 0.2, true)
CustomValue.Text = value
pcall(function()
  callback(value)
  end)
end



return sliderfunc
end
return functionitem
end
return sections
end
return tabs
end
local request = syn and syn.request or identifyexecutor() == "Fluxus" and request or http_request or requests
local setidentity = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity or function() end

function TP(B1)
    local Postion = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local Postion1 = B1 * CFrame.new(0,0,0)
    local Postion2 = (B1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed = 300
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Postion.X,B1.Y,Postion.Z)
    local start = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Postion2/_G.Settings.TweenSpeed, Enum.EasingStyle.Linear),{CFrame = B1})
    start:Play()
    end

function GetWeapon(bh)
    s = ""
    for r, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == bh then
            s = v.Name
        end
    end
    for r, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == bh then
            s = v.Name
        end
    end
    return s
end
function MoonTextureId()
    if World1 then
        return game:GetService("Lighting").FantasySky.MoonTextureId
    elseif World2 then
        return game:GetService("Lighting").FantasySky.MoonTextureId
    elseif World3 then
        return game:GetService("Lighting").Sky.MoonTextureId
    end
end
function CheckMoon()
    moon8 = "http://www.roblox.com/asset/?id=9709150401"
    moon7 = "http://www.roblox.com/asset/?id=9709150086"
    moon6 = "http://www.roblox.com/asset/?id=9709149680"
    moon5 = "http://www.roblox.com/asset/?id=9709149431"
    moon4 = "http://www.roblox.com/asset/?id=9709149052"
    moon3 = "http://www.roblox.com/asset/?id=9709143733"
    moon2 = "http://www.roblox.com/asset/?id=9709139597"
    moon1 = "http://www.roblox.com/asset/?id=9709135895"
    moonreal = MoonTextureId()
    cofullmoonkothangbeo = "Bad Moon"
    if moonreal == moon5 or moonreal == moon4 then
        if moonreal == moon5 then
            cofullmoonkothangbeo = "Full Moon"
        elseif moonreal == moon4 then
            cofullmoonkothangbeo = "Next Night"
        end
    end
    return cofullmoonkothangbeo
end
function function7()
    GameTime = "Error"
    local c = game.Lighting
    local ao = c.ClockTime
    if ao >= 18 or ao < 5 then
        GameTime = "Night"
    else
        GameTime = "Day"
    end
    return GameTime
end
function function6()
    return math.floor(game.Lighting.ClockTime)
end
function getServerTime()
    RealTime = tostring(math.floor(game.Lighting.ClockTime * 100) / 100)
    RealTime = tostring(game.Lighting.ClockTime)
    RealTimeTable = RealTime:split(".")
    Minute, Second = RealTimeTable[1], tonumber(0 + tonumber(RealTimeTable[2] / 100)) * 60
    return Minute, Second
end
function function8()
    local c = game.Lighting
    local ao = c.ClockTime
    if CheckMoon() == "Full Moon" and ao <= 5 then
        return tostring(function6()) .. " ( Will End Moon In " .. math.floor(5 - ao) .. " Minutes )"
    elseif CheckMoon() == "Full Moon" and (ao > 5 and ao < 12) then
        return tostring(function6()) .. " ( Fake Moon )"
    elseif CheckMoon() == "Full Moon" and (ao > 12 and ao < 18) then
        return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 - ao) .. " Minutes )"
    elseif CheckMoon() == "Full Moon" and (ao > 18 and ao <= 24) then
        return tostring(function6()) .. " ( Will End Moon In " .. math.floor(24 + 6 - ao) .. " Minutes )"
    end
    if CheckMoon() == "Next Night" and ao < 12 then
        return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 - ao) .. " Minutes )"
    elseif CheckMoon() == "Next Night" and ao > 12 then
        return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 + 12 - ao) .. " Minutes )"
    end
    return tostring(function6())
end
function FullMoobCheck()
 return function8()
end
function MirageIslandCheck()
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
       return "Spawn"
    else
       return "..."
    end
end
function KitsuneIslandCheck()
 if game.Workspace.Map:FindFirstChild("KitsuneIsland") or game.Workspace.Map.KitsuneIsland then
    return "Spawn"
 else
    return "..."
 end
end
function getHighestPoint()
    if not game.workspace.Map:FindFirstChild("MysticIsland") then
        return nil
    end
    for r, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
        if v:IsA("MeshPart") then
            if v.MeshId == "rbxassetid://16991318748" then
                return v
            end
        end
    end
end
function TwenetoHighestPoint()
    HighestPoint = getHighestPoint()
    if HighestPoint then
        TP(HighestPoint.CFrame * CFrame.new(0, 211.88, 0))
    end
end
function MoveCamtoMoon()
    workspace.CurrentCamera.CFrame =
        CFrame.new(
        workspace.CurrentCamera.CFrame.Position,
        game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position
    )
end
function TweenMirage()
    repeat
        wait()
    until game.Workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island')
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island') then
        AllNPCS = getnilinstances()
        for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            table.insert(AllNPCS, v)
        end
        for r, v in pairs(AllNPCS) do
            if v.Name == "Advanced Fruit Dealer" then
                TP(v.HumanoidRootPart.CFrame)
            end
        end
    end
end
function getBlueGear()
    if game.workspace.Map:FindFirstChild("MysticIsland") then
        for r, v in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
            if v:IsA("MeshPart") and v.MeshId == "rbxassetid://16991318748" then
                return v
            end
        end
    end
end
function TweentoBlueGear()
    BlueGear = getBlueGear()
    if BlueGear then
        TP(BlueGear.CFrame)
    end
end
function EquipWeapon(ToolSe)
    if gggggg then
        return
    end
    if _G.Settings.SelectWeapon == "" or _G.Settings.SelectWeapon == nil or not _G.Settings.SelectWeapon then
        _G.Settings.SelectWeapon = "Melee"
    end
    ToolSe = GetWeapon(_G.Settings.SelectWeapon)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
    end
end
function EquipWeaponName(m)
    if not m then
        return
    end
    ToolSe = m
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
    end
end
function BringMob(name,CFrameMon)
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v.name == name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
                    v.Humanoid.WalkSpeed = 0
                    v.Humanoid.JumpPower = 0
                    v.HumanoidRootPart.CanCollide = false
                    v.HumanoidRootPart.CFrame = CFrameMon
                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                    if v.Humanoid:FindFirstChild('Animator') then
                        v.Humanoid.Animator:Destroy()
                    end
                    v.Humanoid:ChangeState(11)
                    v.Humanoid:ChangeState(14)
                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                    end
        end
end
function CheckTool(cJ)
    lol = {game.Players.LocalPlayer.Character, game.Players.LocalPlayer.Backpack}
    for r, v in pairs(lol) do
        if v:FindFirstChild(cJ) then
            return v:FindFirstChild(cJ)
        end
    end
end
function CheckIsRaiding()
    checkraid1 = game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true
    checkraid2 = getNextIsland()
    if checkraid1 then
        return checkraid1
    end
    return checkraid2
end
function AutoBuyChipRaid(starts)
 if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
    if not CheckTool('Special Microchip') then
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select",_G.Settings.RaidList) 
    end
    if starts then
    if World2 then
        fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
    elseif World3 then
        fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
    end 
end
 end
end
function StartsRaid()
    if World2 then
        fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
    elseif World3 then
        fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
    end
end
function KillAura()
    task.spawn(function()
    for r, v in pairs(game.Workspace.Enemies:GetDescendants()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 and v.Humanoid.Health > 0 then
            v.Humanoid.Health = 0
        end
    end
    for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") then
            spawn(function()
                    repeat
                        v.Humanoid.Health = 0
                        task.wait()
                    until not v or not v:FindFirstChild("Humanoid") or v.Humanoid.Health == 0
                end)
        end
    end
end)
end
spawn(function()
    while wait() do
     if _G.Settings.KillAura then
       KillAura()
     end
    end
   end)
task.spawn(function()
 while wait() do
  if _G.Settings.NextIslands then
    getNextIsland()
  end
 end
end)
task.spawn(function()
    while wait() do
     if _G.Settings.AutoBuyChipsRaid and not CheckTool('Special Microchip')then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select",_G.Settings.RaidList)
     end
    end
   end)
   task.spawn(function()
   while task.wait() do
    if _G.Settings.AutoRaid then
        if CheckIsRaiding() then
            if getNextIsland() then
                spawn(TP(getNextIsland().CFrame * CFrame.new(0, 60, 0)), 1)
                KillAura()
            end
        else
                    AutoBuyChipRaid(true)
        end
    end
   end
   end)

function AutoHaki()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        local args = {
            [1] = "Buso"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end
spawn(function()
 while wait() do
    if _G.Settings.AutoFarmLevel or _G.Settings.AutoFarmNear or _G.Settings.AutoCakePrince or _G.Settings.AutoFarmBone or _G.Settings.AutoPirateRaid or _G.Settings.AutoFarmElite or _G.Settings.AutoKillPlrTrial then
        repeat wait(0.0137)
            game:GetService 'VirtualUser':CaptureController()
            game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
        until _G.Settings.AutoFarmLevel or _G.Settings.AutoFarmNear or _G.Settings.AutoCakePrince or _G.Settings.AutoFarmBone or _G.Settings.AutoPirateRaid or _G.Settings.AutoFarmElite or _G.Settings.AutoKillPlrTrial
        AutoHaki()
    if not game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
        local ag = Instance.new("BodyVelocity")
        ag.Velocity = Vector3.new(0, 0, 0)
        ag.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        ag.P = 9000
        ag.Parent = game.Players.LocalPlayer.Character.Head
        for r, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
      elseif game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
       game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
    end
    else 
        if game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
            game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
        end
  end
 end
end)

local Module = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local CombatFramework = debug.getupvalues(Module)[2]
local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
task.spawn(function()
    while task.wait() do
        if _G.Settings.FastAttack then
                CameraShakerR:Stop()
                CombatFramework.activeController.attacking = false
                CombatFramework.activeController.timeToNextAttack = 0
                CombatFramework.activeController.increment = 3
                CombatFramework.activeController.hitboxMagnitude = 100
                CombatFramework.activeController.blocking = false
                CombatFramework.activeController.timeToNextBlock = 0
                CombatFramework.activeController.focusStart = 0
                CombatFramework.activeController.humanoid.AutoRotate = true
        end
    end
end)

function CheckQuest()MyLevel=game:GetService("Players").LocalPlayer.Data.Level.Value;if World1 then if MyLevel==1 or MyLevel<=9 then Mon="Bandit"LevelQuest=1;NameQuest="BanditQuest1"NameMon="Bandit"CFrameQuest=CFrame.new(1059.37195,15.4495068,1550.4231,0.939700544,-0,-0.341998369,0,1,-0,0.341998369,0,0.939700544)CFrameMon=CFrame.new(1045.962646484375,27.00250816345215,1560.8203125)elseif MyLevel==10 or MyLevel<=14 then Mon="Monkey"LevelQuest=1;NameQuest="JungleQuest"NameMon="Monkey"CFrameQuest=CFrame.new(-1598.08911,35.5501175,153.377838,0,0,1,0,1,-0,-1,0,0)CFrameMon=CFrame.new(-1448.51806640625,67.85301208496094,11.46579647064209)elseif MyLevel==15 or MyLevel<=29 then Mon="Gorilla"LevelQuest=2;NameQuest="JungleQuest"NameMon="Gorilla"CFrameQuest=CFrame.new(-1598.08911,35.5501175,153.377838,0,0,1,0,1,-0,-1,0,0)CFrameMon=CFrame.new(-1129.8836669921875,40.46354675292969,-525.4237060546875)elseif MyLevel==30 or MyLevel<=39 then Mon="Pirate"LevelQuest=1;NameQuest="BuggyQuest1"NameMon="Pirate"CFrameQuest=CFrame.new(-1141.07483,4.10001802,3831.5498,0.965929627,-0,-0.258804798,0,1,-0,0.258804798,0,0.965929627)CFrameMon=CFrame.new(-1103.513427734375,13.752052307128906,3896.091064453125)elseif MyLevel==40 or MyLevel<=59 then Mon="Brute"LevelQuest=2;NameQuest="BuggyQuest1"NameMon="Brute"CFrameQuest=CFrame.new(-1141.07483,4.10001802,3831.5498,0.965929627,-0,-0.258804798,0,1,-0,0.258804798,0,0.965929627)CFrameMon=CFrame.new(-1140.083740234375,14.809885025024414,4322.92138671875)elseif MyLevel==60 or MyLevel<=74 then Mon="Desert Bandit"LevelQuest=1;NameQuest="DesertQuest"NameMon="Desert Bandit"CFrameQuest=CFrame.new(894.488647,5.14000702,4392.43359,0.819155693,-0,-0.573571265,0,1,-0,0.573571265,0,0.819155693)CFrameMon=CFrame.new(924.7998046875,6.44867467880249,4481.5859375)elseif MyLevel==75 or MyLevel<=89 then Mon="Desert Officer"LevelQuest=2;NameQuest="DesertQuest"NameMon="Desert Officer"CFrameQuest=CFrame.new(894.488647,5.14000702,4392.43359,0.819155693,-0,-0.573571265,0,1,-0,0.573571265,0,0.819155693)CFrameMon=CFrame.new(1608.2822265625,8.614224433898926,4371.00732421875)elseif MyLevel==90 or MyLevel<=99 then Mon="Snow Bandit"LevelQuest=1;NameQuest="SnowQuest"NameMon="Snow Bandit"CFrameQuest=CFrame.new(1389.74451,88.1519318,-1298.90796,-0.342042685,0,0.939684391,0,1,0,-0.939684391,0,-0.342042685)CFrameMon=CFrame.new(1354.347900390625,87.27277374267578,-1393.946533203125)elseif MyLevel==100 or MyLevel<=119 then Mon="Snowman"LevelQuest=2;NameQuest="SnowQuest"NameMon="Snowman"CFrameQuest=CFrame.new(1389.74451,88.1519318,-1298.90796,-0.342042685,0,0.939684391,0,1,0,-0.939684391,0,-0.342042685)CFrameMon=CFrame.new(1201.6412353515625,144.57958984375,-1550.0670166015625)elseif MyLevel==120 or MyLevel<=149 then Mon="Chief Petty Officer"LevelQuest=1;NameQuest="MarineQuest2"NameMon="Chief Petty Officer"CFrameQuest=CFrame.new(-5039.58643,27.3500385,4324.68018,0,0,-1,0,1,0,1,0,0)CFrameMon=CFrame.new(-4881.23095703125,22.65204429626465,4273.75244140625)elseif MyLevel==150 or MyLevel<=174 then Mon="Sky Bandit"LevelQuest=1;NameQuest="SkyQuest"NameMon="Sky Bandit"CFrameQuest=CFrame.new(-4839.53027,716.368591,-2619.44165,0.866007268,0,0.500031412,0,1,0,-0.500031412,0,0.866007268)CFrameMon=CFrame.new(-4953.20703125,295.74420166015625,-2899.22900390625)elseif MyLevel==175 or MyLevel<=189 then Mon="Dark Master"LevelQuest=2;NameQuest="SkyQuest"NameMon="Dark Master"CFrameQuest=CFrame.new(-4839.53027,716.368591,-2619.44165,0.866007268,0,0.500031412,0,1,0,-0.500031412,0,0.866007268)CFrameMon=CFrame.new(-5259.8447265625,391.3976745605469,-2229.035400390625)elseif MyLevel==190 or MyLevel<=209 then Mon="Prisoner"LevelQuest=1;NameQuest="PrisonerQuest"NameMon="Prisoner"CFrameQuest=CFrame.new(5308.93115,1.65517521,475.120514,-0.0894274712,-5.00292918e-09,-0.995993316,1.60817859e-09,1,-5.16744869e-09,0.995993316,-2.06384709e-09,-0.0894274712)CFrameMon=CFrame.new(5098.9736328125,-0.3204058110713959,474.2373352050781)elseif MyLevel==210 or MyLevel<=249 then Mon="Dangerous Prisoner"LevelQuest=2;NameQuest="PrisonerQuest"NameMon="Dangerous Prisoner"CFrameQuest=CFrame.new(5308.93115,1.65517521,475.120514,-0.0894274712,-5.00292918e-09,-0.995993316,1.60817859e-09,1,-5.16744869e-09,0.995993316,-2.06384709e-09,-0.0894274712)CFrameMon=CFrame.new(5654.5634765625,15.633401870727539,866.2991943359375)elseif MyLevel==250 or MyLevel<=274 then Mon="Toga Warrior"LevelQuest=1;NameQuest="ColosseumQuest"NameMon="Toga Warrior"CFrameQuest=CFrame.new(-1580.04663,6.35000277,-2986.47534,-0.515037298,0,-0.857167721,0,1,0,0.857167721,0,-0.515037298)CFrameMon=CFrame.new(-1820.21484375,51.68385696411133,-2740.6650390625)elseif MyLevel==275 or MyLevel<=299 then Mon="Gladiator"LevelQuest=2;NameQuest="ColosseumQuest"NameMon="Gladiator"CFrameQuest=CFrame.new(-1580.04663,6.35000277,-2986.47534,-0.515037298,0,-0.857167721,0,1,0,0.857167721,0,-0.515037298)CFrameMon=CFrame.new(-1292.838134765625,56.380882263183594,-3339.031494140625)elseif MyLevel==300 or MyLevel<=324 then Mon="Military Soldier"LevelQuest=1;NameQuest="MagmaQuest"NameMon="Military Soldier"CFrameQuest=CFrame.new(-5313.37012,10.9500084,8515.29395,-0.499959469,0,0.866048813,0,1,0,-0.866048813,0,-0.499959469)CFrameMon=CFrame.new(-5411.16455078125,11.081554412841797,8454.29296875)elseif MyLevel==325 or MyLevel<=374 then Mon="Military Spy"LevelQuest=2;NameQuest="MagmaQuest"NameMon="Military Spy"CFrameQuest=CFrame.new(-5313.37012,10.9500084,8515.29395,-0.499959469,0,0.866048813,0,1,0,-0.866048813,0,-0.499959469)CFrameMon=CFrame.new(-5802.8681640625,86.26241302490234,8828.859375)elseif MyLevel==375 or MyLevel<=399 then Mon="Fishman Warrior"LevelQuest=1;NameQuest="FishmanQuest"NameMon="Fishman Warrior"CFrameQuest=CFrame.new(61122.65234375,18.497442245483,1569.3997802734)CFrameMon=CFrame.new(60878.30078125,18.482830047607422,1543.7574462890625)elseif MyLevel==400 or MyLevel<=449 then Mon="Fishman Commando"LevelQuest=2;NameQuest="FishmanQuest"NameMon="Fishman Commando"CFrameQuest=CFrame.new(61122.65234375,18.497442245483,1569.3997802734)CFrameMon=CFrame.new(61922.6328125,18.482830047607422,1493.934326171875)elseif MyLevel==450 or MyLevel<=474 then Mon="God's Guard"LevelQuest=1;NameQuest="SkyExp1Quest"NameMon="God's Guard"CFrameQuest=CFrame.new(-4721.88867,843.874695,-1949.96643,0.996191859,-0,-0.0871884301,0,1,-0,0.0871884301,0,0.996191859)CFrameMon=CFrame.new(-4710.04296875,845.2769775390625,-1927.3079833984375)elseif MyLevel==475 or MyLevel<=524 then Mon="Shanda"LevelQuest=2;NameQuest="SkyExp1Quest"NameMon="Shanda"CFrameQuest=CFrame.new(-7859.09814,5544.19043,-381.476196,-0.422592998,0,0.906319618,0,1,0,-0.906319618,0,-0.422592998)CFrameMon=CFrame.new(-7678.48974609375,5566.40380859375,-497.2156066894531)if _G.AutoFarm and(CFrameQuest.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude>10000 then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813,5547.1416015625,-380.29119873047))end elseif MyLevel==525 or MyLevel<=549 then Mon="Royal Squad"LevelQuest=1;NameQuest="SkyExp2Quest"NameMon="Royal Squad"CFrameQuest=CFrame.new(-7906.81592,5634.6626,-1411.99194,0,0,-1,0,1,0,1,0,0)CFrameMon=CFrame.new(-7624.25244140625,5658.13330078125,-1467.354248046875)elseif MyLevel==550 or MyLevel<=624 then Mon="Royal Soldier"LevelQuest=2;NameQuest="SkyExp2Quest"NameMon="Royal Soldier"CFrameQuest=CFrame.new(-7906.81592,5634.6626,-1411.99194,0,0,-1,0,1,0,1,0,0)CFrameMon=CFrame.new(-7836.75341796875,5645.6640625,-1790.6236572265625)elseif MyLevel==625 or MyLevel<=649 then Mon="Galley Pirate"LevelQuest=1;NameQuest="FountainQuest"NameMon="Galley Pirate"CFrameQuest=CFrame.new(5259.81982,37.3500175,4050.0293,0.087131381,0,0.996196866,0,1,0,-0.996196866,0,0.087131381)CFrameMon=CFrame.new(5551.02197265625,78.90135192871094,3930.412841796875)elseif MyLevel>=650 then Mon="Galley Captain"LevelQuest=2;NameQuest="FountainQuest"NameMon="Galley Captain"CFrameQuest=CFrame.new(5259.81982,37.3500175,4050.0293,0.087131381,0,0.996196866,0,1,0,-0.996196866,0,0.087131381)CFrameMon=CFrame.new(5441.95166015625,42.50205993652344,4950.09375)end elseif World2 then if MyLevel==700 or MyLevel<=724 then Mon="Raider"LevelQuest=1;NameQuest="Area1Quest"NameMon="Raider"CFrameQuest=CFrame.new(-429.543518,71.7699966,1836.18188,-0.22495985,0,-0.974368095,0,1,0,0.974368095,0,-0.22495985)CFrameMon=CFrame.new(-728.3267211914062,52.779319763183594,2345.7705078125)elseif MyLevel==725 or MyLevel<=774 then Mon="Mercenary"LevelQuest=2;NameQuest="Area1Quest"NameMon="Mercenary"CFrameQuest=CFrame.new(-429.543518,71.7699966,1836.18188,-0.22495985,0,-0.974368095,0,1,0,0.974368095,0,-0.22495985)CFrameMon=CFrame.new(-1004.3244018554688,80.15886688232422,1424.619384765625)elseif MyLevel==775 or MyLevel<=799 then Mon="Swan Pirate"LevelQuest=1;NameQuest="Area2Quest"NameMon="Swan Pirate"CFrameQuest=CFrame.new(638.43811,71.769989,918.282898,0.139203906,0,0.99026376,0,1,0,-0.99026376,0,0.139203906)CFrameMon=CFrame.new(1068.664306640625,137.61428833007812,1322.1060791015625)elseif MyLevel==800 or MyLevel<=874 then Mon="Factory Staff"NameQuest="Area2Quest"LevelQuest=2;NameMon="Factory Staff"CFrameQuest=CFrame.new(632.698608,73.1055908,918.666321,-0.0319722369,8.96074881e-10,-0.999488771,1.36326533e-10,1,8.92172336e-10,0.999488771,-1.07732087e-10,-0.0319722369)CFrameMon=CFrame.new(73.07867431640625,81.86344146728516,-27.470672607421875)elseif MyLevel==875 or MyLevel<=899 then Mon="Marine Lieutenant"LevelQuest=1;NameQuest="MarineQuest3"NameMon="Marine Lieutenant"CFrameQuest=CFrame.new(-2440.79639,71.7140732,-3216.06812,0.866007268,0,0.500031412,0,1,0,-0.500031412,0,0.866007268)CFrameMon=CFrame.new(-2821.372314453125,75.89727783203125,-3070.089111328125)elseif MyLevel==900 or MyLevel<=949 then Mon="Marine Captain"LevelQuest=2;NameQuest="MarineQuest3"NameMon="Marine Captain"CFrameQuest=CFrame.new(-2440.79639,71.7140732,-3216.06812,0.866007268,0,0.500031412,0,1,0,-0.500031412,0,0.866007268)CFrameMon=CFrame.new(-1861.2310791015625,80.17658233642578,-3254.697509765625)elseif MyLevel==950 or MyLevel<=974 then Mon="Zombie"LevelQuest=1;NameQuest="ZombieQuest"NameMon="Zombie"CFrameQuest=CFrame.new(-5497.06152,47.5923004,-795.237061,-0.29242146,0,-0.95628953,0,1,0,0.95628953,0,-0.29242146)CFrameMon=CFrame.new(-5657.77685546875,78.96973419189453,-928.68701171875)elseif MyLevel==975 or MyLevel<=999 then Mon="Vampire"LevelQuest=2;NameQuest="ZombieQuest"NameMon="Vampire"CFrameQuest=CFrame.new(-5497.06152,47.5923004,-795.237061,-0.29242146,0,-0.95628953,0,1,0,0.95628953,0,-0.29242146)CFrameMon=CFrame.new(-6037.66796875,32.18463897705078,-1340.6597900390625)elseif MyLevel==1000 or MyLevel<=1049 then Mon="Snow Trooper"LevelQuest=1;NameQuest="SnowMountainQuest"NameMon="Snow Trooper"CFrameQuest=CFrame.new(609.858826,400.119904,-5372.25928,-0.374604106,0,0.92718488,0,1,0,-0.92718488,0,-0.374604106)CFrameMon=CFrame.new(549.1473388671875,427.3870544433594,-5563.69873046875)elseif MyLevel==1050 or MyLevel<=1099 then Mon="Winter Warrior"LevelQuest=2;NameQuest="SnowMountainQuest"NameMon="Winter Warrior"CFrameQuest=CFrame.new(609.858826,400.119904,-5372.25928,-0.374604106,0,0.92718488,0,1,0,-0.92718488,0,-0.374604106)CFrameMon=CFrame.new(1142.7451171875,475.6398010253906,-5199.41650390625)elseif MyLevel==1100 or MyLevel<=1124 then Mon="Lab Subordinate"LevelQuest=1;NameQuest="IceSideQuest"NameMon="Lab Subordinate"CFrameQuest=CFrame.new(-6064.06885,15.2422857,-4902.97852,0.453972578,-0,-0.891015649,0,1,-0,0.891015649,0,0.453972578)CFrameMon=CFrame.new(-5707.4716796875,15.951709747314453,-4513.39208984375)elseif MyLevel==1125 or MyLevel<=1174 then Mon="Horned Warrior"LevelQuest=2;NameQuest="IceSideQuest"NameMon="Horned Warrior"CFrameQuest=CFrame.new(-6064.06885,15.2422857,-4902.97852,0.453972578,-0,-0.891015649,0,1,-0,0.891015649,0,0.453972578)CFrameMon=CFrame.new(-6341.36669921875,15.951770782470703,-5723.162109375)elseif MyLevel==1175 or MyLevel<=1199 then Mon="Magma Ninja"LevelQuest=1;NameQuest="FireSideQuest"NameMon="Magma Ninja"CFrameQuest=CFrame.new(-5428.03174,15.0622921,-5299.43457,-0.882952213,0,0.469463557,0,1,0,-0.469463557,0,-0.882952213)CFrameMon=CFrame.new(-5449.6728515625,76.65874481201172,-5808.20068359375)elseif MyLevel==1200 or MyLevel<=1249 then Mon="Lava Pirate"LevelQuest=2;NameQuest="FireSideQuest"NameMon="Lava Pirate"CFrameQuest=CFrame.new(-5428.03174,15.0622921,-5299.43457,-0.882952213,0,0.469463557,0,1,0,-0.469463557,0,-0.882952213)CFrameMon=CFrame.new(-5213.33154296875,49.73788070678711,-4701.451171875)elseif MyLevel==1250 or MyLevel<=1274 then Mon="Ship Deckhand"LevelQuest=1;NameQuest="ShipQuest1"NameMon="Ship Deckhand"CFrameQuest=CFrame.new(1037.80127,125.092171,32911.6016)CFrameMon=CFrame.new(1212.0111083984375,150.79205322265625,33059.24609375)elseif MyLevel==1275 or MyLevel<=1299 then Mon="Ship Engineer"LevelQuest=2;NameQuest="ShipQuest1"NameMon="Ship Engineer"CFrameQuest=CFrame.new(1037.80127,125.092171,32911.6016)CFrameMon=CFrame.new(919.4786376953125,43.54401397705078,32779.96875)elseif MyLevel==1300 or MyLevel<=1324 then Mon="Ship Steward"LevelQuest=1;NameQuest="ShipQuest2"NameMon="Ship Steward"CFrameQuest=CFrame.new(968.80957,125.092171,33244.125)CFrameMon=CFrame.new(919.4385375976562,129.55599975585938,33436.03515625)elseif MyLevel==1325 or MyLevel<=1349 then Mon="Ship Officer"LevelQuest=2;NameQuest="ShipQuest2"NameMon="Ship Officer"CFrameQuest=CFrame.new(968.80957,125.092171,33244.125)CFrameMon=CFrame.new(1036.0179443359375,181.4390411376953,33315.7265625)elseif MyLevel==1350 or MyLevel<=1374 then Mon="Arctic Warrior"LevelQuest=1;NameQuest="FrostQuest"NameMon="Arctic Warrior"CFrameQuest=CFrame.new(5667.6582,26.7997818,-6486.08984,-0.933587909,0,-0.358349502,0,1,0,0.358349502,0,-0.933587909)CFrameMon=CFrame.new(5966.24609375,62.97002029418945,-6179.3828125)elseif MyLevel==1375 or MyLevel<=1424 then Mon="Snow Lurker"LevelQuest=2;NameQuest="FrostQuest"NameMon="Snow Lurker"CFrameQuest=CFrame.new(5667.6582,26.7997818,-6486.08984,-0.933587909,0,-0.358349502,0,1,0,0.358349502,0,-0.933587909)CFrameMon=CFrame.new(5407.07373046875,69.19437408447266,-6880.88037109375)elseif MyLevel==1425 or MyLevel<=1449 then Mon="Sea Soldier"LevelQuest=1;NameQuest="ForgottenQuest"NameMon="Sea Soldier"CFrameQuest=CFrame.new(-3054.44458,235.544281,-10142.8193,0.990270376,-0,-0.13915664,0,1,-0,0.13915664,0,0.990270376)CFrameMon=CFrame.new(-3028.2236328125,64.67451477050781,-9775.4267578125)elseif MyLevel>=1450 then Mon="Water Fighter"LevelQuest=2;NameQuest="ForgottenQuest"NameMon="Water Fighter"CFrameQuest=CFrame.new(-3054.44458,235.544281,-10142.8193,0.990270376,-0,-0.13915664,0,1,-0,0.13915664,0,0.990270376)CFrameMon=CFrame.new(-3352.9013671875,285.01556396484375,-10534.841796875)end elseif World3 then if MyLevel==1500 or MyLevel<=1524 then Mon="Pirate Millionaire"LevelQuest=1;NameQuest="PiratePortQuest"NameMon="Pirate Millionaire"CFrameQuest=CFrame.new(-290.074677,42.9034653,5581.58984,0.965929627,-0,-0.258804798,0,1,-0,0.258804798,0,0.965929627)CFrameMon=CFrame.new(-245.9963836669922,47.30615234375,5584.1005859375)elseif MyLevel==1525 or MyLevel<=1574 then Mon="Pistol Billionaire"LevelQuest=2;NameQuest="PiratePortQuest"NameMon="Pistol Billionaire"CFrameQuest=CFrame.new(-290.074677,42.9034653,5581.58984,0.965929627,-0,-0.258804798,0,1,-0,0.258804798,0,0.965929627)CFrameMon=CFrame.new(-187.3301544189453,86.23987579345703,6013.513671875)elseif MyLevel==1575 or MyLevel<=1599 then Mon="Dragon Crew Warrior"LevelQuest=1;NameQuest="AmazonQuest"NameMon="Dragon Crew Warrior"CFrameQuest=CFrame.new(5832.83594,51.6806107,-1101.51563,0.898790359,-0,-0.438378751,0,1,-0,0.438378751,0,0.898790359)CFrameMon=CFrame.new(6141.140625,51.35136413574219,-1340.738525390625)elseif MyLevel==1600 or MyLevel<=1624 then Mon="Dragon Crew Archer [Lv. 1600]"NameQuest="AmazonQuest"LevelQuest=2;NameMon="Dragon Crew Archer"CFrameQuest=CFrame.new(5833.1147460938,51.60498046875,-1103.0693359375)CFrameMon=CFrame.new(6616.41748046875,441.7670593261719,446.0469970703125)elseif MyLevel==1625 or MyLevel<=1649 then Mon="Female Islander"NameQuest="AmazonQuest2"LevelQuest=1;NameMon="Female Islander"CFrameQuest=CFrame.new(5446.8793945313,601.62945556641,749.45672607422)CFrameMon=CFrame.new(4685.25830078125,735.8078002929688,815.3425903320312)elseif MyLevel==1650 or MyLevel<=1699 then Mon="Giant Islander [Lv. 1650]"NameQuest="AmazonQuest2"LevelQuest=2;NameMon="Giant Islander"CFrameQuest=CFrame.new(5446.8793945313,601.62945556641,749.45672607422)CFrameMon=CFrame.new(4729.09423828125,590.436767578125,-36.97627639770508)elseif MyLevel==1700 or MyLevel<=1724 then Mon="Marine Commodore"LevelQuest=1;NameQuest="MarineTreeIsland"NameMon="Marine Commodore"CFrameQuest=CFrame.new(2180.54126,27.8156815,-6741.5498,-0.965929747,0,0.258804798,0,1,0,-0.258804798,0,-0.965929747)CFrameMon=CFrame.new(2286.0078125,73.13391876220703,-7159.80908203125)elseif MyLevel==1725 or MyLevel<=1774 then Mon="Marine Rear Admiral [Lv. 1725]"NameMon="Marine Rear Admiral"NameQuest="MarineTreeIsland"LevelQuest=2;CFrameQuest=CFrame.new(2179.98828125,28.731239318848,-6740.0551757813)CFrameMon=CFrame.new(3656.773681640625,160.52406311035156,-7001.5986328125)elseif MyLevel==1775 or MyLevel<=1799 then Mon="Fishman Raider"LevelQuest=1;NameQuest="DeepForestIsland3"NameMon="Fishman Raider"CFrameQuest=CFrame.new(-10581.6563,330.872955,-8761.18652,-0.882952213,0,0.469463557,0,1,0,-0.469463557,0,-0.882952213)CFrameMon=CFrame.new(-10407.5263671875,331.76263427734375,-8368.5166015625)elseif MyLevel==1800 or MyLevel<=1824 then Mon="Fishman Captain"LevelQuest=2;NameQuest="DeepForestIsland3"NameMon="Fishman Captain"CFrameQuest=CFrame.new(-10581.6563,330.872955,-8761.18652,-0.882952213,0,0.469463557,0,1,0,-0.469463557,0,-0.882952213)CFrameMon=CFrame.new(-10994.701171875,352.38140869140625,-9002.1103515625)elseif MyLevel==1825 or MyLevel<=1849 then Mon="Forest Pirate"LevelQuest=1;NameQuest="DeepForestIsland"NameMon="Forest Pirate"CFrameQuest=CFrame.new(-13234.04,331.488495,-7625.40137,0.707134247,-0,-0.707079291,0,1,-0,0.707079291,0,0.707134247)CFrameMon=CFrame.new(-13274.478515625,332.3781433105469,-7769.58056640625)elseif MyLevel==1850 or MyLevel<=1899 then Mon="Mythological Pirate"LevelQuest=2;NameQuest="DeepForestIsland"NameMon="Mythological Pirate"CFrameQuest=CFrame.new(-13234.04,331.488495,-7625.40137,0.707134247,-0,-0.707079291,0,1,-0,0.707079291,0,0.707134247)CFrameMon=CFrame.new(-13680.607421875,501.08154296875,-6991.189453125)elseif MyLevel==1900 or MyLevel<=1924 then Mon="Jungle Pirate"LevelQuest=1;NameQuest="DeepForestIsland2"NameMon="Jungle Pirate"CFrameQuest=CFrame.new(-12680.3818,389.971039,-9902.01953,-0.0871315002,0,0.996196866,0,1,0,-0.996196866,0,-0.0871315002)CFrameMon=CFrame.new(-12256.16015625,331.73828125,-10485.8369140625)elseif MyLevel==1925 or MyLevel<=1974 then Mon="Musketeer Pirate"LevelQuest=2;NameQuest="DeepForestIsland2"NameMon="Musketeer Pirate"CFrameQuest=CFrame.new(-12680.3818,389.971039,-9902.01953,-0.0871315002,0,0.996196866,0,1,0,-0.996196866,0,-0.0871315002)CFrameMon=CFrame.new(-13457.904296875,391.545654296875,-9859.177734375)elseif MyLevel==1975 or MyLevel<=1999 then Mon="Reborn Skeleton"LevelQuest=1;NameQuest="HauntedQuest1"NameMon="Reborn Skeleton"CFrameQuest=CFrame.new(-9479.2168,141.215088,5566.09277,0,0,1,0,1,-0,-1,0,0)CFrameMon=CFrame.new(-8763.7236328125,165.72299194335938,6159.86181640625)elseif MyLevel==2000 or MyLevel<=2024 then Mon="Living Zombie"LevelQuest=2;NameQuest="HauntedQuest1"NameMon="Living Zombie"CFrameQuest=CFrame.new(-9479.2168,141.215088,5566.09277,0,0,1,0,1,-0,-1,0,0)CFrameMon=CFrame.new(-10144.1318359375,138.62667846679688,5838.0888671875)elseif MyLevel==2025 or MyLevel<=2049 then Mon="Demonic Soul"LevelQuest=1;NameQuest="HauntedQuest2"NameMon="Demonic Soul"CFrameQuest=CFrame.new(-9516.99316,172.017181,6078.46533,0,0,-1,0,1,0,1,0,0)CFrameMon=CFrame.new(-9505.8720703125,172.10482788085938,6158.9931640625)elseif MyLevel==2050 or MyLevel<=2074 then Mon="Posessed Mummy"LevelQuest=2;NameQuest="HauntedQuest2"NameMon="Posessed Mummy"CFrameQuest=CFrame.new(-9516.99316,172.017181,6078.46533,0,0,-1,0,1,0,1,0,0)CFrameMon=CFrame.new(-9582.0224609375,6.251527309417725,6205.478515625)elseif MyLevel==2075 or MyLevel<=2099 then Mon="Peanut Scout"LevelQuest=1;NameQuest="NutsIslandQuest"NameMon="Peanut Scout"CFrameQuest=CFrame.new(-2104.3908691406,38.104167938232,-10194.21875,0,0,-1,0,1,0,1,0,0)CFrameMon=CFrame.new(-2143.241943359375,47.72198486328125,-10029.9951171875)elseif MyLevel==2100 or MyLevel<=2124 then Mon="Peanut President"LevelQuest=2;NameQuest="NutsIslandQuest"NameMon="Peanut President"CFrameQuest=CFrame.new(-2104.3908691406,38.104167938232,-10194.21875,0,0,-1,0,1,0,1,0,0)CFrameMon=CFrame.new(-1859.35400390625,38.10316848754883,-10422.4296875)elseif MyLevel==2125 or MyLevel<=2149 then Mon="Ice Cream Chef"LevelQuest=1;NameQuest="IceCreamIslandQuest"NameMon="Ice Cream Chef"CFrameQuest=CFrame.new(-820.64825439453,65.819526672363,-10965.795898438,0,0,-1,0,1,0,1,0,0)CFrameMon=CFrame.new(-872.24658203125,65.81957244873047,-10919.95703125)elseif MyLevel==2150 or MyLevel<=2199 then Mon="Ice Cream Commander"LevelQuest=2;NameQuest="IceCreamIslandQuest"NameMon="Ice Cream Commander"CFrameQuest=CFrame.new(-820.64825439453,65.819526672363,-10965.795898438,0,0,-1,0,1,0,1,0,0)CFrameMon=CFrame.new(-558.06103515625,112.04895782470703,-11290.7744140625)elseif MyLevel==2200 or MyLevel<=2224 then Mon="Cookie Crafter"LevelQuest=1;NameQuest="CakeQuest1"NameMon="Cookie Crafter"CFrameQuest=CFrame.new(-2021.32007,37.7982254,-12028.7295,0.957576931,-8.80302053e-08,0.288177818,6.9301187e-08,1,7.51931211e-08,-0.288177818,-5.2032135e-08,0.957576931)CFrameMon=CFrame.new(-2374.13671875,37.79826354980469,-12125.30859375)elseif MyLevel==2225 or MyLevel<=2249 then Mon="Cake Guard"LevelQuest=2;NameQuest="CakeQuest1"NameMon="Cake Guard"CFrameQuest=CFrame.new(-2021.32007,37.7982254,-12028.7295,0.957576931,-8.80302053e-08,0.288177818,6.9301187e-08,1,7.51931211e-08,-0.288177818,-5.2032135e-08,0.957576931)CFrameMon=CFrame.new(-1598.3070068359375,43.773197174072266,-12244.5810546875)elseif MyLevel==2250 or MyLevel<=2274 then Mon="Baking Staff"LevelQuest=1;NameQuest="CakeQuest2"NameMon="Baking Staff"CFrameQuest=CFrame.new(-1927.91602,37.7981339,-12842.5391,-0.96804446,4.22142143e-08,0.250778586,4.74911062e-08,1,1.49904711e-08,-0.250778586,2.64211941e-08,-0.96804446)CFrameMon=CFrame.new(-1887.8099365234375,77.6185073852539,-12998.3505859375)elseif MyLevel==2275 or MyLevel<=2299 then Mon="Head Baker"LevelQuest=2;NameQuest="CakeQuest2"NameMon="Head Baker"CFrameQuest=CFrame.new(-1927.91602,37.7981339,-12842.5391,-0.96804446,4.22142143e-08,0.250778586,4.74911062e-08,1,1.49904711e-08,-0.250778586,2.64211941e-08,-0.96804446)CFrameMon=CFrame.new(-2216.188232421875,82.884521484375,-12869.2939453125)elseif MyLevel==2300 or MyLevel<=2324 then Mon="Cocoa Warrior"LevelQuest=1;NameQuest="ChocQuest1"NameMon="Cocoa Warrior"CFrameQuest=CFrame.new(233.22836303710938,29.876001358032227,-12201.2333984375)CFrameMon=CFrame.new(-21.55328369140625,80.57499694824219,-12352.3876953125)elseif MyLevel==2325 or MyLevel<=2349 then Mon="Chocolate Bar Battler"LevelQuest=2;NameQuest="ChocQuest1"NameMon="Chocolate Bar Battler"CFrameQuest=CFrame.new(233.22836303710938,29.876001358032227,-12201.2333984375)CFrameMon=CFrame.new(582.590576171875,77.18809509277344,-12463.162109375)elseif MyLevel==2350 or MyLevel<=2374 then Mon="Sweet Thief"LevelQuest=1;NameQuest="ChocQuest2"NameMon="Sweet Thief"CFrameQuest=CFrame.new(150.5066375732422,30.693693161010742,-12774.5029296875)CFrameMon=CFrame.new(165.1884765625,76.05885314941406,-12600.8369140625)elseif MyLevel==2375 or MyLevel<=2399 then Mon="Candy Rebel"LevelQuest=2;NameQuest="ChocQuest2"NameMon="Candy Rebel"CFrameQuest=CFrame.new(150.5066375732422,30.693693161010742,-12774.5029296875)CFrameMon=CFrame.new(134.86563110351562,77.2476806640625,-12876.5478515625)elseif MyLevel==2400 or MyLevel<=2424 then Mon="Candy Pirate"LevelQuest=1;NameQuest="CandyQuest1"NameMon="Candy Pirate"CFrameQuest=CFrame.new(-1150.0400390625,20.378934860229492,-14446.3349609375)CFrameMon=CFrame.new(-1310.5003662109375,26.016523361206055,-14562.404296875)elseif MyLevel==2425 or MyLevel<=2449 then Mon="Snow Demon"LevelQuest=2;NameQuest="CandyQuest1"NameMon="Snow Demon"CFrameQuest=CFrame.new(-1150.0400390625,20.378934860229492,-14446.3349609375)CFrameMon=CFrame.new(-880.2006225585938,71.24776458740234,-14538.609375)elseif MyLevel==2450 or MyLevel<=2474 then Mon="Isle Outlaw"LevelQuest=1;NameQuest="TikiQuest1"NameMon="Isle Outlaw"CFrameQuest=CFrame.new(-16547.748046875,61.13533401489258,-173.41360473632812)CFrameMon=CFrame.new(-16442.814453125,116.13899993896484,-264.4637756347656)elseif MyLevel==2475 or MyLevel<=2499 then Mon="Island Boy"LevelQuest=2;NameQuest="TikiQuest1"NameMon="Island Boy"CFrameQuest=CFrame.new(-16547.748046875,61.13533401489258,-173.41360473632812)CFrameMon=CFrame.new(-16901.26171875,84.06756591796875,-192.88906860351562)elseif MyLevel==2500 or MyLevel<=2524 then Mon="Sun-kissed Warrior"LevelQuest=1;NameQuest="TikiQuest2"NameMon="kissed"CFrameQuest=CFrame.new(-16539.078125,55.68632888793945,1051.5738525390625)CFrameMon=CFrame.new(-16349.8779296875,92.0808334350586,1123.4169921875)elseif MyLevel==2525 or MyLevel<=2550 then Mon="Isle Champion"LevelQuest=2;NameQuest="TikiQuest2"NameMon="Isle Champion"CFrameQuest=CFrame.new(-16539.078125,55.68632888793945,1051.5738525390625)CFrameMon=CFrame.new(-16347.4150390625,92.09503936767578,1122.335205078125)end end end

task.spawn(function()
 while wait() do
    if _G.Settings.AutoFarmLevel then
    pcall(function()
        CheckQuest()
        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,Mon) then
             game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
           end
        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
         TP(CFrameQuest)
         if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
             game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
         end
        else
         CheckQuest()
         if game.Workspace.Enemies:FindFirstChild(NameMon) then 
             for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v.Name == NameMon then
                 pcall(function()
                 repeat task.wait()
                 TP(v.HumanoidRootPart.CFrame * CFrame.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ))
                 EquipWeapon()
                 pcall(function()BringMob(v.Name,v.HumanoidRootPart.CFrame )end)
                 if v.Humanoid.Health == 0 then
                     v:Destroy()
                 end
                 until not _G.Settings.AutoFarmLevel or not v.Parent or not game.Workspace.Enemies:FindFirstChild(Mon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
             end)
             end
             end
         else
             TP(CFrameMon * CFrame.new(0,200,0))
             for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                 if v.Name == NameMon then
                  repeat task.wait()
                  TP(v.HumanoidRootPart.CFrame * CFrame.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ))
                  EquipWeapon()
                  pcall(function()BringMob(v.Name,v.HumanoidRootPart.CFrame )end)
                  if v.Humanoid.Health == 0 then
                      v:Destroy()
                  end
                  until _G.Settings.AutoFarmLevel or not v.Parent or not game.Workspace.Enemies:FindFirstChild(Mon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
              end
              end
         end
        end
    end)
    elseif _G.Settings.AutoFarmNear then
        pcall(function()
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
         repeat task.wait()
         TP(v.HumanoidRootPart.CFrame * CFrame.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ))
         EquipWeapon()
         pcall(function()BringMob(v.Name,v.HumanoidRootPart.CFrame )end)
         if v.Humanoid.Health == 0 then
             v:Destroy()
         end
         until getgenv().AutoFarmNear or not v.Parent
    end
        end)
  end
 end
end)
local CakeQuestPos = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
task.spawn(function()
 while wait() do
  if _G.Settings.AutoCakePrince then
    if game:GetService("ReplicatedStorage"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
        pcall(function()
            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Cake Prince" or v.Name == "Dough King" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon()
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,-35,0))
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                            until not _G.Settings.AutoCakePrinceQuest or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                    TP(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                  TP(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
                  TP(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") then
                  TP(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                else
                    TP(CFrame.new(-2152.71337890625, 70.01806640625, -12398.490234375))
                end
            end
        end)
    else                   
        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                      pcall(function()
                            repeat task.wait()
                                EquipWeapon()
                                BringMob(v.Name,v.HumanoidRootPart.CFrame)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false 
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ))
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                if v.Humanoid.Health <= 0 then
                                  v:Destroy()
                                end
                            until not v or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or KillMob == 0
                      end)
                  end
         end
        end
    end
    end
  end
 end
end)

task.spawn(function()
 while wait() do
  if _G.Settings.AutoFarmBone then
    if game.Workspace.Enemies:FindFirstChild("Reborn Skeleton") or game.Workspace.Enemies:FindFirstChild("Living Zombie") or game.Workspace.Enemies:FindFirstChild("Demonic Soul")  or game.Workspace.Enemies:FindFirstChild("Posessed Mummy") then 
    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                repeat wait()
                    EquipWeapon()
                                      pcall(function()BringMob(v.Name,v.HumanoidRootPart.CFrame )end)
                    TP(v.HumanoidRootPart.CFrame * CFrame.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ))
                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    v.HumanoidRootPart.Transparency = 1
                    v.Humanoid.JumpPower = 0
                    v.Humanoid.WalkSpeed = 0
                    v.HumanoidRootPart.CanCollide = false
                    v.Humanoid:ChangeState(11)
                    v.Humanoid:ChangeState(14)
                    if v.Humanoid.Health <= 0 and v.Humanoid:FindFirstChild("Animator") then
                        v.Humanoid.Animator:Destroy()
                    end
                until not _G.Settings.AutoFarmBone or not v.Parent or v.Humanoid.Health <= 0
            end
        end
    end
    for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if v.Name == "Reborn Skeleton" then
            TP(v.HumanoidRootPart.CFrame * CFrame.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ))
        elseif v.Name == "Living Zombie" then
            TP(v.HumanoidRootPart.CFrame * CFrame.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ))
        elseif v.Name == "Demonic Soul" then
            TP(v.HumanoidRootPart.CFrame * CFrame.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ))
        elseif v.Name == "Posessed Mummy" then
            TP(v.HumanoidRootPart.CFrame * CFrame.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ))
        end
    end
else
TP(CFrame.new(-9508.5673828125, 142.1398468017578, 5737.3603515625))
end
  end
 end
end)

task.spawn(function()
    while wait() do
        if _G.Settings.AutoPirateRaid then
            pcall(function()
                local CFrameBoss = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09,
                    0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
                if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.Settings.AutoPirateRaid and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                                repeat
                                    wait()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ))
                                until v.Humanoid.Health <= 0 or not v.Parent or _G.Settings.AutoPirateRaid == false
                            end
                        end
                    end
                else
                    if ((CFrameBoss).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1500 then
                        TP(CFrameBoss)
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.Settings.AutoYama then
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
                repeat
                    task.wait()
                    fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.Settings.AutoYama
            end
        end
    end
end)
function CheckMob(bk, bl)
    for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if
            table.find(bk, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                v.Humanoid.Health > 0
         then
            return v
        end
    end
    if bl then
        for r, v in pairs(game.ReplicatedStorage:GetChildren()) do
            if
                table.find(bk, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                    v.Humanoid.Health > 0
             then
                return v
            end
        end
    end
end
Elites = {"Deandre", "Urban", "Diablo","Deandre [Lv. 1750]", "Urban [Lv. 1750]", "Diablo [Lv. 1750]"}
function CheckElite()
    return CheckMob(Elites, true)
end
function KillMobReal(cx)
    k = cx
    if game.Workspace.Enemies:FindFirstChild(k.Name) and k:FindFirstChild("Humanoid") and k:FindFirstChild("HumanoidRootPart") and k.Humanoid.Health > 0  then
        repeat
            spawn(EquipWeapon(), 1)
            spawn(TP(k.HumanoidRootPart.CFrame * CFrame.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ)), 1)
        until not k or not k:FindFirstChild("Humanoid") or not k:FindFirstChild("HumanoidRootPart") or
            k.Humanoid.Health <= 0
    end
end
function HopServer(bO)
    if not bO then
        bO = 10
    end
    ticklon = tick()
    repeat
        task.wait()
    until tick() - ticklon >= _G.Settings["Hop Delay"] or 1
    function Hop()
        Notify("Script Status", "Finding Server...\nTarget Count: " .. bO, 5)
        for r = 1, 100 do
            if ChooseRegion == nil or ChooseRegion == "" then
                ChooseRegion = "Singapore"
            else
                game:GetService("Players").LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text =
                    ChooseRegion
            end
            local bP = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(r)
            for k, v in pairs(bP) do
                if k ~= game.JobId and v["Count"] < bO then
                    if not bM[k] or tick() - bM[k].Time > 60 * 10 then
                        bM[k] = {Time = tick()}
                        SaveSettings2()
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible then
                            Notify("Script Status", "Founded Server But InCombat", 15)
                            repeat
                                wait()
                                AntiLowHealth(math.random(8500, 10000))
                            until not game:GetService("Players").LocalPlayer or
                                not game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible
                            Notify("Script Status", "Joining Server ID: " .. k .. "\nRegion: " .. v["Region"], 15)
                        else
                            Notify("Script Status", "Joining Server ID: " .. k .. "\nRegion: " .. v["Region"], 15)
                        end
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", k)
                        return true
                    elseif tick() - bM[k].Time > 60 * 60 then
                        bM[k] = nil
                    end
                end
            end
        end
        return false
    end
    if not getgenv().Loaded then
        function bQ(v)
            if v.Name == "ErrorPrompt" then
                if v.Visible then
                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                        HopServer()
                        v.Visible = false
                    end
                end
                v:GetPropertyChangedSignal("Visible"):Connect(
                    function()
                        if v.Visible then
                            if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                                HopServer()
                                v.Visible = false
                            end
                        end
                    end
                )
            end
        end
        for k, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
            bQ(v)
        end
        game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ)
        getgenv().Loaded = true
    end
    while not Hop() do
        wait()
    end
end
task.spawn(function()
 while wait() do
  if _G.Settings.AutoFarmElite then
    if CheckElite() then
    mobngu = CheckElite()
    if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,CheckElite().Name:gsub(" %pLv. %d+%p", "")) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
    end
    if game.Workspace.Enemies:FindFirstChild(mobngu.Name) then
        KillMobReal(mobngu)
    else
        spawn(TP(mobngu.HumanoidRootPart.CFrame * CFrame.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ)), 1)
    end
    else
        if _G.Settings.HopServerElite then
            HopServer()
        end
    end
  end
 end
end)
TempleOfTimeCFrame = CFrame.new(28734.3945, 14888.2324, -109.071777, -0.650207579, 4.1780531e-08, -0.759756625, 1.97876595e-08, 1, 3.80575109e-08, 0.759756625, 9.71147784e-09, -0.650207579)
function TweenTemple()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
end
tableRaceDoor = {}
for r, v in pairs(game.Workspace:GetDescendants()) do
    if string.find(v.Name, "Corridor") then
        tableRaceDoor[v.Name] = v.Door.Door.RightDoor.Union.CFrame
    end
end
function TweentoCurrentRaceDoor()
    a = tableRaceDoor[game.Players.LocalPlayer.Data.Race.Value .. "Corridor"]
    if (TempleOfTimeCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
        repeat
            wait()
            if
                (TempleOfTimeCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                    2000
             then
                TweenTemple()
            end
        until (TempleOfTimeCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
            2000
        repeat
            wait()
            if
                (TempleOfTimeCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                    2000
             then
                TweenTemple()
            end
        until (TempleOfTimeCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
            2000
        TP(a)
    elseif
        (TempleOfTimeCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
     then
        TP(a)
    end
end
function CheckAcientOneStatus()
    if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return "You have yet to achieve greatness"
    end
    local v227 = nil
    local v228 = nil
    local v229 = nil
    v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
    if v229 == 1 then
        return "Required Train More"
    elseif v229 == 2 or v229 == 4 or v229 == 7 then
        return "Can Buy Gear With " .. v227 .. " Fragments"
    elseif v229 == 3 then
        return "Required Train More"
    elseif v229 == 5 then
        return "You Are Done Your Race."
    elseif v229 == 6 then
        return "Upgrades completed: " .. v228 - 2 .. "/3, Need Trains More"
    end
    if v229 ~= 8 then
        if v229 == 0 then
            return "Ready For Trial"
        else
            return "You have yet to achieve greatness"
        end
    end
    return "Remaining " .. 10 - v228 .. " training sessions."
end
function PullLever()
    local bn=CFrame.new(28576.4688,14939.2832,76.5164413,-1,0,0,0,0.707134247,-0.707079291,-0,-0.707079291,-0.707134247)
    local bo=CFrame.new(28576.4688,14935.9512,75.469101,-1,-4.22219593e-08,1.13133396e-08,0,-0.258819044,-0.965925813,4.37113883e-08,-0.965925813,0.258819044)
    local bp = 0.2
    if
        game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z > bo.Z + bp or
            game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z < bo.Z - bp
     then
        CheckAndTweenTemple()
        TP(game:GetService("Workspace").Map["Temple of Time"].Lever.Part.CFrame)
        for r, v in pairs(game:GetService("Workspace").Map["Temple of Time"].Lever:GetDescendants()) do
            if v.Name == "ProximityPrompt" then
                fireproximityprompt(v)
            end
        end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.AutoKillPlrTrial then
                for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                        if v.Humanoid.Health > 0 then
                            repeat wait()
                                EquipWeapon()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0))
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(_G.Settings.PostionX, _G.Settings.PostionY, _G.Settings.PostionZ)
                            until not _G.Settings.AutoKillPlrTrial or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)

local Win = library:CreateLibrary()
local Main = Win:Tab("Home",10723407389)
local Main_Page = Main:CraftPage(1)
Main_Page:Label("Welcome To Gojo 1/2 Hub")
Main_Page:Seperator("Discord")
Main_Page:Button('Copy Link Discord Hub',function()
setclipboard('Truongdepzqi:3')
end)
Main_Page:Button('Copy Link Discord Store [Parter]',function()
setclipboard('Wibu Never Die')
end)
Main_Page:Seperator(" 🔰 Infomation ")
Main_Page:Label("Developer : TruongWibu")
Main_Page:Label("Script type : Free")
Main_Page:Label("Script language : Vn ")
Main_Page:Label("Script Version : 1.0.9 ")
Main_Page:CreateMoonPage(15965809870)
local Main_Page1 = Main:CraftPage(2)
Main_Page1:Seperator("Update & Announcement")
Main_Page1:Label("Is No Updates")
local Main_Page2 = Main:CraftPage(1)
Main_Page2:Seperator(" ⚙️ Settings ")
Main_Page2:Slider("Cooldown After attack time",true,1,100,5,function(value)
_G.Settings["CDAAT"] = value
  end)
Main_Page2:Slider("Time Wait",true,3,20,7,function(value)
_G.Settings["TimeWait"] = value
end)
local Item = Win:Tab("Item",10709819149)
local Item_Page = Item:CraftPage(1)
Item_Page:Seperator("Main Farm")
local LevelLabel = Item_Page:Label("Level : N/A")
spawn(function()
 while wait() do
  if game.Players.LocalPlayer.Data.Level.Value == 2550 then
    LevelLabel:Set("Level : Max Level")
  else
    LevelLabel:Set("Level : "..game.Players.LocalPlayer.Data.Level.Value)
  end
 end
end)
Item_Page:Toggle('Auto Farm Level',_G.Settings.AutoFarmLevel,function(Value)
    _G.Settings.AutoFarmLevel = Value
    saveSettings()
end)
Item_Page:Toggle('Auto Farm Mastery Fruits [Can Not Use]',_G.Settings.AutoFarmFruits,function(Value)
    _G.Settings.AutoFarmFruits = Value
    saveSettings()
end)
Item_Page:Toggle('Auto Farm Mastery Gun [Can Not Use]',_G.Settings.AutoFarmGun,function(Value)
    _G.Settings.AutoFarmGun = Value
    saveSettings()
end)
Item_Page:Toggle('Auto Farm Near',_G.Settings.AutoFarmNear,function(Value)
    _G.Settings.AutoFarmNear = Value
    saveSettings()
end)
local Item_Page1 = Item:CraftPage(2)
Item_Page:Seperator("🍰 [Cake Prince] 👑")
local CakePrinceLabel = Item_Page1:Label("Defeat: N/A")
spawn(function()
    while wait() do
        pcall(function()
            if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                CakePrinceLabel:Set("Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41))
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                CakePrinceLabel:Set("Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40))
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                CakePrinceLabel:Set("Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39))
            else
                CakePrinceLabel:Set("Boss Is Spawning :🟢")
            end
        end)
    end
end)
Item_Page1:Toggle('Auto Cake Prince',_G.Settings.AutoCakePrince,function(Value)
    _G.Settings.AutoCakePrince = Value
    saveSettings()
end)
Item_Page1:Toggle('Quest [Wait Update]',_G.Settings.AutoCakePrinceQuest,function(Value)
    _G.Settings.AutoCakePrinceQuest = Value
    saveSettings()
end)
Item_Page1:Toggle('Mastery Fruits Farm [Can Not Use]',false,function(Value)
    _G.Settings.AutoMasteryFruitCake = Value
    saveSettings()
end)
Item_Page1:Toggle('Mastery Gun Farm [Can Not Use]',false,function(Value)
    _G.Settings.AutoMasteryGunCake = Value
    saveSettings()
end)
Item_Page1:Seperator("🦴 [Bone] 🦴")
Item_Page1:Toggle('Auto Farm Bone',_G.Settings.AutoFarmBone,function(Value)
    _G.Settings.AutoFarmBone = Value
    saveSettings()
end)
Item_Page1:Toggle('Quest [🦴] [Can Not Use]',_G.Settings.AutoBoneQuest,function(Value)
    _G.Settings.AutoBoneQuest = Value
    saveSettings()
end)
Item_Page1:Toggle('Mastery Fruits Farm [Can Not Use]',false,function(Value)
    _G.Settings.AutoMasteryFruitBoneCake = Value
    saveSettings()
end)
Item_Page1:Toggle('Mastery Gun Farm [Can Not Use]',false,function(Value)
    _G.Settings.AutoMasteryGunBone = Value
    saveSettings()
end)
Item_Page1:Seperator("[Elite]")
Item_Page1:Toggle('Auto Elite',_G.Settings.AutoPirateRaid,function(Value)
    _G.Settings.AutoFarmElite = Value
    saveSettings()
end)
Item_Page1:Toggle('Auto Hop',_G.Settings.AutoYama,function(Value)
    _G.Settings.HopServerElite = Value
    saveSettings()
end)
Item_Page1:Toggle('Auto Yama',_G.Settings.AutoYama,function(Value)
    _G.Settings.AutoYama = Value
    saveSettings()
end)
Item_Page1:Seperator("[Misc]")
Item_Page1:Toggle('Auto Raid Pirate',_G.Settings.AutoPirateRaid,function(Value)
    _G.Settings.AutoPirateRaid = Value
    saveSettings()
end)
Item_Page1:Button('Holy Torch [1]',function()
    TP(CFrame.new(-10752.4434, 415.261749, -9367.43848, 1, 0, 0, 0, 1, 0, 0, 0, 1))
end)
Item_Page1:Button('Holy Torch [2]',function()
    TP(CFrame.new(-11671.6289, 333.78125, -9474.31934, 0.300932229, 0, -0.953645527, 0, 1, 0, 0.953645527, 0, 0.300932229))
end)
Item_Page1:Button('Holy Torch [3]',function()
    TP(CFrame.new(-12133.1406, 521.507446, -10654.292, 0.80428642, 0, -0.594241858, 0, 1, 0, 0.594241858, 0, 0.80428642))
end)
Item_Page1:Button('Holy Torch [4]',function()
    TP(CFrame.new(-13336.127, 484.521179, -6985.31689, 0.853732228, 0, -0.520712316, 0, 1, 0, 0.520712316, 0, 0.853732228))
end)
Item_Page1:Button('Holy Torch [5]',function()
    TP(CFrame.new(-13487.623, 336.436188, -7924.53857, -0.982848108, 0, 0.184417039, 0, 1, 0, -0.184417039, 0, -0.982848108))
end)
local Item_Page2 = Item:CraftPage(1)
Item_Page2:Seperator("[Race V4]")
Item_Page2:Button('Temple',function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
end)
local RaceDoorList = {"Automatic","Mink","Fish","Cybord","Ghoul","Human","Sky"}
Item_Page2:Dropdown("Select Race Door",RaceDoorList,_G.Settings.DropRaceDoor,function(v)
    _G.Settings.DropRaceDoor = v
    saveSettings()
end)
Item_Page2:Button('Teleport Race Door',function()
    if _G.Settings.DropRaceDoor == 'Automatic' then
        TweentoCurrentRaceDoor()
    elseif _G.Settings.DropRaceDoor == 'Mink' then
        TP(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
    elseif _G.Settings.DropRaceDoor == 'Fish' then
        TP(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
    elseif _G.Settings.DropRaceDoor == 'Cybord' then
        TP(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
    elseif _G.Settings.DropRaceDoor == 'Ghoul' then
        TP(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
    elseif _G.Settings.DropRaceDoor == 'Human' then
        TP(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
    elseif _G.Settings.DropRaceDoor == 'Sky' then
        TP(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
    end
end)
local AcientStatusLabel = Item_Page2:Label("AcientOne :")
spawn(function()
 while wait(5) do
    AcientStatusLabel:Set("Acient One Stauts :"..CheckAcientOneStatus())
 end
end)
Item_Page2:Button('Pull Lever',function()
    PullLever()
end)

Item_Page1:Toggle('Auto Kill Players',_G.Settings.AutoKillPlrTrial,function(Value)
    _G.Settings.AutoKillPlrTrial = Value
    saveSettings()
end)

Item_Page2:Label("Waits Update Auto Trial Race V4")
local Item_Page3 = Item:CraftPage(2)
local FullMoonLabel = Item_Page3:Label("Full Moon :")
local MirageIslandLabel =Item_Page3:Label("Mirage :")
local KitsuneIslandLabel =Item_Page3:Label("Kitsune Island :")
task.spawn(function()
    while wait() do
        FullMoonLabel:Set("Full Moon : "..FullMoobCheck())
        MirageIslandLabel:Set("Mirage Island : "..MirageIslandCheck())
        KitsuneIslandLabel:Set("Kitsune Island : "..KitsuneIslandCheck())
    end
end)
function NoFog()
    local c = game.Lighting
    c.FogEnd = 100000
    for r, v in pairs(c:GetDescendants()) do
        if v:IsA("Atmosphere") then
            v:Destroy()
        end
    end
end
Item_Page3:Button('No Fogs',function()
    NoFog()
end)
Item_Page3:Button('Teleport to Highest Mirage',function()
    TwenetoHighestPoint()
end)
Item_Page3:Button('Teleport to Advanced Fruit Dealer',function()
    TweenMirage()
end)
Item_Page3:Button('Teleport to Blue Gear',function()
    TweentoBlueGear()
end)
Item_Page3:Button('Moon',function()
    workspace.CurrentCamera.CFrame =
        CFrame.new(
        workspace.CurrentCamera.CFrame.Position,
        game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position
    )
end)

local Teleport = Win:Tab("Teleport",10709789810)

local Teleport_Page1 = Teleport:CraftPage(1)
local IslandList = {
    "Mansion",
    "Port Town",
    "Great Tree",
    "Castle On The Sea",
    "MiniSky", 
    "Hydra Island",
    "Floating Turtle",
    "Haunted Castle",
    "Ice Cream Island",
    "Peanut Island",
    "Cake Island",
    "Cocoa Island",
    "Candy Island"
    }
    Teleport_Page1:Dropdown("Select Island",IslandList,_G.Settings.SelectIsland,function(v)
    _G.Settings.SelectIsland = v
    saveSettings()
end)
Teleport_Page1:Button('Teleport Island',function()
    if _G.Settings.SelectIsland == "Great Tree" then
        TP(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
    elseif _G.Settings.SelectIsland == "Castle On The Sea" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125))
    elseif _G.Settings.SelectIsland == "MiniSky" then
        TP(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
    elseif _G.Settings.SelectIsland == "Port Town" then
        TP(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
    elseif _G.Settings.SelectIsland == "Hydra Island" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953))
    elseif _G.Settings.SelectIsland == "Floating Turtle" then
        TP(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
    elseif _G.Settings.SelectIsland == "Mansion" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
    elseif _G.Settings.SelectIsland == "Haunted Castle" then
        TP(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
    elseif _G.Settings.SelectIsland == "Ice Cream Island" then
        TP(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
    elseif _G.Settings.SelectIsland == "Peanut Island" then
        TP(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
    elseif _G.Settings.SelectIsland == "Cake Island" then
        TP(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
    elseif _G.Settings.SelectIsland == "Cocoa Island" then
        TP(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
    elseif _G.Settings.SelectIsland == "Candy Island" then
        TP(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
    end
end)
Teleport_Page1:Button('Stop Teleport',function()
    TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end)
ALLNPCOOO = {}
for r, v in pairs(getnilinstances()) do
    if
        v:IsA("Model") and v:FindFirstChild("Head") and v.Head:FindFirstChild("QuestBBG") and
            v.Head.QuestBBG.Title.Text == "MISC."
     then
        ALLNPCOOO[v.Name] = v.Head.CFrame * CFrame.new(0, -2, 2)
    end
end
for r, v in pairs(game.Workspace.NPCs:GetDescendants()) do
    if v.Name == "QuestBBG" and v.Title.Text == "MISC." then
        ALLNPCOOO[v.Parent.Parent.Name] = v.Parent.Parent.Head.CFrame * CFrame.new(0, -2, 2)
    end
end
NpcList = {}
for r, v in pairs(ALLNPCOOO) do
    if v == "Ancient One" then
    else
    table.insert(NpcList, r)
end
end

Teleport_Page1:Dropdown("Select Npc",NpcList,_G.Settings.SelectNpc,function(v)
    _G.Settings.SelectNpc = v
    saveSettings()
end)
Teleport_Page1:Button('Teleport Npc',function()
TP(ALLNPCOOO[_G.Settings.SelectNpc])
end)

local Raid = Win:Tab("Raids",10734919503)
local Raid_Page1 = Teleport:CraftPage(1)
function IsIslandRaid(cu)
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island " .. cu) then
        min = 4500
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. cu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min
             then
                min = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
        end
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. cu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min
             then
                return v
            end
        end
    end
end
function getNextIsland()
    TableIslandsRaid = {5, 4, 3, 2, 1}
    for r, v in pairs(TableIslandsRaid) do
        if
            IsIslandRaid(v) and
                (IsIslandRaid(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                    4500
         then
            return IsIslandRaid(v)
        end
    end
end

Raid_Page1:Toggle('Kill Aura',_G.Settings.KillAura,function(a)
 _G.Settings.KillAura = a
 saveSettings()
end)
Raid_Page1:Toggle('Next Island',_G.Settings.KillAura,function(a)
    _G.Settings.NextIslands = a
end)
Raid_Page1:Dropdown("Choose Raid",{ "Flame", "Ice", "Quake", "Light", "Dark", "Spider", "Rumble", "Magma", "Human: Buddha", "Sand","Bird: Phoenix", "Dough" },_G.Settings.ChoosenRaid,function(v)
    _G.Settings.ChoosenRaid = v
    saveSettings()
  end)
Raid_Page1:Toggle('Auto Buy Chip',_G.Settings.KillAura,function(a)
    _G.Settings.AutoBuyChipsRaid = a
    saveSettings()
end)
Raid_Page1:Toggle('Auto Raid [Not Auto Unstore Fruits]',_G.Settings.AutoRaid,function(a)
    _G.Settings.AutoRaid = a
    saveSettings()
end)

local Visuals = Win:Tab("Visuals",10709789810)
local Visuals_Page1 = Visuals:CraftPage(1)
Meleetable = {"BlackLeg","Electro","Fishman Karate","Dragon Claw","Sanguine Art","Superhuman","Death Step","Sharkman Karate","Electric Claw","Dragon Talon","GodHuman"}
swordtable = {"Cutlass Katana", "Katana", "Iron Mace", "Dual Katana", "Triple Katana", "Pipe", "Dual-Headed Blade", "Bisento", "Soul Cane", "Pole v.2"}
gunstable = {"Slingshot","Musket","Flintlock","Refined Slingshot","Refined Flintlock","Cannon","Kabucha","Bizarre Rifle","Refund Stats","Race Random"}
Hakitable = {"Buso", "Geppo", "Soru", "Observation"}
Visuals_Page1:Label("[Melee]")
Visuals_Page1:Dropdown("Select Melee",{"BlackLeg","Electro","Fishman Karate","Dragon Claw","Sanguine Art","Superhuman","Death Step","Sharkman Karate","Electric Claw","Dragon Talon","GodHuman"},_G.Settings.VisualMelee,function(v)
    _G.Settings.VisualMelee = v
    saveSettings()
end)
Visuals_Page1:Button('Buy',function()
    if _G.Settings.VisualMelee == "BlackLeg" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    elseif _G.Settings.VisualMelee == "Electro" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    elseif _G.Settings.VisualMelee == "Fishman Karate" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    elseif _G.Settings.VisualMelee == "Dragon Claw" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
    elseif _G.Settings.VisualMelee == "Sanguine Art" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt",false)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt",true)
    elseif _G.Settings.VisualMelee == "Superhuman" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    elseif _G.Settings.VisualMelee == "Death Step" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    elseif _G.Settings.VisualMelee == "Sharkman Karate" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    elseif _G.Settings.VisualMelee == "Electric Claw" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    elseif _G.Settings.VisualMelee == "Dragon Talon" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    elseif _G.Settings.VisualMelee == "GodHuman" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end
end)
Visuals_Page1:Label("[Sword]")
Visuals_Page1:Dropdown("Select Sword",{"Cutlass Katana", "Katana", "Iron Mace", "Dual Katana", "Triple Katana", "Pipe", "Dual-Headed Blade", "Bisento", "Soul Cane", "Pole v.2"},_G.Settings.VisualSword,function(v)
    _G.Settings.VisualSword = v
    saveSettings()
end)
Visuals_Page1:Button('Buy',function()
    if _G.Settings.VisualSword == "Pole v.2" then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
    else
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", _G.Settings.VisualSword)
    end
end)
Visuals_Page1:Label("[Gun]")
Visuals_Page1:Dropdown("Select Gun",{"Slingshot","Musket","Flintlock","Refined Slingshot","Refined Flintlock","Cannon","Kabucha","Bizarre Rifle","Refund Stats","Race Random"},_G.Settings.VisualGun,function(v)
    _G.Settings.VisualGun = v
    saveSettings()
end)
Visuals_Page1:Button('Buy',function()
    if _G.Settings.VisualGun == "Bizarre Rifle" then
        local A_1 = "Ectoplasm"
        local A_2 = "Buy"
        local A_3 = 1
        local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"]
        Event:InvokeServer(A_1, A_2, A_3)
        Event:InvokeServer(A_1, A_2, A_3)
    else
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", _G.Settings.VisualGun)
    end
end)
Visuals_Page1:Label("[Haki]")
Visuals_Page1:Dropdown("Select Haki",{"Buso", "Geppo", "Soru", "Observation"},_G.Settings.VisualHaki,function(v)
    _G.Settings.VisualHaki = v
    saveSettings()
end)
Visuals_Page1:Button('Buy',function()
    if _G.Settings.VisualHaki == "Observation" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
    return
    end
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", _G.Settings.VisualHaki)
end)
Visuals_Page1:Label("[Misc]")

Visuals_Page1:Button("Refund Stats", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
end)
Visuals_Page1:Button("Race Random", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
end)

Visuals_Page1:Button("Buy Ghoul Race", function()
    local a = {"Ectoplasm", "BuyCheck", 4}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))
    local a = {"Ectoplasm", "Change", 4}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))
end)
Visuals_Page1:Button("Buy Cyborg Race", function()
    local a = {"CyborgTrainer", "Buy"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))
end)

Visuals_Page1:Button("Random Fruit", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
end)

Visuals_Page1:Button("Devil Shop", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
    game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
end)

Visuals_Page1:Button("Titles Ui", function()
    local args = {
        [1] = "getTitles"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    game.Players.LocalPlayer.PlayerGui.Main.Titles.Visible = true
end)

Visuals_Page1:Button("Haki Ui", function()
    game.Players.LocalPlayer.PlayerGui.Main.Colors.Visible = true
end)


local Visuals_Page2 = Visuals:CraftPage(2)
Visuals_Page2:Label("[Team]")
Visuals_Page1:Button("Join Pirates Team", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
end)

Visuals_Page1:Button("Join Marines Team", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
end)

Visuals_Page2:Label("[Server]")
Visuals_Page2:Textbox("Job ID :","Put Job ID",function(v)
_G.Settings.JobId = v
end)
Visuals_Page2:Button('Join [Job ID]',function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Settings.JobId, game.Players.LocalPlayer)
end)
Visuals_Page2:Textbox("VN Job ID :","Put VN Job ID",function(v)
    _G.Settings.VNJobId = v
end)
Visuals_Page2:Button('Join [VN Job ID] :',function()
    print("Soon")
end)
Visuals_Page2:Button('Join [Full Moon Server] [soon]:',function()
    print("Soon") 
end)
Visuals_Page2:Button('Join [Mirage Server] [soon]:',function()
    print("Soon")
end)
Visuals_Page2:Button('Rejoin',function()
  game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
Visuals_Page2:Button('Hop',function()
  HopServer()
end)
Visuals_Page2:Label("[Settings]")
Visuals_Page2:Toggle('Auto Rejoin',_G.Settings.AutoRejoin,function(a)
    _G.Settings.AutoRejoin = a
    saveSettings()
end)

Visuals_Page2:Toggle('Fast Attack',_G.Settings.FastAttack,function(a)
    _G.Settings.FastAttack = a
    saveSettings()
end)
Visuals_Page2:Toggle('Auto Executes [Only Pc]',_G.Settings.AutoExecutes,function(a)
    _G.Settings.AutoExecutes = a
    saveSettings()
end)
Visuals_Page2:Toggle('Delete Effect Sound Slash',_G.Settings.AutoExecutes,function(a)
  _G.Settings.DeleteEffect = a
  saveSettings()
end)
Visuals_Page2:Slider("Tween Speed",true,200,375,_G.Settings.TweenSpeed,function(value)
  _G.Settings.TweenSpeed = value
  saveSettings()
end)
Visuals_Page2:Slider("Postion X",true,10,80,_G.Settings.PostionX,function(value)
  _G.Settings.PostionX = value
  saveSettings()
end)
Visuals_Page2:Slider("Postion Y",true,10,80,_G.Settings.PostionY,function(value)
  _G.Settings.PostionY = value
  saveSettings()
end)
Visuals_Page2:Slider("Postion Z",true,10,80,_G.Settings.PostionZ,function(value)
  _G.Settings.PostionZ = value
  saveSettings()
end)
spawn(function()
  while task.wait(0.009) do
    if   _G.Settings.DeleteEffect then
      for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
              if v.Name == ("CurvedRing") or v.Name == ("SlashHit") or v.Name == ("SwordSlash") or v.Name == ("SlashTail") or v.Name == ("Sounds") then
                  v:Destroy()
              end
      end
      for i, v in pairs(game:GetService("ReplicatedStorage").Effect.Container.Death:GetChildren()) do
              v:Destroy()
      end
      for i, v in pairs(game:GetService("ReplicatedStorage").Effect.Container.Respawn:GetChildren()) do
              v:Destroy()
      end
  end
end
end)

spawn(function()
    while wait() do
        if _G.Settings.AutoRejoin then
                getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                        game:GetService("TeleportService"):Teleport(game.PlaceId)
                    end
                 end)
            end
        end
    end)


