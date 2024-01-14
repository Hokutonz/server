-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Mazween
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.AHT_URHGAN_WHITEGATE]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        50000, 11200,    -- Scroll of Sleepga
        10000, 18720,    -- Scroll of Sleep II
        10000, 25200,    -- Poison II
        10000, 14000,    -- Bio II
        10000,  5160,    -- Poisonga
        25000, 19932,    -- Stone III
        25000, 22682,    -- Water III
        25000, 27744,    -- Aero III
        25000, 33306,    -- Fire III
        25000, 39368,    -- Blizzard III
        25000, 45930,    -- Thunder III
        50000, 27000,    -- Absorb-TP
        25000, 30780,    -- Drain II
        50000, 70560,    -- Dread Spikes
        50000, 44000,    -- Absorb-ACC
        25000, 79800     -- Aspir II
    }

    player:showText(npc, ID.text.MAZWEEN_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
