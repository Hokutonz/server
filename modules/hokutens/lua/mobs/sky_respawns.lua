---------------------------------------
-- Adjust respawn timers on NM's in Sky
---------------------------------------
require("modules/module_utils")
require("scripts/globals/mobs")
---------------------------------------

local m = Module:new("sky_respawns")

-- Despot
m:addOverride("xi.zones.RuAun_Gardens.mobs.Groundskeeper.onMobDespawn", function(mob)
    super(mob)

    local ID = require("scripts/zones/RuAun_Gardens/IDs")

    if xi.mob.phOnDespawn(mob, ID.mob.DESPOT_PH, 5, 3600, true) then -- respawn 1 hr
        local phId = mob:getID()
        local nmId = ID.mob.DESPOT_PH[phId]

        GetMobByID(nmId):addListener("SPAWN", "PH_VAR", function(m)
            m:setLocalVar("ph", phId)
        end)
    end
end)

-- Faust
m:addOverride("xi.zones.The_Shrine_of_RuAvitau.mobs.Faust.onMobDespawn", function(mob)
    super(mob)

    mob:setRespawnTime(3600) -- respawn 1 hr
end)

-- Mother Globe
m:addOverride("xi.zones.The_Shrine_of_RuAvitau.mobs.Mother_Globe.onMobDespawn", function(mob)
    super(mob)

    mob:setRespawnTime(3600) -- respawn 1 hr
end)

-- Despot
m:addOverride("xi.zones.VeLugannon_Palace.mobs.Zipacna.onMobDespawn", function(mob)
    super(mob)

    mob:setRespawnTime(3600) -- respawn 1 hr
end)

return m
