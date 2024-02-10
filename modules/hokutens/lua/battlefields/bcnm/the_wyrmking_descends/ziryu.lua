-----------------------------------
-- Area: Riverne - Site B01 (BCNM)
--   NM: Ziryu
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_B01/IDs")
require("modules/module_utils")
-----------------------------------
xi.module.ensureTable("xi.zones.Riverne-Site_B01.mobs.Ziryu")
local m = Module:new("wyrmking_ziryu")
-----------------------------------

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Ziryu.onMobInitialize", function(mob)
    mob:setMobMod(xi.mobMod.CHARMABLE, 1)
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Ziryu.onMobSpawn", function(mob)
    mob:setMobMod(xi.mobMod.CHARMABLE, 1)
end)

return m
