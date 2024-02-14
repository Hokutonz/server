-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/weaponskills")
-----------------------------------

local axe = Module:new("axe_ws_mods")

-----------------------------------
-- Decimation
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Enabled CanCrit
-- Raised Crit mod.
-----------------------------------

axe:addOverride ("xi.actions.weaponskills.decimation.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 3
    params.ftp100 = 1.50 params.ftp200 = 1.50 params.ftp300 = 1.50
    params.str_wsc = 0.60 params.dex_wsc = 0.0 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 1.0 params.crit200 = 1.0 params.crit300 = 1.0
    params.canCrit = true
    params.acc100 = 0.8 params.acc200 = 0.9 params.acc300 = 1.0
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Onslaught
-- Notes on this modification;
-- Raised FTP mod.
-- Raised DEX mod.
-----------------------------------

axe:addOverride ("xi.actions.weaponskills.onslaught.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 5.75 params.ftp200 = 5.75 params.ftp300 = 5.75
    params.str_wsc = 0.0 params.dex_wsc = 0.80 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    if damage > 0 then
        if not target:hasStatusEffect(xi.effect.ACCURACY_DOWN) then
            local duration = tp / 1000 * 20 * applyResistanceAddEffect(player, target, xi.element.EARTH, 0)
            target:addStatusEffect(xi.effect.ACCURACY_DOWN, 20, 0, duration)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Primal Rend
-- Notes on this modification;
-- Raised FTP mod.
-- Added DEX mod.
-- Raised DEX mod.
-- Raised CHR mod.
-----------------------------------

axe:addOverride ("xi.actions.weaponskills.primal_rend.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.ftp100 = 4.75 params.ftp200 = 4.85 params.ftp300 = 4.95
    params.str_wsc = 0.0 params.dex_wsc = 0.70 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.0 params.chr_wsc = 0.70
    params.ele = xi.element.LIGHT
    params.skill = xi.skill.AXE
    params.includemab = true

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doMagicWeaponskill(player, target, wsID, params, tp, action, primary) 
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Ruinator
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Removed ACC deviation.
-----------------------------------

axe:addOverride ("xi.actions.weaponskills.ruinator.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 4
    params.ftp100 = 6.0 params.ftp200 = 6.0 params.ftp300 = 6.0
    params.str_wsc = 0.95 params.dex_wsc = 0.0 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.1 params.atk200 = 1.1 params.atk300 = 1.1

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

return axe
