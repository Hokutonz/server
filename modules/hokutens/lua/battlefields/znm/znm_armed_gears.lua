-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  Mob: Armed Gears
-- !pos -19 -4 -153
-- Mobid: 17072178
-----------------------------------
require("modules/module_utils")
require("scripts/mixins/families/gears")
require("scripts/mixins/job_special")
require("scripts/mixins/rage")
-----------------------------------
local m = Module:new("znm_armed_gears")

xi.module.ensureTable("xi.zones.Alzadaal_Undersea_Ruins.mobs.Armed_Gears")

m:addOverride("xi.zones.Alzadaal_Undersea_Ruins.mobs.Armed_Gears.onMobInitialize", function(mob)
    g_mixins.gears(mob)
    g_mixins.job_special(mob)
    g_mixins.rage(mob)
    mob:addMod(xi.mod.MDEF, 20)
    mob:addMod(xi.mod.DEF, 50)
    mob:setMod(xi.mod.EARTH_MEVA, 250)
    mob:setMod(xi.mod.DARK_MEVA, 250)
    mob:setMod(xi.mod.LIGHT_MEVA, 250)
    mob:setMod(xi.mod.FIRE_MEVA, 250)
    mob:setMod(xi.mod.WATER_MEVA, 250)
    mob:setMod(xi.mod.THUNDER_MEVA, 300)
    mob:setMod(xi.mod.WIND_MEVA, 250)
    mob:setMod(xi.mod.EARTH_SDT, 250)
    mob:setMod(xi.mod.DARK_SDT, 250)
    mob:setMod(xi.mod.LIGHT_SDT, 250)
    mob:setMod(xi.mod.FIRE_SDT, 250)
    mob:setMod(xi.mod.WATER_SDT, 250)
    mob:setMod(xi.mod.THUNDER_SDT, 300)
    mob:setMod(xi.mod.WIND_SDT, 250)
    mob:setMod(xi.mod.SILENCERES, 10000)
    mob:setMod(xi.mod.LTNG_ABSORB, 100)
    mob:setMod(xi.mod.BINDRES, 10000)
    mob:setMod(xi.mod.GRAVITYRES, 10000)
    mob:setMod(xi.mod.SLEEPRES, 10000)
    mob:setMod(xi.mod.LULLABYRES, 10000)
    mob:addMod(xi.mod.MOVE_SPEED_OVERIDE, 12)
    mob:addStatusEffect(xi.effect.REGAIN, 5, 3, 0)
    mob:addStatusEffect(xi.effect.REGEN, 5, 3, 0)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:setAnimationSub(0)
end)

m:addOverride("xi.zones.Alzadaal_Undersea_Ruins.mobs.Armed_Gears.onMobSpawn", function(mob)
    mob:setLocalVar("[rage]timer", 1800) -- 30 minutes

    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = xi.jsa.MIGHTY_STRIKES, cooldown = 120, hpp = 100 },
        },
    })
end)

m:addOverride("xi.zones.Alzadaal_Undersea_Ruins.mobs.Armed_Gears.onMobEngaged", function(mob)
end)

m:addOverride("xi.zones.Alzadaal_Undersea_Ruins.mobs.Armed_Gears.onMobFight", function(mob)
end)

return m
