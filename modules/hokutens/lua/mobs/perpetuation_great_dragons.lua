-----------------------------------
-- Common Requires
-----------------------------------
require("modules/module_utils")

-----------------------------------
-- ID Requires
-----------------------------------
local attohwaChasmID      = require("scripts/zones/Attohwa_Chasm/IDs")
local kingRanperresTombID = require("scripts/zones/King_Ranperres_Tomb/IDs")
local uleguerandRangeID   = require("scripts/zones/Uleguerand_Range/IDs")

-----------------------------------
-- Module definition
-----------------------------------
local m = Module:new("perpetuation_great_dragons")

----------------------------------------------------------------------------------------------------
-- Attohwa Chasm: Tiamat
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Attohwa_Chasm.Zone.onInitialize", function(zone)
    super(zone)

    local hnmPopTime = GetServerVariable("[HNM]Tiamat") -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 12) * 3600 -- Modified

        SetServerVariable("[HNM]Tiamat", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(attohwaChasmID.mob.TIAMAT)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(attohwaChasmID.mob.TIAMAT)
    else
        GetMobByID(attohwaChasmID.mob.TIAMAT):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Attohwa_Chasm.mobs.Tiamat.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 291600 + math.random(0, 6) * 600 -- Modified Windows (81-82 hours with 10 minute windows)

    SetServerVariable("[HNM]Tiamat", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(attohwaChasmID.mob.TIAMAT):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(attohwaChasmID.mob.TIAMAT)
end)

----------------------------------------------------------------------------------------------------
-- King Ranperres Tomb: Vrtra
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.King_Ranperres_Tomb.Zone.onInitialize", function(zone)
    super(zone)

    local hnmPopTime = GetServerVariable("[HNM]Vrtra")   -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 12) * 3600 -- Modified

        SetServerVariable("[HNM]Vrtra", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(kingRanperresTombID.mob.VRTRA)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(kingRanperresTombID.mob.VRTRA)
    else
        GetMobByID(kingRanperresTombID.mob.VRTRA):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.King_Ranperres_Tomb.mobs.Vrtra.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 291600 + math.random(0, 6) * 600 -- Modified Windows (81-82 hours with 10 minute windows)

    SetServerVariable("[HNM]Vrtra", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(kingRanperresTombID.mob.VRTRA):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(kingRanperresTombID.mob.VRTRA)
end)

----------------------------------------------------------------------------------------------------
-- Uleguerand Range: Jormungand
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Uleguerand_Range.Zone.onInitialize", function(zone)
    super(zone)

    local hnmPopTime = GetServerVariable("[HNM]Jormungand")   -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 12) * 3600 -- Modified

        SetServerVariable("[HNM]Jormungand", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(uleguerandRangeID.mob.JORMUNGAND)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(uleguerandRangeID.mob.JORMUNGAND)
    else
        GetMobByID(uleguerandRangeID.mob.JORMUNGAND):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Uleguerand_Range.mobs.Jormungand.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 291600 + math.random(0, 6) * 600 -- Modified Windows (81-82 hours with 10 minute windows)

    SetServerVariable("[HNM]Jormungand", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(uleguerandRangeID.mob.JORMUNGAND):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(uleguerandRangeID.mob.JORMUNGAND)
end)

return m
