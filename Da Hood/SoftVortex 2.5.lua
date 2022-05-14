game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "SoftVortex",
Text = "Thank You For Using SoftVortex",
Button1 = "🌟",
Duration = 0.3
})
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Ak485176/Matres/main/nicee"),true))()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🖤 SoftVortex 2.5                                       discord.gg/SoftVortex", "DarkTheme") 
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main Section")
local mouse = game.Players.LocalPlayer:GetMouse()
local sconnections = {}
local loopbreak = false
local CFrameSpeedTP = 0 -- // Default CFrame TP Speed
local JumpPower = 50 --// Default Jump Power
local njcs = false --// No Jump Cooldown
local infj = false --// Infinite Jump
local circfov = 250 --// Silent Aim Circle FOV
local cs  --// RunService Stepped Connection
local c1  --// CFrame TP
local c2  --// Anti Stomp
local c3  --// Noclip
local c4  --// JumpPower Loop
local c5  --// Infinite Jump
local c7  --// Silent Aim
local circle  --// Circle FOV
do
    --// Spoof the Current Da Hood Modded Anti Cheat
    local function ACThing()
        for I, V in pairs(getgc(true)) do
            if type(V) == "function" then
                if getfenv(V).script and getfenv(V).script.name == "Camera" then
                    for I2, V2 in pairs(getupvalues(V)) do
                        if type(V2) == "table" and rawget(V2, "DoThings") then
                            rawset(V2, "Break", true)
                            rawset(
                                V2,
                                "DoThings",
                                function()
                                end
                            )
                        end
                    end
                end
            end
        end
    end
    ACThing()
    game.Players.LocalPlayer.CharacterAdded:connect(ACThing)

    --// Creates the Circle
    circle = Drawing.new("Circle")
    circle.Transparency = 1
    circle.Thickness = 1
    circle.Radius = 100
    circle.Filled = false
    circle.Color = Color3.new(255, 255, 255)
    circle.Visible = true

    --// Silent Aim
    local oldh
    oldh =
        hookmetamethod(
        game,
        "__index",
        function(Self, Index)
            if Self:IsA("Mouse") and Index == "Hit" and c7 then
                local target
                local raycastlimit = 9e9
                for _, V in pairs(workspace.Characters:GetChildren()) do
                    if
                        V.Name ~= game.Players.LocalPlayer.Name and V:FindFirstChild("Head") and
                            V:FindFirstChild("HumanoidRootPart") and
                            V:FindFirstChild("I_LOADED_I") and
                            V.I_LOADED_I:FindFirstChild("K.O") and
                            not V.I_LOADED_I:FindFirstChild("K.O").Value
                     then
                        local pos, vis = workspace.CurrentCamera:WorldToViewportPoint(V.HumanoidRootPart.Position)
                        if vis then
                            local m =
                                (Vector2.new(
                                game.Players.LocalPlayer:GetMouse().X,
                                game.Players.LocalPlayer:GetMouse().Y
                            ) - Vector2.new(pos.X, pos.Y)).Magnitude
                            if m < raycastlimit and m < circfov then
                                local humanoid = V.Humanoid
                                humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Subject
                                humanoid.HealthDisplayDistance = 5000
                                humanoid.NameDisplayDistance = 5000
                                target = V
                                raycastlimit = m
                            else
                                local humanoid = V.Humanoid
                                humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
                                humanoid.HealthDisplayDistance = 100
                                humanoid.NameDisplayDistance = 100
                            end
                        end
                    end
                end

                if target then
                    local head = target.Head
                    returningvalue = head.CFrame + (head.Velocity * .20)
                    return Index == "Hit" and returningvalue
                end
            end
            return oldh(Self, Index)
        end
    )

    --// Remove Wait() Cooldown
    local old
    old =
        hookfunction(
        wait,
        function(a)
            local oldarg = a
            if njcs or infj then
                a = 0
                return old(a)
            else
                return old(a)
            end
        end
    )
end
--//

cs =
    game:GetService("RunService").Stepped:connect(
    function()
        --// RunService Stepped
        if c1 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
                game.Players.LocalPlayer.Character.Humanoid.MoveDirection * CFrameSpeedTP
        end
        if c3 then
            for I, V in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if V:IsA("BasePart") and V.CanCollide == true then
                    V.CanCollide = false
                end
            end
        end
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
    end
)
table.insert(sconnections, cs)

--// while true do loop
coroutine.wrap(
    function()
        --// Avoid yielding
        while true do
            task.wait()
            if loopbreak then
                break
            end
            pcall(
                function()
                    --// Move the Circle's Position to Mouse
                    if c7 then
                        circle.Visible = true
                        circle.Position = Vector2.new(mouse.X, mouse.Y + 40)
                        circle.Radius = circfov
                    else
                        circle.Visible = false
                    end
                    --// Anti Stomp
                    if c2 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health <= 10 then
                            game.Players.LocalPlayer.Character.I_LOADED_I:Destroy()
                            wait(5)
                            game.Players.LocalPlayer.Character.Humanoid.RigType = Enum.HumanoidRigType.R6
                        end
                    end
                end
            )
        end
    end
)()
Section:NewToggle(
    "Silent Aim",
    "Silent Aim",
    function(state)
        c7 = state
    end
)
Section:NewSlider(
    "Silent Aim FOV",
    "The Silent Aim FOV",
    1000,
    10,
    function(state)
        circfov = state
    end
)

Section:NewButton("Aimbot V2", "Basically Aimbot", function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/MinecraftTester5151/fds/main/a"),true))()
end)
Section:NewButton("Aimware Q", "Basically Aimbot", function()
loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/violentqm/aimwarelock/main/Main"))()
end)
Section:NewButton("Fly X", "Fly X", function()
    	local L_143_ = game.Players.LocalPlayer
	local L_144_ = L_143_:GetMouse()
	localplayer = L_143_
	if workspace:FindFirstChild("Core") then
		workspace.Core:Destroy()
	end
	local L_145_ = Instance.new("Part")
	L_145_.Name = "Core"
	L_145_.Size = Vector3.new(0.05, 0.05, 0.05)
	spawn(function()
		L_145_.Parent = workspace
		local L_152_ = Instance.new("Weld", L_145_)
		L_152_.Part0 = L_145_
		L_152_.Part1 = localplayer.Character.LowerTorso
		L_152_.C0 = CFrame.new(0, 0, 0)
	end)
	workspace:WaitForChild("Core")
	local L_146_ = workspace.Core
	flying = true
	local L_147_ = 25
	local L_148_ = {
		a = false,
		d = false,
		w = false,
		s = false
	}
	local L_149_
	local L_150_
	local function L_151_func()
		local L_153_ = Instance.new("BodyPosition", L_146_)
		local L_154_ = Instance.new("BodyGyro", L_146_)
		L_153_.Name = "EPIXPOS"
		L_153_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
		L_153_.position = L_146_.Position
		L_154_.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		L_154_.cframe = L_146_.CFrame
		repeat
			wait()
			localplayer.Character.Humanoid.PlatformStand = true
			local L_155_ = L_154_.cframe - L_154_.cframe.p + L_153_.position
			if not L_148_.w and not L_148_.s and not L_148_.a and not L_148_.d then
				L_147_ = 25
			end
			if L_148_.w then
				L_155_ = L_155_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_147_
				L_147_ = L_147_ + 0
			end
			if L_148_.s then
				L_155_ = L_155_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_147_
				L_147_ = L_147_ + 0
			end
			if L_148_.d then
				L_155_ = L_155_ * CFrame.new(L_147_, 0, 0)
				L_147_ = L_147_ + 0
			end
			if L_148_.a then
				L_155_ = L_155_ * CFrame.new(-L_147_, 0, 0)
				L_147_ = L_147_ + 0
			end
			if L_147_ > 10 then
				L_147_ = 25
			end
			L_153_.position = L_155_.p
			if L_148_.w then
				L_154_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_147_ * 0), 0, 0)
			elseif L_148_.s then
				L_154_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_147_ * 0), 0, 0)
			else
				L_154_.cframe = workspace.CurrentCamera.CoordinateFrame
			end
		until flying == false
		if L_154_ then
			L_154_:Destroy()
		end
		if L_153_ then
			L_153_:Destroy()
		end
		flying = false
		localplayer.Character.Humanoid.PlatformStand = false
		L_147_ = 25
	end
	L_149_ = L_144_.KeyDown:connect(function(L_156_arg0)
		if not L_146_ or not L_146_.Parent then
			flying = false
			L_149_:disconnect()
			L_150_:disconnect()
			return
		end
		if L_156_arg0 == "w" then
			L_148_.w = true
		elseif L_156_arg0 == "s" then
			L_148_.s = true
		elseif L_156_arg0 == "a" then
			L_148_.a = true
		elseif L_156_arg0 == "d" then
			L_148_.d = true
		elseif L_156_arg0 == "x" then
			if flying == true then
				flying = false
			else
				flying = true
				L_151_func()
			end
		end
	end)
	
	L_150_ = L_144_.KeyUp:connect(function(L_157_arg0)
		if L_157_arg0 == "w" then
			L_148_.w = false
		elseif L_157_arg0 == "s" then
			L_148_.s = false
		elseif L_157_arg0 == "a" then
			L_148_.a = false
		elseif L_157_arg0 == "d" then
			L_148_.d = false
		end
	end)
	L_151_func()
