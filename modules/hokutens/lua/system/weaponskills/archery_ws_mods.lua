-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/weaponskills")
-----------------------------------

local archery = Module:new("archery_ws_mods")

-----------------------------------
-- Apex Arrow
-- Notes on this modification;
-- Raised FTP mod.
-- Raised AGI mod.
-----------------------------------

archery:addOverride ("xi.actions.weaponskills.apex_arrow.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
        return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 1
    params.ftp100 = 5.65 params.ftp200 = 5.65 params.ftp300 = 5.65
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0
    params.agi_wsc = 0.95 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0
    params.ignoresDef = true
    params.ignored100 = 0.15
    params.ignored200 = 0.35
    params.ignored300 = 0.5

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doRangedWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Empyreal Arrow
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised AGI mod.
-----------------------------------

archery:addOverride ("xi.actions.weaponskills.empyreal_arrow.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 3.1 params.ftp200 = 3.15 params.ftp300 = 3.20
    params.str_wsc = 0.60 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.60 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doRangedWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Namas Arrow
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised AGI mod.
-----------------------------------

archery:addOverride ("xi.actions.weaponskills.namas_arrow.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 3.3 params.ftp200 = 3.3 params.ftp300 = 3.3
    params.str_wsc = 0.50 params.dex_wsc = 0.0 params.vit_wsc = 0.0
    params.agi_wsc = 0.50 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0
    params.overrideCE = 160
    params.overrideVE = 480

    xi.aftermath.addStatusEffect(player, tp, xi.slot.RANGED, xi.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doRangedWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end)

return archery
