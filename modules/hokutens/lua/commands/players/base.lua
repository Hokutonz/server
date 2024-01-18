-----------------------------------
-- func: base
-- desc: Sends the player to server !base (Leafallia)
-----------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'is',
}

commandObj.onTrigger = function(player)
    if player:getCharVar('inJail') == 0 then
        player:setPos(0.3724, -0.4672, -0.0169, 153, 281)
    end
end

return commandObj