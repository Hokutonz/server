-----------------------------------
-- ID: 27556
-- Item: echad ring (Hokutens Ring)
-- Experience point bonus
-----------------------------------
-- Bonus: +200%
-- Duration: 720 min
-- Max bonus: 75000 exp
-----------------------------------
require("modules/module_utils")
--------------------------------------------
local m = Module:new("item_echad_ring")

m:addOverride("xi.items.echad_ring.onItemCheck", function(target)
    local result = 0
    if target:hasStatusEffect(xi.effect.DEDICATION) then
        result = xi.msg.basic.ITEM_UNABLE_TO_USE_2
    end

    return result
end)

m:addOverride("xi.items.echad_ring.onItemUse", function(target)
    local effect    = xi.effect.DEDICATION
    local power     = 200
    local duration  = 43200
    local subpower  = 75000

    xi.itemUtils.addItemExpEffect(target, effect, power, duration, subpower)
end)

return m
