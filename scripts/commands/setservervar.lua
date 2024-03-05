-----------------------------------
-- func: checkvar <varType> <varName>
-- desc: checks player or server variable and returns result value.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 5,
    parameters = 'si'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!setservervar <variable name> <value>')
end

commandObj.onTrigger = function(player, arg1, arg2)
    -- validate var
    if (arg1 == nil) then
        error(player, "You must provide a variable name.")
        return
    end

    -- validate value
    if (arg2 == nil) then
        error(player, "You must provide a value.")
        return
    end

    SetServerVariable(arg1, arg2)
    player:printToPlayer( string.format( "Set server variable '%s' to %i.", arg1, arg2 ) )
end

return commandObj