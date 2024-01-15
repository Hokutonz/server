-----------------------------------
-- func: sigil
-- desc: Casts sigil on the player.
-----------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'is',
}

commandObj.onTrigger = function(player)
    player:printToPlayer("Enjoy sigil!")
    player:delStatusEffectsByFlag(xi.effectFlag.INFLUENCE, true)
    player:addStatusEffect(xi.effect.SIGIL, 0, 0, 15000)
end

return commandObj