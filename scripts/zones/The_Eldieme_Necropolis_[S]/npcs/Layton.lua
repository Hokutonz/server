-----------------------------------
-- Area: The Eldieme Necropolis (S)
--  NPC: Layton
-- Type: Standard Merchant NPC
-- Note: Available during Campaign battles
-- !pos 382.679 -39.999 3.541 175
-----------------------------------
local ID = zones[xi.zone.THE_ELDIEME_NECROPOLIS_S]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        6049,  25000,    -- Firestorm Schema
        6050,  25000,    -- Rainstorm Schema
        6051,  25000,    -- Thunderstorm Schema
        6052,  25000,    -- Hailstorm Schema
        6053,  25000,    -- Sandstorm Schema
        6054,  25000,    -- Windstorm Schema
        6055,  25000,    -- Aurorastorm Schema
        6056,  25000,    -- Voidstorm Schema
        6041,  25000,    -- Pyrohelix Schema
        6042,  25000,    -- Hydrohelix Schema
        6043,  25000,    -- Ionohelix Schema
        6044,  25000,    -- Cryohelix Schema
        6045,  25000,    -- Geohelix Schema
        6046,  25000,    -- Anemohelix Schema
        6047,  25000,    -- Luminohelix Schema
        6048,  25000,    -- Noctohelix Schema
    }

    player:showText(npc, ID.text.LAYTON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
