-----------------------------------
-- Area: Al'Taieu
-- NPC: qm_jailer_of_justice (???)
-- Allows players to spawn the Jailer of Justice by trading the Second Virtue, Deed of Moderation, and HQ Xzomit Organ to a ???.
-- !pos -278 0 -463 33
-- !additem 1853
-- !additem 1854
-- !additem 1855
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
-----------------------------------

local m = Module:new("justice_qm")

m:addOverride("xi.zones.AlTaieu.npcs.qm_jailer_of_justice.onTrade", function(player, npc, trade)
    local ID = require("scripts/zones/AlTaieu/IDs")

    if
        not GetMobByID(ID.mob.JAILER_OF_JUSTICE):isSpawned() and
        trade:hasItemQty(1853, 1) and -- second_virtue
        trade:hasItemQty(1854, 1) and -- deed_of_moderation
        trade:hasItemQty(1855, 1) and -- hq_xzomit_organ
        trade:getItemCount() == 3
    then
        player:tradeComplete()
        SpawnMob(ID.mob.JAILER_OF_JUSTICE):updateClaim(player)
    end
end)

m:addOverride("xi.zones.AlTaieu.npcs.qm_jailer_of_justice.onTrigger", function(player, npc)
    player:PrintToPlayer(string.format("Desssireth...thou?"), 0xD)

    npc:timer(2000, function(npcArg)
        player:PrintToPlayer(string.format("Sssecond...irtue..."), 0xD)
    end)

    npc:timer(4000, function(npcArg)
        player:PrintToPlayer(string.format("Deed...ressstraint...willpo...er..."), 0xD)
    end)

    npc:timer(6000, function(npcArg)
        player:PrintToPlayer(string.format("...from...fallen...Xzom..."), 0xD)
    end)

    npc:timer(8000, function(npcArg)
        player:PrintToPlayer(string.format("...cannot...derssstand...them"), 0xD)
    end)
end)

return m
