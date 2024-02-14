-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/weaponskills")
-----------------------------------

local club = Module:new("club_ws_mods")

-----------------------------------
-- Black Halo
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised MND mod.
-- Raised ATK mod.
-----------------------------------

club:addOverride ("xi.actions.weaponskills.black_halo.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 2
    params.ftp100 = 3.25 params.ftp200 = 3.30 params.ftp300 = 3.35
    params.str_wsc = 0.75 params.dex_wsc = 0.0 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.75
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.5 params.atk200 = 1.5 params.atk300 = 1.5

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Randgrith
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised MND mod.
-----------------------------------

club:addOverride ("xi.actions.weaponskills.randgrith.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 5.5 params.ftp200 = 5.5 params.ftp300 = 5.5
    params.str_wsc = 0.85 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.85 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.RELIC)

    if damage > 0 then
        if not target:hasStatusEffect(xi.effect.EVASION_DOWN) then
            local duration = tp / 1000 * 20 * applyResistanceAddEffect(player, target, xi.element.ICE, 0)
            target:addStatusEffect(xi.effect.EVASION_DOWN, 32, 0, duration)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Realmrazer
-- Notes on this modification;
-- Raised FTP mod.
-- Raised MND mod.
-- Raised ACC mod.
-- Raised ATK mod.
-----------------------------------

club:addOverride ("xi.actions.weaponskills.realmrazer.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 7
    params.ftp100 = 6.0 params.ftp200 = 6.0 params.ftp300 = 6.0
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.85
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.98 params.acc200 = 0.99 params.acc300 = 1.0
    params.atk100 = 1.5 params.atk200 = 1.5 params.atk300 = 1.5

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Mystic Boon
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised MND mod.
-- Raised ATK mod.
-- Changed 100% Damage to MP returns to variance-range to compensate for collectively higher damage adjustment.
-----------------------------------

club:addOverride ("xi.actions.weaponskills.mystic_boon.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 1
    params.ftp100 = 5.5 params.ftp200 = 5.6 params.ftp300 = 5.7
    params.str_wsc = 0.95 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.95 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.25; params.atk200 = 1.25; params.atk300 = 1.25

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    player:addMP(damage * math.random(35,45)/100)

    return tpHits, extraHits, criticalHit, damage
end)

return club
