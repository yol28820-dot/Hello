local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Dominant_Final_Edition"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- ANA PANEL
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 680, 0, 420)
Main.Position = UDim2.new(0.5, -340, 0.5, -210)
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
Title.Size = UDim2.new(0, 300, 1, 0)
Title.Text = "  Dominant Executor v3.2 | RC7 Integrated"
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TabBar

-- EPIC FACE LOGO (Verdiğin ID)
local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 60, 0, 60)
Logo.Position = UDim2.new(0.5, -30, 0, -10)
Logo.Image = "rbxassetid://4359357959"
Logo.BackgroundTransparency = 1
Logo.ZIndex = 5
Logo.Parent = Main

---------------------------------------------------------
-- SOL TARAF: KOD EDİTÖRÜ & LOGS
---------------------------------------------------------
local EditorScroll = Instance.new("ScrollingFrame")
EditorScroll.Size = UDim2.new(0, 420, 0, 230)
EditorScroll.Position = UDim2.new(0.02, 0, 0.1, 0)
EditorScroll.BackgroundColor3 = Color3.new(1, 1, 1)
EditorScroll.CanvasSize = UDim2.new(0, 0, 15, 0)
EditorScroll.ScrollBarThickness = 6
EditorScroll.Parent = Main

local EditorBox = Instance.new("TextBox")
EditorBox.Size = UDim2.new(1, 0, 1, 0)
EditorBox.Text = "-- Dominant v3.2\nprint('Waiting for command...')"
EditorBox.MultiLine = true
EditorBox.ClearTextOnFocus = false
EditorBox.TextXAlignment = Enum.TextXAlignment.Left
EditorBox.TextYAlignment = Enum.TextYAlignment.Top
EditorBox.Font = Enum.Font.Code
EditorBox.TextSize = 14
EditorBox.Parent = EditorScroll

local LogScroll = Instance.new("ScrollingFrame")
LogScroll.Size = UDim2.new(0, 420, 0, 90)
LogScroll.Position = UDim2.new(0.02, 0, 0.75, 0)
LogScroll.BackgroundColor3 = Color3.new(1, 1, 1)
LogScroll.CanvasSize = UDim2.new(0, 0, 20, 0) -- Çok fazla remote için geniş alan
LogScroll.ScrollBarThickness = 4
LogScroll.Parent = Main

local Logs = Instance.new("TextLabel")
Logs.Size = UDim2.new(1, 0, 1, 0)
Logs.BackgroundTransparency = 1
Logs.Text = "[SYSTEM]: Ready to scan Remotes..."
Logs.TextXAlignment = Enum.TextXAlignment.Left
Logs.TextYAlignment = Enum.TextYAlignment.Top
Logs.Font = Enum.Font.Code
Logs.TextSize = 12
Logs.TextWrapped = true
Logs.Parent = LogScroll

---------------------------------------------------------
-- SAĞ TARAF: SCRIPT HUB (GENİŞLETİLMİŞ)
---------------------------------------------------------
local ScriptSection = Instance.new("Frame")
ScriptSection.Size = UDim2.new(0, 220, 0, 350)
ScriptSection.Position = UDim2.new(0.65, 0, 0.1, 0)
ScriptSection.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
ScriptSection.BorderSizePixel = 1
ScriptSection.Parent = Main

local ScriptTitle = Instance.new("TextLabel")
ScriptTitle.Size = UDim2.new(1, 0, 0, 25)
ScriptTitle.Text = "SCRIPT HUB (LUA)"
ScriptTitle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ScriptTitle.Font = Enum.Font.SourceSansBold
ScriptTitle.Parent = ScriptSection

local ScriptScroll = Instance.new("ScrollingFrame")
ScriptScroll.Size = UDim2.new(1, 0, 1, -25)
ScriptScroll.Position = UDim2.new(0, 0, 0, 25)
ScriptScroll.BackgroundTransparency = 1
ScriptScroll.CanvasSize = UDim2.new(0, 0, 4, 0)
ScriptScroll.ScrollBarThickness = 5
ScriptScroll.Parent = ScriptSection

