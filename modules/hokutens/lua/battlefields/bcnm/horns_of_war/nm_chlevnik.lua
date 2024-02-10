-----------------------------------
-- Area: Horlais Peak
-- Mob: Chlevnik
-- KSNM99
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("nm_chlevnik")

xi.module.ensureTable("xi.zones.Horlais_Peak.mobs.Chlevnik")

m:addOverride("xi.zones.Horlais_Peak.mobs.Chlevnik.onMobSpawn", function(mob)
    mob:setAnimationSub(3)
    mob:setUnkillable(true)
    mob:addMod(xi.mod.ATT, 150)
    mob:addMod(xi.mod.DEF, 180)
    mob:addMod(xi.mod.EVA, 110)
    mob:setMod(xi.mod.MDEF, 20)
    mob:setMod(xi.mod.TRIPLE_ATTACK, 5)
    mob:addMod(xi.mod.STUNRES, 90)
    mob:addMod(xi.mod.SLEEPRES, 90)
    mob:setMobMod(xi.mobMod.NO_MOVE, 0)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setTP(3000) -- opens fight with a skill

    mob:addListener("TAKE_DAMAGE", "CHLEVNIK_TAKE_DAMAGE", function(mobArg, amount, attacker, attackType, damageType)
        if amount >= mobArg:getHP() and mob:getLocalVar("control") == 0 then
            mob:setLocalVar("control", 1) -- Prevents multiple uses of meteor
            mob:setAutoAttackEnabled(false)
            mob:setMagicCastingEnabled(false)
            mob:setMobAbilityEnabled(false)
            mob:setLocalVar("meteor", 1)
        end
    end)

    -- Do this because people like to range the ability
    -- We will still fire it off even if no target is near
    mob:addListener('WEAPONSKILL_STATE_ENTER', 'CHLEVNIK_FINAL_METEOR', function(mobArg, skillID)
        if skillID == 634 then -- Final Meteor
            mobArg:setLocalVar("meteor", 0)
            mobArg:setMobMod(xi.mobMod.NO_MOVE, 1)
            mobArg:setAnimationSub(1)
            mobArg:timer(7000, function(chlevnik)
                chlevnik:setMagicCastingEnabled(true)
                chlevnik:setAutoAttackEnabled(true)
                chlevnik:setMobAbilityEnabled(true)
                chlevnik:setUnkillable(false)
                chlevnik:setHP(0)
            end)
        end
    end)
end)

m:addOverride("xi.zones.Horlais_Peak.mobs.Chlevnik.onMobEngaged", function(mob, target)
    mob:setLocalVar("delay", os.time() + 30)
end)

m:addOverride("xi.zones.Horlais_Peak.mobs.Chlevnik.onMobFight", function(mob, target)
    if mob:getHPP() > 25 then
        mob:setMod(xi.mod.REGAIN, 80)
    else
        mob:setMod(xi.mod.REGAIN, 50)
    end

    local delay = mob:getLocalVar("delay")
    if os.time() > delay then -- Use Meteor every 30s, based on capture
        mob:castSpell(218, target) -- meteor
        mob:setLocalVar("delay", os.time() + 30)
    end

    if mob:getLocalVar("meteor") == 1 then
        if mob:checkDistance(target) > 40 then
            mob:resetEnmity(target)
        else
            mob:useMobAbility(634) -- Final Meteor
        end
    end
end)

m:addOverride("xi.zones.Horlais_Peak.mobs.Chlevnik.onAdditionalEffect", function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.STUN, { power = math.random(7, 8), chance = 20 }) --based on captures
end)

m:addOverride("xi.zones.Horlais_Peak.mobs.Chlevnik.onSpellPrecast", function(mob, spell)
    if spell:getID() == 218 then
        spell:setAoE(xi.magic.aoe.RADIAL)
        spell:setFlag(xi.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280)
        spell:setMPCost(0)
    end
end)

m:addOverride("xi.zones.Horlais_Peak.mobs.Chlevnik.onMobDeath", function(mob, player, optParams)
    mob:removeListener("CHLEVNIK_TAKE_DAMAGE")
    mob:removeListener("CHLEVNIK_FINAL_METEOR")
end)

return m
