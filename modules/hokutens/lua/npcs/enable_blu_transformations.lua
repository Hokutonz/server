-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: Blank (Transformations Quest)
-- !pos 529.704 0.000 649.682 72
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
-----------------------------------

local m = Module:new("enable_blu_transformations")

m:addOverride("xi.zones.Alzadaal_Undersea_Ruins.npcs.blank_transformations.onTrigger", function(player, npc)
    local transformationsProgress = player:getCharVar("TransformationsProgress")
    -- TRANSFORMATIONS
    if transformationsProgress == 4 then
        -- TODO: Nepionic Soulflayer disabled until its skill list is fully implemented
        player:startEvent(4)
        -- player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    elseif transformationsProgress == 5 then
        player:startEvent(5)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end)

m:addOverride("xi.zones.Alzadaal_Undersea_Ruins.npcs.blank_transformations.onEventFinish", function(player, csid, option, npc)
    if csid == 4 then
        npcUtil.popFromQM(player, GetNPCByID(ID.npc.NEPIONIC_QM), ID.mob.NEPIONIC_SOULFLAYER, {hide = 1})
    elseif csid == 5 then
        npcUtil.completeQuest(player, xi.quest.log_id.AHT_URHGAN, xi.quest.id.ahtUrhgan.TRANSFORMATIONS, {
            item = 15265,
            title = xi.title.PARAGON_OF_BLUE_MAGE_EXCELLENCE,
            var = {"TransformationsProgress"}
        })
    end
end)

return m
