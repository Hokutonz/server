------------------------------------
-- Override specific mission/quest functions
-----------------------------------
require("modules/module_utils")
require("scripts/globals/missions")
local cu = require("modules/catseyexi/lua/additive_overrides/utils/custom_util")
-----------------------------------
local m = Module:new("cop_chapter_8_fixes")

local ring =
{
    15543, -- Rajas Ring
    15544, -- Sattva Ring
    15545  -- Tamas Ring
}

-- 8-1 Towers
m:addOverride("xi.zones.AlTaieu.npcs._0x1.onTrigger", function(player, npc)
    if player:getCurrentMission(xi.mission.log_id.COP) == xi.mission.id.cop.GARDEN_OF_ANTIQUITY then
        player:setCharVar("[SEA][AlTieu]SouthTowerCS", 1)
        player:PrintToPlayer("You may now go visit the West Tower.")
    end
end)

m:addOverride("xi.zones.AlTaieu.npcs._0x2.onTrigger", function(player, npc)
    if player:getCurrentMission(xi.mission.log_id.COP) == xi.mission.id.cop.GARDEN_OF_ANTIQUITY then
        player:setCharVar("[SEA][AlTieu]WestTowerCS", 1)
        player:PrintToPlayer("You may now go visit the East Tower.")
    end 
end)

m:addOverride("xi.zones.AlTaieu.npcs._0x3.onTrigger", function(player, npc)
    if player:getCurrentMission(xi.mission.log_id.COP) == xi.mission.id.cop.GARDEN_OF_ANTIQUITY then
        player:setCharVar("[SEA][AlTieu]EastTowerCS", 1)
        player:setCharVar("PromathiaStatus", 3)
        player:PrintToPlayer("You may now return to the Crystalline Field.")
    end
end)


cu.reloadOverride(m, "xi.zones.Upper_Jeuno.npcs._6s1.onTrade", function(player, npc, trade)
    local ID        = require("scripts/zones/Upper_Jeuno/IDs")
    local mission   = player:getCurrentMission(xi.mission.log_id.COP)
    local ringCount = 0

    if mission < xi.mission.id.cop.DAWN then
        return
    end

    for i = 0, trade:getSlotCount()-1 do
        local itemId = trade:getItemId(i)

        if utils.contains(itemId, ring) then
            ringCount = ringCount + 1
        else
            printf("[PM8] %s door traded %u instead of a ring.", player:getName(), itemId)
            return
        end
    end

    if ringCount > 0 then
        player:tradeComplete()
        player:setCharVar("[COP]StoredRing", ringCount)
        player:PrintToPlayer("Items have been stored. Come back to retrieve them after the cutscene.")
    end
end)

m:addOverride("xi.zones.Upper_Jeuno.npcs._6s1.onTrigger", function(player, npc)
    local status = player:getCharVar("PromathiaStatus")
    local mission = player:getCurrentMission(xi.mission.log_id.COP)

    if
        mission == xi.mission.id.cop.DAWN and
        status == 4
    then
        player:startEvent(129)

    elseif
        (mission == xi.mission.id.cop.DAWN and status > 4) or
        player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.DAWN)
    then
        local hasRing = false

        for key, value in pairs(ring) do
            if player:hasItem(value) then
                hasRing = true
            end
        end

        if not hasRing then
            local currentDay = tonumber(os.date("%j"))
            local ringsTaken = player:getCharVar("COP-ringsTakenbr")
            local dateObtained = player:getCharVar("COP-lastRingday")

            if ringsTaken == 0 then
                player:startEvent(84, ring[1], ring[2], ring[3])

            -- First time you throw away, no wait
            elseif ringsTaken == 1 then
                player:startEvent(204, ring[1], ring[2], ring[3])

            -- Wait time is >= 28 days, not 26
            elseif
                ringsTaken > 1 and
                (currentDay - dateObtained) >= 28
            then
                player:startEvent(204, ring[1], ring[2], ring[3])
            end
        end
    end
    
    if player:getCharVar("[COP]StoredRing") > 0 then
        local ringVoucher = player:getCharVar("[COP]StoredRing")
        local menu =
        {
            title = "Ring Storage",
            onStart = function(playerArg)
                -- NOTE: This could be used to lock the player in place
                playerArg:PrintToPlayer(string.format("You have %i ring vouchers available", ringVoucher, xi.msg.channel.NS_SAY))
            end,
            options =
            {
                {
                    "Option 1: Rajas ring",
                    function(playerArg)
                        if ringVoucher > 0 then
                            npcUtil.giveItem(player, 15543)
                            ringVoucher = ringVoucher - 1
                            player:setCharVar("[COP]StoredRing", ringVoucher)
                        else
                            playerArg:PrintToPlayer("You don't have enough vouchers available to complete this transaction.", xi.msg.channel.NS_SAY)
                        end 
                    end,
                },
                {
                    "Option 2: Tamas ring",
                    function(playerArg)
                        if ringVoucher > 0 then
                            npcUtil.giveItem(player, 15545)
                            ringVoucher = ringVoucher - 1
                            player:setCharVar("[COP]StoredRing", ringVoucher)
                        else
                            playerArg:PrintToPlayer("You don't have enough vouchers available to complete this transaction.", xi.msg.channel.NS_SAY)
                        end 
                    end,
                },
                {
                    "Option 3: Sattva ring",
                    function(playerArg)
                        if ringVoucher > 0 then
                            npcUtil.giveItem(player, 15544)
                            ringVoucher = ringVoucher - 1
                            player:setCharVar("[COP]StoredRing", ringVoucher)
                        else
                            playerArg:PrintToPlayer("You don't have enough vouchers available to complete this transaction.", xi.msg.channel.NS_SAY)
                        end 
                    end,
                },
            },
            onCancelled = function(playerArg)
            end,
            onEnd = function(playerArg)
            end,
        }
        player:customMenu(menu)
    end
end)

return m
