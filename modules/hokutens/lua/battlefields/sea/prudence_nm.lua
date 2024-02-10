-----------------------------------
-- Jailer_of_Prudence
-- !pos 706.6854 -1.0802 20.8859 33
-- !additem 1856
-- !additem 1870
-- !additem 1871
-- Memo; the functionality of this module requires two addtional outside edits.
-- A dummy script to overwrite in scripts/zones/AlTaieu/mobs/Jailer_of_Prudence_2.lua
-- And DB edit renaming 16912847=Jailer_of_Prudence to 16912847=Jailer_of_Prudence_2
-- this is done within modules/sql/mobs/sea_upscale.sql
-----------------------------------
require("modules/module_utils")
require("scripts/globals/magic")
require("scripts/globals/mobs")
require("scripts/mixins/job_special")
require("scripts/mixins/rage")
-----------------------------------
-- Jailer_of_Prudence
-- mobID = 16912846
-----------------------------------
local prudence = Module:new("prudence_nm")

xi.module.ensureTable("xi.zones.AlTaieu.mobs.Jailer_of_Prudence")

prudence:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Prudence.onMobInitialize", function(mob)
    g_mixins.job_special(mob)
    g_mixins.rage(mob)
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
    mob:addMod(xi.mod.MDEF, 20)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:addStatusEffect(xi.effect.REGAIN, 15, 3, 0)
    mob:addStatusEffectEx(xi.effect.FLEE, 0, 100, 0, 60)
    mob:setMobMod(xi.mobMod.NO_DROPS, 1)
    mob:setMobMod(xi.mobMod.ALLI_HATE, 30)
    mob:addListener("WEAPONSKILL_STATE_ENTER", "PRUDENCE_MIMIC_START", function(mobArg, skillID)
        local prudenceIDs = { 16912846, 16912847 }
        if mobArg:getLocalVar('[JoP]mimic') ~= 1 and mobArg:isAlive() then
            for _, jailer in ipairs(prudenceIDs) do
                if mobArg:getID() ~= jailer then
                    local prudence_mimic = GetMobByID(jailer)
                    if
                        prudence_mimic:isAlive() and
                        mobArg:canUseAbilities() and
                        prudence_mimic:getLocalVar('[JoP]LastAbilityMimic') + 6 < os.time() and
                        mobArg:checkDistance(prudence_mimic) <= 10
                    then
                        prudence_mimic:setLocalVar('[JoP]mimic', 1)
                        prudence_mimic:setLocalVar('[JoP]LastAbilityMimic', os.time())
                        prudence_mimic:useMobAbility(skillID)
                    end
                end
            end
        end
    end)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "PRUDENCE_MIMIC_STOP", function(mobArg, skillID)
        mobArg:setLocalVar('[JoP]mimic', 0)
    end)
end)
-- adjust ATT and DEF values below to balance the monster.
prudence:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Prudence.onMobSpawn", function(mob)
    mob:setAnimationSub(6) -- Mouth closed
    mob:addMod(xi.mod.DEF, 120)
    mob:setMod(xi.mod.TRIPLE_ATTACK, 1)
    mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 1, 1, 0, 0)
    mob:setLocalVar("[rage]timer", 1800) -- 30 mins
end)
-- adjust ATT and DEF values below to balance the monster.
prudence:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Prudence.onMobFight", function(mob, target)
    local randomTime = math.random(20, 45)
    local changeTime = mob:getLocalVar("changeTime")

    if mob:getID(16912846) and (mob:getAnimationSub() == 6 and mob:getBattleTime() - changeTime > randomTime) then
        mob:setAnimationSub(3) -- Mouth Open
        mob:addMod(xi.mod.ATT, 100)
        mob:delMod(xi.mod.DEF, 100)
        mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
        mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
        mob:setLocalVar("changeTime", mob:getBattleTime())

    elseif mob:getID(16912846) and (mob:getAnimationSub() == 3 and mob:getBattleTime() - changeTime > randomTime) then
        mob:setAnimationSub(6) -- Mouth Closed
        mob:delMod(xi.mod.ATT, 100)
        mob:addMod(xi.mod.DEF, 100)
        mob:setMod(xi.mod.TRIPLE_ATTACK, 1)
        mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 1, 1, 0, 0)
        mob:setLocalVar("changeTime", mob:getBattleTime())
    end

    local perfectDodgeHPP =
    {
        95, 85, 75, 65, 55, 45, 35, 25, 15, 5,
    }

    local perfectDodgeTrigger = mob:getLocalVar("perfectDodgeTrigger")
    local perfectDodgeQueue = mob:getLocalVar("perfectDodgeQueue")
    local mobHPP = mob:getHPP()
    for trigger, hpp in ipairs(perfectDodgeHPP) do
        if mobHPP < hpp and perfectDodgeTrigger < trigger then
            mob:setLocalVar("perfectDodgeTrigger", trigger)
            mob:setLocalVar("perfectDodgeQueue", perfectDodgeQueue + 1)
            break
        end
    end

    if
        mob:actionQueueEmpty() == true and
        mob:canUseAbilities()
    then
        perfectDodgeQueue = mob:getLocalVar("perfectDodgeQueue")
        if perfectDodgeQueue > 0 then
            perfectDodgeQueue = mob:getLocalVar("perfectDodgeQueue") - 1
            if not mob:hasStatusEffect(xi.effect.PERFECT_DODGE) and mob:isAlive() then
                mob:useMobAbility(693)
                mob:setLocalVar("perfectDodgeQueue", perfectDodgeQueue)
            end
        end
    end
end)

