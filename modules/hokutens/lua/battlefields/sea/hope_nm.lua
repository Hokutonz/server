
-----------------------------------
-- Area: Al'Taieu
-- NM: Jailer of Hope
-- Jailer_of_Hope
-- !pos -688.591 -0.500 -69.345 33
-- !additem 1852
-- !additem 1851
-- !additem 1850
-----------------------------------
require("modules/module_utils")
require("scripts/globals/mobs")
require("scripts/mixins/job_special")
-----------------------------------

local m = Module:new("hope_nm")

xi.module.ensureTable("xi.zones.AlTaieu.mobs.Jailer_of_Hope")

m:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Hope.onMobInitialize", function(mob)
    g_mixins.job_special(mob)
    mob:setMod(xi.mod.SILENCERES, 100)
    mob:setMod(xi.mod.STUNRES, 100)
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
    mob:setMod(xi.mod.THUNDER_MEVA, 300)
    mob:setMod(xi.mod.WATER_MEVA, 100)
    mob:setMod(xi.mod.LIGHT_MEVA, 100)
    mob:setMod(xi.mod.DARK_MEVA, 100)
    mob:setMod(xi.mod.FIRE_SDT, 100)
    mob:setMod(xi.mod.ICE_SDT, 100)
    mob:setMod(xi.mod.WIND_SDT, 100)
    mob:setMod(xi.mod.EARTH_SDT, 100)
    mob:setMod(xi.mod.THUNDER_SDT, 300)
    mob:setMod(xi.mod.WATER_SDT, 100)
    mob:setMod(xi.mod.LIGHT_SDT, 100)
    mob:setMod(xi.mod.DARK_SDT, 100)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 20)
    mob:addMod(xi.mod.MDEF, 20)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:addStatusEffect(xi.effect.REGAIN, 30, 3, 0)
end)

m:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Hope.onMobSpawn", function(mob)
    mob:setSpellList(0) -- If it dies with the ability to cast spells, the next spawn would be able to cast from the start.
    mob:setMobMod(xi.mobMod.MAGIC_COOL, 20) -- This gives around 6 - 15 seconds between casts. Doesn't seem to work anywhere except in this function.
    mob:setAnimationSub(5)
    mob:hideName(true)
    mob:setUntargetable(true)
    mob:addMod(xi.mod.ATT, 165) -- 650 total atk
    mob:addMod(xi.mod.DEF, 213) -- 630 total def
    mob:addMod(xi.mod.EVA, 88) -- 425 total eva
    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = xi.jsa.MIGHTY_STRIKES, cooldown = 90, hpp = math.random(85, 95)}, -- "May use Mighty Strikes multiple times."
        },
    })
end)

m:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Hope.onMobEngaged", function(mob, target)  -- Coming out of water animation
    mob:hideName(false)
    mob:setUntargetable(false)
    mob:setAnimationSub(6)
    mob:setLocalVar("spellTime", 0)
end)

m:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Hope.onSpellPrecast", function(mob, spell)
    if spell:getID() == 196 or 213 then
        spell:setMPCost(1)
    end
end)

m:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Hope.onMobWeaponSkillPrepare", function(mob, target)
    local rnd = math.random()
    if rnd < 0.5 then -- uses Aerial Collision 50%~ of the time
        return 1353 -- Aerial Collision
    elseif rnd < 0.65 then
        return 1355 -- Spine Lash
    elseif rnd < 0.80 then
        return 1356 -- Voiceless Storm
    else
        return 1358 -- Plasma Charge
    end
end)

m:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Hope.onMobWeaponSkill", function(target, mob, skill)
    if skill:getID() == 1358 then -- Set spell list for Burst2/Thundaga3 upon using Plasma Charge. Allow for 60 seconds.
        mob:setSpellList(140)
        mob:setLocalVar("spellTime", os.time() + 60)
    end

    local aerialCollisionCounter = mob:getLocalVar("aerialCollisionCounter")
    local aerialCollisionMax = mob:getLocalVar("aerialCollisionMax")
    if skill:getID() == 1353 then  -- mob uses arial collision back to back
        if
            aerialCollisionCounter == 0 and
            aerialCollisionMax == 0
        then
            aerialCollisionMax = 1
            mob:setLocalVar("aerialCollisionMax", aerialCollisionMax)
        end

        aerialCollisionCounter = aerialCollisionCounter + 1
        mob:setLocalVar("aerialCollisionCounter", aerialCollisionCounter)

        if aerialCollisionCounter > aerialCollisionMax then
            mob:setLocalVar("aerialCollisionCounter", 0)
            mob:setLocalVar("aerialCollisionMax", 0)
        else
            mob:timer(3000, function(mobArg)
                mobArg:useMobAbility(1353)
            end)
        end
    end
end)

m:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Hope.onMobFight", function(mob, target)
    if
        mob:getLocalVar("spellTime") < os.time() and
        mob:getLocalVar("spellTime") ~= 0
    then -- Checks for it being 0 because it gets set to 0 to avoid setting the spell list repeatedly
        mob:setSpellList(0)
        mob:setLocalVar("spellTime", 0)
    end
end)

m:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Hope.onAdditionalEffect", function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.STUN, {chance = 65, duration = math.random(4, 8)})
end)

m:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Hope.onMobDeath", function(mob, player, isKiller)
end)

return m
