-----------------------------------
-- ID: 26789
-- Shobuhouou Kabuto (Rare Ex)
-- [Head] All Races
-- DEF:1 Enchantment: Raise
-- LV 1 WAR MNK WHM BLM RDM THF PLD DRK BST BRD RNG SAM NIN DRG SMN BLU COR PUP DNC SCH GEO RUN
-----------------------------------
require("modules/module_utils")
--------------------------------------------

local m = Module:new("shobuhouou_kabuto")

xi.module.ensureTable("xi.items.shobuhouou_kabuto")

m:addOverride("xi.items.shobuhouou_kabuto.onItemCheck", function(target)
    if not target:isPC() or not target:isDead() then
        return xi.msg.basic.ITEM_UNABLE_TO_USE
    end

    return 0
end)

m:addOverride("xi.items.shobuhouou_kabuto.onItemUse", function(target)
    if target:isPC() and target:isDead() then
        target:sendRaise(1)
        return xi.msg.basic.USES
    end
end)

return m
