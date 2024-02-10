-----------------------------------
-- Area: Riverne-Site_A01
-- Notes: Assists Ouryu in Ouryu Cometh
-----------------------------------
require("scripts/globals/mobs")
require("modules/module_utils")
-----------------------------------
xi.module.ensureTable("xi.zones.Riverne-Site_A01.mobs.Earth_Elemental")

local m = Module:new("ouryu_earth_elemental")

m:addOverride("xi.zones.Riverne-Site_A01.mobs.Earth_Elemental.onMobInitialize", function(mob)
    mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 500)
end)

m:addOverride("xi.zones.Riverne-Site_A01.mobs.Earth_Elemental.onMobSpawn", function(mob)
    mob:setMod(xi.mod.SLEEPRES, 100)
end)

m:addOverride("xi.zones.Riverne-Site_A01.mobs.Earth_Elemental.onMobDespawn", function(mob)
    mob:setRespawnTime(120) -- Respawns every 2 minutes, based on in-era video
end)

return m
