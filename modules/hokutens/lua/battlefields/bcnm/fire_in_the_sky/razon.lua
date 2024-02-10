-----------------------------------
-- Area: Monarch Linn
-- Mob: Razon
-- ENM: Fire in the Sky
-----------------------------------
require("scripts/globals/mobs")
require("modules/module_utils")
-----------------------------------
local m = Module:new("fire_in_the_sky_razon")

local elements =
{
    xi.damageType.EARTH,
    xi.damageType.WATER,
    xi.damageType.WIND,
    xi.damageType.FIRE,
    xi.damageType.ICE,
    xi.damageType.THUNDER,
    xi.damageType.LIGHT,
    xi.damageType.DARK,
}

xi.module.ensureTable("xi.zones.Monarch_Linn.mobs.Razon")

m:addOverride("xi.zones.Monarch_Linn.mobs.Razon.onMobSpawn", function(mob)
    mob:addMod(xi.mod.UDMGMAGIC, 2500)
    mob:setLocalVar("triggerElement1", elements[math.random(1, 8)])
    mob:setLocalVar("triggerElement2", elements[math.random(1, 8)])

    mob:addListener("TAKE_DAMAGE", "RAZON_TAKE_DAMAGE", function(mobArg, amount, attacker, attackType, damageType)
        if
            attackType == xi.attackType.MAGICAL and
            (damageType == mob:getLocalVar("triggerElement1") or
            damageType == mob:getLocalVar("triggerElement2"))
        then
            local tp = mobArg:getTP()
            mobArg:useMobAbility(626) -- dust cloud
            mobArg:setTP(tp)

            if mobArg:getAnimationSub() == 12 then
                mobArg:useMobAbility(571)
            elseif mobArg:getAnimationSub() == 5 then
                mobArg:useMobAbility(573)
            elseif mobArg:getAnimationSub() == 6 then
                mobArg:useMobAbility(575)
            end
        end
    end)
end)

m:addOverride("xi.zones.Monarch_Linn.mobs.Razon.onMobWeaponSkill", function(target, mob, skill)
    if skill:getID() == 575 then
        mob:timer(5000, function(mobArg)
            mobArg:getBattlefield():lose()
        end)
    end
end)

m:addOverride("xi.zones.Monarch_Linn.mobs.Razon.onMobDisengage", function(mob)
    mob:setLocalVar("changeTime", 0)
end)

return m
