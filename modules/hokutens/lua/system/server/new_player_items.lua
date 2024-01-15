-----------------------------------
-- Hand out custom server items and linkpearl to new players
-----------------------------------
require('modules/module_utils')
require('scripts/globals/player')
-----------------------------------
local m = Module:new('new_player_items')

m:addOverride('xi.player.charCreate', function(player)
    local lsName = 'Hokutens' -- Name of linkshell
    player:addItem(10293) -- Chocobo Shirt
	player:addItem(11811) -- Destrier Beret
    player:addLinkpearl(lsName, true)
    super(player)
end)

return m
