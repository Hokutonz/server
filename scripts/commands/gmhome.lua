-----------------------------------
-- func: gmhome
-- desc: Sends you to zone 210 (GM_HOME), if you are a GM
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 5,
    parameters = ''
}

commandObj.onTrigger = function(player)
    player:setPos(0, 0, 0, 0, xi.zone.GM_HOME)
end

return commandObj
