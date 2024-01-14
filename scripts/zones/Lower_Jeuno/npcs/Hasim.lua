-----------------------------------
-- Area: Lower Jeuno
--  NPC: Hasim
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
        50000,  23400, -- Scroll of Cure IV
        25000,  11200, -- Scroll of Curaga II
        50000,  19932, -- Scroll of Curaga III
        15000,   2330, -- Scroll of Silena
        15000,  19200, -- Scroll of Stona
        15000,  13300, -- Scroll of Viruna
        15000,   8586, -- Scroll of Cursna
        25000,  32000, -- Scroll of Protect III
        15000,   7074, -- Scroll of Protectra II
        50000,  19200, -- Scroll of Protectra III
        25000,  26244, -- Scroll of Shell III
        10000,   1760, -- Scroll of Shellra
        15000,  14080, -- Scroll of Shellra II
        50000,  26244, -- Scroll of Shellra III
        10000,   1760, -- Scroll of Barfire
        10000,   3624, -- Scroll of Barblizzard
        10000,    930, -- Scroll of Baraero
        10000,    156, -- Scroll of Barstone
        10000,   5754, -- Scroll of Barthunder
        10000,    360, -- Scroll of Barwater
        15000,   1760, -- Scroll of Barfira
        15000,   3624, -- Scroll of Barblizzara
        15000,    930, -- Scroll of Baraera
        15000,    156, -- Scroll of Barstonra
        15000,   5754, -- Scroll of Barthundra
        15000,    360, -- Scroll of Barwatera
        10000,    244, -- Scroll of Barsleep
        10000,    400, -- Scroll of Barpoison
        10000,    780, -- Scroll of Barparalyze
        10000,   2030, -- Scroll of Barblind
        10000,   4608, -- Scroll of Barsilence
        15000,    244, -- Scroll of Barsleepra
        15000,    400, -- Scroll of Barpoisonra
        15000,    780, -- Scroll of Barparalyzra
        15000,   2030, -- Scroll of Barblindra
        15000,   4608, -- Scroll of Barsilencera
        10000,  15120, -- Scroll of Barpetrify
        10000,   9600, -- Scroll of Barvirus
        15000,  15120, -- Scroll of Barpetra
        15000,   9600, -- Scroll of Barvira
        25000,  73740, -- Scroll of Gain-VIT
        25000,  77500, -- Scroll of Gain-MND
        25000,  85680, -- Scroll of Gain-AGI
        25000,  81900, -- Scroll of Gain-CHR
        25000,  89804, -- Scroll of Gain-STR
        25000,  94461, -- Scroll of Gain-INT
        25000,  99613, -- Scroll of Gain-DEX
        25000,  73740, -- Scroll of Boost-VIT
        25000,  77500, -- Scroll of Boost-MND
        25000,  85680, -- Scroll of Boost-AGI
        25000,  81900, -- Scroll of Boost-CHR
        25000,  89804, -- Scroll of Boost-STR
        25000,  94461, -- Scroll of Boost-INT
        25000,  99613, -- Scroll of Boost-DEX
        50000,  73500, -- Scroll of Inundation
        15000, 130378, -- Scroll of Addle
        25000,  35000, -- Scroll of Holy
        15000,  20000, -- Scroll of Banishga II
        150000, 119240, -- Scroll of Protecra V
        150000, 124540, -- Scroll of Shellra V
        50000, 139135, -- Scroll of Dia III
        100000, 139135, -- Scroll of Slow II
        100000, 139135, -- Scroll of Paralyze II
        100000, 139135, -- Scroll of Phalanx II
    }

    player:showText(npc, ID.text.WAAG_DEEG_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