end)
Section:NewButton("Cframe Speed N", "Speed Hack", function()
    	repeat
		wait()
	until game:IsLoaded()
	local L_134_ = game:service('Players')
	local L_135_ = L_134_.LocalPlayer
	repeat
		wait()
	until L_135_.Character
	local L_136_ = game:service('UserInputService')
	local L_137_ = game:service('RunService')
	getgenv().Multiplier = 0.5
	local L_138_ = true
	local L_139_
	L_136_.InputBegan:connect(function(L_140_arg0)
		if L_140_arg0.KeyCode == Enum.KeyCode.LeftBracket then
			Multiplier = Multiplier + 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.LeftBracket) do
				wait()
				Multiplier = Multiplier + 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.RightBracket then
			Multiplier = Multiplier - 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.RightBracket) do
				wait()
				Multiplier = Multiplier - 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.N then
			L_138_ = not L_138_
			if L_138_ == true then
				repeat
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
					game:GetService("RunService").Stepped:wait()
				until L_138_ == false
			end
		end
	end)
end)
Section:NewSlider("Cframe Speed", "speed hack i recommend 1-4", 6, 0, function(s)
    getgenv().Multiplier = s
end)

Section:NewButton("Anti Ban", "Kicks you when a mod/admin/star Has Joined", function()
local annoying = {"JokeTheFool", "Sherosama", "dtbbullet", "AStrongMuscle", "XavierWild", "NikoSenpai", "UziGarage", "iumu", "Benoxa", "Luutyy", "clubstar54", "givkitheth", "DrxcoBaby" , "DrxcoRxsh" , "ROVTAED" , "clayonADHD" , "ihatehenri" , "wDynamic" , "Dark_Legacies" , "HiurrW" , "6ugged" , "llHxtedOppll" , "DeszKAndrees" , "WWWHYYYYYYYYYYYYYY" , "DigitalAngels" , "monkey1991cool" , "IkykoI" , "shinepranked" , "eliteloopkiller" , "RestfuIly" , "Remurez" , "Craxelss" , "prokiller357089" , "Deluxura" , "Iateforever" , "romeothefathamster" , "SinisterLimitless" , "xXStrikerTentacle215" , "lmTheHxliday" , "G5OUL" , "saialt11" , "T_4Q" , "theyluvkyro" , "A3sReturn" , "B4NKFUNDS" , "YourFatherMetal" , "YourFatherGenux" , "SwagminLerk" , "MarcsRevenge" , "Leppions" , "KivieArsenal" , "WeaponMods" , "ImTheHxliday" , "0uwy" , "dtbkxng" , "saiheartshin" , "Tezza4321" , "rvkudo" , "FateIsAChimp"}
 
game.Players.PlayerAdded:Connect(function(plr)
for i, v in pairs(annoying) do
if plr.Name == v then
local loc = game.Players.LocalPlayer
loc:Kick("Kicked an admin/mod/star has joined")
end
end
end)
end)
Section:NewToggle(
    "Anti Stomp [click respawn ]",
    "wont be able to be stomped or grabbed or get up",
    function(state)
        if state then
            c2 = true
        else
            c2 = false
        end
    end
)
Section:NewButton(
    "respawn",
    "respawn",
    function()
        for I, V in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if V:IsA("BasePart") and not V.Anchored then
                V.Anchored = true
            end
        end
        game.Players.LocalPlayer.Character.Head:ClearAllChildren()
    end
)
Section:NewButton("Spinbot [B]", "Spinbot", function()
   	local L_165_ = false
	local L_166_ = game:GetService("UserInputService");
	L_166_.InputBegan:Connect(function(L_167_arg0, L_168_arg1)
		if (L_167_arg0.KeyCode == Enum.KeyCode.B and L_168_arg1 == false) then
			if L_165_ == false then
				L_165_ = true
				wait()
				getgenv().urspeed = 500
				local L_169_ = game.Players.LocalPlayer.Character
				while wait() do
					L_169_.HumanoidRootPart.CFrame = L_169_.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(urspeed), 0)
				end
			else
				L_165_ = false
				getgenv().urspeed = 0
			end
		end
	end);
	game:GetService('RunService').Stepped:connect(function()
		if L_165_ == true then
		end
	end)
	game:GetService('RunService').Stepped:connect(function()
		if L_165_ == false then
			stopTracks();
		end
	end)
end)

Section:NewButton("Float Speed C", "Basically SpeedHack evry time you hold C", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/angeloX041/Speedc/main/SuperSpeedC ", true))()
end)
Section:NewButton("AirStrike", "Makes your Gun Float", function()
		wait(0) local A_1 = "Airstrike Switched To True." local A_2 = "f" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
	
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do                 if v:isA("Tool") then                                          v.GripPos = Vector3.new(5,0,-5)                     game.Players.LocalPlayer.Character.Humanoid:UnequipTools()                 end end
end)

Section:NewButton("Auto Stomp", "AutoStomp", function()
_G.stompem = true
        while _G.stompem do
        wait()
        game.ReplicatedStorage.MainRemote:FireServer("Stomp")
end
end)
Section:NewButton("Disable Auto Stomp", "AutoStomp", function()
_G.stompem = false
end)
    
    

game:GetService("RunService").RenderStepped:Connect(function()
	if getgenv().Toggled then
		toggle:UpdateToggle("Toggle On")
	else
		toggle:UpdateToggle("Toggle Off")
	end
end)


