-----------------------------------
-- ID: 21096
-- Heartbeater +1 (Rare Ex)
-- [Body] All Races
-- DPS: 47 DMG:2 Delay:257
-- Enchantment: "Synthesis Support" (Cooking)
-- LV 1 WAR MNK WHM BLM RDM THF PLD DRK BST BRD RNG SAM NIN DRG SMN BLU COR PUP DNC SCH GEO RUN
-----------------------------------
require("modules/module_utils")
--------------------------------------------

local m = Module:new("heartbeater_+1")

xi.module.ensureTable("xi.items.heartbeater_+1")

m:addOverride("xi.items.heartbeater_+1.onItemCheck", function(target)
    return 0
end)

m:addOverride("xi.items.heartbeater_+1.onItemUse", function(target)
    target:addStatusEffect(xi.effect.COOKING_IMAGERY, 3, 0, 480)
    target:printToPlayer("Your cooking skills went up a little.", xi.msg.channel.NS_SAY)
end)

return m
