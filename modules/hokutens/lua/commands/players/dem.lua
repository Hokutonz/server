-----------------------------------------------
-- func !dem
-- desc Sned player to the DEM_GATE_CRYSTAL
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

-- Check if player has enmity
  if player:hasEnmity() then
  player:printToPlayer('You cant use this command when you have Enmity.')
  return
end

   if not player:hasKeyItem(xi.ki.DEM_GATE_CRYSTAL) then
   player:printToPlayer('You need the Dem Gate Crystal to use this command.')
   return
end

player:injectActionPacket(player:getID(), 4, 122, 0, 0, 0, 10, 1)
player:timer(4000, function()
player:setPos(220.0000, 19.1040, 300.0000, 0, xi.zone.KONSCHTAT_HIGHLANDS)

end)

end

return commandObj