-----------------------------------
require("modules/module_utils")
-----------------------------------

    npc =
    {
                PORTALS      =
        {               --   West X     Y    South Z    East X     Y    North Z
            { coords = {    -610,       0,   36,        -608,      0,   44,       0, -610 }, event = 51          }, -- exit colosseum

        }
    }

local m = Module:new("the_colosseum")
-----------------------------------------------------------------------------------
--- below code to activate the portals---------------------------------------------
-----------------------------------------------------------------------------------
m:addOverride('xi.zones.The_Colosseum.Zone.onInitialize', function(zone)
    super(zone)
        for k, v in pairs(npc.PORTALS) do
        zone:registerTriggerArea(k, unpack(v['coords']))
        end
end)

m:addOverride('xi.zones.The_Colosseum.Zone.onTriggerAreaEnter', function(player, triggerArea)
local p = npc.PORTALS[triggerArea:GetTriggerAreaID()]
player:startOptionalCutscene(p['event'])
player:setPos(80.2866, 0.0000, -103.8602, 194, 50)
end)


return m

