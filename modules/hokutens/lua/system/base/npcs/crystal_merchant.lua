-----------------------------------
-- Crystal Merchant (Leafallia)
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
require("scripts/globals/missions")
require("modules/module_utils")
require("scripts/zones/Leafallia/Zone")
local ID = require("scripts/zones/Leafallia/IDs")
-----------------------------------
local m = Module:new("crystal_merchant")

m:addOverride("xi.zones.Leafallia.Zone.onInitialize", function(zone)
    super(zone)

    local crystal_stock =
    {
        4096,   100,   -- Fire Crystal
        4097,   100,   -- Ice Crystal
        4098,   100,   -- Wind Crystal
        4099,   100,   -- Earth Crystal
        4100,   100,   -- Lightning Crystal
        4101,   100,   -- Water Crystal
        4102,   100,   -- Light Crystal
        4103,   100,   -- Dark Crystal
    }

    local crystalmerchant = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Crystal Merchant",
        look = 738,
        x = -7.8645,
        y = -0.3029,
        z = -4.8554,
        rotation = 187,
        widescan = 1,

        onTrade = function(player, npc, trade)
        end,

        -- Offer crystals to buy
        onTrigger = function(player, npc)
            player:printToPlayer("Welcome to the Crystal Shop!", 0, npc:getPacketName())
            xi.shop.general(player, crystal_stock)
        end,
    })

    utils.unused(crystalmerchant)
end)

return m
