-----------------------------------
-- Area: Riverne - Site B01 (BCNM)
--   NM: Tiamat
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/mobs")
require("modules/module_utils")
-----------------------------------
local m  = Module:new("wyrmking_tiamat")
-----------------------------------

xi.module.ensureTable("xi.zones.Riverne-Site_B01.mobs.Tiamat")

local function land(mob)
    -- need to deal with case of stun of touchdown
    mob:useMobAbility(1282)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), xi.behavior.NO_TURN))
    mob:setLocalVar("changeTime", mob:getBattleTime() + 120)
    mob:setLocalVar("damageTaken", 0)
end

local function flight(mob)
    mob:setAnimationSub(1)
    mob:addStatusEffectEx(xi.effect.ALL_MISS, 0, 1, 0, 0)
    mob:setBehaviour(0)
    mob:setMobSkillAttack(730)
    mob:setLocalVar("changeTime", mob:getBattleTime() + 120)
    mob:setLocalVar("damageTaken", 0)
end

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Tiamat.onMobSpawn", function(mob)
    local bahamut = GetMobByID(zones[mob:getZoneID()].mob.BAHAMUT_V2)

    -- Turn on Bahamut's damage shields until pet dies
    bahamut:setLocalVar("Enable_Shields", 1)
    bahamut:setLocalVar("Announce_Shields", 0)

    mob:setMobSkillAttack(0) -- resetting so it doesn't respawn in flight mode.
    mob:setAnimationSub(0) -- subanim 0 is only used when it spawns until first flight.

    -- need to check some of these resists and values
    mob:setMod(xi.mod.BINDRES, 100)
    mob:setMod(xi.mod.SLEEPRES, 100)
    -- mob:setMod(xi.mod.TERRORRES, 100)
    -- mob:addImmunity(xi.immunity.BIND)
    -- mob:addImmunity(xi.immunity.SLEEP)
    -- mob:addImmunity(xi.immunity.TERROR)
    mob:setMod(xi.mod.COUNTER, 10)
    mob:setMod(xi.mod.UFASTCAST, 50)
    mob:setMod(xi.mod.UDMGMAGIC, -5000)
    mob:setMod(xi.mod.UDMGRANGE, -5000)
    mob:setMod(xi.mod.UDMGBREATH, -5000)
    mob:setMobMod(xi.mobMod.SIGHT_RANGE, 30)
    mob:setMobMod(xi.mobMod.GA_CHANCE, 70)
    mob:setMobMod(xi.mobMod.BUFF_CHANCE, 30)
    mob:setMod(xi.mod.UDMGMAGIC, -4000)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:addMod(xi.mod.SILENCERES, 100)
    mob:setMod(xi.mod.DEF, 459)
    mob:setMod(xi.mod.EVA, 422)
    mob:setMod(xi.mod.VIT, 19)
    mob:setMod(xi.mod.STR, 3)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 25)
    mob:setMod(xi.mod.MATT, 0)
    mob:setMod(xi.mod.ATT, 436)
    mob:setMod(xi.mod.REFRESH, 200)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), xi.behavior.NO_TURN))

    mob:addListener("TAKE_DAMAGE", "TIAMAT_TAKE_DAMAGE", function(defender, amount, attacker, attackType, damageType)
        local damageTaken = defender:getLocalVar("damageTaken") + amount
        defender:setLocalVar("damageTaken", damageTaken)
        local willKillMob = (defender:getHP() - amount) <= 0
        if damageTaken > 2500 and not willKillMob then
            if
                defender:getAnimationSub() == 1 and
                defender:actionQueueEmpty()
            then
                land(defender)
            elseif
                (defender:getAnimationSub() == 0 or
                defender:getAnimationSub() == 2) and
                not defender:hasStatusEffect(xi.effect.MIGHTY_STRIKES) and
                defender:actionQueueEmpty()
            then
                flight(defender)
            end
        end
    end)
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Tiamat.onMobDeath", function(mob, player, optParams)
    local bahamut = GetMobByID(zones[mob:getZoneID()].mob.BAHAMUT_V2)

    -- Turn off Bahamut's damage shields and prepare announcement
    bahamut:setLocalVar("Enable_Shields", 0)
    bahamut:setLocalVar("Shields_Announced", 0)
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Tiamat.onMobEngaged", function(mob)
    mob:setLocalVar("twohourTime", mob:getBattleTime() + 15)
    mob:setLocalVar("changeTime", mob:getBattleTime() + 120)
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Tiamat.onMobFight", function(mob, target)
    -- Gains a large attack boost when health is under 25% which cannot be Dispelled
    if mob:getHPP() < 25 then
        if not mob:hasStatusEffect(xi.effect.ATTACK_BOOST) then
            mob:addStatusEffect(xi.effect.ATTACK_BOOST, 75, 0, 0)
            mob:getStatusEffect(xi.effect.ATTACK_BOOST):setFlag(xi.effectFlag.DEATH)
        end
    -- Deletes Effect if regens back up due to a wipe
    else
        if mob:hasStatusEffect(xi.effect.ATTACK_BOOST) then
            mob:delStatusEffect(xi.effect.ATTACK_BOOST)
        end
    end

    if
        not mob:hasStatusEffect(xi.effect.MIGHTY_STRIKES) and
        mob:actionQueueEmpty()
    then
        local changeTime = mob:getLocalVar("changeTime")
        local twohourTime = mob:getLocalVar("twohourTime")

        if -- If mob uses its 2hr
            mob:getAnimationSub() == 2 and
            mob:getBattleTime() > twohourTime and
            mob:canUseAbilities()
        then
            mob:useMobAbility(688)
            twohourTime = mob:getBattleTime() + math.random(180, 300)
            mob:setLocalVar("twohourTime", twohourTime)
        elseif -- subanimation 2 is grounded mode, so check if she should take off
            (mob:getAnimationSub() == 0 or mob:getAnimationSub() == 2) and
            mob:getBattleTime() > changeTime
        then
            flight(mob)
        elseif -- subanimation 1 is flight, so check if she should land
            mob:getAnimationSub() == 1 and
            mob:getBattleTime() > changeTime
        then
            land(mob)
        end
    end

    if mob:hasStatusEffect(xi.effect.MIGHTY_STRIKES) then
        mob:setMobAbilityEnabled(false)
        mob:setMagicCastingEnabled(false)
    else
        mob:setMobAbilityEnabled(true)
        mob:setMagicCastingEnabled(true)
    end

    -- Wyrms automatically wake from sleep in the air
    if mob:getAnimationSub() == 1 then
        mob:delStatusEffect(xi.effect.SLEEP_I)
        mob:delStatusEffect(xi.effect.SLEEP_II)
        mob:delStatusEffect(xi.effect.LULLABY)
    end
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Tiamat.onMobWeaponSkill", function(target, mob, skill)
    -- Don't lose TP from autos during flight
    if skill:getID() == 1278 then
        mob:addTP(65) -- Needs to gain TP from flight auto attacks
        mob:setLocalVar("skill_tp", 0)
    elseif skill:getID() == 1282 then
        mob:addTP(mob:getLocalVar("skill_tp"))
        mob:setLocalVar("skill_tp", 0)
    end
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Tiamat.onMobWeaponSkillPrepare", function(mob, target)
    if mob:getAnimationSub() == 1 then
        mob:setLocalVar("skill_tp", mob:getTP())
    end
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Tiamat.onMobDisengage", function(mob)
    -- reset on wipe
    mob:setLocalVar("changeTime", 0)
    mob:setLocalVar("twohourTime", 0)
    mob:setLocalVar("damageTaken", 0)
    if mob:getAnimationSub() == 1 then
        mob:setAnimationSub(0)
        mob:delStatusEffect(xi.effect.ALL_MISS)
        mob:setMobSkillAttack(0)
        mob:setBehaviour(bit.bor(mob:getBehaviour(), xi.behavior.NO_TURN))
    end
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Tiamat.onAdditionalEffect", function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENFIRE, { chance = 20, power = 100 })
end)

return m
