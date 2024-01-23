-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/weaponskills")
-----------------------------------

local great_katana = Module:new("great_katana_ws_mods")

--[[
-----------------------------------
-- Tachi Gekko
-----------------------------------
great_katana:addOverride ("xi.actions.weaponskills.tachi_gekko.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    
    local params = {}
    params.numHits = 1
    params.ftp100 = 1.75 params.ftp200 = 1.88 params.ftp300 = 2.0
    params.str_wsc = 1.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 2.2; params.atk200 = 2.2; params.atk300 = 2.2


    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    if damage > 0 and not target:hasStatusEffect(xi.effect.SILENCE) then
        local duration = 60 * applyResistanceAddEffect(player, target, xi.magic.ele.WIND, 0)
        target:addStatusEffect(xi.effect.SILENCE, 1, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end)
]]

-----------------------------------
-- Tachi Kaiten
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-----------------------------------
great_katana:addOverride ("xi.actions.weaponskills.tachi_kaiten.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 5.0 params.ftp200 = 5.0 params.ftp300 = 5.0
    params.str_wsc = 0.80 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Tachi Kasha
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-----------------------------------
great_katana:addOverride ("xi.actions.weaponskills.tachi_kasha.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 3.50 params.ftp200 = 3.75 params.ftp300 = 4.0
    params.str_wsc = 0.85 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.5; params.atk200 = 1.5; params.atk300 = 1.5

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if damage > 0 and not target:hasStatusEffect(xi.effect.PARALYSIS) then
        local duration = 60 * applyResistanceAddEffect(player, target, xi.magic.ele.ICE, 0)
        target:addStatusEffect(xi.effect.PARALYSIS, 25, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Tachi Rana
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-----------------------------------
great_katana:addOverride ("xi.actions.weaponskills.tachi_rana.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 3
    params.ftp100 = 5.55 params.ftp200 = 5.55 params.ftp300 = 5.55
    params.str_wsc = 0.90 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.8 params.acc200 = 0.9 params.acc300 = 1.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Tachi: Shoha
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised ATK mod.
-----------------------------------
great_katana:addOverride ("xi.actions.weaponskills.tachi_shoha.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 2
    params.ftp100 = 5.70 params.ftp200 = 5.75 params.ftp300 = 5.80
    params.str_wsc = 0.95  params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.75; params.atk200 = 1.75; params.atk300 = 1.75

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

return great_katana
