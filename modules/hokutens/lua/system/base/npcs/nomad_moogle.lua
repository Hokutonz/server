-----------------------------------
-- Survival Guide (Leafallia)
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
require("scripts/globals/missions")
require("modules/module_utils")
require("scripts/zones/Leafallia/Zone")
local ID = require("scripts/zones/Leafallia/IDs")
-----------------------------------
local m = Module:new("nomad_moogle")

m:addOverride("xi.zones.Leafallia.Zone.onInitialize", function(zone)
    super(zone)

    local nomadmoogle = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Nomad Moogle",
        look = "0x0000D50300000000000000000000000000000000",
        x = 1.7335,
        y = -0.3882,
        z = 10.3230,
        rotation = 83,
        widescan = 1,

        onTrade = function(player, npc, trade)
        end,

        onTrigger = function(player, npc)
            player:showText(npc, ID.text.NOMAD_MOOGLE_DIALOG)
            player:sendMenu(1)
        end,

        onEventUpdate = function(player, csid, option, npc)
        end,

        onEventFinish = function(player, csid, option, npc)
        end,
    })

    utils.unused(nomadmoogle)
end)

return m
