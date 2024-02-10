-----------------------------------
-- Area: Mount Zhayolm
-- NM: Sarameya
-- !pos 322 -14 -581 61
-- Spawned with Buffalo Corpse: !additem 2583
-- Weak to water elemental damage
-----------------------------------
require("modules/module_utils")
require("scripts/globals/magic")
require("scripts/mixins/job_special")
require("scripts/mixins/rage")
-----------------------------------
local m = Module:new("znm_sarameya")

xi.module.ensureTable("xi.zones.Mount_Zhayolm.mobs.Sarameya")

m:addOverride("xi.zones.Mount_Zhayolm.mobs.Sarameya.onMobInitialize", function(mob)
    g_mixins.job_special(mob)
    g_mixins.rage(mob)
    mob:setMobMod(xi.mobMod.GA_CHANCE, 50)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setMod(xi.mod.SILENCERES, 10000)
    mob:setMod(xi.mod.BINDRES, 10000)
    mob:setMod(xi.mod.GRAVITYRES, 10000)
    mob:setMod(xi.mod.SLEEPRES, 10000)
    mob:setMod(xi.mod.LULLABYRES, 10000)
end)

m:addOverride("xi.zones.Mount_Zhayolm.mobs.Sarameya.onMobSpawn", function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:addMod(xi.mod.MDEF, -12)
    mob:addMod(xi.mod.DEF, 50)
    mob:addMod(xi.mod.STR, 40)
    mob:addMod(xi.mod.VIT, 20)
    mob:addMod(xi.mod.INT, 10)
    mob:addMod(xi.mod.MND, 10)
    mob:addMod(xi.mod.CHR, 20)
    mob:addMod(xi.mod.AGI, 20)
    mob:addMod(xi.mod.DEX, 40)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 10)
    mob:setMod(xi.mod.EARTH_MEVA, 170)
    mob:setMod(xi.mod.DARK_MEVA, 125)
    mob:setMod(xi.mod.LIGHT_MEVA, 128)
    mob:setMod(xi.mod.FIRE_MEVA, 250)
    mob:setMod(xi.mod.THUNDER_MEVA, 170)
    mob:setMod(xi.mod.ICE_MEVA, 200)
    mob:setMod(xi.mod.WIND_MEVA, 170)
    mob:setMod(xi.mod.EARTH_SDT, 170)
    mob:setMod(xi.mod.DARK_SDT, 250)
    mob:setMod(xi.mod.LIGHT_SDT, 128)
    mob:setMod(xi.mod.FIRE_SDT, 250)
    mob:setMod(xi.mod.THUNDER_SDT, 170)
    mob:setMod(xi.mod.ICE_SDT, 200)
    mob:setMod(xi.mod.WIND_SDT, 170)
    mob:setMod(xi.mod.FIRE_ABSORB, 100)
    mob:setMod(xi.mod.FASTCAST, 10)
    mob:addStatusEffect(xi.effect.REGAIN, 5, 3, 0)
    mob:addStatusEffect(xi.effect.REGEN, 5, 3, 0)
    mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
    mob:addMod(xi.mod.MOVE_SPEED_OVERIDE, 12)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end)

m:addOverride("xi.zones.Mount_Zhayolm.mobs.Sarameya.onAdditionalEffect", function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.POISON, { chance = 40, power = 50 })
end)

return m
