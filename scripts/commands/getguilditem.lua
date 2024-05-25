-----------------------------------
-- func: getcraftRank <craft skill or ID> (player)
-- desc: returns target's RANK of specified craft skill
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 2,
    parameters = 'is'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!getcraftRank <guild ID> (player)')
end

commandObj.onTrigger = function(player, guildID, target)
    if guildID == nil then
        error(player, 'You must specify a guild ID to check!')
        return
    end

    local gID = tonumber(guildID)
    local targ = nil

    if gID == nil or gID < 0 or gID > 8 then
        error(player, 'You must specify a valid guild ID.')
        return
    end

    if target == nil then
        if player:getCursorTarget() == nil then
            targ = player
        else
            if player:getCursorTarget():isPC() then
                targ = player:getCursorTarget()
            else
                error(player, 'You must target a player or specify a name.')
                return
            end
        end
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            player:printToPlayer(string.format('Player named "%s" not found!', target))
            return
        end
    end

    local gpItem, remainingPoints = player:getCurrentGPItem(gID)
    local rank                    = player:getSkillRank(xi.crafting.guildTable[gID][1])
    player:printToPlayer(string.format('%s\'s GP Item: %u, Remaining: %u rank: %u', targ:getName(), gpItem, remainingPoints, rank))
end

return commandObj