Section:NewButton("Tool Reach", "Big Hitbox With Tools", function()
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v:isA("Tool") then
				local a = Instance.new("SelectionBox",v.Handle)
				a.Adornee = v.Handle
				v.Handle.Size = Vector3.new(50,50,50)
				v.GripPos = Vector3.new(10,10,10)
				v.Handle.Transparency = 1
				lplayer.Character.Humanoid:UnequipTools()
			end
		end
end)
Section:NewButton("Anti Slow", "Anti Slow When Reloading/Jumping/Punching", function()
        local Players = game:GetService("Players")
        local lp = Players.LocalPlayer
        local mouse = lp:GetMouse()
        local uis = game:GetService("UserInputService")
        local rservice = game:GetService("RunService")
        local cam = workspace.CurrentCamera
        local NormalGravity = game.Workspace.Gravity

        local Raw = getrawmetatable(game)
        local Caller = checkcaller or is_protosmasher_caller or Cer.isCerus
        local CallingScript = getcallingscript or get_calling_script
        local Closure = newcclosure or read_me or function(Func) return Func end
        local CallingMethod = getnamecallmethod or get_namecall_method
        setreadonly(Raw,false)
        local NewIndex = Raw.__newindex;
        Raw.__newindex = Closure(function(self,Property,Value)
            if Caller() then return NewIndex(self,Property,Value) end
            if Property == "WalkSpeed" then return 16 end
            if Property == "JumpPower" then return 50 end 
            if Property == "HipHeight" then return 0 end 
            if self == workspace and Property == "Gravity" then return NormalGravity end
            if Property == "CFrame" and self:IsDescendantOf(lp.Character) then return end 
            return NewIndex(self,Property,Value)
        end)
        local Namecall = Raw.__namecall;
        Raw.__namecall = Closure(function(self,...)
        local Args = {...}
            if Caller() then 
                if CallingMethod() == "FindFirstChild" and Args[1] == "HumanoidRootPart" then 
                    Args[1] = "HumanoidRootPart" 
                    return Namecall(self,unpack(Args))
                end
                return Namecall(self,...) 
            end 
            if CallingMethod() == "Destroy" or CallingMethod() == "Kick" then 
                if self == lp then return wait(9e9) end
                if tostring(self) == 'BodyGyro' or tostring(self) == 'BodyVelocity' then return wait(9e9) end 
            end
            if CallingMethod() == "BreakJoints" and self == lp.Character then return wait(9e9) end
            return Namecall(self,...)
        end)
        setreadonly(Raw,true)
        uis.InputBegan:Connect(function(key)
            if key.KeyCode == Enum.KeyCode.LeftShift then
                shiftdown = true
            end
            if key.KeyCode == Enum.KeyCode.LeftAlt then
                altering = true
            end
            if key.KeyCode == Enum.KeyCode.R then
                if lp.Character and lp.Character:FindFirstChildOfClass("Tool") then
                    game.ReplicatedStorage.MainRemote:FireServer("Reload")
                end
            end
            if recording == false and key ~= nil then
                if key.KeyCode == akey then
                    keyss = true
                    plr = getClosestToMouse()
                end
            end
            if key ~= nil and recording then
                akey = key.KeyCode
                button.Text = tostring(key.KeyCode)
                recording = false
            end
        end)
        uis.InputEnded:Connect(function(key)
            if key.KeyCode == Enum.KeyCode.LeftShift then
                shiftdown = false
            end
            if key.KeyCode == Enum.KeyCode.LeftAlt then
                altering = false
            end
            if recording == false and key ~= nil then
                if key.KeyCode == akey then
                    keyss = false
                    plr = nil
                end
            end
        end)
        rservice.RenderStepped:Connect(function()
            if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
                if shiftdown then
                    lp.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 21
                else
                    lp.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
                end
                if ar then
                    if lp.Character and lp.Character:FindFirstChild("I_LOADED_I") and lp.Character:FindFirstChild("I_LOADED_I")['K.O'].Value == true then
                        if lp.Character then
                            lp.Character:Destroy()
                        end
                    end
                end
            end
            for _,z in pairs(game.Players:GetPlayers()) do
                for _,v in pairs(game.CoreGui:GetChildren()) do
                    if z.Name == v.Name then
                        if z.Character and z.Character:FindFirstChildOfClass("Humanoid") and z.Character:FindFirstChild("Head") then
                            v.Adornee = z.Character:FindFirstChild("Head")
                        else
                            v.Adornee = nil
                        end
                    end
                end
            end
        end)
        DiscordLib:Notification("Notification", "Removed Slowdown and Jump cooldown", "Okay!")
end)

Section:NewSlider(
    "Jump Power",
    "Defines how high you jump",
    350,
    50,
    function(state)
        JumpPower = state
    end
)
Section:NewToggle(
    "Infinite Jump",
    "you can jump how many times u want",
    function(state)
        infj = state
        if state then
            c5 =
                game.Players.LocalPlayer:GetMouse().KeyDown:connect(
                function(k)
                    if infj and k == " " then
                        game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)
                    end
                end
            )
            table.insert(sconnections, c5)
        else
            c5:Disconnect()
        end
    end
)

Section:NewToggle(
    "No Jump Cooldown",
    "Allows you to jump without having cooldown",
    function(state)
        njcs = state
    end
)
Section:NewButton("Boost X [Works When Dead] OP ASF", "boost X works while dead", function()
	repeat wait() until game.Players.LocalPlayer.Character

	local plr = game.Players.LocalPlayer
	local char = plr.Character
	local hum = char:WaitForChild("Humanoid")
	local Torso = char:WaitForChild("LowerTorso")
	local Mouse = plr:GetMouse()
	local toggle = false

	Mouse.KeyDown:Connect(function(key)
		if key == "x" then
			if toggle == false then
				toggle = true
				local Anim = Instance.new("Animation")
				Anim.AnimationId = "rbxassetid://7189034627"
				local PlayAnim = hum:LoadAnimation(Anim)
				PlayAnim:Play()
				local BV = Instance.new("BodyVelocity",Torso)
				BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
				while toggle == true do
					BV.Velocity = Mouse.Hit.lookVector*300
					wait()
				end
			end
			if toggle == true then
				toggle = false
				Torso:FindFirstChildOfClass("BodyVelocity"):remove()
				local tracks = hum:GetPlayingAnimationTracks()
				for i, stoptracks in pairs(tracks) do
					stoptracks:Stop()
				end
				local Anim = Instance.new("Animation")
				Anim.AnimationId = "http://www.roblox.com/asset/?id=7189034627"
				local PlayAnim = hum:LoadAnimation(Anim)
				PlayAnim:Play()
			end
		end
	end)
end)
Section:NewButton("Airwalk [U]", "Walking on Air", function()

        local testsquadAIR    = {
            Airwalk    = Enum.KeyCode.U;
         }
         
         local ContextAction = Game:GetService("ContextActionService")
         local RunService    = Game:GetService("RunService")
         
         local function ForEach(t, f)
            for Index, Value in pairs(t) do
                f(Value, Index)
            end
         end _G.ForEach=ForEach;
         local function Create(ClassName)
            local Object = Instance.new(ClassName)
            return function(Properties)
                ForEach(Properties, function(Value, Property)
                    Object[Property] = Value
                end)
                return Object
            end
         end _G.Create=Create;
         
         do
            local airwalkState     = false
            local currentPart    = nil
            RunService.RenderStepped:connect(function()
                if airwalkState then
                    if not currentPart then
                        warn "On"
                        currentPart = Create "Part" {
                            Parent = workspace.CurrentCamera;
                            Name = "AWP";
                            Transparency = 1;
                            Size = Vector3.new(2, 1, 2);
                            Anchored = true;
                        }
                    end
                    local character = game.Players.LocalPlayer.Character
                    if character then
                        currentPart.CFrame = character.HumanoidRootPart.CFrame - Vector3.new(0, 3.6, 0)
                    end
                else
                    if currentPart then
                        warn "Off"
                        currentPart:Destroy()
                        currentPart = nil
                    end        
                end
            end)
            ContextAction:BindAction("Airwalk", function(_, InputState)
                if InputState == Enum.UserInputState.Begin then
                    
                    airwalkState = not airwalkState
                end
            end, false, testsquadAIR.Airwalk)
         end
end)

