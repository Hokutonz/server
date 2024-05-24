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
   if player:getCharVar('inJail') > 0 then
   player:printToPlayer('You are in jail buddy....you aint going no where!')
   return
end

-- Check if player has enmity
  if player:hasEnmity() then
  player:printToPlayer('You cant use this command when you have Enmity.')
  return
end
            
   player:injectActionPacket(player:getID(), 6, 200, 0, 0, 0, 10, 1)
   player:timer(2600, function()
   player:setPos(0.3724, -0.4672, -0.0169, 153, 281)
    
end)

end

return commandObj