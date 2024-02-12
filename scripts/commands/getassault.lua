-----------------------------------
-- Func: getassault
-- Desc: Gets the current assault assigned the target player.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!getassault <player>')
end

commandObj.onTrigger = function(player, target)
    local targ
    if target == nil then
        if player:getCursorTarget() == nil then
            error(player, 'You must provide a player name.')
            return
        else
            targ = player:getCursorTarget()
        end
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    local currentAssault = targ:getCurrentAssault()
    player:printToPlayer(string.format('%s\'s current assault : %u', targ:getName(), currentAssault))
end

return commandObj
