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
        4612,  50000, -- Scroll of Cure IV
        4616,  25000, -- Scroll of Curaga II
        4617,  50000, -- Scroll of Curaga III
        4625,  15000, -- Scroll of Silena
        4626,  15000, -- Scroll of Stona
        4627,  15000, -- Scroll of Viruna
        4628,  15000, -- Scroll of Cursna
        4653,  25000, -- Scroll of Protect III
        4734,  15000, -- Scroll of Protectra II
        4735,  50000, -- Scroll of Protectra III
        4658,  25000, -- Scroll of Shell III
        4738,  10000, -- Scroll of Shellra
        4739,  14080, -- Scroll of Shellra II
        4740,  50000, -- Scroll of Shellra III
        4668,  10000, -- Scroll of Barfire
        4669,  10000, -- Scroll of Barblizzard
        4670,  10000, -- Scroll of Baraero
        4671,  10000, -- Scroll of Barstone
        4672,  10000, -- Scroll of Barthunder
        4673,  10000, -- Scroll of Barwater
        4674,  15000, -- Scroll of Barfira
        4675,  15000, -- Scroll of Barblizzara
        4676,  15000, -- Scroll of Baraera
        4677,  15000, -- Scroll of Barstonra
        4678,  15000, -- Scroll of Barthundra
        4679,  15000, -- Scroll of Barwatera
        4680,  10000, -- Scroll of Barsleep
        4681,  10000, -- Scroll of Barpoison
        4682,  10000, -- Scroll of Barparalyze
        4683,  10000, -- Scroll of Barblind
        4684,  10000, -- Scroll of Barsilence
        4694,  15000, -- Scroll of Barsleepra
        4695,  15000, -- Scroll of Barpoisonra
        4696,  15000, -- Scroll of Barparalyzra
        4697,  15000, -- Scroll of Barblindra
        4698,  15000, -- Scroll of Barsilencera
        4685,  10000, -- Scroll of Barpetrify
        4686,  10000, -- Scroll of Barvirus
        4699,  15000, -- Scroll of Barpetra
        4700,  15000, -- Scroll of Barvira
        5089,  73740, -- Scroll of Gain-VIT
        5092,  77500, -- Scroll of Gain-MND
        5090,  85680, -- Scroll of Gain-AGI
        5093,  81900, -- Scroll of Gain-CHR
        5087,  89804, -- Scroll of Gain-STR
        5091,  94461, -- Scroll of Gain-INT
        5088,  99613, -- Scroll of Gain-DEX
        5096,  73740, -- Scroll of Boost-VIT
        5099,  77500, -- Scroll of Boost-MND
        5097,  85680, -- Scroll of Boost-AGI
        5100,  81900, -- Scroll of Boost-CHR
        5094,  89804, -- Scroll of Boost-STR
        5098,  94461, -- Scroll of Boost-INT
        5095,  99613, -- Scroll of Boost-DEX
        5106,  73500, -- Scroll of Inundation
        4849, 130378, -- Scroll of Addle
        4629,  35000, -- Scroll of Holy
        4647,  20000, -- Scroll of Banishga II
        4737, 150000, -- Scroll of Protecra V
        4742, 150000, -- Scroll of Shellra V
        4633, 139135, -- Scroll of Dia III
        6569, 139135, -- Scroll of Slow II
        6570, 139135, -- Scroll of Paralyze II
        6571, 139135, -- Scroll of Phalanx II
    }

    player:showText(npc, ID.text.WAAG_DEEG_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
