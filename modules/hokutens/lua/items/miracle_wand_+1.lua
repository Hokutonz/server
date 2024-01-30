-----------------------------------
-- ID: 18845
-- Miracle Wand +1 (Rare Ex)
-- [Main] All Races (Club)
-- DPS: 68 DMG:3 Delay:264
-- Enchantment: Adds "Regen" effect to party member
-- LV 1 WAR MNK WHM BLM RDM THF PLD DRK BST BRD RNG SAM NIN DRG SMN BLU COR PUP DNC SCH GEO RUN
-----------------------------------
require("modules/module_utils")
--------------------------------------------

local m = Module:new("miracle_wand_+1")

xi.module.ensureTable("xi.items.miracle_wand_+1")

m:addOverride("xi.items.miracle_wand_+1.onItemCheck", function(target)
    return 0
end)

m:addOverride("xi.items.miracle_wand_+1.onItemUse", function(target)
    
    local party = target:getPartyWithTrusts()

    for _, member in pairs(party) do
        if target:getZoneID() == member:getZoneID() then
            member:addStatusEffect(xi.effect.REGEN, 5, 3, 180) -- 5 HP/tick Regen for 3 mins
        end
    end
    
    return xi.msg.basic.USES
end)

return m
