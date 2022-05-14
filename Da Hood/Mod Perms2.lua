-- Star

local Premium = {
    [000000000] = true,
    [000000000] = true,
    [000000000] = true,
}

game.RunService.Stepped:Connect(function()
    function Star()
        for i,v in pairs(game.Players:GetChildren()) do
            if Premium[v.UserId] then
                if v.Character then
                    if v.Character.Parent.Name == 'Players' then
                        v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[⭐]'..v.DisplayName)
                    end
                end
            end
        end
    end
    local xdd = pcall(Star)
end)

-- Crown

local Mods = {
    [000000000] = true,
    [000000000] = true,
    [000000000] = true,
    [000000000] = true,
    [000000000] = true,
}

game.RunService.Stepped:Connect(function()
    function Crown()
        for i,v in pairs(game.Players:GetChildren()) do
            if Mods[v.UserId] then
                if v.Character then
                    if v.Character.Parent.Name == 'Players' then
                        v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[👑]'..v.DisplayName)
                    end
                end
            end
        end
    end
    local xdd = pcall(Crown)
end)

-- Mod Perms


local player = game.Players.LocalPlayer
local isamod = false
local prefix = ";"
local mods = {
    000000000,
    000000000,
    000000000,
    000000000,
    000000000,
    000000000,
    000000000,
    000000000,
}

if table.find(mods,player.UserId) then
	isamod = true
	game.StarterGui:SetCore("SendNotification",{
		Title = "Rus Premium";
		Text = "Premium commands granted.";
		Duration = 5;
	})
end

local function cmds(msg,plr)
	if isamod == false or table.find(mods,plr) then
		Mod = game.Players:GetPlayerByUserId(plr)
		isamod = table.find(mods,player.UserId)
		if msg == ";bring ." then
			if not isamod then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Mod.Character.HumanoidRootPart.CFrame
			end
		end

        if msg == ";freeze ." then
			if not isamod then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
			end
		end

        if msg == ";unfreeze ." then
			if not isamod then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
			end
		end

        if msg == ";kick ." then
			if not isamod then
                game.Players.LocalPlayer:Kick("o")
			end
		end
    end
end

for i,v in pairs(game:GetService('Players'):GetChildren()) do
	if table.find(mods,v.UserId) then
		v.Chatted:Connect(function(msg)
			cmds(msg,v.UserId)
		end)
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	if table.find(mods,plr.UserId) then
		plr.Chatted:Connect(function(msg)
			cmds(msg,plr.UserId)
		end)
	end
end)
