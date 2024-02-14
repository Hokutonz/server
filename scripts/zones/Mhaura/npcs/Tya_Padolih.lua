-----------------------------------
-- Area: Mhaura
--  NPC: Tya Padolih
-- Standard Merchant NPC
-- !pos -48 -4 30 249
-----------------------------------
local ID = zones[xi.zone.MHAURA]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        4716,  5000,    -- Scroll of Regen
        4718, 10000,    -- Scroll of Regen II
        4719, 25000,    -- Scroll of Regen III
        4881, 15000,    -- Scroll of Sleepga
        4690, 29030,    -- Scroll of Baramnesia
        4691, 29030,    -- Scroll of Baramnesra
        4744,  5523,    -- Scroll of Invisible
        4745,  2400,    -- Scroll of Sneak
        4746,  1243,    -- Scroll of Deodorize
        4912, 20000,    -- Scroll of Distract
        4914, 25000,    -- Scroll of Frazzle
    }

    player:showText(npc, ID.text.TYAPADOLIH_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
