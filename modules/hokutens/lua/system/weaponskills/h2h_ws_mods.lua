-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/weaponskills")
-----------------------------------

local h2h = Module:new("h2h_ws_mods")

-----------------------------------
-- Asuran Fists
-- Notes on this modification;
-- Raised STR mod.
-- Raised VIT mod.
-----------------------------------

h2h:addOverride ("xi.actions.weaponskills.asuran_fists.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 7
    params.ftp100 = 1.0 params.ftp200 = 1.0 params.ftp300 = 1.0
    params.str_wsc = 0.50 params.dex_wsc = 0.0 params.vit_wsc = 0.50 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.8 params.acc200 = 0.9 params.acc300 = 1
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Final Heaven
-- Notes on this modification;
-- Raised FTP mod.
-----------------------------------

h2h:addOverride ("xi.actions.weaponskills.final_heaven.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 5.75 params.ftp200 = 5.75 params.ftp300 = 5.75
    params.str_wsc = 0.0        params.dex_wsc = 0.0
    params.vit_wsc = 0.60       params.agi_wsc = 0.0
    params.int_wsc = 0.0        params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Ascetics Fury
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised VIT mod.
-----------------------------------

h2h:addOverride ("xi.actions.weaponskills.ascetics_fury.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 1
    params.ftp100 = 4.0 params.ftp200 = 4.0 params.ftp300 = 4.0
    params.str_wsc = 0.75 params.dex_wsc = 0.0 params.vit_wsc = 0.75 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.1 params.crit200 = 0.2 params.crit300 = 0.4
    params.canCrit = true
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Stringing Pummel
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised VIT mod.
-----------------------------------

h2h:addOverride ("xi.actions.weaponskills.stringing_pummel.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 5
    params.ftp100 = 2.0 params.ftp200 = 2.0 params.ftp300 = 2.0
    params.str_wsc = 0.75 params.dex_wsc = 0.0 params.vit_wsc = 0.75 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.15 params.crit200 = 0.30 params.crit300 = 0.45
    params.canCrit = true
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Shijin Spiral
-- Notes on this modification;
-- Raised FTP mod.
-- Raised DEX mod.
-- Raised ATK mod.
-----------------------------------

h2h:addOverride ("xi.actions.weaponskills.shijin_spiral.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 4
    params.ftp100 = 6.5 params.ftp200 = 6.5 params.ftp300 = 6.5
    params.str_wsc = 0.0 params.dex_wsc = 0.95 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.25; params.atk200 = 1.25; params.atk300 = 1.25
    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if damage > 0 then
        local duration = (tp / 1000) + 4
        if not target:hasStatusEffect(xi.effect.PLAGUE) then
            target:addStatusEffect(xi.effect.PLAGUE, 5, 0, duration)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end)

return h2h
