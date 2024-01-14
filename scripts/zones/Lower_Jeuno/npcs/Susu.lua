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
        4867,  10000, -- Scroll of Sleep II
        4881,  50000, -- Scroll of Sleepga
        4769,  25000, -- Scroll of Stone III
        4770, 108000, -- Scroll of Stone IV
        4798,  75000, -- Scroll of Stonega II
        4799, 100000, -- Scroll of Stonega III
        4779,  25000, -- Scroll of Water III
        4780, 116000, -- Scroll of Water IV
        4808,  75000, -- Scroll of Waterga II
        4809, 100000, -- Scroll of Waterga III
        4764,  27744, -- Scroll of Aero III
        4765, 131750, -- Scroll of Aero IV
        4793,  75000, -- Scroll of Aeroga II
        4794, 100000, -- Scroll of Aeroga III
        4754,  33306, -- Scroll of Fire III
        4755, 148500, -- Scroll of Fire IV
        4783,  75000, -- Scroll of Firaga II
        4784, 112000, -- Scroll of Firaga III
        4759,  39368, -- Scroll of Blizzard III
        4760, 166250, -- Scroll of Blizzard IV
        4788,  75000, -- Scroll of Blizzaga II
        4789, 127500, -- Scroll of Blizzaga III
        4774,  45930, -- Scroll of Thunder III
        4775, 185000, -- Scroll of Thunder IV
        4803,  75000, -- Scroll of Thundaga II
        4804, 144000, -- Scroll of Thundaga III
        4818,  75000, -- Scroll of Quake
        4822,  75000, -- Scroll of Flood
        4816,  75000, -- Scroll of Tornado
        4812,  75000, -- Scroll of Flare
        4814,  75000, -- Scroll of Freeze
        4820,  75000, -- Scroll of Burst
        4813, 150000, -- Scroll of Flare II
        4815, 150000, -- Scroll of Freeze II
        4817, 150000, -- Scroll of Tornado II
        4819, 150000, -- Scroll of Quake II
        4821, 150000, -- Scroll of Burst II
        4823, 150000, -- Scroll of Flood II
        4840, 139125, -- Scroll of Bio III
        4884, 139125, -- Scroll of Blind II
    }

    player:showText(npc, ID.text.WAAG_DEEG_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
