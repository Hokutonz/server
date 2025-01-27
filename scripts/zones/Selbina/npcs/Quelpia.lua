-----------------------------------
-- Area: Selbina
--  NPC: Quelpia
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.SELBINA]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        4610,   585,    -- Scroll of Cure II
        4611,  3261,    -- Scroll of Cure III
        4616, 10080,    -- Scroll of Curaga II
        4620,  5178,    -- Scroll of Raise
        4621, 15000,    -- Scroll of Raise II
        4743, 10000,    -- Scroll of Reraise
        4749, 20000,    -- Scroll of Reraise II
        4629, 31500,    -- Scroll of Holy
        4632, 10080,    -- Scroll of Dia II
        4637,  8100,    -- Scroll of Banish II
        4733,  5000,    -- Scroll of Protectra
        4652,  6366,    -- Scroll of Protect II
        4657, 15840,    -- Scroll of Shell II
        4665, 18000,    -- Scroll of Haste
        4708,  4644,    -- Scroll of Enfire
        4709,  3688,    -- Scroll of Enblizzard
        4710,  2250,    -- Scroll of Enaero
        4711,  1827,    -- Scroll of Enstone
        4712,  1363,    -- Scroll of Enthunder
        4713,  6366,    -- Scroll of Enwater
        4714, 15000,    -- Scroll of Phalanx
    }

    player:showText(npc, ID.text.QUELPIA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
