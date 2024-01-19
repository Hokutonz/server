-----------------------------------
-- Crystal Merchant (Leafallia)
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
require("scripts/globals/missions")
require("modules/module_utils")
require("scripts/zones/Leafallia/Zone")
local ID = require("scripts/zones/Leafallia/IDs")
-----------------------------------
local m = Module:new("claim_rewards")

m:addOverride("xi.zones.Leafallia.Zone.onInitialize", function(zone)
    super(zone)

    local claimrewards = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Claim Rewards",
        look = 969,
        x = -28.2609,
        y = -0.4081,
        z = 4.2968,
        rotation = 197,
        widescan = 1,

        onTrade = function(player, npc, trade)
        end,

        onTrigger = function(player, npc)
            if player:getMainLvl() == 75 and not player:hasKeyItem(xi.ki.RHAPSODY_IN_WHITE) then
                player:addKeyItem(xi.ki.RHAPSODY_IN_WHITE)
                player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.RHAPSODY_IN_WHITE)
            end
            if (player:getSkillLevel(xi.skill.FISHING) >= 100 or
               player:getSkillLevel(xi.skill.WOODWORKING) >= 100 or
               player:getSkillLevel(xi.skill.SMITHING) >= 100 or
               player:getSkillLevel(xi.skill.GOLDSMITHING) >= 100 or
               player:getSkillLevel(xi.skill.CLOTHCRAFT) >= 100 or
               player:getSkillLevel(xi.skill.LEATHERCRAFT) >= 100 or
               player:getSkillLevel(xi.skill.BONECRAFT) >= 100 or
               player:getSkillLevel(xi.skill.ALCHEMY) >= 100 or
               player:getSkillLevel(xi.skill.COOKING) >= 100) and
               not player:hasKeyItem(xi.ki.RHAPSODY_IN_CRIMSON) then
                player:addKeyItem(xi.ki.RHAPSODY_IN_CRIMSON)
                player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.RHAPSODY_IN_CRIMSON)
            end
        end,
    })

    utils.unused(claimrewards)
end)

return m
