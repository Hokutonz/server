-----------------------------------
-- func: signet
-- desc: Casts signet on the player.
-----------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'is',
}

commandObj.onTrigger = function(player)
    player:printToPlayer("Enjoy signet!")
    player:delStatusEffectsByFlag(xi.effectFlag.INFLUENCE, true)
    player:addStatusEffect(xi.effect.SIGNET, 0, 0, 15000)
end

return commandObj