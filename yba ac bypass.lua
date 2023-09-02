--- getgc  | Discord : 897206465339748402 | v3rm : https://v3rmillion.net/member.php?action=profile&uid=3197903

local stringAntiKick = "  ___XP DE KEY" -- idk why but it doesnt kick when you return this so...
local namecall
namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...) -- i kinda over complicated it since the ac is trash
    if not checkcaller() and typeof(self, "Instance") then
        local method = getnamecallmethod()
        local args = {...}

        if rawequal(self.ClassName, "RemoteFunction") then
            if rawequal(self.Name, "Returner")
                and rawequal(args[1], "idklolbrah2de")
                and rawequal(typeof(args[2]), "Vector3")
            then
                -- args[2] = Vector3.new()
                warn(getcallingscript())
                return stringAntiKick -- fucktard anticheat
            elseif rawequal(args[1], "Reset") then
                return stringAntiKick-- block the reset when speed you hacks etc, prolly back to hook it who knows
            end
        elseif rawequal(self.ClassName, "RemoteEvent") then -- remotes event
            if rawequal(args[1], "UpdateState") then
                if rawequal(args[2], Enum.HumanoidStateType.PlatformStanding) -- antifly
                or rawequal(args[2], Enum.HumanoidStateType.Running) -- :shrug:
                or rawequal(args[2], Enum.HumanoidStateType.Dead) then -- ban #0

                    --args[1] = nil--Enum.HumanoidStateType.Freefall
                    --args[2] = nil
                    -- warn("called")
                    return --oldNameCall(self, unpack(args))
                end
            end
        end
	-- if table.find(args, "SigL") then
	-- 	warn("ban incoming")
	-- 	rconsoleprint("You almost got banned!\n")
	-- 	rconsoleprint("Closing game to be safe.\n")
	-- 	game:Shutdown()
	-- 	return wait(9e9)
	-- end
    end
    return namecall(self, ...)
end))

hookfunction(workspace.Raycast, function() -- noclip bypass
    -- warn("noclip")
	return nil
end)

warn("executed")