Section:NewButton("Trash Talk J", "Trash Talk", function()

    local plr = game.Players.LocalPlayer
    repeat wait() until plr.Character
    local char = plr.Character

    local garbage = {
        "SoftVortex on Top #1";
        "MANS JUST GOT DROPPED";
        "my grandma has more skill than you";
        "AIRSHOTED LOL";
        "imagine being you right now";
        "why do you even try";
        "I didn't think you were this bad";
        "so trash";
        "crimskid is a dog L & a skid";
        "SoftVortex is The Best Dhm Script!";
        "thank you for your time";
        "time to take out the trash";
        "did you get worse?";
        "TAPPED";











    }


    function TrashTalk(inputObject, gameProcessedEvent)
        if inputObject.KeyCode == Enum.KeyCode.J and gameProcessedEvent == false then        
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                garbage[math.random(1,#garbage)],
                "All"
            )
        end
    end

    game:GetService("UserInputService").InputBegan:connect(TrashTalk)
 
if combo > 45 then
   c("0x01")
end
end)





local Tab = Window:NewTab("Player")
local Section = Tab:NewSection("Player Section")

Section:NewTextBox("Streak Changer", "Streak Changer", function(txt)
    game:GetService("Players").LocalPlayer.Information.Streaks.Value = txt
end)

Section:NewButton("Fe Headless", "Buggy", function()
		pcall(function()
			game.Players.LocalPlayer.Character.Head.Neck:Destroy()
			game.Players.LocalPlayer.Character.UpperTorso.NeckAttachment:Destroy()
			game.Players.LocalPlayer.Character.Humanoid.HealthDisplayDistance = math.huge
			game.Players.LocalPlayer.Character.Humanoid.NameDisplayDistance = math.huge
			game.Players.LocalPlayer.Character.Head.Size = Vector3.new(0,0,0)
			game.Players.LocalPlayer.Character.Head.Massless = true
			game.Players.LocalPlayer.Character.Head.CanCollide = false
	
			heazd = true
	
			while heazd == true do 
				pcall(function()  
					game.Players.LocalPlayer.Character.Head.NeckRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
					game.Players.LocalPlayer.Character.UpperTorso.NeckRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
					game.Players.LocalPlayer.Character.Head.CFrame = CFrame.new(0, 100000.4736328125, 0)
				end)
				wait()
			end
		end)

end)
Section:NewButton("Headless", "Headless", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/carlcoded/pro/main/headlessperma'))()
end)
Section:NewButton("Face Changer", "Face Changer", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/carlcoded/Scripts/main/carlface'))()
end)
Section:NewButton("Korblox Leg", "Korblox Leg", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/carlcoded/pro/main/rightkorbloxperma'))()
end)
Section:NewButton("Fe Korblox Leg [Wont Let You Stomp]", "Fe Korblox Leg Wont Be Able To Stomp", function()
    game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
end)

Section:NewButton("Fe Animations", "Fe Animations Everyone Can See", function()
	local AnimationChanger = Instance.new("ScreenGui") local Main = Instance.new("Frame") local TopBar = Instance.new("Frame") local Close = Instance.new("TextButton") local TextLabel = Instance.new("TextLabel") local TextLabel_2 = Instance.new("TextLabel") local NormalTab = Instance.new("Frame") local A_Astronaut = Instance.new("TextButton") local A_Bubbly = Instance.new("TextButton") local A_Cartoony = Instance.new("TextButton") local A_Elder = Instance.new("TextButton") local A_Knight = Instance.new("TextButton") local A_Levitation = Instance.new("TextButton") local A_Mage = Instance.new("TextButton") local A_Ninja = Instance.new("TextButton") local A_Pirate = Instance.new("TextButton") local A_Robot = Instance.new("TextButton") local A_Stylish = Instance.new("TextButton") local A_SuperHero = Instance.new("TextButton") local A_Toy = Instance.new("TextButton") local A_Vampire = Instance.new("TextButton") local A_Werewolf = Instance.new("TextButton") local A_Zombie = Instance.new("TextButton") local Category = Instance.new("TextLabel") local SpecialTab = Instance.new("Frame") local A_Patrol = Instance.new("TextButton") local A_Confident = Instance.new("TextButton") local A_Popstar = Instance.new("TextButton") local A_Cowboy = Instance.new("TextButton") local A_Ghost = Instance.new("TextButton") local A_Sneaky = Instance.new("TextButton") local A_Princess = Instance.new("TextButton") local Category_2 = Instance.new("TextLabel") local OtherTab = Instance.new("Frame") local Category_3 = Instance.new("TextLabel") local A_None = Instance.new("TextButton") local A_Anthro = Instance.new("TextButton") local Animate = game.Players.LocalPlayer.Character.Animate AnimationChanger.Name = "AnimationChanger" AnimationChanger.Parent = game:WaitForChild("CoreGui") AnimationChanger.ZIndexBehavior = Enum.ZIndexBehavior.Sibling Main.Name = "Main" Main.Parent = AnimationChanger Main.BackgroundColor3 = Color3.new(0.278431, 0.278431, 0.278431) Main.BorderSizePixel = 0 Main.Position = UDim2.new(0.421999991, 0, -1, 0) Main.Size = UDim2.new(0, 300, 0, 250) Main.Active = true Main.Draggable = true TopBar.Name = "TopBar" TopBar.Parent = Main TopBar.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) TopBar.BorderSizePixel = 0 TopBar.Size = UDim2.new(0, 300, 0, 30) Close.Name = "Close" Close.Parent = TopBar Close.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) Close.BorderSizePixel = 0 Close.Position = UDim2.new(0.899999976, 0, 0, 0) Close.Size = UDim2.new(0, 30, 0, 30) Close.Font = Enum.Font.SciFi Close.Text = "x" Close.TextColor3 = Color3.new(1, 0, 0.0156863) Close.TextSize = 20 Close.MouseButton1Click:Connect(function() wait(0.3) Main:TweenPosition(UDim2.new(0.421999991, 0, -1.28400004, 0)) wait(3) AnimationChanger:Destroy() end) TextLabel.Parent = TopBar TextLabel.BackgroundColor3 = Color3.new(1, 1, 1) TextLabel.BackgroundTransparency = 1 TextLabel.BorderSizePixel = 0 TextLabel.Position = UDim2.new(0, 0, 0.600000024, 0) TextLabel.Size = UDim2.new(0, 270, 0, 10) TextLabel.Font = Enum.Font.SourceSans TextLabel.Text = "Made by Nyser#4623" TextLabel.TextColor3 = Color3.new(1, 1, 1) TextLabel.TextSize = 15 TextLabel_2.Parent = TopBar TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1) TextLabel_2.BackgroundTransparency = 1 TextLabel_2.BorderSizePixel = 0 TextLabel_2.Position = UDim2.new(0, 0, -0.0266667679, 0) TextLabel_2.Size = UDim2.new(0, 270, 0, 20) TextLabel_2.Font = Enum.Font.SourceSans TextLabel_2.Text = "Animation Changer" TextLabel_2.TextColor3 = Color3.new(1, 1, 1) TextLabel_2.TextSize = 20 NormalTab.Name = "NormalTab" NormalTab.Parent = Main NormalTab.BackgroundColor3 = Color3.new(0.278431, 0.278431, 0.278431) NormalTab.BackgroundTransparency = 1 NormalTab.BorderSizePixel = 0 NormalTab.Position = UDim2.new(0.5, 0, 0.119999997, 0) NormalTab.Size = UDim2.new(0, 150, 0, 500) A_Astronaut.Name = "A_Astronaut" A_Astronaut.Parent = NormalTab A_Astronaut.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Astronaut.BorderSizePixel = 0 A_Astronaut.Position = UDim2.new(0, 0, 0.815764725, 0) A_Astronaut.Size = UDim2.new(0, 150, 0, 30) A_Astronaut.Font = Enum.Font.SciFi A_Astronaut.Text = "Astronaut" A_Astronaut.TextColor3 = Color3.new(1, 1, 1) A_Astronaut.TextSize = 20 A_Astronaut.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Bubbly.Name = "A_Bubbly" A_Bubbly.Parent = NormalTab A_Bubbly.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Bubbly.BorderSizePixel = 0 A_Bubbly.Position = UDim2.new(0, 0, 0.349019617, 0) A_Bubbly.Size = UDim2.new(0, 150, 0, 30) A_Bubbly.Font = Enum.Font.SciFi A_Bubbly.Text = "Bubbly" A_Bubbly.TextColor3 = Color3.new(1, 1, 1) A_Bubbly.TextSize = 20 A_Bubbly.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910" Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921" Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Cartoony.Name = "A_Cartoony" A_Cartoony.Parent = NormalTab A_Cartoony.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Cartoony.BorderSizePixel = 0 A_Cartoony.Position = UDim2.new(0, 0, 0.407272667, 0) A_Cartoony.Size = UDim2.new(0, 150, 0, 30) A_Cartoony.Font = Enum.Font.SciFi A_Cartoony.Text = "Cartoony" A_Cartoony.TextColor3 = Color3.new(1, 1, 1) A_Cartoony.TextSize = 20 A_Cartoony.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Elder.Name = "A_Elder" A_Elder.Parent = NormalTab A_Elder.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Elder.BorderSizePixel = 0 A_Elder.Position = UDim2.new(6.51925802e-09, 0, 0.636310041, 0) A_Elder.Size = UDim2.new(0, 150, 0, 30) A_Elder.Font = Enum.Font.SciFi A_Elder.Text = "Elder" A_Elder.TextColor3 = Color3.new(1, 1, 1) A_Elder.TextSize = 20 A_Elder.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Knight.Name = "A_Knight" A_Knight.Parent = NormalTab A_Knight.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Knight.BorderSizePixel = 0 A_Knight.Position = UDim2.new(0, 0, 0.52352941, 0) A_Knight.Size = UDim2.new(0, 150, 0, 30) A_Knight.Font = Enum.Font.SciFi A_Knight.Text = "Knight" A_Knight.TextColor3 = Color3.new(1, 1, 1) A_Knight.TextSize = 20 A_Knight.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Levitation.Name = "A_Levitation" A_Levitation.Parent = NormalTab A_Levitation.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Levitation.BorderSizePixel = 0 A_Levitation.Position = UDim2.new(0, 0, 0.115472436, 0) A_Levitation.Size = UDim2.new(0, 150, 0, 30) A_Levitation.Font = Enum.Font.SciFi A_Levitation.Text = "Levitation" A_Levitation.TextColor3 = Color3.new(1, 1, 1) A_Levitation.TextSize = 20 A_Levitation.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Mage.Name = "A_Mage" A_Mage.Parent = NormalTab A_Mage.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Mage.BorderSizePixel = 0 A_Mage.Position = UDim2.new(0, 0, 0.696203232, 0) A_Mage.Size = UDim2.new(0, 150, 0, 30) A_Mage.Font = Enum.Font.SciFi A_Mage.Text = "Mage" A_Mage.TextColor3 = Color3.new(1, 1, 1) A_Mage.TextSize = 20 A_Mage.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Ninja.Name = "A_Ninja" A_Ninja.Parent = NormalTab A_Ninja.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Ninja.BorderSizePixel = 0 A_Ninja.Position = UDim2.new(0, 0, 0.0597896464, 0) A_Ninja.Size = UDim2.new(0, 150, 0, 30) A_Ninja.Font = Enum.Font.SciFi A_Ninja.Text = "Ninja" A_Ninja.TextColor3 = Color3.new(1, 1, 1) A_Ninja.TextSize = 20 A_Ninja.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Pirate.Name = "A_Pirate" A_Pirate.Parent = NormalTab A_Pirate.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Pirate.BorderSizePixel = 0 A_Pirate.Position = UDim2.new(-0.000333309174, 0, 0.874588311, 0) A_Pirate.Size = UDim2.new(0, 150, 0, 30) A_Pirate.Font = Enum.Font.SciFi A_Pirate.Text = "Pirate" A_Pirate.TextColor3 = Color3.new(1, 1, 1) A_Pirate.TextSize = 20 A_Pirate.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Robot.Name = "A_Robot" A_Robot.Parent = NormalTab A_Robot.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Robot.BorderSizePixel = 0 A_Robot.Position = UDim2.new(0, 0, 0.291479498, 0) A_Robot.Size = UDim2.new(0, 150, 0, 30) A_Robot.Font = Enum.Font.SciFi A_Robot.Text = "Robot" A_Robot.TextColor3 = Color3.new(1, 1, 1) A_Robot.TextSize = 20 A_Robot.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Stylish.Name = "A_Stylish" A_Stylish.Parent = NormalTab A_Stylish.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Stylish.BorderSizePixel = 0 A_Stylish.Position = UDim2.new(0, 0, 0.232816339, 0) A_Stylish.Size = UDim2.new(0, 150, 0, 30) A_Stylish.Font = Enum.Font.SciFi A_Stylish.Text = "Stylish" A_Stylish.TextColor3 = Color3.new(1, 1, 1) A_Stylish.TextSize = 20 A_Stylish.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_SuperHero.Name = "A_SuperHero" A_SuperHero.Parent = NormalTab A_SuperHero.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_SuperHero.BorderSizePixel = 0 A_SuperHero.Position = UDim2.new(0, 0, 0.464919746, 0) A_SuperHero.Size = UDim2.new(0, 150, 0, 30) A_SuperHero.Font = Enum.Font.SciFi A_SuperHero.Text = "SuperHero" A_SuperHero.TextColor3 = Color3.new(1, 1, 1) A_SuperHero.TextSize = 20 A_SuperHero.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Toy.Name = "A_Toy" A_Toy.Parent = NormalTab A_Toy.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Toy.BorderSizePixel = 0 A_Toy.Position = UDim2.new(6.51925802e-09, 0, 0.756028414, 0) A_Toy.Size = UDim2.new(0, 150, 0, 30) A_Toy.Font = Enum.Font.SciFi A_Toy.Text = "Toy" A_Toy.TextColor3 = Color3.new(1, 1, 1) A_Toy.TextSize = 20 A_Toy.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Vampire.Name = "A_Vampire" A_Vampire.Parent = NormalTab A_Vampire.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Vampire.BorderSizePixel = 0 A_Vampire.Position = UDim2.new(0, 0, 0.934021354, 0) A_Vampire.Size = UDim2.new(0, 150, 0, 30) A_Vampire.Font = Enum.Font.SciFi A_Vampire.Text = "Vampire" A_Vampire.TextColor3 = Color3.new(1, 1, 1) A_Vampire.TextSize = 20 A_Vampire.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Werewolf.Name = "A_Werewolf" A_Werewolf.Parent = NormalTab A_Werewolf.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Werewolf.BorderSizePixel = 0 A_Werewolf.Position = UDim2.new(-0.000333368778, 0, 0.174509808, 0) A_Werewolf.Size = UDim2.new(0, 150, 0, 30) A_Werewolf.Font = Enum.Font.SciFi A_Werewolf.Text = "Werewolf" A_Werewolf.TextColor3 = Color3.new(1, 1, 1) A_Werewolf.TextSize = 20 A_Werewolf.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Zombie.Name = "A_Zombie" A_Zombie.Parent = NormalTab A_Zombie.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Zombie.BorderSizePixel = 0 A_Zombie.Position = UDim2.new(-1.1920929e-07, 0, 0.582352936, 0) A_Zombie.Size = UDim2.new(0, 150, 0, 30) A_Zombie.Font = Enum.Font.SciFi A_Zombie.Text = "Zombie" A_Zombie.TextColor3 = Color3.new(1, 1, 1) A_Zombie.TextSize = 20 A_Zombie.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) Category.Name = "Category" Category.Parent = NormalTab Category.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863) Category.BorderSizePixel = 0 Category.Size = UDim2.new(0, 150, 0, 30) Category.Text = "Normal" Category.TextColor3 = Color3.new(0, 0.835294, 1) Category.TextSize = 14 SpecialTab.Name = "SpecialTab" SpecialTab.Parent = Main SpecialTab.BackgroundColor3 = Color3.new(0.278431, 0.278431, 0.278431) SpecialTab.BackgroundTransparency = 1 SpecialTab.BorderSizePixel = 0 SpecialTab.Position = UDim2.new(0, 0, 0.119999997, 0) SpecialTab.Size = UDim2.new(0, 150, 0, 230) A_Patrol.Name = "A_Patrol" A_Patrol.Parent = SpecialTab A_Patrol.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Patrol.BorderSizePixel = 0 A_Patrol.Position = UDim2.new(0, 0, 0.259960413, 0) A_Patrol.Size = UDim2.new(0, 150, 0, 30) A_Patrol.Font = Enum.Font.SciFi A_Patrol.Text = "Patrol" A_Patrol.TextColor3 = Color3.new(1, 1, 1) A_Patrol.TextSize = 20 A_Patrol.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Confident.Name = "A_Confident" A_Confident.Parent = SpecialTab A_Confident.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Confident.BorderSizePixel = 0 A_Confident.Position = UDim2.new(0, 0, 0.389248967, 0) A_Confident.Size = UDim2.new(0, 150, 0, 30) A_Confident.Font = Enum.Font.SciFi A_Confident.Text = "Confident" A_Confident.TextColor3 = Color3.new(1, 1, 1) A_Confident.TextSize = 20 A_Confident.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Popstar.Name = "A_Popstar" A_Popstar.Parent = SpecialTab A_Popstar.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Popstar.BorderSizePixel = 0 A_Popstar.Position = UDim2.new(0, 0, 0.130671918, 0) A_Popstar.Size = UDim2.new(0, 150, 0, 30) A_Popstar.Font = Enum.Font.SciFi A_Popstar.Text = "Popstar" A_Popstar.TextColor3 = Color3.new(1, 1, 1) A_Popstar.TextSize = 20 A_Popstar.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Cowboy.Name = "A_Cowboy" A_Cowboy.Parent = SpecialTab A_Cowboy.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Cowboy.BorderSizePixel = 0 A_Cowboy.Position = UDim2.new(0, 0, 0.772964239, 0) A_Cowboy.Size = UDim2.new(0, 150, 0, 30) A_Cowboy.Font = Enum.Font.SciFi A_Cowboy.Text = "Cowboy" A_Cowboy.TextColor3 = Color3.new(1, 1, 1) A_Cowboy.TextSize = 20 A_Cowboy.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Ghost.Name = "A_Ghost" A_Ghost.Parent = SpecialTab A_Ghost.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Ghost.BorderSizePixel = 0 A_Ghost.Position = UDim2.new(0, 0, 0.900632322, 0) A_Ghost.Size = UDim2.new(0, 150, 0, 30) A_Ghost.Font = Enum.Font.SciFi A_Ghost.Text = "Ghost" A_Ghost.TextColor3 = Color3.new(1, 1, 1) A_Ghost.TextSize = 20 A_Ghost.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863" Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616012453" Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616011509" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Sneaky.Name = "A_Sneaky" A_Sneaky.Parent = SpecialTab A_Sneaky.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Sneaky.BorderSizePixel = 0 A_Sneaky.Position = UDim2.new(0, 0, 0.517628431, 0) A_Sneaky.Size = UDim2.new(0, 150, 0, 30) A_Sneaky.Font = Enum.Font.SciFi A_Sneaky.Text = "Sneaky" A_Sneaky.TextColor3 = Color3.new(1, 1, 1) A_Sneaky.TextSize = 20 A_Sneaky.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Princess.Name = "A_Princess" A_Princess.Parent = SpecialTab A_Princess.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Princess.BorderSizePixel = 0 A_Princess.Position = UDim2.new(0, 0, 0.645296335, 0) A_Princess.Size = UDim2.new(0, 150, 0, 30) A_Princess.Font = Enum.Font.SciFi A_Princess.Text = "Princess" A_Princess.TextColor3 = Color3.new(1, 1, 1) A_Princess.TextSize = 20 A_Princess.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=941003647" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=941013098" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=941028902" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=941015281" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=941008832" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=940996062" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=941000007" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) Category_2.Name = "Category" Category_2.Parent = SpecialTab Category_2.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863) Category_2.BorderSizePixel = 0 Category_2.Size = UDim2.new(0, 150, 0, 30) Category_2.Text = "Special" Category_2.TextColor3 = Color3.new(0, 0.835294, 1) Category_2.TextSize = 14 OtherTab.Name = "OtherTab" OtherTab.Parent = Main OtherTab.BackgroundColor3 = Color3.new(0.278431, 0.278431, 0.278431) OtherTab.BackgroundTransparency = 1 OtherTab.BorderSizePixel = 0 OtherTab.Position = UDim2.new(0, 0, 1.06800008, 0) OtherTab.Size = UDim2.new(0, 150, 0, 220) Category_3.Name = "Category" Category_3.Parent = OtherTab Category_3.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863) Category_3.BorderSizePixel = 0 Category_3.Size = UDim2.new(0, 150, 0, 30) Category_3.Text = "Other" Category_3.TextColor3 = Color3.new(0, 0.835294, 1) Category_3.TextSize = 14 A_None.Name = "A_None" A_None.Parent = OtherTab A_None.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_None.BorderSizePixel = 0 A_None.Position = UDim2.new(0, 0, 0.134545445, 0) A_None.Size = UDim2.new(0, 150, 0, 30) A_None.Font = Enum.Font.SciFi A_None.Text = "None" A_None.TextColor3 = Color3.new(1, 1, 1) A_None.TextSize = 20 A_None.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=0" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=0" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=0" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=0" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=0" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=0" Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=0" Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=0" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) A_Anthro.Name = "A_Anthro" A_Anthro.Parent = OtherTab A_Anthro.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078) A_Anthro.BorderSizePixel = 0 A_Anthro.Position = UDim2.new(0, 0, 0.269090891, 0) A_Anthro.Size = UDim2.new(0, 150, 0, 30) A_Anthro.Font = Enum.Font.SciFi A_Anthro.Text = "Anthro (Default)" A_Anthro.TextColor3 = Color3.new(1, 1, 1) A_Anthro.TextSize = 20 A_Anthro.MouseButton1Click:Connect(function() Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951" Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257" Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577" Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475" Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830" Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778" Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892" game.Players.LocalPlayer.Character.Humanoid.Jump = true end) wait(1) Main:TweenPosition(UDim2.new(0.421999991, 0, 0.28400004, 0))
end)
Section:NewButton("Fe Animation Combos", "Fe Animation Combos", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/carlcoded/scripp/main/animationcombos'))()
end)
Section:NewButton("Naked", "Removes Your Clothes", function()
		if game.Players.LocalPlayer.Character.Shirt then
			game.Players.LocalPlayer.Character.Shirt:Remove()
		else
		end
		if game.Players.LocalPlayer.Character.Pants then
			game.Players.LocalPlayer.Character.Pants:Remove()
		else
		end
		if game.Players.LocalPlayer.Character["Shirt Graphic"] then
			game.Players.LocalPlayer.Character["Shirt Graphic"]:Remove()
		else
		end
end)




