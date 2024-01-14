-----------------------------------
-- Area: Lower Jeuno
--  NPC: Amalasanda
-- Type: Tenshodo Merchant
-- !pos 28.149 2.899 -44.780 245
-----------------------------------
local ID = zones[xi.zone.LOWER_JEUNO]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(xi.ki.TENSHODO_MEMBERS_CARD) then
        local stock =
        {
            704,     144, -- Bamboo Stick
            829,   21000, -- Silk Cloth
            1240,    220, -- Koma
            657,    7000, -- Tama-Hagane
            1415,  73530, -- Urushi
            1161,    100, -- Uchitake
            1164,    100, -- Tsurara
            1167,    100, -- Kawahori-Ogi
            1170,    100, -- Makibishi
            1173,    100, -- Hiraishin
            1176,    100, -- Mizu-Deppo
            1179,    250, -- Shihei
            1182,    250, -- Jusatsu
            1185,    250, -- Kaginawa
            1188,    250, -- Sairui-Ran
            1191,    250, -- Kodoku
            1194,    250, -- Shinobi-Tabi
            1500,    250, -- Sanjaku-Tenugui
            1471,    316, -- Sticky Rice
            1554,    645, -- Turmeric
            1555,   1585, -- Coriander
            1590,    800, -- Holy Basil
            1475,    990, -- Curry Powder
            5164,   2595, -- Ground Wasabi
            1652,    200, -- Rice Vinegar
            5237,    492, -- Shirataki
            2702,   5000, -- Buckwheat Flour
            4928,  15000, -- Katon: Ichi
            4931,  15000, -- Hyoton: Ichi
            4934,  15000, -- Huton: Ichi
            4937,  15000, -- Doton: Ichi
            4940,  15000, -- Raiton: Ichi
            4943,  15000, -- Suiton: Ichi
            4949,  25000, -- Jubaku: Ichi
            4952,  25000, -- Hojo: Ichi
            4955,  25000, -- Kurayami: Ichi
            4958,  25000, -- Dokumori: Ichi
            4961,  25000, -- Tonko: Ichi
            4964,  25000, -- Monomi: Ichi
            4687,  60750, -- Recall-Jugner
            4688,  60750, -- Recall-Pashh
            4689,  60750, -- Recall-Meriph
            4747, 120000, -- Teleport-Vahzl
            4728, 100000, -- Teleport-Yhoat
            4729, 100000, -- Teleport-Altep
            4730,  75000, -- Teleport-Holla
            4731,  75000, -- Teleport-Dem
            4732,  75000, -- Teleport-Mea
            4853,  20000, -- Drain
            4855,  20000, -- Aspir
            4857,  25000, -- Blaze Spikes
            4869,  25000, -- Warp
            4870, 250000, -- Warp II
            4873,  50000, -- Retrace
            4882, 500000, -- Sleepga II
            4946, 100000, -- Utsusemi: Ichi
            4994,  25000, -- Mage's Ballad
        }

        player:showText(npc, ID.text.AMALASANDA_SHOP_DIALOG)
        xi.shop.general(player, stock)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
