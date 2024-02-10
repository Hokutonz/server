-----------------------------------
-- Common Requires
-----------------------------------
require("modules/module_utils")

-----------------------------------
-- ID Requires
-----------------------------------
local behemothDomID   = require("scripts/zones/Behemoths_Dominion/IDs")
local dragonsAeryID   = require("scripts/zones/Dragons_Aery/IDs")
local valleySorrowsID = require("scripts/zones/Valley_of_Sorrows/IDs")

-----------------------------------
-- Module definition
-----------------------------------
local m = Module:new("perpetuation_landkings_zilart")

----------------------------------------------------------------------------------------------------
-- Behemoth's Dominion: Behemoth
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Behemoths_Dominion.Zone.onInitialize", function(zone)
    super(zone)

    local hnmPopTime = GetServerVariable("[HNM]Behemoth") -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 48) * 1800

        SetServerVariable("[HNM]Behemoth", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(behemothDomID.mob.BEHEMOTH)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(behemothDomID.mob.BEHEMOTH)
    else
        GetMobByID(behemothDomID.mob.BEHEMOTH):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Behemoths_Dominion.mobs.Behemoth.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 21600 + math.random(0, 6) * 300 -- 6-6.5 hours with 5 minute windows

    SetServerVariable("[HNM]Behemoth", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(behemothDomID.mob.BEHEMOTH):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(behemothDomID.mob.BEHEMOTH)
end)

----------------------------------------------------------------------------------------------------
-- Dragon's Aery: Fafnir
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Dragons_Aery.Zone.onInitialize", function(zone)
    super(zone)

    local hnmPopTime = GetServerVariable("[HNM]Fafnir") -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 48) * 1800

        SetServerVariable("[HNM]Fafnir", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(dragonsAeryID.mob.FAFNIR)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(dragonsAeryID.mob.FAFNIR)
    else
        GetMobByID(dragonsAeryID.mob.FAFNIR):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Dragons_Aery.mobs.Fafnir.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 21600 + math.random(0, 6) * 300 -- 6-6.5 hours with 5 minute windows

    SetServerVariable("[HNM]Fafnir", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(dragonsAeryID.mob.FAFNIR):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(dragonsAeryID.mob.FAFNIR)
end)

----------------------------------------------------------------------------------------------------
-- Valley of Sorrows: Adamantoise
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Valley_of_Sorrows.Zone.onInitialize", function(zone)
    super(zone)

    local hnmPopTime = GetServerVariable("[HNM]Adamantoise") -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 48) * 1800

        SetServerVariable("[HNM]Adamantoise", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(valleySorrowsID.mob.ADAMANTOISE)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(valleySorrowsID.mob.ADAMANTOISE)
    else
        GetMobByID(valleySorrowsID.mob.ADAMANTOISE):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Valley_of_Sorrows.mobs.Adamantoise.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 21600 + math.random(0, 6) * 300 -- 6-6.5 hours with 5 minute windows

    SetServerVariable("[HNM]Adamantoise", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(valleySorrowsID.mob.ADAMANTOISE):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(valleySorrowsID.mob.ADAMANTOISE)
end)

return m
