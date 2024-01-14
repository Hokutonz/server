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
            704,    144, -- Bamboo Stick
            829,  21000, -- Silk Cloth
            1240,   220, -- Koma
            657,   7000, -- Tama-Hagane
            1500, 73530, -- Urushi
            1500,    40, -- Uchitake
            1500,    40, -- Tsurara
            1500,    40, -- Kawahori-Ogi
            1500,    40, -- Makibishi
            1500,    40, -- Hiraishin
            1500,    40, -- Mizu-Deppo
            1500,   125, -- Shihei
            1500,   125, -- Jusatsu
            1500,   125, -- Kaginawa
            1500,   125, -- Sairui-Ran
            1500,   125, -- Kodoku
            1500,   125, -- Shinobi-Tabi
            1500,   125, -- Sanjaku-Tenugui
            1471,   316, -- Sticky Rice
            1554,   645, -- Turmeric
            1555,  1585, -- Coriander
            1590,   800, -- Holy Basil
            1475,   990, -- Curry Powder
            5164,  2595, -- Ground Wasabi
            1652,   200, -- Rice Vinegar
            5237,   492, -- Shirataki
            2702,  5000, -- Buckwheat Flour
            15000,  2331, -- Katon: Ichi
            15000,  2331, -- Hyoton: Ichi
            15000,  2331, -- Huton: Ichi
            15000,  2331, -- Doton: Ichi
            15000,  2331, -- Raiton: Ichi
            15000,  2331, -- Suiton: Ichi
            20000,  2849, -- Jubaku: Ichi
            20000,  2849, -- Hojo: Ichi
            20000,  2849, -- Kurayami: Ichi
            20000,  2849, -- Dokumori: Ichi
            25000,  2849, -- Tonko: Ichi
            25000,  9590, -- Monomi: Ichi
            25000, 60750, -- Recall-Jugner
            25000, 60750, -- Recall-Pashh
            25000, 60750, -- Recall-Meriph
            120000, 34656, -- Teleport-Vahzl
            100000, 34656, -- Teleport-Yhoat
            100000, 34656, -- Teleport-Altep
            75000, 34656, -- Teleport-Holla
            75000, 34656, -- Teleport-Dem
            75000, 34656, -- Teleport-Mea
            20000, 10428, -- Drain
            20000, 12850, -- Aspir
            25000, 10428, -- Blaze Spikes
            25000, 11953, -- Warp
            250000, 37200, -- Warp II
            50000, 32320, -- Retrace
            500000, 67818, -- Sleepga II
            50000, 13133, -- Utsusemi: Ichi
            25000, 11830, -- Mage's Ballad
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
