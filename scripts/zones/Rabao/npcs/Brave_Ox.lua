-----------------------------------
-- Area: Rabao
--  NPC: Brave Ox
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.RABAO]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        75000,  77350,    -- Protect IV
        100000,  73710,    -- Protectra IV
        25000,  63700,    -- Dispel
        10000,  31850,    -- Stun
        25000,  31850,    -- Flash
        50000, 546000,    -- Reraise III
        25000,  78260,    -- Banish III
        25000,  20092,    -- Cura
        10000,  88389,    -- Cura II
        50000,  62192,    -- Sacrifice
        50000,  64584,    -- Esuna
        50000,  30967,    -- Auspice
        -- 4614, 141137,    -- Cure VI
        125000, 103882,    -- Protect V
        125000, 125069,    -- Shell V
        250000, 140332,    -- Crusade
    }

    player:showText(npc, ID.text.BRAVEOX_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