local Tab = Window:NewTab("Animations")
local Section = Tab:NewSection("Animtions Section")
Section:NewButton("Owner's Animations", "Owners Animation", function()
    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782841498"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
    wait(1)
end)

Section:NewButton("Barbie Pack", "Barbie Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
    wait(1)

end)

Section:NewButton("Preset Pack", "Preset Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782841498"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
    wait(1)

end)

Section:NewButton("Astronaut", "Astronaut Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true

end)

Section:NewButton("Bubbly", "Bubbly Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
    Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
    Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true

end)
    
Section:NewButton("Cartoony", "Cartoony Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true

end)

Section:NewButton("Elder", "Elder Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    
end)

Section:NewButton("Levitation", "Levitation Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    
end)

Section:NewButton("Mage", "Mage Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    
end)

Section:NewButton("Ninja", "Ninja Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    
end)

Section:NewButton("Pirate", "Pirate Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    
end)

Section:NewButton("Robot", "Robot Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    
end)

Section:NewButton("Stylish", "Stylish Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    
end)

Section:NewButton("Super Hero", "Supa heruu Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    
end)

Section:NewButton("Toy", "Toy Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    
end)

Section:NewButton("Vampire", "Vampire Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    
end)

Section:NewButton("Werewolf", "Werewolf Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true

end)

Section:NewButton("Zombie", "Owners Animation", function()

    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true

end)


