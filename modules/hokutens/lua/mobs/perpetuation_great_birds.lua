-----------------------------------
-- Common Requires
-----------------------------------
require("modules/module_utils")

-----------------------------------
-- ID Requires
-----------------------------------
local rolanberryFieldsID    = require("scripts/zones/Rolanberry_Fields/IDs")
local sauromugueChampaignID = require("scripts/zones/Sauromugue_Champaign/IDs")

-----------------------------------
-- Module definition
-----------------------------------
local m = Module:new("perpetuation_great_birds")

----------------------------------------------------------------------------------------------------
-- Rolanberry Fields: Simurgh
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Rolanberry_Fields.Zone.onInitialize", function(zone)
    super(zone) -- Note: We will overwrite existing logic for Simurgh's respawn time with below's logic.

    local hnmPopTime = GetServerVariable("[HNM]Simurgh") -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 48) * 1800

        SetServerVariable("[HNM]Simurgh", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(rolanberryFieldsID.mob.SIMURGH)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(rolanberryFieldsID.mob.SIMURGH)
    else
        GetMobByID(rolanberryFieldsID.mob.SIMURGH):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Rolanberry_Fields.mobs.Simurgh.onMobDespawn", function(mob)
    super(mob) -- Note: We will overwrite existing logic for Simurgh's respawn time with below's logic.

    -- Server Variable work.
    local randomPopTime = 21600 + math.random(0, 6) * 300 -- 6-6.5 hours with 5 minute windows

    SetServerVariable("[HNM]Simurgh", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(rolanberryFieldsID.mob.SIMURGH):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(rolanberryFieldsID.mob.SIMURGH)
end)

----------------------------------------------------------------------------------------------------
-- Sauromugue Champaign: Roc
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Sauromugue_Champaign.Zone.onInitialize", function(zone)
    super(zone) -- Note: We will overwrite existing logic for Roc's respawn time with below's logic.

    local hnmPopTime = GetServerVariable("[HNM]Roc") -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 48) * 1800

        SetServerVariable("[HNM]Roc", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(sauromugueChampaignID.mob.ROC)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(sauromugueChampaignID.mob.ROC)
    else
        GetMobByID(sauromugueChampaignID.mob.ROC):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Sauromugue_Champaign.mobs.Roc.onMobDespawn", function(mob)
    super(mob) -- Note: We will overwrite existing logic for Roc's respawn time with below's logic.

    -- Server Variable work.
    local randomPopTime = 21600 + math.random(0, 6) * 300 -- 6-6.5 hours with 5 minute windows

    SetServerVariable("[HNM]Roc", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(sauromugueChampaignID.mob.ROC):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(sauromugueChampaignID.mob.ROC)
end)

return m
