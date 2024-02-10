-----------------------------------
-- Jailer_of_Justice
-- !pos -278 0 -463 33
-- !additem 1853
-- !additem 1854
-- !additem 1855
-----------------------------------
require("modules/module_utils")
require("scripts/mixins/job_special")
require("scripts/mixins/rage")
require("scripts/globals/mobs")
require("scripts/globals/magic")
-----------------------------------
local justice = Module:new("justice_nm")

xi.module.ensureTable("xi.zones.AlTaieu.mobs.Jailer_of_Justice")

-- Qn'xzomit pet IDs to despawn
local despawnMobTable =
{
    16912840,
    16912841,
    16912842,
    16912843,
    16912844,
    16912845,
}

local spawnXzomit = function(mob, xzomit)
    mob:entityAnimationPacket("casm")
    mob:setAutoAttackEnabled(false)
    mob:setMobAbilityEnabled(false)
    local x = mob:getXPos()
    local y = mob:getYPos()
    local z = mob:getZPos()
    mob:timer(3000, function(mobArg)
        if mob:isAlive() then
            mobArg:entityAnimationPacket("shsm")
            mobArg:setAutoAttackEnabled(true)
            mobArg:setMobAbilityEnabled(true)
            GetMobByID(xzomit):setSpawn(x + math.random(1, 2), y, z + math.random(1, 2))
            SpawnMob(xzomit, 300):updateEnmity(mobArg:getTarget())
        end
    end)
end

justice:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Justice.onMobInitialize", function(mob)
    g_mixins.job_special(mob)
    g_mixins.rage(mob)
    mob:setMod(xi.mod.STUNRES, 100)
    mob:setMod(xi.mod.BLINDRES, 100)
    mob:setMod(xi.mod.BINDRES, 100)
    mob:setMod(xi.mod.GRAVITYRES, 100)
    mob:setMod(xi.mod.SLEEPRES, 100)
    mob:setMod(xi.mod.POISONRES, 100)
    mob:setMod(xi.mod.PARALYZERES, 100)
    mob:setMod(xi.mod.LULLABYRES, 100)
    mob:setMod(xi.mod.FIRE_MEVA, 100)
    mob:setMod(xi.mod.ICE_MEVA, 100)
    mob:setMod(xi.mod.WIND_MEVA, 100)
    mob:setMod(xi.mod.EARTH_MEVA, 100)
    mob:setMod(xi.mod.THUNDER_MEVA, 100)
    mob:setMod(xi.mod.WATER_MEVA, 100)
    mob:setMod(xi.mod.LIGHT_MEVA, 100)
    mob:setMod(xi.mod.DARK_MEVA, 100)
    mob:setMod(xi.mod.FIRE_SDT, 100)
    mob:setMod(xi.mod.ICE_SDT, 100)
    mob:setMod(xi.mod.WIND_SDT, 100)
    mob:setMod(xi.mod.EARTH_SDT, 100)
    mob:setMod(xi.mod.THUNDER_SDT, 100)
    mob:setMod(xi.mod.WATER_SDT, 100)
    mob:setMod(xi.mod.LIGHT_SDT, 100)
    mob:setMod(xi.mod.DARK_SDT, 100)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 10)
    mob:addMod(xi.mod.MDEF, 20)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:addStatusEffect(xi.effect.REGAIN, 30, 3, 0)
end)

justice:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Justice.onMobSpawn", function(mob)
    mob:addMod(xi.mod.ATT, 217) -- 650 total atk
    mob:addMod(xi.mod.DEF, 247) -- 630 total def
    mob:addMod(xi.mod.EVA, 88) -- 425 total eva
    mob:setLocalVar("familiarTrigger", math.random(40, 60))
    mob:setLocalVar("canCharm", os.time() + 240)
    mob:setAutoAttackEnabled(true)
    mob:setMobAbilityEnabled(true)
    mob:setLocalVar("[rage]timer", 1800) -- 30 minutes
end)

justice:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Justice.onMobFight", function(mob, target)
    if mob:getHPP() < mob:getLocalVar("familiarTrigger") and mob:getLocalVar("familiar") == 0 then
        mob:setLocalVar("twohour_tp", mob:getTP())
        mob:useMobAbility(740)
        mob:setLocalVar("familiar", 1)
    end

    local popTime = mob:getLocalVar("lastPetPop")
    -- ffxiclopedia says 30 sec, bgwiki says 1-2 min..
    -- confirmed retail capture spawns xzomits every 30 seconds..
    if os.time() - popTime > 30 then
        local alreadyPopped = false
		for xzomit = 16912840, 16912845 do
            if alreadyPopped == true then
                break
            else
                if
                    not GetMobByID(xzomit):isSpawned() and
                    mob:canUseAbilities() == true
                then
                    spawnXzomit(mob, xzomit)
                    mob:setLocalVar("lastPetPop", os.time())
                    alreadyPopped = true
                end
            end
        end
    end

    if os.time() > mob:getLocalVar("canCharm") then
        mob:setLocalVar("canCharm", os.time() + 240)
        mob:setLocalVar("twohour_tp", mob:getTP())
        mob:useMobAbility(710)
    end
end)

justice:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Justice.onMobWeaponSkill", function(target, mob, skill)
    if skill:getID() == 740 then
        mob:addTP(mob:getLocalVar("twohour_tp"))
        mob:setLocalVar("twohour_tp", 0)
    elseif skill:getID() == 710 then
        mob:addTP(mob:getLocalVar("twohour_tp"))
        mob:setLocalVar("twohour_tp", 0)
    end
end)
-- Despawn pets or else they will just stay up if not killed.
justice:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Justice.onMobDespawn", function(mob, player, isKiller)
    for _, despawnMob in ipairs(despawnMobTable) do
	    DespawnMob(despawnMob)
    end
end)

justice:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Justice.onMobDeath", function(mob, player, isKiller)
    for _, despawnMob in ipairs(despawnMobTable) do
	    DespawnMob(despawnMob)
    end
end)

return justice
