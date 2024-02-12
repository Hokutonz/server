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
            if npcUtil.tradeHasExactly(trade, { xi.item.EARTH_STAFF, xi.item.WATER_STAFF,
                                    xi.item.WIND_STAFF, xi.item.FIRE_STAFF, xi.item.ICE_STAFF,
                                    xi.item.THUNDER_STAFF, xi.item.LIGHT_STAFF, xi.item.DARK_STAFF })
            then
                player:tradeComplete()
                player:addItem(xi.item.IRIDAL_STAFF, 1)
            end
            if npcUtil.tradeHasExactly(trade, { xi.item.TERRAS_STAFF, xi.item.NEPTUNES_STAFF,
                                    xi.item.AUSTERS_STAFF, xi.item.VULCANS_STAFF, xi.item.AQUILOS_STAFF,
                                    xi.item.JUPITERS_STAFF, xi.item.APOLLOS_STAFF, xi.item.PLUTOS_STAFF })
            then
                player:tradeComplete()
                player:addItem(xi.item.CHATOYANT_STAFF, 1)
            end
        end,

        onTrigger = function(player, npc)
            if player:getMainLvl() == 75 and not player:hasKeyItem(xi.ki.RHAPSODY_IN_WHITE) then
                player:addKeyItem(xi.ki.RHAPSODY_IN_WHITE)
                player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.RHAPSODY_IN_WHITE)
            end
            if (player:getSkillLevel(xi.skill.FISHING) >= 3200 or
               player:getSkillLevel(xi.skill.WOODWORKING) >= 3200 or
               player:getSkillLevel(xi.skill.SMITHING) >= 3200 or
               player:getSkillLevel(xi.skill.GOLDSMITHING) >= 3200 or
               player:getSkillLevel(xi.skill.CLOTHCRAFT) >= 3200 or
               player:getSkillLevel(xi.skill.LEATHERCRAFT) >= 3200 or
               player:getSkillLevel(xi.skill.BONECRAFT) >= 3200 or
               player:getSkillLevel(xi.skill.ALCHEMY) >= 3200 or
               player:getSkillLevel(xi.skill.COOKING) >= 3200) and
               not player:hasKeyItem(xi.ki.RHAPSODY_IN_CRIMSON) then
                player:addKeyItem(xi.ki.RHAPSODY_IN_CRIMSON)
                player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.RHAPSODY_IN_CRIMSON)
            end
        end,
    })

    utils.unused(claimrewards)
end)

return m
