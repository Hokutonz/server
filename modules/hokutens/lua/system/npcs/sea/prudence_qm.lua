-----------------------------------
--  Area: Al'Taieu
--  NPC: qm_jailer_of_prudence (???)
-- !pos 706.6854 -1.0802 20.8859 33
-- !additem 1856
-- !additem 1870
-- !additem 1871
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
-----------------------------------

local m = Module:new("prudence_qm")

m:addOverride("xi.zones.AlTaieu.npcs.qm_jailer_of_prudence.onTrade", function(player, npc, trade)
    local ID = require("scripts/zones/AlTaieu/IDs")

     -- JAILER OF PRUDENCE
    if
        not GetMobByID(ID.mob.JAILER_OF_PRUDENCE_1):isSpawned() and
        not GetMobByID(ID.mob.JAILER_OF_PRUDENCE_2):isSpawned() and
        trade:hasItemQty(1856, 1) and -- third_virtue
        trade:hasItemQty(1870, 1) and -- deed_of_sensibility
        trade:hasItemQty(1871, 1) and -- high-quality_hpemde_organ
        trade:getItemCount() == 3
    then
        player:tradeComplete()
        SpawnMob(ID.mob.JAILER_OF_PRUDENCE_1):updateClaim(player) -- Spawn Jailer of Prudence 1
        SpawnMob(ID.mob.JAILER_OF_PRUDENCE_2)                     -- Spawn Jailer of Prudence 2 unclaimed
    end
end)

m:addOverride("xi.zones.AlTaieu.npcs.qm_jailer_of_prudence.onTrigger", function(player, npc)
    player:PrintToPlayer(string.format("Seeketh...thou?"), 0xD)

    npc:timer(2000, function(npcArg)
        player:PrintToPlayer(string.format("Thir...irtue"), 0xD)
    end)

    npc:timer(4000, function(npcArg)
        player:PrintToPlayer(string.format("Deed...rationa..."), 0xD)
    end)

    npc:timer(6000, function(npcArg)
       player:PrintToPlayer(string.format("...receptac...from Hpem..."), 0xD)
    end)

    npc:timer(8000, function(npcArg)
        player:PrintToPlayer(string.format("...cannot...omprehend...them"), 0xD)
    end)
end)

return m
