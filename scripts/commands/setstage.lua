-----------------------------------
-- func: setStage
-- desc: changes stage inside an instance
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 5,
    parameters = 'i'
}

commandObj.onTrigger = function(player, stage)
    local zone = player:getZone()

    if zone:getTypeMask() == xi.zoneType.INSTANCED then
        local instance = player:getInstance()
        local startStage = instance:getStage()

        instance:setStage(stage)

        player:printToPlayer(string.format('Stage changed from %i to %i', startStage, stage))
    else
        player:printToPlayer('Must be in an Instanced zone')
    end
end

return commandObj
