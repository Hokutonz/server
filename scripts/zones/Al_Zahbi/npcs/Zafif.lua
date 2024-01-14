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
        50000, 23400,    -- Scroll of Cure IV
        25000, 11200,    -- Scroll of Curaga II
        50000, 19932,    -- Scroll of Curaga III
        25000, 32000,    -- Scroll of Protect III
        75000, 91116,    -- Scroll of Protect IV
        100000, 85500,    -- Scroll of Protectra IV
        25000, 35000,    -- Scroll of Holy
        15000, 20000,    -- Scroll of Banishga II
        10000,  2330,    -- Scroll of Silena
        10000, 19200,    -- Scroll of Stona
        10000, 13300,    -- Scroll of Viruna
        10000,  8586,    -- Scroll of Cursna
        25000, 77600,    -- Scroll of Dispell
        25000, 27000,    -- Scroll of Flash
        50000, 99375,    -- Scroll of Reraise III
        75000, 28500     -- Scroll of Reprisal
    }

    player:showText(npc, ID.text.ZAFIF_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
