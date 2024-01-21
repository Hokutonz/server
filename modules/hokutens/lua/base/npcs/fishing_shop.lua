-----------------------------------
-- Master Baiter's Fishing Shop (Leafallia)
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
require("scripts/globals/missions")
require("modules/module_utils")
require("scripts/zones/Leafallia/Zone")
local ID = require("scripts/zones/Leafallia/IDs")
-----------------------------------
local m = Module:new("fishing_shop")

m:addOverride("xi.zones.Leafallia.Zone.onInitialize", function(zone)
    super(zone)

    local fishing_stock =
    {
        17391,   5000,   -- Willow Fishing Rod
        17390,  10000,   -- Yew Fishing Rod
        17384,  25000,   -- Carbon Fishing Rod
        17015,  50000,   -- Halcyon Fishing Rod
        16998,     50,   -- Ball of insect paste
        17407,   5000,   -- Minnow
    }

    local masterbaiter = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Master Baiter",
        look = 73,
        x = 4.0280,
        y = 0.4328,
        z = 20.2933,
        rotation = 140,
        widescan = 1,

        onTrade = function(player, npc, trade)
        end,

        -- Offer crystals to buy
        onTrigger = function(player, npc)
            player:printToPlayer("Git yer fishin' shyte here.", 0, npc:getPacketName())
            xi.shop.general(player, fishing_stock)
        end,
    })

    utils.unused(masterbaiter)
end)

return m
