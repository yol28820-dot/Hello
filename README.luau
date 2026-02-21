local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Dominant_NoOverflow_Final"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- ANA PANEL
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 650, 0, 400)
Main.Position = UDim2.new(0.5, -325, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
Main.BorderSizePixel = 1
Main.BorderColor3 = Color3.fromRGB(100, 100, 100)
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

-- ÜST ŞERİT
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0, 25)
TabBar.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
TabBar.BorderSizePixel = 1
TabBar.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Text = "  Dominant Executor v3.1"
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TabBar

-- EPIC FACE LOGO
local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 60, 0, 60)
Logo.Position = UDim2.new(0.5, -30, 0, -10)
Logo.Image = "rbxassetid://4359357959"
Logo.BackgroundTransparency = 1
Logo.ZIndex = 5
Logo.Parent = Main

---------------------------------------------------------
-- SOL TARAF: KOD EDİTÖRÜ (KAYDIRILABİLİR)
---------------------------------------------------------
local EditorScroll = Instance.new("ScrollingFrame")
EditorScroll.Size = UDim2.new(0, 400, 0, 220)
EditorScroll.Position = UDim2.new(0.02, 0, 0.1, 0)
EditorScroll.BackgroundColor3 = Color3.new(1, 1, 1)
EditorScroll.BorderSizePixel = 1
EditorScroll.BorderColor3 = Color3.fromRGB(180, 180, 180)
EditorScroll.CanvasSize = UDim2.new(0, 0, 10, 0) -- Uzun kodlar için 10 katı dikey alan
EditorScroll.ScrollBarThickness = 6
EditorScroll.Parent = Main

local EditorBox = Instance.new("TextBox")
EditorBox.Size = UDim2.new(1, 0, 1, 0) -- Kaydırma alanını tam kaplar
EditorBox.Text = "-- Dominant Script Hub\n-- Uzun kodlar artik tasmaz!"
EditorBox.MultiLine = true
EditorBox.ClearTextOnFocus = false
EditorBox.TextXAlignment = Enum.TextXAlignment.Left
EditorBox.TextYAlignment = Enum.TextYAlignment.Top
EditorBox.Font = Enum.Font.Code
EditorBox.TextSize = 14
EditorBox.Parent = EditorScroll

-- Log Kutusu (Kaydırılabilir)
local LogBox = Instance.new("ScrollingFrame")
LogBox.Size = UDim2.new(0, 400, 0, 80)
LogBox.Position = UDim2.new(0.02, 0, 0.75, 0)
LogBox.BackgroundColor3 = Color3.new(1, 1, 1)
LogBox.CanvasSize = UDim2.new(0, 0, 10, 0)
LogBox.ScrollBarThickness = 4
LogBox.Parent = Main

local Logs = Instance.new("TextLabel")
Logs.Size = UDim2.new(1, 0, 1, 0)
Logs.BackgroundTransparency = 1
Logs.Text = "[SYSTEM]: Dominant Loaded Successfully."
Logs.TextXAlignment = Enum.TextXAlignment.Left
Logs.TextYAlignment = Enum.TextYAlignment.Top
Logs.Font = Enum.Font.Code
Logs.TextWrapped = true
Logs.Parent = LogBox

---------------------------------------------------------
-- SAĞ TARAF: SCRIPT BÖLÜMÜ (KAYDIRILABİLİR)
---------------------------------------------------------
local ScriptSection = Instance.new("Frame")
ScriptSection.Size = UDim2.new(0, 200, 0, 330)
ScriptSection.Position = UDim2.new(0.67, 0, 0.1, 0)
ScriptSection.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
ScriptSection.BorderSizePixel = 1
ScriptSection.Parent = Main

local ScriptTitle = Instance.new("TextLabel")
ScriptTitle.Size = UDim2.new(1, 0, 0, 25)
ScriptTitle.Text = "SCRIPT HUB"
ScriptTitle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ScriptTitle.Font = Enum.Font.SourceSansBold
ScriptTitle.Parent = ScriptSection

local ScriptScroll = Instance.new("ScrollingFrame")
ScriptScroll.Size = UDim2.new(1, 0, 1, -25)
ScriptScroll.Position = UDim2.new(0, 0, 0, 25)
ScriptScroll.BackgroundTransparency = 1
ScriptScroll.CanvasSize = UDim2.new(0, 0, 3, 0) -- Daha fazla script eklemek için alan
ScriptScroll.ScrollBarThickness = 5
ScriptScroll.Parent = ScriptSection

local SList = Instance.new("UIListLayout")
SList.Padding = UDim.new(0, 2)
SList.Parent = ScriptScroll

-- SCRIPT KÜTÜPHANESİ
local ScriptLibrary = {
	["Infinite Yield (Admin)"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()',
	["Dex Explorer (V3)"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Dex.lua"))()',
	["Simple Spy (Remote)"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpyV3/main/main.lua"))()',
	["Unnamed ESP"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()',
	["Anti-AFK"] = 'local vu = game:GetService("VirtualUser"); game:GetService("Players").LocalPlayer.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame); task.wait(1); vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end)',
	["Rejoin"] = 'game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)',
    ["Fly Script (V3)"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))()'
}

for name, code in pairs(ScriptLibrary) do
	local sBtn = Instance.new("TextButton")
	sBtn.Size = UDim2.new(1, 0, 0, 30)
	sBtn.Text = name
	sBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
	sBtn.BorderSizePixel = 0
	sBtn.Font = Enum.Font.SourceSans
	sBtn.Parent = ScriptScroll
	
	sBtn.MouseButton1Click:Connect(function()
		EditorBox.Text = code
		Logs.Text = Logs.Text .. "\n[LOADED]: " .. name
        LogBox.CanvasPosition = Vector2.new(0, 9999)
	end)
end

---------------------------------------------------------
-- BUTONLAR
---------------------------------------------------------
local function createBtn(name, xPos)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0, 120, 0, 30)
	b.Position = UDim2.new(xPos, 0, 0.66, 0)
	b.Text = name
	b.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
	b.BorderSizePixel = 1
	b.Parent = Main
	return b
end

local Exec = createBtn("Execute", 0.02)
local Clear = createBtn("Clear", 0.22)
local Inject = createBtn("Inject", 0.42)

Exec.MouseButton1Click:Connect(function()
	local f, e = loadstring(EditorBox.Text)
	if f then 
		task.spawn(f) 
		Logs.Text = Logs.Text .. "\n[IDE]: Success."
	else 
		Logs.Text = Logs.Text .. "\n[ERR]: "..e 
	end
    LogBox.CanvasPosition = Vector2.new(0, 9999)
end)

Clear.MouseButton1Click:Connect(function() EditorBox.Text = "" end)

Inject.MouseButton1Click:Connect(function()
	Logs.Text = Logs.Text .. "\n[INJECT]: Remotes Scanned."
    LogBox.CanvasPosition = Vector2.new(0, 9999)
end)
