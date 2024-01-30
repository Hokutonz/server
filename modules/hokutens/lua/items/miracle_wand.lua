-----------------------------------
-- ID: 18844
-- Miracle Wand (Rare Ex)
-- [Main] All Races (Club)
-- DPS: 45 DMG:2 Delay:264
-- Enchantment: Adds "Regen" effect to party member
-- LV 1 WAR MNK WHM BLM RDM THF PLD DRK BST BRD RNG SAM NIN DRG SMN BLU COR PUP DNC SCH GEO RUN
-----------------------------------
require("modules/module_utils")
--------------------------------------------

local m = Module:new("miracle_wand")

xi.module.ensureTable("xi.items.miracle_wand")

m:addOverride("xi.items.miracle_wand.onItemCheck", function(target)
    return 0
end)

m:addOverride("xi.items.miracle_wand.onItemUse", function(target)
    
    local party = target:getPartyWithTrusts()

    for _, member in pairs(party) do
        if target:getZoneID() == member:getZoneID() then
            member:addStatusEffect(xi.effect.REGEN, 5, 3, 180) -- 5 HP/tick Regen for 3 mins
        end
    end
    
    return xi.msg.basic.USES
end)

return m
