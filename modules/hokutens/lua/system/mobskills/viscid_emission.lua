-----------------------------------
--  Viscid Emission
--  Inflicts amnesia in an area of effect.
--  Type: Magical (Enfeebling)
--  Range: Unknown cone
--  Utsusemi/Blink absorb: Ignores shadows
-----------------------------------
require("scripts/globals/mobskills")
require("modules/module_utils")
-----------------------------------
local m = Module:new("mobskill_viscid_emission")

m:addOverride("xi.actions.mobskills.viscid_emission.onMobSkillCheck", function(target, mob, skill)
    return 0
end)

m:addOverride("xi.actions.mobskills.viscid_emission.onMobWeaponSkill", function(target, mob, skill)
    local power    = 1
    local duration = 60

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.AMNESIA, power, 0, duration))

    return xi.effect.AMNESIA
end)

return m
