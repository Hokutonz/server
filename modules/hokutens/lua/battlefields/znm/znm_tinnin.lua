-----------------------------------
-- Area: Wajaom Woodlands
--  ZNM: Tinnin
-- !pos 276 0 -694 51
-- Spawned with Monkey Wine: !additem 2573
-----------------------------------
require("modules/module_utils")
require("scripts/mixins/job_special")
require("scripts/mixins/rage")
-----------------------------------
local m = Module:new("znm_tinnin")

xi.module.ensureTable("xi.zones.Wajaom_Woodlands.mobs.Tinnin")

m:addOverride("xi.zones.Wajaom_Woodlands.mobs.Tinnin.onMobInitialize", function(mob)
    g_mixins.job_special(mob)
    g_mixins.rage(mob)
    mob:addMod(xi.mod.ATT, -50)
    mob:addMod(xi.mod.MDEF, 20)
    mob:addMod(xi.mod.VIT, 10)
    mob:addMod(xi.mod.INT, 20)
    mob:addMod(xi.mod.MND, 20)
    mob:addMod(xi.mod.CHR, 20)
    mob:addMod(xi.mod.AGI, 20)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 10)
    mob:setMod(xi.mod.DARK_MEVA, 250)
    mob:setMod(xi.mod.LIGHT_MEVA, 128)
    mob:setMod(xi.mod.FIRE_MEVA, 170)
    mob:setMod(xi.mod.WATER_MEVA, 250)
    mob:setMod(xi.mod.ICE_MEVA, 200)
    mob:setMod(xi.mod.WIND_MEVA, 170)
    mob:setMod(xi.mod.DARK_SDT, 250)
    mob:setMod(xi.mod.LIGHT_SDT, 128)
    mob:setMod(xi.mod.FIRE_SDT, 170)
    mob:setMod(xi.mod.WATER_SDT, 250)
    mob:setMod(xi.mod.ICE_SDT, 200)
    mob:setMod(xi.mod.WIND_SDT, 170)
    mob:setMod(xi.mod.SILENCERES, 10000)
    mob:setMod(xi.mod.WATER_ABSORB, 100)
    mob:setMod(xi.mod.BINDRES, 10000)
    mob:setMod(xi.mod.GRAVITYRES, 10000)
    mob:setMod(xi.mod.SLEEPRES, 10000)
    mob:setMod(xi.mod.LULLABYRES, 10000)
    mob:setMod(xi.mod.FASTCAST, 10)
    mob:addStatusEffect(xi.effect.REGAIN, 5, 3, 0)
    mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
    mob:addMod(xi.mod.MOVE_SPEED_OVERIDE, 12)
    mob:setMobMod(xi.mobMod.GIL_MIN, 12000)
    mob:setMobMod(xi.mobMod.GIL_MAX, 30000)
    mob:setMobMod(xi.mobMod.MUG_GIL, 8000)
    mob:setMobMod(xi.mobMod.DRAW_IN, 1)
    mob:setMod(xi.mod.UDMGBREATH, -10000) -- immune to breath damage
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
end)

m:addOverride("xi.zones.Wajaom_Woodlands.mobs.Tinnin.onMobSpawn", function(mob)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:setHP(mob:getMaxHP() / 2)
    mob:setUnkillable(true)
    mob:setMod(xi.mod.REGEN, 50, 3, 0)

    -- Mighty Strikes
    xi.mix.jobSpecial.config(
        mob,
        {
            specials =
            {
                { id = xi.jsa.MIGHTY_STRIKES, cooldown = 120, hpp = 100 },
            }
        }
    )

    -- Regen Head every 1.5-4 minutes 90-240
    mob:setLocalVar("headTimer", os.time() + math.random(60, 190))

    -- Number of crits to lose a head
    mob:setLocalVar("CritToTheFace", math.random(10, 30))
    mob:setLocalVar("crits", 0)
end)

return m