local Tab = Window:NewTab("Misc")
local Section = Tab:NewSection("Misc Section")

Section:NewToggle(
    "Noclip",
    "Lets You Walk Throught Walls",
    function(state)
        c3 = state
    end
)
    
Section:NewButton("Chat Logs", "Chat Logs", function()
loadstring(game:HttpGet(("https://pastebin.com/raw/MahxFag6"),true))()
end)

Section:NewButton("Dark Chat", "Dark Chat", function()
        print(bool)
            local player = game:GetService("Players").LocalPlayer
            player.Information.DarkChat.Value = true
end)
Section:NewButton("inf zoom", "inf zoom", function()
game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = math.huge
     game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.Visible = false
     game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.Visible = false
     game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.Visible = false
     game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.Visible = false 
end)
Section:NewButton("Dot Crosshair", "Dot Crosshair", function()
 game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Visible = L_178_arg0
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.Visible = L_178_arg0
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.Visible = L_178_arg0
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.Visible = L_178_arg0
	game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.Visible = L_178_arg0

end)
Section:NewButton("Delete Tool", "Gives you delete tool", function()
                local tool3 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
        tool3.BinType = "Hammer"
        DiscordLib:Notification("Notification", "Gave player delete tool", "Okay!")

end)
Section:NewButton("Xray", "Xray FULL Bright and can see throught close walls", function()
		pcall(function()
			game.Players.LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
		end)
		game.Lighting.FogEnd = 99999999999999999999
		game:GetService('Lighting').Brightness = 1
		game:GetService('Lighting').GlobalShadows = false
		game.Players.localPlayer.CameraMaxZoomDistance = 150
		game.Players.LocalPlayer.CameraMinZoomDistance = 0

end)
Section:NewButton("No Shadows", "Removes All Shadows", function()

game:GetService("Lighting").GlobalShadows = false
game:GetService("Lighting").ShadowSoftness = 0
end)
Section:NewButton("Full Bright", "Makes Your game Full Bright", function()

game:GetService("Lighting").Brightness = 2
end)
Section:NewButton("No Fog", "Removes Game Fog", function()
game:GetService("Lighting").FogEnd = 9e9
game:GetService("Lighting").FogStart = 9e9
end)

