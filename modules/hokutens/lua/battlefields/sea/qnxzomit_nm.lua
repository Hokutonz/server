-----------------------------------
-- Area: Al'Taieu
--  Mob: Qn'xzomit
-- Note: Pet for JOL and JOJ
-----------------------------------
require("modules/module_utils")
require("scripts/mixins/job_special")
local ID = require("scripts/zones/AlTaieu/IDs")
-----------------------------------
local Qnxzomit = Module:new("qnxzomit_nm")

xi.module.ensureTable("xi.zones.AlTaieu.mobs.Qnxzomit")

Qnxzomit:addOverride("xi.zones.AlTaieu.mobs.Qnxzomit.onMobInitialize", function(mob)
    g_mixins.job_special(mob)
end)

Qnxzomit:addOverride("xi.zones.AlTaieu.mobs.Qnxzomit.onMobSpawn", function(mob)
        xi.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = xi.jsa.MIJIN_GAKURE, hpp = math.random(25, 35)},
        },
    })
    mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
    mob:addStatusEffectEx(xi.effect.FLEE, 0, 100, 0, 60)
end)

Qnxzomit:addOverride("xi.zones.AlTaieu.mobs.Qnxzomit.onMobDespawn", function(mob)
    if (mob:getID() > ID.mob.JAILER_OF_LOVE) then
        local jailerOfLove = GetMobByID(ID.mob.JAILER_OF_LOVE)
        local xzomitsKilled = jailerOfLove:getLocalVar("JoL_Qn_xzomit_Killed")
        jailerOfLove:setLocalVar("JoL_Qn_xzomit_Killed", xzomitsKilled + 1)
    end
end)

return Qnxzomit
