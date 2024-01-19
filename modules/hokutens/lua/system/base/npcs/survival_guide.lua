-----------------------------------
-- Survival Guide (Leafallia)
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
require('scripts/globals/teleports')
require("scripts/globals/missions")
require("modules/module_utils")
require("scripts/zones/Leafallia/Zone")
local ID = require("scripts/zones/Leafallia/IDs")
-----------------------------------
local m = Module:new("survival_guide")

m:addOverride("xi.zones.Leafallia.Zone.onInitialize", function(zone)
    super(zone)

    local survivalguide = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Survival Guide",
        look = "0x0000810900000000000000000000000000000000",
        x = 4.3925,
        y = -0.2677,
        z = 5.4564,
        rotation = 129,
        widescan = 1,

        onTrade = function(player, npc, trade)
        end,

        onTrigger = function(player, npc)
            xi.survivalGuide.onTrigger(player)
        end,

        onEventUpdate = function(player, csid, option, npc)
            xi.survivalGuide.onEventUpdate(player, csid, option, npc)
        end,

        onEventFinish = function(player, csid, option, npc)
            xi.survivalGuide.onEventFinish(player, csid, option, npc)
        end,
    })

    utils.unused(survivalguide)
end)

return m