prudence:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Prudence.onMobDespawn", function(mob)
    local firstPrudence     = GetMobByID(16912846)
    local secondPrudence    = GetMobByID(16912847)
    if mob:getID() == 16912846 then
        secondPrudence:setMobMod(xi.mobMod.NO_DROPS, 0)
    else
        firstPrudence:setMobMod(xi.mobMod.NO_DROPS, 0)
    end
end)

prudence:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Prudence.onMobDeath", function(mob, player, optParams)
    mob:resetLocalVars()
end)
-----------------------------------
-- Jailer_of_Prudence_2
-- mobID = 16912847
-----------------------------------
xi.module.ensureTable("xi.zones.AlTaieu.mobs.Jailer_of_Prudence_2")

prudence:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Prudence_2.onMobInitialize", function(mob)
    g_mixins.job_special(mob)
    g_mixins.rage(mob)
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
    mob:addMod(xi.mod.MDEF, 20)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:addStatusEffect(xi.effect.REGAIN, 30, 3, 0)
    mob:addStatusEffectEx(xi.effect.FLEE, 0, 100, 0, 60)
    mob:setMobMod(xi.mobMod.NO_DROPS, 1)
    mob:setMobMod(xi.mobMod.ALLI_HATE, 30)
    mob:addListener("WEAPONSKILL_STATE_ENTER", "PRUDENCE_MIMIC_START", function(mobArg, skillID)
        local prudenceIDs = { 16912846, 16912847 }
        if mobArg:getLocalVar('[JoP]mimic') ~= 1 and mobArg:isAlive() then
            for _, jailer in ipairs(prudenceIDs) do
                if mobArg:getID() ~= jailer then
                    local prudence_mimic = GetMobByID(jailer)
                    if
                        prudence_mimic:isAlive() and
                        mobArg:canUseAbilities() and
                        prudence_mimic:getLocalVar('[JoP]LastAbilityMimic') + 6 < os.time() and
                        mobArg:checkDistance(prudence_mimic) <= 10
                    then
                        prudence_mimic:setLocalVar('[JoP]mimic', 1)
                        prudence_mimic:setLocalVar('[JoP]LastAbilityMimic', os.time())
                        prudence_mimic:useMobAbility(skillID)
                    end
                end
            end
        end
    end)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "PRUDENCE_MIMIC_STOP", function(mobArg, skillID)
        mobArg:setLocalVar('[JoP]mimic', 0)
    end)
end)

-- adjust ATT and DEF values below to balance the monster.
prudence:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Prudence_2.onMobSpawn", function(mob)
    mob:setAnimationSub(3) -- Mouth closed
    mob:addMod(xi.mod.DEF, 20)
    mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
    mob:addMod(xi.mod.ATT, 100)
    --mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 1, 1, 0, 0)
    mob:setLocalVar("[rage]timer", 1800) -- 30 mins
end)

-- adjust ATT and DEF values below to balance the monster.
prudence:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Prudence_2.onMobFight", function(mob, target)
    local randomTime = math.random(20, 45)
    local changeTime = mob:getLocalVar("changeTime")

    if mob:getID(16912847) and (mob:getAnimationSub() == 6 and mob:getBattleTime() - changeTime > randomTime) then
        mob:setAnimationSub(3) -- Mouth Open
        mob:addMod(xi.mod.ATT, 100)
        mob:delMod(xi.mod.DEF, 100)
        mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
        mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
        mob:setLocalVar("changeTime", mob:getBattleTime())

    elseif mob:getID(16912847) and (mob:getAnimationSub() == 3 and mob:getBattleTime() - changeTime > randomTime) then
        mob:setAnimationSub(6) -- Mouth Closed
        mob:delMod(xi.mod.ATT, 100)
        mob:addMod(xi.mod.DEF, 100)
        mob:setMod(xi.mod.TRIPLE_ATTACK, 1)
        mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 1, 1, 0, 0)
        mob:setLocalVar("changeTime", mob:getBattleTime())
    end

    local perfectDodgeHPP =
    {
        95, 85, 75, 65, 55, 45, 35, 25, 15, 5,
    }

    local perfectDodgeTrigger = mob:getLocalVar("perfectDodgeTrigger")
    local perfectDodgeQueue = mob:getLocalVar("perfectDodgeQueue")
    local mobHPP = mob:getHPP()
    for trigger, hpp in ipairs(perfectDodgeHPP) do
        if mobHPP < hpp and perfectDodgeTrigger < trigger then
            mob:setLocalVar("perfectDodgeTrigger", trigger)
            mob:setLocalVar("perfectDodgeQueue", perfectDodgeQueue + 1)
            break
        end
    end

    if
        mob:actionQueueEmpty() == true and
        mob:canUseAbilities()
    then
        perfectDodgeQueue = mob:getLocalVar("perfectDodgeQueue")
        if perfectDodgeQueue > 0 then
            perfectDodgeQueue = mob:getLocalVar("perfectDodgeQueue") - 1
            if not mob:hasStatusEffect(xi.effect.PERFECT_DODGE) and mob:isAlive() then
                mob:useMobAbility(693)
                mob:setLocalVar("perfectDodgeQueue", perfectDodgeQueue)
            end
        end
    end
end)

prudence:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Prudence_2.onMobDespawn", function(mob)
    local firstPrudence     = GetMobByID(16912846)
    local secondPrudence    = GetMobByID(16912847)
    if mob:getID() == 16912846 then
        secondPrudence:setMobMod(xi.mobMod.NO_DROPS, 0)
    else
        firstPrudence:setMobMod(xi.mobMod.NO_DROPS, 0)
    end
end)

prudence:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Prudence_2.onMobDeath", function(mob, player, optParams)
    mob:resetLocalVars()
end)

return prudence
