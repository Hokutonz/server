-----------------------------------
-- ID: 21087
-- Heartstopper +1 (Rare Ex)
-- [Main] All Races (Club)
-- DPS: 43 DMG:2 Delay:280
-- Enchantment: Costume
-- LV 1 WAR MNK WHM BLM RDM THF PLD DRK BST BRD RNG SAM NIN DRG SMN BLU COR PUP DNC SCH GEO RUN
-----------------------------------
require("modules/module_utils")
--------------------------------------------

local m = Module:new("heartstopper_+1")

xi.module.ensureTable("xi.items.heartstopper_+1")

m:addOverride("xi.items.heartstopper_+1.onItemCheck", function(target)
    if not target:canUseMisc(xi.zoneMisc.COSTUME) then
        return xi.msg.basic.CANT_BE_USED_IN_AREA
    end

    return 0
end)

m:addOverride("xi.items.heartstopper_+1.onItemUse", function(target)
    local rand = math.random(1, 2)
    if rand == 1 then
        target:addStatusEffect(xi.effect.COSTUME, 3050, 0, 3600) -- Trust: Mumor
    elseif rand == 2 then
        target:addStatusEffect(xi.effect.COSTUME, 3104, 0, 3600) -- Trust: Mumor II
    end
end)

return m
