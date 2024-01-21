-----------------------------------
-- Common Requires
-----------------------------------
require("modules/module_utils")

-----------------------------------
-- ID Requires
-----------------------------------
local gustavTunnelID = require("scripts/zones/Gustav_Tunnel/IDs")
local kuftalTunnelID = require("scripts/zones/Kuftal_Tunnel/IDs")

-----------------------------------
-- Module definition
-----------------------------------
local m = Module:new("perpetuation_lesser_dragons")

----------------------------------------------------------------------------------------------------
-- Gustav Tunnel: Bune
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Gustav_Tunnel.Zone.onInitialize", function(zone)
    super(zone)

    local hnmPopTime = GetServerVariable("[HNM]Bune") -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 48) * 1800

        SetServerVariable("[HNM]Bune", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(gustavTunnelID.mob.BUNE)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(gustavTunnelID.mob.BUNE)
    else
        GetMobByID(gustavTunnelID.mob.BUNE):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Gustav_Tunnel.mobs.Bune.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 75600 + math.random(0, 6) * 1800

    SetServerVariable("[HNM]Bune", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(gustavTunnelID.mob.BUNE):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(gustavTunnelID.mob.BUNE)
end)

----------------------------------------------------------------------------------------------------
-- Kuftal Tunnel: Guivre
----------------------------------------------------------------------------------------------------
m:addOverride("xi.zones.Kuftal_Tunnel.Zone.onInitialize", function(zone)
    super(zone)

    local hnmPopTime = GetServerVariable("[HNM]Guivre") -- Time the NM will spawn at.

    -- First-time setup.
    if hnmPopTime == 0 then
        hnmPopTime = os.time() + math.random(1, 48) * 1800

        SetServerVariable("[HNM]Guivre", hnmPopTime) -- Save pop time.
    end

    UpdateNMSpawnPoint(kuftalTunnelID.mob.GUIVRE)

    -- Spawn mob or set spawn time.
    if hnmPopTime <= os.time() then
        SpawnMob(kuftalTunnelID.mob.GUIVRE)
    else
        GetMobByID(kuftalTunnelID.mob.GUIVRE):setRespawnTime(hnmPopTime - os.time())
    end
end)

m:addOverride("xi.zones.Kuftal_Tunnel.mobs.Guivre.onMobDespawn", function(mob)
    super(mob)

    -- Server Variable work.
    local randomPopTime = 75600 + math.random(0, 6) * 1800

    SetServerVariable("[HNM]Guivre", os.time() + randomPopTime) -- Save next pop time.

    -- Set spawn time and position.
    GetMobByID(kuftalTunnelID.mob.GUIVRE):setRespawnTime(randomPopTime)
    UpdateNMSpawnPoint(kuftalTunnelID.mob.GUIVRE)
end)

return m
