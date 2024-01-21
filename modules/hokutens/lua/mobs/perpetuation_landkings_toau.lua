-----------------------------------
-- Common Requires
-----------------------------------
require("modules/module_utils")

-----------------------------------
-- ID Requires
-----------------------------------
local caedarvaMireID = require("scripts/zones/Caedarva_Mire/IDs")
local mountZhayolmID = require("scripts/zones/Mount_Zhayolm/IDs")

-----------------------------------
-- Mobs with IDs not listed
-----------------------------------
local hydraID = 16986355

-----------------------------------
-- Module definition
-----------------------------------
local m = Module:new("perpetuation_landkings_toau")

----------------------------------------------------------------------------------------------------
-- Caedarva Mire: Khimaira
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Caedarva_Mire.Zone.onInitialize", function(zone)
    super(zone)

    -- New stuff below.
    local hnmPopTime = GetServerVariable("[HNM]Khimaira")   -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 12) * 3600 -- Modified

        SetServerVariable("[HNM]Khimaira", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(caedarvaMireID.mob.KHIMAIRA)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(caedarvaMireID.mob.KHIMAIRA)
    else
        GetMobByID(caedarvaMireID.mob.KHIMAIRA):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Caedarva_Mire.mobs.Khimaira.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 205200 + math.random(0, 6) * 600 -- Modified Windows (57-60 Hours with Half Hour Windows)

    SetServerVariable("[HNM]Khimaira", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(caedarvaMireID.mob.KHIMAIRA):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(caedarvaMireID.mob.KHIMAIRA)
end)

----------------------------------------------------------------------------------------------------
-- Mount Zhayolm: Cerberus
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Mount_Zhayolm.Zone.onInitialize", function(zone)
    super(zone)

    local hnmPopTime = GetServerVariable("[HNM]Cerberus")   -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 12) * 3600 -- Modified

        SetServerVariable("[HNM]Cerberus", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(mountZhayolmID.mob.CERBERUS)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(mountZhayolmID.mob.CERBERUS)
    else
        GetMobByID(mountZhayolmID.mob.CERBERUS):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Mount_Zhayolm.mobs.Cerberus.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 205200 + math.random(0, 6) * 600 -- Modified Windows (57-60 Hours with Half Hour Windows)

    SetServerVariable("[HNM]Cerberus", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(mountZhayolmID.mob.CERBERUS):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(mountZhayolmID.mob.CERBERUS)
end)

----------------------------------------------------------------------------------------------------
-- Wajoam Woodlands: Hydra
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Wajaom_Woodlands.Zone.onInitialize", function(zone)
    super(zone)

    local hnmPopTime = GetServerVariable("[HNM]Hydra")   -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 12) * 3600 -- Modified

        SetServerVariable("[HNM]Hydra", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(hydraID)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(hydraID)
    else
        GetMobByID(hydraID):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Wajaom_Woodlands.mobs.Hydra.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 205200 + math.random(0, 6) * 600 -- Modified Windows (57-60 Hours with Half Hour Windows)

    SetServerVariable("[HNM]Hydra", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(hydraID):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(hydraID)
end)

return m