local SList = Instance.new("UIListLayout")
SList.Padding = UDim.new(0, 2)
SList.Parent = ScriptScroll

-- SCRIPT KÜTÜPHANESİ (RC7 DAHİL)
local ScriptLibrary = {
	["RC7 (GUI)"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/CoreGui/Scripts/main/RC7"))()',
	["Infinite Yield"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()',
	["Dex Explorer"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Dex.lua"))()',
	["Simple Spy V3"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpyV3/main/main.lua"))()',
	["Dark Dex V4"] = 'loadstring(game:HttpGet("https://gist.githubusercontent.com/DinosaurButWithNoLife/3924f3ad8438107779708f09fcb6ad27/raw/dex.lua"))()',
	["OwlHub (Aim/ESP)"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()',
	["Universal ESP"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()',
	["Fly Gui (V3)"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))()',
	["Anti-AFK"] = 'local vu = game:GetService("VirtualUser"); game:GetService("Players").LocalPlayer.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame); task.wait(1); vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end)',
	["Rejoin Game"] = 'game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)',
    ["Chat Spammer"] = 'while task.wait(1) do game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Dominant Executor On Top!", "All") end'
}

for name, code in pairs(ScriptLibrary) do
	local sBtn = Instance.new("TextButton")
	sBtn.Size = UDim2.new(1, 0, 0, 30)
	sBtn.Text = " " .. name
	sBtn.TextXAlignment = Enum.TextXAlignment.Left
	sBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
	sBtn.BorderSizePixel = 0
	sBtn.Font = Enum.Font.SourceSans
	sBtn.Parent = ScriptScroll
	
	sBtn.MouseButton1Click:Connect(function()
		EditorBox.Text = code
		Logs.Text = Logs.Text .. "\n[LOADED]: " .. name
		LogScroll.CanvasPosition = Vector2.new(0, 99999)
	end)
end

---------------------------------------------------------
-- BUTONLAR & FONKSİYONLAR
---------------------------------------------------------
local function createBtn(name, xPos)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0, 130, 0, 30)
	b.Position = UDim2.new(xPos, 0, 0.67, 0)
	b.Text = name
	b.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
	b.BorderSizePixel = 1
	b.Parent = Main
	return b
end

local Exec = createBtn("Execute", 0.02)
local Clear = createBtn("Clear", 0.22)
local Inject = createBtn("Inject", 0.42)

-- REMOTE SCANNER (FIXED)
Inject.MouseButton1Click:Connect(function()
	Logs.Text = Logs.Text .. "\n[SCANNING]: Fetching all RemoteEvents..."
	local count = 0
	for _, v in pairs(game:GetDescendants()) do
		pcall(function()
			if v:IsA("RemoteEvent") then
				count = count + 1
				Logs.Text = Logs.Text .. "\n> EVENT: " .. v.Name .. " | In: " .. v.Parent.Name
			elseif v:IsA("RemoteFunction") then
				count = count + 1
				Logs.Text = Logs.Text .. "\n> FUNC: " .. v.Name .. " | In: " .. v.Parent.Name
			end
		end)
	end
	Logs.Text = Logs.Text .. "\n[SUCCESS]: Found " .. count .. " Remotes."
	LogScroll.CanvasPosition = Vector2.new(0, 99999)
end)

Exec.MouseButton1Click:Connect(function()
	local f, e = loadstring(EditorBox.Text)
	if f then 
		task.spawn(f) 
		Logs.Text = Logs.Text .. "\n[IDE]: Executed Successfully."
	else 
		Logs.Text = Logs.Text .. "\n[SYNTAX ERR]: "..e 
	end
	LogScroll.CanvasPosition = Vector2.new(0, 99999)
end)

Clear.MouseButton1Click:Connect(function() EditorBox.Text = "" end)
