-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/weaponskills")
-----------------------------------

local marksmanship = Module:new("marksmanship_ws_mods")

-----------------------------------
-- Coronach
-- Notes on this modification;
-- Raised DEX mod.
-----------------------------------
marksmanship:addOverride("xi.actions.weaponskills.coronach.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 3 params.ftp200 = 3 params.ftp300 = 3
    params.str_wsc = 0.0  params.dex_wsc = 0.50 params.vit_wsc = 0.0
    params.agi_wsc = 0.50 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0
    params.overrideCE = 80
    params.overrideVE = 240

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doRangedWeaponskill(player, target, wsID, params, tp, action, primary)

    -- Apply aftermath
    if damage > 0 then
        xi.aftermath.addStatusEffect(player, tp, xi.slot.RANGED, xi.aftermath.type.RELIC)
    end

    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Detonator
-- Notes on this modification;
-- Raised FTP mod.
-- Raised AGI mod.
-----------------------------------
marksmanship:addOverride("xi.actions.weaponskills.detonator.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 4.0 params.ftp200 = 4.05 params.ftp300 = 4.1
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.40 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doRangedWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Last Stand
-- Notes on this modification;
-- NERFED 5/5/2023 Neckbeard (3,500 DMG to 1,500 DMG CAP)
-----------------------------------
marksmanship:addOverride("xi.actions.weaponskills.last_stand.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    if not player:hasStatusEffect(xi.effect.UNLIMITED_SHOT) then
        player:removeAmmo()
    end

    if player:hasStatusEffect(xi.effect.UNLIMITED_SHOT) then
        player:delStatusEffect(xi.effect.UNLIMITED_SHOT)
    end

    local params = {}
    params.numHits = 2
    params.ftp100 = 2.0 params.ftp200 = 2.25 params.ftp300 = 2.30
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0
    params.agi_wsc = 0.5 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0
    params.multiHitfTP = true

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doRangedWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Leaden Salute
-- Notes on this modification;
-- Raised FTP mod.
-- Raised AGI mod.
-----------------------------------
marksmanship:addOverride("xi.actions.weaponskills.leaden_salute.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.ftp100 = 4.35 params.ftp200 = 4.50 params.ftp300 = 4.65
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.95 params.int_wsc = 0.0
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.ele = xi.element.DARK
    params.skill = xi.skill.MARKSMANSHIP
    params.includemab = true

    xi.aftermath.addStatusEffect(player, tp, xi.slot.RANGED, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Trueflight
-- Notes on this modification;
-- Raised FTP mod.
-- Raised AGI mod.
-----------------------------------
marksmanship:addOverride("xi.actions.weaponskills.trueflight.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.ftp100 = 5.50 params.ftp200 = 5.75 params.ftp300 = 6.0
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0
    params.agi_wsc = 0.75 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.ele = xi.element.LIGHT
    params.skill = xi.skill.MARKSMANSHIP
    params.includemab = true

    xi.aftermath.addStatusEffect(player, tp, xi.slot.RANGED, xi.aftermath.type.MYTHIC)

    local damage, tpHits, extraHits = xi.weaponskills.doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, false, damage
end)

return marksmanship
