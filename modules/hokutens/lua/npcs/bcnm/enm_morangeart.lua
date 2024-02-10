-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Morangeart
-- Type: ENM Quest Activator
-- !pos -74.308 -24.782 -28.475 26
-----------------------------------
require("scripts/globals/utils")
require("modules/module_utils")
-----------------------------------
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
-----------------------------------

local m = Module:new("enm_morganheart")

xi.module.ensureTable("xi.zones.Tavnazian_Safehold.Morangeart")

m:addOverride("xi.zones.Tavnazian_Safehold.npcs.Morangeart.onTrigger", function(player, npc)
    local cd = player:getCharVar("[ENM]MonarchBeard")

    if
        player:getCurrentMission(xi.mission.log_id.COP) > xi.mission.id.cop.AN_ETERNAL_MELODY and
        cd < VanadielTime()
    then
        if player:hasKeyItem(xi.ki.MONARCH_BEARD) then
            player:startEvent(520)
        else
            player:startEvent(521)
        end
    elseif
        player:getCurrentMission(xi.mission.log_id.COP) > xi.mission.id.cop.AN_ETERNAL_MELODY and
        cd > VanadielTime()
    then
        player:startEvent(522, cd)
    else
        player:startEvent(523)
    end
end)

m:addOverride("xi.zones.Tavnazian_Safehold.npcs.Morangeart.onEventFinish", function(player, csid, option)
    if csid == 521 then
        player:addKeyItem(xi.ki.MONARCH_BEARD)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.MONARCH_BEARD)
        player:setCharVar("[ENM]MonarchBeard", VanadielTime() + (xi.settings.main.ENM_COOLDOWN * 3600)) -- Current time + (ENM_COOLDOWN*1hr in seconds)
    end
end)

return m
