-----------------------------------
-- func: sanction
-- desc: Casts sanction on the player.
-----------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'is',
}

commandObj.onTrigger = function(player)
    player:printToPlayer("Enjoy sanction!")
    player:delStatusEffectsByFlag(xi.effectFlag.INFLUENCE, true)
    player:addStatusEffect(xi.effect.SANCTION, 0, 0, 15000)
end

return commandObj