Section:NewButton("Anti Flashbang", "AntiFlashBang wont get flashed", function()
		while wait() do
			local XD = game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui
	
			if XD:FindFirstChild("whiteScreen") then
				XD.whiteScreen:Destroy()
			end
			wait(0.2)
		end
end)
Section:NewSlider("Fov", "Fov", 120, 70, function(s)
workspace.CurrentCamera.FieldOfView = s
end)
local Tab = Window:NewTab("Esp")
local Section = Tab:NewSection("Esp Section")

Section:NewButton("Name Esp [ 3 dots for more info ]", "Name Esp With Toggle", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/violentqm/esp2/main/Esp"))()
end)
local Tab = Window:NewTab("Teleports")
local Section = Tab:NewSection("Guns & Tools")

Section:NewButton("[Revolver]", "Revolver", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2569.08276, 402.38739, -781.499451, -0.999504864, -1.13275389e-08, -0.0314642377, -1.30366979e-08, 1, 5.41155316e-08, 0.0314642377, 5.44989263e-08, -0.999504864);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("[Double Barrel SG]", "Double Barrel", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2963.08545, 402.394287, -920.461243, -0.99998194, 3.40505331e-08, -0.00601358805, 3.36777362e-08, 1, 6.20936547e-08, 0.00601358805, 6.1890006e-08, -0.99998194);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("[Golden AK-47] - 25 Streak", "Golden Ak", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-1985.76025, 321.937439, -498.719177, -0.0033185475, 8.57726192e-08, -0.999994516, 2.61092001e-08, 1, 8.56864446e-08, 0.999994516, -2.58247024e-08, -0.0033185475);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("[RPG] - 5 Streak", "RPG", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-1807.50037, 353.889374, -934.243225, -0.999994457, 5.49968693e-09, -0.00332777039, 5.49829959e-09, 1, 4.2605236e-10, 0.00332777039, 4.07752915e-10, -0.999994457);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("[R8] - 5 Streak", "R8", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2765.84351, 402.446289, -975.294434, 0.999994457, 1.44272247e-10, -0.00333536183, 9.58554902e-11, 1, 7.199435e-08, 0.00333536183, -7.19942719e-08, 0.999994457);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("[Lmg]", "Lmg", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2544.85938, 403.634979, -961.189575, 0.999958217, 4.1234518e-09, 0.0091395136, -4.18108881e-09, 1, 6.28722452e-09, -0.0091395136, -6.32517505e-09, 0.999958217);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("[Knife]", "Knife", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2197.26807, 402.389191, -902.183716, -0.999764144, 6.4037927e-08, -0.0217172485, 6.38522906e-08, 1, 9.24102661e-09, 0.0217172485, 7.85215093e-09, -0.999764144);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("[StopSign]", "StopSign", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2151.77856, 402.388458, -738.462219, -0.999981582, -4.42280594e-08, -0.00606955215, -4.45065957e-08, 1, 4.57558222e-08, 0.00606955215, 4.60251144e-08, -0.999981582);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)

Section:NewButton("[Bat]", "Bat", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2006.53662, 402.389313, -955.052612, 0.999752522, -5.18564391e-08, -0.0222468711, 5.35936699e-08, 1, 7.74925724e-08, 0.0222468711, -7.86656855e-08, 0.999752522);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)

local Section = Tab:NewSection("Shops & Stores")

Section:NewButton("Gun Shop #1", "Gun Shop #1", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2507.49585, 388.952026, -1396.30176, -0.0282071792, -4.56844812e-10, 0.999602079, -2.99567375e-08, 1, -3.88304777e-10, -0.999602079, -2.99557712e-08, -0.0282071792);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("Hood Kicks", "Hood Kicks", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2136.46021, 402.485229, -1070.60559, 0.0222394932, -2.41513227e-08, 0.9997527, -5.22906589e-08, 1, 2.53205013e-08, -0.9997527, -5.28408428e-08, 0.0222394932);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("Phone Store", "Phone Store", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2045.48584, 402.549835, -1529.24536, -0.0440280139, 9.30849009e-10, -0.999030292, -9.32599331e-10, 1, 9.72852909e-10, 0.999030292, 9.74527792e-10, -0.0440280139);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
local Section = Tab:NewSection("Locations")

Section:NewButton("Bank Roof", "Bank Roof", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2364.67554, 419.618835, -943.247498, 0.0241010822, 1.38333667e-09, -0.999709547, -8.33812325e-11, 1, 1.3817284e-09, 0.999709547, 5.00558622e-11, 0.0241010822);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("Bank Vault", "Bank Vault", function()
    
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2364.67554, 419.618835, -943.247498, 0.0241010822, 1.38333667e-09, -0.999709547, -8.33812325e-11, 1, 1.3817284e-09, 0.999709547, 5.00558622e-11, 0.0241010822);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("Bank Vault", "Bank Vault", function()
    
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2434.54224, 403.927277, -945.620422, 0.014530126, -4.54579752e-09, 0.99989444, -3.82510095e-08, 1, 5.10212805e-09, -0.99989444, -3.83211045e-08, 0.014530126);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)

