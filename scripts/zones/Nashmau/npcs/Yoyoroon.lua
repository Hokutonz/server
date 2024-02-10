-----------------------------------
-- Area: Nashmau
--  NPC: Yoyoroon
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.NASHMAU]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        2239,  5000,    -- Tension Spring
        2243,  5000,    -- Loudspeaker
        2246,  5000,    -- Accelerator
        2251,  5000,    -- Armor Plate
        2254,  5000,    -- Stabilizer
        2258,  5000,    -- Mana Jammer
        2262,  5000,    -- Auto-Repair Kit
        2266,  5000,    -- Mana Tank
        2240, 10000,    -- Inhibitor
        9229, 10000,    -- Speedloader
        2242, 10000,    -- Mana Booster
        2247, 10000,    -- Scope
        2250, 10000,    -- Shock Absorber
        2255, 10000,    -- Volt Gun
        2260, 10000,    -- Stealth Screen
        2264, 10000,    -- Damage Gauge
        2268, 10000,    -- Mana Conserver
        2238, 25000,    -- Strobe
        2409, 25000,    -- Flame Holder
        2410, 25000,    -- Ice Maker
        2248, 25000,    -- Pattern Reader
        2411, 25000,    -- Replicator
        2252, 25000,    -- Analyzer
        2256, 25000,    -- Heat Seeker
        2259, 25000,    -- Heatsink
        2263, 25000,    -- Flashbulb
        2267, 25000,    -- Mana Converter
        2241, 50000,    -- Tension Spring II
        2244, 50000,    -- Scanner
        2245, 50000,    -- Loudspeaker II
        2249, 50000,    -- Accelerator II
        2253, 50000,    -- Armor Plate II
        2257, 50000,    -- Stabilizer II
        2261, 50000,    -- Mana Jammer II
        2412, 100000,   -- Hammermill
        9068, 100000,   -- Barrier Module
        9070, 100000,   -- Resister
        2265, 100000,   -- Auto-Repair Kit II
        9072, 100000,   -- Arcanic Cell
        2269, 100000,   -- Mana Tank II
        9032, 100000,   -- Strobe II
        9033, 150000,   -- Tension Spring III
        9034, 150000,   -- Loudspeaker III
        9066, 150000,   -- Amplifier
        9037, 150000,   -- Accelerator III
        9036, 150000,   -- Scope II
        9039, 150000,   -- Armor Plate III
        9040, 150000,   -- Stabilizer III
        9042, 150000,   -- Mana Jammer III
        9065, 200000,   -- Inhibitor II
        9230, 200000,   -- Speedloader II
        9067, 200000,   -- Repeater
        9043, 200000,   -- Stealth Screen II
        2322, 250000,   -- Attuner
        3307, 250000,   -- Heat Capacitor
        2323, 250000,   -- Tactical Processor
        3308, 250000,   -- Power Cooler
        2324, 250000,   -- Drum Magazine
        3309, 250000,   -- Barrage Turbine
        2325, 250000,   -- Equalizer
        3310, 250000,   -- Barrier Module II
        2326, 250000,   -- Target Marker
        3311, 250000,   -- Galvanizer
        2327, 250000,   -- Mana Channeler
        3312, 250000,   -- Percolator
        2328, 250000,   -- Eraser
        3313, 250000,   -- Vivi-Valve
        2329, 250000,   -- Smoke Screen
        3314, 250000,   -- Disruptor
        2353, 500000,   -- Optic Fiber
    }

    player:showText(npc, ID.text.YOYOROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
