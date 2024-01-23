-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/weaponskills")
-----------------------------------

local greatAxe = Module:new("great_axe_ws_mods")

--[[
-----------------------------------
-- Full Break
-- Great Axe weapon skill
-- Skill level: 225 (Warriors only.)
-- Lowers enemy's attack, defense, params.accuracy, and evasion. Duration of effect varies with TP.
-- Lowers attack and defense by 12.5%, evasion by 20 points, and estimated to also lower params.accuracy by 20 points.
-- These enfeebles are given as four seperate status effects, resists calculated seperately for each. They almost always wear off simultaneously, but have been observed to wear off at different times.
-- Strong against: Coeurls.
-- Immune: Antica, Cockatrice, Crawlers, Worms.
-- Will stack with Sneak Attack.
-- Aligned with the Aqua Gorget & Snow Gorget.
-- Aligned with the Aqua Belt & Snow Belt.
-- Element: Earth
-- Modifiers: STR:50%  VIT:50%
-- 100%TP    200%TP    300%TP
-- 1.5        1.5       1.5
-----------------------------------

greatAxe:addOverride ("xi.actions.weaponskills.full_break.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 1.5 params.ftp200 = 1.5 params.ftp300 = 1.5
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.5 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1
    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if (damage > 0) then
        local duration = (tp / 1000 * 30) + 60
        if (target:hasStatusEffect(xi.effect.DEFENSE_DOWN) == false) then
            target:addStatusEffect(xi.effect.DEFENSE_DOWN, 12.5, 0, duration * applyResistanceAddEffect(player, target, xi.magic.ele.WIND, 0))
        end
        if (target:hasStatusEffect(xi.effect.ATTACK_DOWN) == false) then
            target:addStatusEffect(xi.effect.ATTACK_DOWN, 12.5, 0, duration * applyResistanceAddEffect(player, target, xi.magic.ele.WATER, 0))
        end
        if (target:hasStatusEffect(xi.effect.EVASION_DOWN) == false) then
            target:addStatusEffect(xi.effect.EVASION_DOWN, 20, 0, duration * applyResistanceAddEffect(player, target, xi.magic.ele.ICE, 0))
        end
        if (target:hasStatusEffect(xi.effect.ACCURACY_DOWN) == false) then
            target:addStatusEffect(xi.effect.ACCURACY_DOWN, 20, 0, duration * applyResistanceAddEffect(player, target, xi.magic.ele.EARTH, 0))
        end
    end
    return tpHits, extraHits, criticalHit, damage

end)
]]

-----------------------------------
-- Kings Justice
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-----------------------------------

greatAxe:addOverride ("xi.actions.weaponskills.kings_justice.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 3
    params.ftp100 = 3.0 params.ftp200 = 3.15 params.ftp300 = 3.30
    params.str_wsc = 0.70 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

--[[
-----------------------------------
-- Metatron Torment
-- Notes on this modification;
-- No changes.
-----------------------------------

greatAxe:addOverride ("xi.actions.weaponskills.metatron_torment.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 2.75 params.ftp200 = 2.75 params.ftp300 = 2.75
    params.str_wsc = 0.6 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    if damage > 0 then
        local duration = tp / 1000 * 20 * applyResistanceAddEffect(player, target, xi.magic.ele.WIND, 0)
        target:addStatusEffect(xi.effect.DEFENSE_DOWN, 19, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end)
]]

--[[
-----------------------------------
-- Raging Rush
-- Great Axe weapon skill
-- Skill level: 200 (Warriors only.)
-- Delivers a three-hit attack. Chance of params.critical hit varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Snow Gorget & Aqua Gorget.
-- Aligned with the Snow Belt & Aqua Belt.
-- Element: None
-- Modifiers: STR:50%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------

greatAxe:addOverride ("xi.actions.weaponskills.raging_rush.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 3
    params.ftp100 = 1 params.ftp200 = 1 params.ftp300 = 1
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.1 params.crit200 = 0.3 params.crit300 = 0.5
    params.canCrit = true
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)
]]

-----------------------------------
-- Steel Cyclone
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised VIT mod.
-----------------------------------

greatAxe:addOverride ("xi.actions.weaponskills.steel_cyclone.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 2.25 params.ftp200 = 2.50 params.ftp300 = 2.75
    params.str_wsc = 0.60 params.dex_wsc = 0.0 params.vit_wsc = 0.60 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.66; params.atk200 = 1.66; params.atk300 = 1.66

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

--[[
-----------------------------------
-- Ukko's Fury
-- Great Axe Weapon Skill
-- Skill Level: N/A
-- Description: Delivers a twofold attack that slows target. Chance of params.critical hit varies with TP. Ukonvasara: Aftermath.
-- Available only when equipped with Ukonvasara (85), Ukonvasara (90), Ukonvasara (95), Maschu +1, Maschu +2.
-- Aligned with the Light Gorget, Breeze Gorget & Thunder Gorget.
-- Aligned with the Light Belt, Breeze Belt & Thunder Belt.
-- Element: None
-- Skillchain Properties: Light/Fragmentation
-- Modifiers: STR:80%
-- Damage Multipliers by TP:
-- 100%TP    200%TP    300%TP
-- 2.5        2.5        2.5
-- params.critical Chance added with TP:
-- 100%TP    200%TP    300%TP
-- 10%        20%        40%
-----------------------------------

greatAxe:addOverride ("xi.actions.weaponskills.ukkos_fury.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

local weaponskill_object = {}

    local params = {}
    params.numHits = 2
    params.ftp100 = 2.5 params.ftp200 = 2.5 params.ftp300 = 2.5
    params.str_wsc = 0.8 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.10 params.crit200 = 0.20 params.crit300 = 0.40
    params.canCrit = true
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1


    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.EMPYREAN)

    if damage > 0 then
        if not target:hasStatusEffect(xi.effect.SLOW) then
            local duration = 60 * applyResistanceAddEffect(player, target, xi.magic.ele.EARTH, 0)
            target:addStatusEffect(xi.effect.SLOW, 1500, 0, duration)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end)
]]

-----------------------------------
-- Upheaval
-- Notes on this modification;
-- Raised FTP mod.
-- Raised VIT mod.
-----------------------------------

greatAxe:addOverride ("xi.actions.weaponskills.upheaval.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 4
    params.ftp100 = 4.40 params.ftp200 = 4.45 params.ftp300 = 4.50
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.95 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = true
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

return greatAxe
