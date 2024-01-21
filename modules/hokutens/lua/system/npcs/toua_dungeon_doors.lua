-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
-----------------------------------
local m = Module:new("toua_dungeon_doors")
xi.module.ensureTable("xi.zones.Mamook.npcs._1t2")
xi.module.ensureTable("xi.zones.Arrapago_Reef.npcs._ji7")
-----------------------------------
-- Area: Mamook
-- NPC: Mahogany Door _1t2
-- !pos -240.8226 17.6597 -380.3431 65
-----------------------------------
m:addOverride("xi.zones.Mamook.npcs._1t2.onTrade", function(player, npc, trade)
    if
        npcUtil.tradeHasExactly(trade,
        {
            2224, -- mamook_silverscale_key
            2225, -- mamook_tanscale_key
            2226  -- mamook_blackscale_key
        })
    then
        player:confirmTrade()
        npc:openDoor()
        player:PrintToPlayer("Your keys are destroyed, but the door opens.", 0xD)
    end
end)

m:addOverride("xi.zones.Mamook.npcs._1t2.onTrigger", function(player, npc)
    if player:getXPos() <= -242.3022 and npc:getAnimation() == xi.anim.CLOSE_DOOR then -- from inside the door
        npc:openDoor()
    else
        player:PrintToPlayer("A sturdy door with three locks.", 0xD)
    end
end)

m:addOverride("xi.zones.Mamook.npcs._1t2.onEventUpdate", function(player, csid, option)
end)

m:addOverride("xi.zones.Mamook.npcs._1t2.onEventFinish", function(player, csid, option)
end)
-----------------------------------
-- Area: Arrapago Reef
-- NPC: Tidal Gate _ji7
-- !pos -403.5278 -15.6225 419.9711 54
-----------------------------------
m:addOverride("xi.zones.Arrapago_Reef.npcs._ji7.onTrade", function(player, npc, trade)
    if
        npcUtil.tradeHasExactly(trade,
        {
            2218, -- lamian_claw_key
            2219, -- lamian_fang_key
            2220  -- lamian_bone_Key
        })
    then
        player:confirmTrade()
        npc:openDoor()
        player:PrintToPlayer("Your keys are destroyed, but the magical gate opens.", 0xD)
    end
end)

m:addOverride("xi.zones.Arrapago_Reef.npcs._ji7.onTrigger", function(player, npc)
    if player:getXPos() <= -408 and npc:getAnimation() == xi.anim.CLOSE_DOOR then -- from inside the door
        npc:openDoor()
    else
        player:PrintToPlayer("A magical gate with three keyholes.", 0xD)
    end
end)

m:addOverride("xi.zones.Arrapago_Reef.npcs._ji7.onEventUpdate", function(player, csid, option)
end)

m:addOverride("xi.zones.Arrapago_Reef.npcs._ji7.onEventFinish", function(player, csid, option)
end)

return m
