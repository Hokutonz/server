-----------------------------------
-- Area: Riverne Site #B01
--  NPC: Spatial Displacement
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/bcnm")
require("modules/module_utils")
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_B01/IDs")
local m  = Module:new("wyrmking_unstable_displacement")
-----------------------------------
xi.module.ensureTable("xi.zones.Riverne-Site_B01.npcs.Unstable_Dispacement")

m:addOverride("xi.zones.Riverne-Site_B01.npcs.Unstable_Dispacement.onTrade", function(player, npc, trade)
    xi.bcnm.onTrade(player, npc, trade)
end)

m:addOverride("xi.zones.Riverne-Site_B01.npcs.Unstable_Dispacement.onTrigger", function(player, npc)
    if not xi.bcnm.onTrigger(player, npc) then
        player:messageSpecial(ID.text.SPACE_SEEMS_DISTORTED)
    end
end)

m:addOverride("xi.zones.Riverne-Site_B01.npcs.Unstable_Dispacement.onEventUpdate", function(player, csid, option, extras)
    xi.bcnm.onEventUpdate(player, csid, option, extras)
end)

m:addOverride("xi.zones.Riverne-Site_B01.npcs.Unstable_Dispacement.onEventFinish", function (player, csid, option)
end)

return m
