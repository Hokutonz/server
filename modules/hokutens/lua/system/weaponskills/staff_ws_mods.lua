-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/weaponskills")
-----------------------------------

local staff = Module:new("staff_ws_mods")

-----------------------------------
-- Garland of Bliss
-- Notes on this modification;
-- Raised FTP mod.
-- Raised MND mod.
-----------------------------------
staff:addOverride ("xi.actions.weaponskills.garland_of_bliss.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.ftp100 = 5.50 params.ftp200 = 5.50 params.ftp300 = 5.50
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.85 params.chr_wsc = 0.0
    params.ele = xi.element.LIGHT
    params.skill = xi.skill.STAFF
    params.includemab = true

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
    
    if damage > 0 then
        if not target:hasStatusEffect(xi.effect.DEFENSE_DOWN) then
            local duration = (30 + tp / 1000 * 30) * applyResistanceAddEffect(player, target, xi.element.WIND, 0)
            target:addStatusEffect(xi.effect.DEFENSE_DOWN, 12.5, 0, duration)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Gate of Tartarus
-- Notes on this modification;
-- Raised FTP mod.
-- Raised CHR mod.
-- Raised ATK mod.
-----------------------------------
staff:addOverride ("xi.actions.weaponskills.gate_of_tartarus.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 5.5 params.ftp200 = 5.5 params.ftp300 = 5.5
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.90
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.5; params.atk200 = 1.5; params.atk300 = 1.5

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if damage > 0 then
        if not target:hasStatusEffect(xi.effect.ATTACK_DOWN) then
            local duration = tp / 1000 * 3 * applyResistanceAddEffect(player, target, xi.element.WATER, 0)
            target:addStatusEffect(xi.effect.ATTACK_DOWN, 20, 0, duration)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Omniscience
-- Notes on this modification;
-- Raised FTP mod.
-- Raised MND mod.
-----------------------------------
staff:addOverride ("xi.actions.weaponskills.omniscience.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.ftp100 = 5 params.ftp200 = 5 params.ftp300 = 5
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.75 params.chr_wsc = 0.0
    params.ele = xi.element.DARK
    params.skill = xi.skill.STAFF
    params.includemab = true

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    if damage > 0 then
        if not target:hasStatusEffect(xi.effect.MAGIC_ATK_DOWN) then
            local duration = tp / 1000 * 60
            target:addStatusEffect(xi.effect.MAGIC_ATK_DOWN, 10, 0, duration)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Retribution
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised MND mod.
-----------------------------------
staff:addOverride ("xi.actions.weaponskills.retribution.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 1
    params.ftp100 = 4.5 params.ftp200 = 4.75 params.ftp300 = 5.0
    params.str_wsc = 0.90 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.90 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Shattersoul
-- Notes on this modification;
-- Raised FTP mod.
-- Raised INT mod.
-- Raised ATK mod.
-----------------------------------
staff:addOverride ("xi.actions.weaponskills.shattersoul.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 3
    params.ftp100 = 5.5 params.ftp200 = 5.5 params.ftp300 = 5.5
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.95 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 2.0; params.atk200 = 2.0; params.atk300 = 2.0

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if damage > 0 and not target:hasStatusEffect(xi.effect.MAGIC_DEF_DOWN) then
        target:addStatusEffect(xi.effect.MAGIC_DEF_DOWN, 10, 0, 120)
    end

    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Vidohunir
-- Notes on this modification;
-- Raised FTP mod.
-- Raised INT mod.
-----------------------------------
staff:addOverride ("xi.actions.weaponskills.vidohunir.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.ftp100 = 3.75 params.ftp200 = 3.75 params.ftp300 = 3.75
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.85
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.ele = xi.element.DARK
    params.skill = xi.skill.STAFF
    params.includemab = true

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    if damage > 0 then
        local duration = tp / 1000 * 60
        if not target:hasStatusEffect(xi.effect.MAGIC_DEF_DOWN) then
            target:addStatusEffect(xi.effect.MAGIC_DEF_DOWN, 10, 0, duration)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end)

return staff
