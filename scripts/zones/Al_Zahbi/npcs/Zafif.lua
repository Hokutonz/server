-----------------------------------
-- Area: Al Zahbi
--  NPC: Zafif
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.AL_ZAHBI]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        4612,  50000,    -- Scroll of Cure IV
        4616,  25000,    -- Scroll of Curaga II
        4617,  50000,    -- Scroll of Curaga III
        4653,  32000,    -- Scroll of Protect III
        4654,  91116,    -- Scroll of Protect IV
        4736, 100000,    -- Scroll of Protectra IV
        4629,  35000,    -- Scroll of Holy
        4647,  20000,    -- Scroll of Banishga II
        4625,  10000,    -- Scroll of Silena
        4626,  19200,    -- Scroll of Stona
        4627,  13300,    -- Scroll of Viruna
        4628,  10000,    -- Scroll of Cursna
        4868,  77600,    -- Scroll of Dispell
        4720,  27000,    -- Scroll of Flash
        4750,  99375,    -- Scroll of Reraise III
        4715,  75000     -- Scroll of Reprisal
    }

    player:showText(npc, ID.text.ZAFIF_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
