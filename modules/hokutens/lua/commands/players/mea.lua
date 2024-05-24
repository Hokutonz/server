-----------------------------------------------
-- func !mea
-- desc Sned player to the MEA_GATE_CRYSTAL
-----------------------------------------------

commandObj = {}
commandObj.cmdprops = 
{ 
permission = 0, 
parameters = "" 
}
commandObj.onTrigger = function(player)
   if player:getCharVar('inJail') > 0 then
   player:printToPlayer('You are in jail buddy....you aint going no where!')
   return
end

  if player:hasEnmity() then
  player:printToPlayer('You cant use this command when you have Enmity.')
  return
end

   if not player:hasKeyItem(xi.ki.MEA_GATE_CRYSTAL) then
   player:printToPlayer('You need a Gate Crystal to use this command.')
   return
end

   player:injectActionPacket(player:getID(), 4, 122, 0, 0, 0, 10, 1)
   player:timer(4000, function()
   player:setPos(100.0000, 35.1506, 340.0000, 198, xi.zone.TAHRONGI_CANYON)

end)

end

return commandObj