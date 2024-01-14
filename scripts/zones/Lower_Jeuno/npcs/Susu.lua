-----------------------------------
-- Area: Lower Jeuno
--  NPC: Susu
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.LOWER_JEUNO]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        10000,   8720, -- Scroll of Sleep II
        50000,  11200, -- Scroll of Sleepga
        25000,  19932, -- Scroll of Stone III
        50000, 108000, -- Scroll of Stone IV
        75000,  12000, -- Scroll of Stonega II
        100000,  69875, -- Scroll of Stonega III
        25000,  22682, -- Scroll of Water III
        50000, 116000, -- Scroll of Water IV
        75000,  13050, -- Scroll of Waterga II
        4809,  82250, -- Scroll of Waterga III
        25000,  27744, -- Scroll of Aero III
        50000, 131750, -- Scroll of Aero IV
        75000,  19800, -- Scroll of Aeroga II
        100000,  95625, -- Scroll of Aeroga III
        25000,  33306, -- Scroll of Fire III
        50000, 148500, -- Scroll of Fire IV
        75000,  21307, -- Scroll of Firaga II
        100000, 112000, -- Scroll of Firaga III
        25000,  39368, -- Scroll of Blizzard III
        50000, 166250, -- Scroll of Blizzard IV
        75000,  26244, -- Scroll of Blizzaga II
        100000, 127500, -- Scroll of Blizzaga III
        25000,  45930, -- Scroll of Thunder III
        50000, 185000, -- Scroll of Thunder IV
        75000,  31681, -- Scroll of Thundaga II
        100000, 144000, -- Scroll of Thundaga III
        75000,  60000, -- Scroll of Quake
        75000,  67500, -- Scroll of Flood
        75000,  56250, -- Scroll of Tornado
        75000,  71250, -- Scroll of Flare
        75000,  52500, -- Scroll of Freeze
        75000,  63750, -- Scroll of Burst
        150000, 119180, -- Scroll of Flare II
        150000, 119180, -- Scroll of Freeze II
        150000, 119180, -- Scroll of Tornado II
        150000, 119180, -- Scroll of Quake II
        150000, 119180, -- Scroll of Burst II
        150000, 119180, -- Scroll of Flood II
        25000, 139125, -- Scroll of Bio III
        25000, 139125, -- Scroll of Blind II
    }

    player:showText(npc, ID.text.WAAG_DEEG_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
