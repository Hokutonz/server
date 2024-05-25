-----------------------------------
-- func: trustsub
-- desc: Changes the sub-animation of the given trust. (For testing purposes.)
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 2,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!mobsub <animation ID>')
end

commandObj.onTrigger = function(player, arg1)
    local animationId

    if arg1 == nil then
        error(player, 'You must provide an animation ID.')
        return
    end

    -- validate target
    local targ

    targ = player:getCursorTarget()
    if targ == nil then
        error(player, 'You must target a mob.')
        return
    end

    -- validate animationId
    animationId = tonumber(arg1) or xi.anim[string.upper(arg1)]
    if animationId == nil or animationId < 0 then
        error(player, 'Invalid animation ID.')
        return
    end

    -- set animation sub
    targ:setAnimation(animationId)
end

return commandObj
