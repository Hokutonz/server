-----------------------------------
-- Area: Boneyard Gully
-- Mob: Cadaver Warrior
-- ENM: Totentanz
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("totentanz_cadaver_warrior")

xi.module.ensureTable("xi.zones.Boneyard_Gully.mobs.Cadaver_Warrior")

m:addOverride("xi.zones.Boneyard_Gully.mobs.Cadaver_Warrior.onMobSpawn", function(mob)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), xi.behavior.NO_DESPAWN))
    mob:setMod(xi.mod.LULLABYRES, 70)
    mob:setMod(xi.mod.SILENCERES, 70)
    mob:setMod(xi.mod.BINDRES, 70)

    mob:timer(3000, function(mobArg)
        if mobArg:getBattlefield():getLocalVar("undeadControl") == 0 then
            mobArg:setHP(0)
        end
    end)
end)

m:addOverride("xi.zones.Boneyard_Gully.mobs.Cadaver_Warrior.onMobDeath", function(mob, player, optParams)
    mob:hideName(true)
end)

return m
