-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/weaponskills")
-----------------------------------

local katana = Module:new("katana_ws_mods")

--[[
-----------------------------------
-- Blade Jin
-----------------------------------
katana:addOverride ("xi.actions.weaponskills.blade_jin.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 3
    params.ftp100 = 1.0 params.ftp200 = 1.0 params.ftp300 = 1.0
    params.str_wsc = 0.4 params.dex_wsc = 0.4 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.15 params.crit200 = 0.3 params.crit300 = 0.5
    params.canCrit = true
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0


    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)
]]

-----------------------------------
-- Blade Kamu
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised INT mod.
-----------------------------------
katana:addOverride ("xi.actions.weaponskills.blade_kamu.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 1
    params.ftp100 = 4.75 params.ftp200 = 4.75 params.ftp300 = 4.75
    params.str_wsc = 0.80 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.80
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.3; params.atk200 = 1.3; params.atk300 = 1.3

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    if damage > 0 then
        if not target:hasStatusEffect(xi.effect.ACCURACY_DOWN) then
            local duration = tp / 1000 * 60 * applyResistanceAddEffect(player, target, xi.element.EARTH, 0)
            target:addStatusEffect(xi.effect.ACCURACY_DOWN, 10, 0, duration)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Blade Ku
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised DEX mod.
-----------------------------------
katana:addOverride ("xi.actions.weaponskills.blade_ku.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 5
    params.ftp100 = 1.5 params.ftp200 = 1.75 params.ftp300 = 2.0
    params.str_wsc = 0.50 params.dex_wsc = 0.50 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 1.0 params.acc200 = 1.1 params.acc300 = 1.2
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Blade Metsu
-- Notes on this modification;
-- Raised FTP mod.
-- Raised DEX mod.
-----------------------------------
katana:addOverride ("xi.actions.weaponskills.blade_metsu.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 5.75 params.ftp200 = 5.75 params.ftp300 = 5.75
    params.str_wsc = 0.0 params.dex_wsc = 0.85 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    if damage > 0 then
        if not target:hasStatusEffect(xi.effect.PARALYSIS) then
            local duration = 60 * applyResistanceAddEffect(player, target, xi.element.ICE, 0)
            target:addStatusEffect(xi.effect.PARALYSIS, 10, 0, duration)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Blade Shun
-- Notes on this modification;
-- Raised FTP mod.
-- Raised DEX mod.
-- Raised ATK mod.
-----------------------------------
katana:addOverride ("xi.actions.weaponskills.blade_shun.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 5
    params.ftp100 = 4.50 params.ftp200 = 4.50 params.ftp300 = 4.50
    params.str_wsc = 0.0 params.dex_wsc = 0.95 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.5 params.atk200 = 1.5 params.atk300 = 1.5

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

--[[
-----------------------------------
-- Blade Ten
-----------------------------------
katana:addOverride ("xi.actions.weaponskills.blade_ten.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 3.5 params.ftp200 = 3.7 params.ftp300 = 4.0
    params.str_wsc = 0.3 params.dex_wsc = 0.3 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1


    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)
]]

return katana
