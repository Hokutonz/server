-----------------------------------
-- Area: Al'Taieu
-- NPC: qm_jailer_of_hope (???)
-- !pos -688.591 -0.500 -69.345 33
-- !additem 1852
-- !additem 1851
-- !additem 1850
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
-----------------------------------

local m = Module:new("hope_qm")

m:addOverride("xi.zones.AlTaieu.npcs.qm_jailer_of_hope.onTrade", function(player, npc, trade)
    local ID = require("scripts/zones/AlTaieu/IDs")

    if
        not GetMobByID(ID.mob.JAILER_OF_HOPE):isSpawned() and
        trade:hasItemQty(1850, 1) and -- first_virtue
        trade:hasItemQty(1851, 1) and -- deed_of_placidity
        trade:hasItemQty(1852, 1) and -- high-quality_phuabo_organ
        trade:getItemCount() == 3
    then
        player:tradeComplete()
        SpawnMob(ID.mob.JAILER_OF_HOPE):updateClaim(player)
    end
end)

m:addOverride("xi.zones.AlTaieu.npcs.qm_jailer_of_hope.onTrigger", function(player, npc)
    player:PrintToPlayer(string.format("Knoweth...thou?"), 0xD)

    npc:timer(2000, function(npcArg)
       player:PrintToPlayer(string.format("Firs...irtue..."), 0xD)
    end)

    npc:timer(4000, function(npcArg)
       player:PrintToPlayer(string.format("Deed...tranqu...ser...ity..."), 0xD)
    end)

    npc:timer(6000, function(npcArg)
       player:PrintToPlayer(string.format("...receptac...from phua..."), 0xD)
    end)

    npc:timer(8000, function(npcArg)
       player:PrintToPlayer(string.format("...I...cannot...deciph...them..."), 0xD)
    end)
end)

return m