Section:NewButton("AdminBase", "AdminBase", function()
    
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2726.52808, 340.98822, -1557.68311, -0.999366343, 8.56120785e-10, 0.0355943553, 1.20570698e-09, 1, 9.79992887e-09, -0.0355943553, 9.83663462e-09, -0.999366343);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("Heclicopter", "Helicopter", function()
    
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(8,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-1163.80811, 403.159668, -527.43634, 0.731101751, -7.18770821e-08, 0.6822685, 4.64675587e-08, 1, 5.55566828e-08, -0.6822685, -8.91423557e-09, 0.731101751);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("IceLand", "IceLand", function()
    
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-1114.31873, 486.336823, -1182.19446, 0.215057909, 2.66616484e-09, 0.976601303, 3.1408014e-09, 1, -3.42168205e-09, -0.976601303, 3.80317067e-09, 0.215057909);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("Casino", "Casino", function()

local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(7,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2789.41675, 402.394196, -758.530457, 0.999793231, 1.17680816e-08, -0.0203343071, -1.13591074e-08, 1, 2.0228045e-08, 0.0203343071, -1.99928838e-08, 0.999793231);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
    Section:NewButton("Sewer", "Sewer", function()
        
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-1813.76782, 353.770203, -937.970886, -0.999919772, 3.69667674e-08, 0.012668157, 3.79383209e-08, 1, 7.64522596e-08, -0.012668157, 7.69267317e-08, -0.999919772);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("Fitness", "Fitness", function()
    
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2002.98242, 403.337585, -1300.33313, -0.999878347, -7.55120908e-08, 0.0155986128, -7.55320499e-08, 1, -6.90425828e-10, -0.0155986128, -1.8685371e-09, -0.999878347);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
local Section = Tab:NewSection("Armor")
Section:NewButton("[High-Medium Armor]", "High-Medium Armor", function()

local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(8,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2860.22803, 352.124695, -87.9442902, -0.999753892, -4.39816183e-08, 0.0221836977, -4.29260076e-08, 1, 4.80611497e-08, -0.0221836977, 4.70970676e-08, -0.999753892);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)

Section:NewButton("[Medium Armor - Police Station]", "Medium Armor - Police Station", function()
    
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(8,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2182.93994, 402.439331, -741.734314, 0.99841392, 9.62732005e-10, -0.0562990792, -1.01387188e-09, 1, -8.79799511e-10, 0.0562990792, 9.35484135e-10, 0.99841392);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("[Medium Armor - Next To Gun Shop]", "Medium Armor - Next To Gun Shop", function()

local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(8,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2531.26465, 390.988922, -1456.86902, 0.0157732349, 3.54323753e-08, 0.999875605, -8.43299475e-09, 1, -3.53037528e-08, -0.999875605, -7.8750908e-09, 0.0157732349);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
local Section = Tab:NewSection("Food")

Section:NewButton("[Taco & hamburger]", "Taco & hamburger", function()
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2208.75366, 403.110077, -1463.55115, 0.999821365, 6.19721163e-08, -0.0189012401, -6.24686152e-08, 1, -2.56775632e-08, 0.0189012401, 2.68537104e-08, 0.999821365);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("[Pizza & Chicken & Cranberry]", "Pizza & Chicken & Cranberry", function()
    
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(6,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2252.99023, 404.321747, -950.652344, -0.0219976604, 1.7778051e-08, -0.999758005, -6.01037939e-08, 1, 1.91048173e-08, 0.999758005, 6.05095067e-08, -0.0219976604);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("PopCorn", "PopCorn", function()
    
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(7,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2915.51904, 405.244202, -807.656799, 0.999979258, -7.7844831e-08, -0.0064411643, 7.73159599e-08, 1, -8.23573743e-08, 0.0064411643, 8.18576567e-08, 0.999979258);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)
Section:NewButton("School Luanch", "School", function()
    
local plr=game:service"Players".LocalPlayer;
local tweens=game:service"TweenService";
local info=TweenInfo.new(7,Enum.EasingStyle.Quad);
   local pos=CFrame.new(-2525.72168, 402.499695, -365.501526, 0.0282425564, 9.64432516e-08, 0.999601126, 4.50000082e-09, 1, -9.66088791e-08, -0.999601126, 7.22668725e-09, 0.0282425564);
   local tween=tweens:Create(plr.Character["HumanoidRootPart"],info,{CFrame=pos});
   tween:Play();
end)


local Tab = Window:NewTab("Server")
local Section = Tab:NewSection("Server Section")

Section:NewButton("Server Hoper", "joins another dhm server", function()
       local x = {}
            for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
                if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
                    x[#x + 1] = v.id
                end
            end
            if #x > 0 then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
            else
             game.StarterGui:SetCore("SendNotification", {
    Title = "SoftVortex";
    Text = "Failed 2 Find Server";
    Duration = 3;
})
wait(0)
            end
end)



local Tab = Window:NewTab("Skins")
local Section = Tab:NewSection("Skins")

Section:NewButton("Red Sparkle Time", "Red Sparkle Time", function()
setclipboard("3461309563")
end)
Section:NewButton("Blood", "Blood", function()
setclipboard("108941805")
end)
Section:NewButton("Red Grime", "Red Grime", function()
setclipboard("280779721")
end)
Section:NewButton("Gold", "Gold", function()
setclipboard("134632723")
end)
Section:NewButton("Monster assault Camo", "Monster assault Camo", function()
setclipboard("142656364")
end)
Section:NewButton("Chill Triangles", "Chill Triangles", function()
setclipboard("807738028")
end)
Section:NewButton("Blue Bandana", "Blue Bandana", function()
setclipboard("5657430676")
end)
Section:NewButton("Red Bandana", "Red Bandana", function()
setclipboard("5657568372")
end)
Section:NewButton("Worms", "Worms", function()
setclipboard("7545514855")
end)
Section:NewButton("Supreme + Louis vuitton", "Supreme + Louis vuitton", function()
setclipboard("1156146426")
end)
Section:NewButton("Nice Looking Green Skin", "Green Skin", function()
setclipboard("4944059812")
end)
Section:NewButton("Nice Skin", "Nice Skin", function()
setclipboard("3155472478")
end)
Section:NewButton("Cool Skin", "Cool Skin", function()
setclipboard("2669398912")
end)
Section:NewButton("Lightning", "Lightning", function()
setclipboard("5366577617")
end)
Section:NewButton("Space DVD", "Space DVD", function()
setclipboard("521581065")
end)
Section:NewButton("Blue LV", "Blue LV", function()
setclipboard("5486664842")
end)
Section:NewButton("Lava", "Lava", function()
setclipboard("6238541572")
end)


local Tab = Window:NewTab("Boombox")
local Section = Tab:NewSection("Click To Copy id of Song")
local Section = Tab:NewSection("WARNING SOME ARE LOUD!.")

Section:NewButton("😎The Motto😎", ".",function()
setclipboard("8990426054")
end)

Section:NewButton("🔥 London Drill Song", ".",function()
setclipboard("5542209618")
end)
Section:NewButton("🕺Do Da Fortnite🕺", ".",function()
setclipboard("8994226137")
end)
Section:NewButton("💚Owner of SoftVortex Likes This One💚", ".",function()
setclipboard("9048481823")
end)
Section:NewButton("💵 Monney So Big 💵", ".",function()
setclipboard("7450432312")
end)
Section:NewButton("👿a way or another im a bad brother👿", ".",function()
setclipboard("8478224773")
end)
Section:NewButton("🤍NBA YoungBoy - “White Teeth”🤍", ".",function()
setclipboard("6813288997")
end)
Section:NewButton("💙Crip 4 Life💙", ".",function()
setclipboard("7122471461")
end)
Section:NewButton("💙loop💙", ".",function()
setclipboard("7131714079")
end)
Section:NewButton("👿Murder On My Mind👿", ".",function()
setclipboard("4572859762")
end)
Section:NewButton("🔥London Drill🔥", ".",function()
setclipboard("9020842480")
end)
Section:NewButton("🌹Roses🌹", ".",function()
setclipboard("8434230106")
end)
Section:NewButton("🧓registered Se# Offender🧓 long start", ".",function()
setclipboard("9038069435")
end)
Section:NewButton("🌹unreleased lungskull song🌹", ".",function()
setclipboard("9111553813")
end)
Section:NewButton("🌹Love Sosa🌹Loud Start ", ".",function()
setclipboard("9067166824")
end)
Section:NewButton("😂skinny everything h3artcrush $$$😂 bypassed", ".",function()
setclipboard("9102067208")
end)
Section:NewButton("🌹Love Sosa🌹Loud Start ", ".",function()
setclipboard("9067166824")
end)
Section:NewButton("🌹👐Everybody Dies In Their Nightmares👐🌹", ".",function()
setclipboard("9000673014")
end)

local Tab = Window:NewTab("Settings")
local Section = Tab:NewSection("Owner & Creator: Airsoft#0001")
local Section = Tab:NewSection("Subscribe to SoftVortex on YT")


Section:NewButton("Discord invite [Click to Copy]", "Discord invite",function()
setclipboard("https://discord.gg/softvortex")

game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "SoftVortex",
Text = "Discord invite Has Been Copyed",
Button1 = "🌟",
Duration = 30
})
end)

Section:NewKeybind("Toggle UI Keybind", "KeybindInfo", Enum.KeyCode.V, function()
    Library:ToggleUI()
end)
