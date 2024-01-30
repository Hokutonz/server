-----------------------------------
-- ID: 18400
-- Charm Wand +1 (Rare Ex)
-- [Main] All Races (Club)
-- DPS: 68 DMG:3 Delay:264
-- Enchantment: "Reraise" on self and all party members within zone
-- LV 1 WAR MNK WHM BLM RDM THF PLD DRK BST BRD RNG SAM NIN DRG SMN BLU COR PUP DNC SCH GEO RUN
-----------------------------------
require("modules/module_utils")
--------------------------------------------

local m = Module:new("charm_wand_+1")

xi.module.ensureTable("xi.items.charm_wand_+1")

m:addOverride("xi.items.charm_wand_+1.onItemCheck", function(target)
    return 0
end)

m:addOverride("xi.items.charm_wand_+1.onItemUse", function(target)
    local partyMembers = target:getAlliance()
    local membersInZone = {}

    for i = 1, #partyMembers do
        if target:getZoneID() == partyMembers[i]:getZoneID() then
            if partyMembers[i]:isPC() then
                partyMembers[i]:addStatusEffect(xi.effect.RERAISE, 1, 0, 3600) --reraise 1, 30min duration
            end
        end
    end
    
    return xi.msg.basic.USES
end)

return m
