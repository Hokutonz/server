---------------------------------------------------------------------------------------------------
-- func: drk
-- desc: checks to see how many Chaosbringer kills you have to unlock DRK
---------------------------------------------------------------------------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'is',
}

commandObj.onTrigger = function(player)
    local kills = player:getCharVar("ChaosbringerKills")
	player:printToPlayer(string.format("You have %i kills so far.", kills))
end

return commandObj