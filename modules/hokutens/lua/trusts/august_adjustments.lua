-----------------------------------
require("modules/module_utils")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/weaponskillids")
-----------------------------------
local m = Module:new("august_adjustments_LUA")

-- Add TP logic and Damage adjustments to August Attacks
    -- Sword
    m:addOverride("xi.actions.mobskills.august_melee_sword.onMobWeaponSkill", function(target, mob, skill)
        local numhits = 2
        local accmod = 1
        local dmgmod = 1.1
        local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
        local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
        target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
        skill:setMsg(xi.msg.basic.HIT_DMG)

        if dmg > 0 then
            mob:addTP(144)
        end

        return dmg
    end)
    -- Bow
    m:addOverride("xi.actions.mobskills.august_melee_bow.onMobWeaponSkill", function(target, mob, skill)
        local numhits = 2
        local accmod = 1
        local dmgmod = 1
        local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
        local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.RANGED, xi.damageType.PIERCING, info.hitslanded)
        target:takeDamage(dmg, mob, xi.attackType.RANGED, xi.damageType.PIERCING)
        skill:setMsg(xi.msg.basic.HIT_DMG)

        if dmg > 0 then
            mob:addTP(134)
        end

        return dmg
    end)
    -- H2H
    m:addOverride("xi.actions.mobskills.august_melee_h2h.onMobWeaponSkill", function(target, mob, skill)
        local numhits = 1
        local accmod = 2
        local dmgmod = 1.3
        local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
        local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, info.hitslanded)
        target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)
        skill:setMsg(xi.msg.basic.HIT_DMG)

        if dmg > 0 then
            mob:addTP(134)
        end

        return dmg
    end)
    -- Axe
    m:addOverride("xi.actions.mobskills.august_melee_axe.onMobWeaponSkill", function(target, mob, skill)
        local numhits = 1
        local accmod = 2
        local dmgmod = 1.3
        local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
        local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
        target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
        skill:setMsg(xi.msg.basic.HIT_DMG)

        if dmg > 0 then
            mob:addTP(144)
        end

        return dmg
    end)

-- August mobskills
    -- Alabaster Burst
    xi.module.ensureTable("xi.actions.mobskills.alabaster_burst")
        m:addOverride("xi.actions.mobskills.alabaster_burst.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.alabaster_burst.onMobWeaponSkill", function(target, mob, skill)
            local numhits = 2
            local accmod = 2
            local dmgmod = 4.5
            local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
            local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
            target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

            return dmg
        end)
    -- Tartaric Sigil
    xi.module.ensureTable("xi.actions.mobskills.tartaric_sigil")
        m:addOverride("xi.actions.mobskills.tartaric_sigil.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.tartaric_sigil.onMobWeaponSkill", function(target, mob, skill)
            local dmgmod = 3.4
            local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getMainLvl() * 3, xi.magic.ele.DARK, dmgmod, xi.mobskills.magicalTpBonus.MAB_BONUS, 1)
            local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
            target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.DARK)

            return dmg
        end)
    -- Null Field
    xi.module.ensureTable("xi.actions.mobskills.null_field")
        m:addOverride("xi.actions.mobskills.null_field.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.null_field.onMobWeaponSkill", function(target, mob, skill)
            local dmgmod = 1.3
            local info   = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getMainLvl() * 9, xi.magic.ele.FIRE, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT, 1)
            local dmg    = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.FIRE, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
            target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.FIRE)

            return dmg
        end)
    -- Fulminous Fury
    xi.module.ensureTable("xi.actions.mobskills.fulminous_fury")
        m:addOverride("xi.actions.mobskills.fulminous_fury.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.fulminous_fury.onMobWeaponSkill", function(target, mob, skill)
            xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SLOW, 1250, 0, 60)
            xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.POISON, mob:getMainLvl() / 10, 3, 60)
            xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SILENCE, 1, 0, 60)
            xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.PARALYSIS, 15, 0, 60)
            xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.BLINDNESS, 15, 0, 60)
            local dmgmod = 1
            local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, xi.magic.ele.LIGHTNING, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
            local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.LIGHTNING, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
            target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.LIGHTNING)

            return dmg
        end)
    -- No Quarter
    xi.module.ensureTable("xi.actions.mobskills.no_quarter")
        m:addOverride("xi.actions.mobskills.no_quarter.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.no_quarter.onMobWeaponSkill", function(target, mob, skill)
            local numhits = 3
            local accmod = 3
            local dmgmod = 3
            local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
            local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
            target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

            return dmg
        end)
    -- Daybreak
    xi.module.ensureTable("xi.actions.mobskills.daybreak")
        m:addOverride("xi.actions.mobskills.daybreak.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.daybreak.onMobWeaponSkill", function(target, mob, skill)
            local trustLvl = mob:getMainLvl()

            mob:setAnimationSub(5) -- WINGS
            -- erase effects (using erase)
            mob:delStatusEffect(xi.effect.PARALYSIS)
            mob:delStatusEffect(xi.effect.BIND)
            mob:delStatusEffect(xi.effect.WEIGHT)
            mob:delStatusEffect(xi.effect.ADDLE)
            mob:delStatusEffect(xi.effect.BURN)
            mob:delStatusEffect(xi.effect.FROST)
            mob:delStatusEffect(xi.effect.CHOKE)
            mob:delStatusEffect(xi.effect.RASP)
            mob:delStatusEffect(xi.effect.SHOCK)
            mob:delStatusEffect(xi.effect.DROWN)
            mob:delStatusEffect(xi.effect.DIA)
            mob:delStatusEffect(xi.effect.BIO)
            mob:delStatusEffect(xi.effect.STR_DOWN)
            mob:delStatusEffect(xi.effect.DEX_DOWN)
            mob:delStatusEffect(xi.effect.VIT_DOWN)
            mob:delStatusEffect(xi.effect.AGI_DOWN)
            mob:delStatusEffect(xi.effect.INT_DOWN)
            mob:delStatusEffect(xi.effect.MND_DOWN)
            mob:delStatusEffect(xi.effect.CHR_DOWN)
            mob:delStatusEffect(xi.effect.MAX_HP_DOWN)
            mob:delStatusEffect(xi.effect.MAX_MP_DOWN)
            mob:delStatusEffect(xi.effect.ATTACK_DOWN)
            mob:delStatusEffect(xi.effect.EVASION_DOWN)
            mob:delStatusEffect(xi.effect.DEFENSE_DOWN)
            mob:delStatusEffect(xi.effect.MAGIC_DEF_DOWN)
            mob:delStatusEffect(xi.effect.INHIBIT_TP)
            mob:delStatusEffect(xi.effect.MAGIC_ACC_DOWN)
            mob:delStatusEffect(xi.effect.MAGIC_ATK_DOWN)
            -- August will heal slightly based off level
            mob:addHP(trustLvl * 7)
            mob:addMP(trustLvl * 7)
            -- Damage taken -50% (Video supports this)
            mob:setMod(xi.mod.DMGPHYS, 50) -- See Module for removal

            return 0
        end)
    -- Noble Frenzy
    xi.module.ensureTable("xi.actions.mobskills.noble_frenzy")
        m:addOverride("xi.actions.mobskills.noble_frenzy.onMobSkillCheck", function(target, mob, skill)
            return 0
        end)
        m:addOverride("xi.actions.mobskills.noble_frenzy.onMobWeaponSkill", function(target, mob, skill)
            local numhits = 5
            local accmod  = 2
            local dmgmod  = 3.5
            local info    = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1.5625, 1.875, 2.50)
            local dmg     = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
            target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

            return dmg
        end)

return m
