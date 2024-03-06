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
        4654,  77350,    -- Protect IV
        4736, 100000,    -- Protectra IV
        4659,  77350,    -- Shell IV
        4741, 100000,    -- Shellra IV
        4868,  63700,    -- Dispel
        4860,  31850,    -- Stun
        4720,  31850,    -- Flash
        4748, 200000,    -- Raise III
        4750, 250000,    -- Reraise III
        4638,  78260,    -- Banish III
        4701,  25000,    -- Cura
        --5082,  88389,    -- Cura II
        4702,  62192,    -- Sacrifice
        4703,  64584,    -- Esuna
        4704,  50000,    -- Auspice
        4613, 100000,    -- Cure V
        4618, 125000,    -- Curaga IV
        --4614, 141137,    -- Cure VI
        --4655, 125000,    -- Protect V
        --4660, 125000,    -- Shell V
        4717,  75000,    -- Refresh
        5103, 250000,    -- Crusade
    }

    player:showText(npc, ID.text.BRAVEOX_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
