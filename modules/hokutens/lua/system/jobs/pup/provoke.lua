-----------------------------------
-- Provoke
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("pup_provoke")

m:addOverride("xi.actions.abilities.pets.automaton.provoke.onAutomatonAbilityCheck", function(target, automaton, skill)
    return 0
end)

m:addOverride("xi.actions.abilities.pets.automaton.provoke.onAutomatonAbility", function(target, automaton, skill, master, action)
    automaton:addRecast(xi.recast.ABILITY, skill:getID(), 30)
    target:addEnmity(automaton, 1, 3000)
    skill:setMsg(xi.msg.basic.PROVOKE_SWITCH, target)
    return 0
end)

return m
