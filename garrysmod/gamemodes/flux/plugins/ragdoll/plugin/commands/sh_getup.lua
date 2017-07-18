--[[
	Flux © 2016-2017 TeslaCloud Studios
	Do not share or re-distribute before
	the framework is publicly released.
--]]

local COMMAND = Command("getup")
COMMAND.name = "GetUp"
COMMAND.description = "Get up if you are currently fallen."
COMMAND.syntax = "[number GetUpTime]"
COMMAND.category = "roleplay"
COMMAND.aliases = {"chargetup", "unfall", "unfallover"}
COMMAND.noConsole = true

function COMMAND:OnRun(player, delay)
	delay = math.Clamp(tonumber(delay) or 0, 2, 60)

	if (player:Alive() and player:IsRagdolled()) then
		player:Notify("Getting up...")

		timer.Simple(delay, function()
			player:SetRagdollState(RAGDOLL_NONE)
		end)
	else
		player:Notify("You cannot do this right now!")
	end
end

COMMAND:Register()