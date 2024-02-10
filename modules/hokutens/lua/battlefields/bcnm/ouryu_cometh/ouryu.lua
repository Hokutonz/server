-----------------------------------
-- Area: Riverne-Site_A01
-- Notes: Assists Ouryu in Ouryu Cometh
-----------------------------------
require("scripts/globals/mobs")
require("modules/module_utils")
-----------------------------------
xi.module.ensureTable("xi.zones.Riverne-Site_A01.mobs.Ouryu")

local m = Module:new("ouryu")

m:addOverride("xi.zones.Riverne-Site_A01.mobs.Ouryu.onMobSpawn", function(mob)
    mob:setMobSkillAttack(0)
    mob:setAnimationSub(0)
    if mob:hasStatusEffect(xi.effect.ALL_MISS) then
        mob:delStatusEffect(xi.effect.ALL_MISS)
    end

    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
    mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
    mob:setLocalVar("savageDmgMultipliers", 1)
    mob:setLocalVar("twoHour", 0)
    mob:setMobMod(xi.mobMod.MAGIC_COOL, 50)
    mob:addMod(xi.mod.EARTH_MEVA, 1000)
    mob:setMod(xi.mod.BLINDRES, 25)
    mob:addMod(xi.mod.PARALYZERES, 25)
    mob:setMod(xi.mod.UDMGRANGE, -5000)
    -- mob:setMod(xi.mod.MATT, -25)
    -- mob:setMod(xi.mod.ATT, -50)
    mob:setMod(xi.mod.UFASTCAST, 90)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(xi.mobMod.DRAW_IN, 1)
end)

m:addOverride("xi.zones.Riverne-Site_A01.mobs.Ouryu.onMobDeath", function(mob, player, optParams)
    player:addTitle(xi.title.OURYU_OVERWHELMER)
end)

m:addOverride("xi.zones.Riverne-Site_A01.mobs.Ouryu.onMobEngaged", function(mob)
    mob:setMobMod(xi.mobMod.NO_MOVE, 0)
end)

m:addOverride("xi.zones.Riverne-Site_A01.mobs.Ouryu.onMobFight", function(mob)
    -- use 2hr on 10 min cooldown
    if mob:getBattleTime() / 15 > mob:getLocalVar("twohour") then
        mob:useMobAbility(694)
        mob:setLocalVar("twohour", math.random((mob:getBattleTime() / 15) + 36, (mob:getBattleTime() / 15) + 40))
    end

    if mob:actionQueueEmpty() and mob:canUseAbilities() then
        local changeTime = mob:getLocalVar("changeTime")

        -- first flight
        if mob:getAnimationSub() == 0 and mob:getBattleTime() - changeTime > 60 then
            mob:setAnimationSub(1)
            mob:addStatusEffectEx(xi.effect.ALL_MISS, 0, 1, 0, 0)
            mob:setMobSkillAttack(731)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        -- land
        elseif mob:getAnimationSub() == 1 and mob:getBattleTime() - changeTime > 120 then
            mob:useMobAbility(1302)
        -- fly
        elseif mob:getAnimationSub() == 2 and mob:getBattleTime() - changeTime > 120 then
            mob:setAnimationSub(1)
            mob:addStatusEffectEx(xi.effect.ALL_MISS, 0, 1, 0, 0)
            mob:setMobSkillAttack(731)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        end
    end

    -- Wakeup from sleep immediately if flying
    if mob:getAnimationSub() == 1 then
        mob:delStatusEffect(xi.effect.SLEEP_I)
        mob:delStatusEffect(xi.effect.SLEEP_II)
        mob:delStatusEffect(xi.effect.LULLABY)
    end
end)

m:addOverride("xi.zones.Riverne-Site_A01.mobs.Ouryu.onMobWeaponSkill", function(target, mob, skill)
    -- only reset change time if actual perform touchdown
    -- thus keep trying until we do so
    if skill:getID() == 1302 then
        mob:setLocalVar("changeTime", mob:getBattleTime())
    end
end)

m:addOverride("xi.zones.Riverne-Site_A01.mobs.Ouryu.onMobDisengage", function(mob)
    mob:setLocalVar("changeTime", 0)
end)

m:addOverride("xi.zones.Riverne-Site_A01.mobs.Ouryu.onAdditionalEffect", function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENSTONE, { power = math.random(45, 90), chance = 10 })
end)

return m
