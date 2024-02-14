-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/weaponskills")
-----------------------------------

local scythe = Module:new("scythe_ws_mods")

-----------------------------------
-- Catastrophe
-- Notes on this modification;
-- Added STR mod.
-- Raised INT mod.
-- Changed HP return formula.
-----------------------------------
scythe:addOverride("xi.actions.weaponskills.catastrophe.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 3.0 params.ftp200 = 3.0 params.ftp300 = 3.0
    params.str_wsc = 0.60 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.60 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if not target:isUndead() then
        local drain = math.floor(damage * (math.random(40,50)/100))
        player:addHP(drain)

    end

    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Entropy
-- Notes on this modification;
-- Raised FTP mod.
-- Raised INT mod.
-- Changed MP return formula.
-----------------------------------
scythe:addOverride("xi.actions.weaponskills.entropy.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 4
    params.ftp100 = 5.10 params.ftp200 = 5.15 params.ftp300 = 5.20
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0
    params.agi_wsc = 0.0 params.int_wsc = 0.95 params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    player:addMP(damage * math.random(10,12)/100)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Guillotine
-----------------------------------
--[[
scythe:addOverride("xi.actions.weaponskills.guillotine.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 4
    params.ftp100 = 0.7 params.ftp200 = 0.7 params.ftp300 = 0.7
    params.str_wsc = 0.25 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.25 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200=0.0 params.crit300=0.0
    params.canCrit = false
    params.acc100 = 0 params.acc200=0 params.acc300=0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if (damage > 0 and target:hasStatusEffect(xi.effect.SILENCE) == false) then
        local duration = (30 + (tp/1000 * 30)) * applyResistanceAddEffect(player, target, xi.element.WIND, 0)
        target:addStatusEffect(xi.effect.SILENCE, 1, 0, duration)
    end
    return tpHits, extraHits, criticalHit, damage

end)
]]

-----------------------------------
-- Insurgency
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised INT mod.
-----------------------------------
scythe:addOverride("xi.actions.weaponskills.insurgency.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    if player:getMainLvl() < 75 then
         return action:messageID(target:getID(), xi.msg.basic.EVADES)
    end

    local params = {}
    params.numHits = 4
    params.ftp100 = 3.30 params.ftp200 = 3.55 params.ftp300 = 3.80
    params.str_wsc = 0.30 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.30
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

-----------------------------------
-- Quietus
-----------------------------------
--[[
scythe:addOverride("xi.actions.weaponskills.quietus.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 3.0 params.ftp200 = 3.0 params.ftp300 = 3.0
    params.str_wsc = 0.4 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.4 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0
    params.ignoresDef = true
    params.ignored100 = 0.1
    params.ignored200 = 0.3
    params.ignored300 = 0.5

    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.EMPYREAN)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)
]]

-----------------------------------
-- Spiral Hell
-- Notes on this modification;
-- Raised FTP mod.
-- Raised STR mod.
-- Raised INT mod.
-----------------------------------
scythe:addOverride("xi.actions.weaponskills.spiral_hell.onUseWeaponSkill", function(player, target, wsID, tp, primary, action, taChar)
    
    local params = {}
    params.numHits = 1
    params.ftp100 = 2.5 params.ftp200 = 2.75 params.ftp300 = 3.0
    params.str_wsc = 0.65 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.65 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0 params.acc200 = 0 params.acc300 = 0
    params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end)

return scythe
