-----------------------------------
-- Area: Wajaom Woodlands
--  ZNM: Iriz Ima
-----------------------------------
require("modules/module_utils")
require("scripts/mixins/rage")
-----------------------------------
local m = Module:new("znm_iriz_ima")

xi.module.ensureTable("xi.zones.Wajaom_Woodlands.mobs.Iriz_Ima")

m:addOverride("xi.zones.Wajaom_Woodlands.mobs.Iriz_Ima.onMobInitialize", function(mob)
    g_mixins.rage(mob)
    mob:addMod(xi.mod.ATT, 25)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:addMod(xi.mod.MDEF, 50)
    mob:addMod(xi.mod.DEF, 25)
    mob:addMod(xi.mod.MAIN_DMG_RATING, 10)
    mob:setMod(xi.mod.EARTH_MEVA, 25)
    mob:setMod(xi.mod.DARK_MEVA, 25)
    mob:setMod(xi.mod.LIGHT_MEVA, 25)
    mob:setMod(xi.mod.FIRE_MEVA, 25)
    mob:setMod(xi.mod.WATER_MEVA, 25)
    mob:setMod(xi.mod.THUNDER_MEVA, 25)
    mob:setMod(xi.mod.ICE_MEVA, 25)
    mob:setMod(xi.mod.WIND_MEVA, 25)
    mob:setMod(xi.mod.EARTH_SDT, 25)
    mob:setMod(xi.mod.DARK_SDT, 25)
    mob:setMod(xi.mod.LIGHT_SDT, 25)
    mob:setMod(xi.mod.FIRE_SDT, 25)
    mob:setMod(xi.mod.WATER_SDT, 25)
    mob:setMod(xi.mod.THUNDER_SDT, 25)
    mob:setMod(xi.mod.ICE_SDT, 25)
    mob:setMod(xi.mod.WIND_SDT, 25)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 5)
    mob:addMod(xi.mod.GRAVITYRES, 10000)
    mob:addMod(xi.mod.SLEEPRES, 10000)
    mob:addMod(xi.mod.LULLABYRES, 10000)
    mob:addMod(xi.mod.SILENCERES, 10000)
    mob:addMod(xi.mod.BINDRES, 10000)
    mob:addStatusEffect(xi.effect.REGAIN, 2, 3, 0)
    mob:addStatusEffect(xi.effect.REGEN, 5, 3, 0)
    mob:addMod(xi.mod.MOVE_SPEED_OVERIDE, 12)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
end)

return m
