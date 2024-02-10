-----------------------------------
-- Area: Wajaom Woodlands
--  ZNM: Gotoh Zha the Redolent
-- Mobid: 16986430
-----------------------------------
require("modules/module_utils")
require("scripts/mixins/job_special")
require("scripts/mixins/rage")
-----------------------------------
local m = Module:new("znm_gotoh_zha_the_redolent")

xi.module.ensureTable("xi.zones.Wajaom_Woodlands.mobs.Gotoh_Zha_the_Redolent")

m:addOverride("xi.zones.Wajaom_Woodlands.mobs.Gotoh_Zha_the_Redolent.onMobInitialize", function(mob)
    g_mixins.job_special(mob)
    g_mixins.rage(mob)
    mob:addMod(xi.mod.ATT, 50)
    mob:addMod(xi.mod.MDEF, 25)
    mob:addMod(xi.mod.DEF, 75)
    mob:addMod(xi.mod.MAIN_DMG_RATING, 25)
    mob:addMod(xi.mod.STR, 50)
    mob:addMod(xi.mod.VIT, 30)
    mob:addMod(xi.mod.INT, 60)
    mob:addMod(xi.mod.MND, 30)
    mob:addMod(xi.mod.CHR, 20)
    mob:addMod(xi.mod.AGI, 30)
    mob:addMod(xi.mod.DEX, 40)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 10)
    mob:setMod(xi.mod.EARTH_MEVA, 250)
    mob:setMod(xi.mod.DARK_MEVA, 250)
    mob:setMod(xi.mod.LIGHT_MEVA, 250)
    mob:setMod(xi.mod.FIRE_MEVA, 300)
    mob:setMod(xi.mod.WATER_MEVA, 250)
    mob:setMod(xi.mod.THUNDER_MEVA, 250)
    mob:setMod(xi.mod.WIND_MEVA, 300)
    mob:setMod(xi.mod.EARTH_SDT, 250)
    mob:setMod(xi.mod.DARK_SDT, 250)
    mob:setMod(xi.mod.LIGHT_SDT, 250)
    mob:setMod(xi.mod.FIRE_SDT, 300)
    mob:setMod(xi.mod.WATER_SDT, 250)
    mob:setMod(xi.mod.THUNDER_SDT, 250)
    mob:setMod(xi.mod.WIND_SDT, 300)
    mob:setMod(xi.mod.SILENCERES, 10000)
    mob:setMod(xi.mod.FIRE_ABSORB, 100)
    mob:setMod(xi.mod.LIGHT_ABSORB, 100)
    mob:setMod(xi.mod.WIND_ABSORB, 100)
    mob:setMod(xi.mod.BINDRES, 10000)
    mob:setMod(xi.mod.GRAVITYRES, 10000)
    mob:setMod(xi.mod.SLEEPRES, 10000)
    mob:setMod(xi.mod.LULLABYRES, 10000)
    mob:setMod(xi.mod.FASTCAST, 500)
    mob:addMod(xi.mod.MATT, 25)
    mob:addMod(xi.mod.MACC, 250)
    mob:addMod(xi.mod.HASTE_MAGIC, 2600)
    mob:addMod(xi.mod.MOVE_SPEED_OVERIDE, 12)
    mob:addStatusEffect(xi.effect.REGAIN, 5, 3, 0)
    mob:addStatusEffect(xi.effect.REGEN, 5, 3, 0)
    mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
    mob:addStatusEffect(xi.effect.SHOCK_SPIKES, 10, 0, 9000000)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
end)

m:addOverride("xi.zones.Wajaom_Woodlands.mobs.Gotoh_Zha_the_Redolent.onMobSpawn", function(mob)
    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = xi.jsa.MANAFONT, hpp = 0 },
            { id = xi.jsa.BENEDICTION, hpp = math.random(25, 50) },
        },
    })

    mob:setLocalVar("[rage]timer", 1800)
    mob:setSpellList(296) -- Set BLM spell list
end)

m:addOverride("xi.zones.Wajaom_Woodlands.mobs.Gotoh_Zha_the_Redolent.onMobFight", function(mob)
-- Left intentionally blank
end)

return m
