-----------------------------------
-- Area: Al'Taieu
-- NPC: qm_jailer_of_love (???)
-- !pos 431 -0 -603 33
-- !additem 1847
-- !additem 1848
-- !additem 1849
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
-----------------------------------

local m = Module:new("love_qm")

m:addOverride("xi.zones.AlTaieu.npcs.qm_jailer_of_love.onTrade", function(player, npc, trade)
    local ID = require("scripts/zones/AlTaieu/IDs")

    if
        not GetMobByID(ID.mob.JAILER_OF_LOVE):isSpawned() and
        not GetMobByID(ID.mob.ABSOLUTE_VIRTUE):isSpawned() and
        trade:hasItemQty(1848, 1) and -- fourth_virtue
        trade:hasItemQty(1847, 1) and -- fifth_virtue
        trade:hasItemQty(1849, 1) and -- sixth_virtue
        trade:getItemCount() == 3
    then
        player:tradeComplete()
        SpawnMob(ID.mob.JAILER_OF_LOVE):updateClaim(player)
    end
end)

m:addOverride("xi.zones.AlTaieu.npcs.qm_jailer_of_love.onTrigger", function(player, npc)
    player:PrintToPlayer(string.format("Now...I...know..."), 0xD)

    npc:timer(2000, function(npcArg)
       player:PrintToPlayer(string.format("Fourt...irtue..."), 0xD)
    end)

    npc:timer(4000, function(npcArg)
       player:PrintToPlayer(string.format("Fif...irtue..."), 0xD)
    end)

    npc:timer(6000, function(npcArg)
       player:PrintToPlayer(string.format("Sssix...irtue..."), 0xD)
    end)

    npc:timer(8000, function(npcArg)
       player:PrintToPlayer(string.format("I...desssire..."), 0xD)
    end)
end)

return m
