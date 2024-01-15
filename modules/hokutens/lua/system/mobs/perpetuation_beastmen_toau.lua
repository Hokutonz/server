-----------------------------------
-- Common Requires
-----------------------------------
require("modules/module_utils")

-----------------------------------
-- ID Requires
-----------------------------------
local arrapagoReefID = require("scripts/zones/Arrapago_Reef/IDs")
local halvungID      = require("scripts/zones/Halvung/IDs")
local mamookID       = require("scripts/zones/Mamook/IDs")

-----------------------------------
-- Mobs with IDs not listed
-----------------------------------
local hundredfacedHapoolJaID = 17043665
local medusaID               = 16998862

-----------------------------------
-- Module definition
-----------------------------------
local m = Module:new("perpetuation_beastmen_toau")

----------------------------------------------------------------------------------------------------
-- Arrapago Reef: Medusa
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Arrapago_Reef.Zone.onInitialize", function(zone)
    super(zone)

    local hnmPopTime = GetServerVariable("[HNM]Medusa") -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 12) * 3600 -- Modified

        SetServerVariable("[HNM]Medusa", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(medusaID)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(medusaID)
    else
        GetMobByID(medusaID):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Arrapago_Reef.mobs.Medusa.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 291600 + math.random(0, 6) * 600 -- Modified Windows (81-82 hours with 10 minute windows)

    SetServerVariable("[HNM]Medusa", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(medusaID):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(medusaID)
end)

----------------------------------------------------------------------------------------------------
-- Halvung: Gurfurlur the Menacing
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Halvung.Zone.onInitialize", function(zone)
    super(zone)
    local hnmPopTime = GetServerVariable("[HNM]Gurfurlur_the_Menacing") -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        -- hnmPopTime = os.time() + math.random(1, 48) * 1800 -- Original
        -- hnmPopTime = os.time() + math.random(1, 2) * 30 -- Testing
        hnmPopTime = os.time() + math.random(1, 12) * 3600 -- Modified

        SetServerVariable("[HNM]Gurfurlur_the_Menacing", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(halvungID.mob.GURFURLUR_THE_MENACING)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(halvungID.mob.GURFURLUR_THE_MENACING)
    else
        GetMobByID(halvungID.mob.GURFURLUR_THE_MENACING):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Halvung.mobs.Gurfurlur_the_Menacing.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 291600 + math.random(0, 6) * 600 -- Modified Windows (81-82 hours with 10 minute windows)

    SetServerVariable("[HNM]Gurfurlur_the_Menacing", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(halvungID.mob.GURFURLUR_THE_MENACING):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(halvungID.mob.GURFURLUR_THE_MENACING)
end)

----------------------------------------------------------------------------------------------------
-- Mamook: Gulool Ja Ja, Hundredfaced Hapool Ja
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Mamook.Zone.onInitialize", function(zone)
    super(zone)

    local guloolJaJaPopTime   = GetServerVariable("[HNM]Gulool_Ja_Ja")           -- Time the NM will spawn at.
    local hundredfacedPopTime = GetServerVariable("[HNM]Hundredfaced_Hapool_Ja") -- Time the NM will spawn at.

    -- First-time setup.
    if guloolJaJaPopTime == 0 then
        guloolJaJaPopTime = os.time() + math.random(1, 12) * 3600 -- Modified

        SetServerVariable("[HNM]Gulool_Ja_Ja", guloolJaJaPopTime) -- Save pop time.
    end

    if hundredfacedPopTime == 0 then
        hundredfacedPopTime = os.time() + 259200 -- Original (Spawns 3 days after first time Set Up)

        SetServerVariable("[HNM]Hundredfaced_Hapool_Ja", hundredfacedPopTime) -- Save pop time.
    end

    -- Update NM spawn point.
    UpdateNMSpawnPoint(mamookID.mob.GULOOL_JA_JA)
    UpdateNMSpawnPoint(hundredfacedHapoolJaID)

    -- Spawn mob or set spawn time.
    if guloolJaJaPopTime <= os.time() then
        SpawnMob(mamookID.mob.GULOOL_JA_JA)
    else
        GetMobByID(mamookID.mob.GULOOL_JA_JA):setRespawnTime(guloolJaJaPopTime - os.time())
    end

    if hundredfacedPopTime <= os.time() then
        SpawnMob(hundredfacedHapoolJaID)
    else
        GetMobByID(hundredfacedHapoolJaID):setRespawnTime(hundredfacedPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Mamook.mobs.Gulool_Ja_Ja.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local guloolJaJaPopTime = 291600 + math.random(0, 6) * 600 -- Modified Windows (81-82 hours with 10 minute windows)

    SetServerVariable("[HNM]Gulool_Ja_Ja", os.time() + guloolJaJaPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(mamookID.mob.GULOOL_JA_JA):setRespawnTime(guloolJaJaPopTime)
    UpdateNMSpawnPoint(mamookID.mob.GULOOL_JA_JA)
end)

m:addOverride("xi.zones.Mamook.mobs.Hundredfaced_Hapool_Ja.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local hundredfacedPopTime = 259200 -- Original Windows (every 3 days)

    SetServerVariable("[HNM]Hundredfaced_Hapool_Ja", os.time() + hundredfacedPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(hundredfacedHapoolJaID):setRespawnTime(hundredfacedPopTime)
    UpdateNMSpawnPoint(hundredfacedHapoolJaID)
end)

return m
