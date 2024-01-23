-----------------------------------
-- Allow all crafts to reach 100
-----------------------------------
require('modules/module_utils')
require('scripts/globals/crafting')
-----------------------------------
local m = Module:new('all_crafts_hundred')

m:addOverride('xi.crafting.unionRepresentativeEventUpdateRenounce', function(player, craftID)
end)

m:addOverride('xi.crafting.unionRepresentativeTriggerRenounceCheck', function(player, eventId, realSkill, rankCap, param3)
    return false
end)

return m
