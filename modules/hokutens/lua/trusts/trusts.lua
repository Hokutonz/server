-----------------------------------
require("modules/module_utils")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/weaponskillids")
-----------------------------------
local m = Module:new("trusts")

    -- All trusts rework aaev, elivira, halver, rainemard, zeid_ii, gessho, maximilian, semih_lafihna, 
    -- maat, mayakov, volker, uka_totlihn, naja_salaheem, nanaa_mihgo, qultada, kupofried, matsui-p

-- MEMO: Ygnas is not to be enabled in production with current values. Test enviroment only.	
--[[m:addOverride("xi.actions.spells.trust.ygnas.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECTRA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.SHELL, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELLRA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.POISON, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.POISONA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PARALYNA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BLINDNA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SILENA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.VIRUNA)
    trust:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.CURE_CAST_TIME, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.CURE_POTENCY, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.REFRESH, power)
    trust:addMod(xi.mod.HASTE_MAGIC, power)

    trust:setAutoAttackEnabled(false)
end)]]

m:addOverride("xi.actions.spells.trust.joachim.onMobSpawn", function(mob)
    super(mob)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.ELEGY, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.ELEGY)
end)

m:addOverride("xi.actions.spells.trust.ulmia.onMobSpawn", function(mob)
    super(mob)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, xi.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.MAGIC_FINALE)
end)

m:addOverride("xi.actions.spells.trust.aaev.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())
    
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.RAMPART, ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPART)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.PALISADE, ai.r.JA, ai.s.SPECIFIC, xi.ja.PALISADE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, xi.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.PHALANX, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PHALANX)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENLIGHT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.ENLIGHT)
    
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
    
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power * 5)
    trust:addMod(xi.mod.REGEN, 1)
    trust:addMod(xi.mod.ABSORB_DMG_TO_MP, 5)
    trust:addMod(xi.mod.FASTCAST, power / 2)
    trust:addMod(xi.mod.CURE_POTENCY, power)
    trust:addMod(xi.mod.ENMITY, power * 111)
end)

m:addOverride("xi.actions.spells.trust.aagk.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())
    
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.HASSO, ai.r.JA, ai.s.SPECIFIC, xi.ja.HASSO)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.MEDITATE, ai.r.JA, ai.s.SPECIFIC, xi.ja.MEDITATE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.THIRD_EYE)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.JUMP)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.HIGH_JUMP)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SEKKANOKI, ai.r.JA, ai.s.SPECIFIC, xi.ja.SEKKANOKI)

    trust:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.HIGHEST)
    
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power * 5)
    trust:addMod(xi.mod.ACC, power * 5)
    trust:addMod(xi.mod.WSACC, power * 5)
    trust:addMod(xi.mod.STR, power * 2)
    trust:addMod(xi.mod.STORETP, 240)
    trust:addMod(xi.mod.JUMP_TP_BONUS, 250)
end)

m:addOverride("xi.actions.spells.trust.ingrid.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())
    
    trust:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 20, ai.r.JA, ai.s.SPECIFIC, xi.ja.CONVERT)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURAGA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURAGA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECTRA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.SHELL, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELLRA)
    trust:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, xi.effect.HASTE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HASTE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.POISON, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.POISONA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PARALYNA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BLINDNA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SILENA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.VIRUNA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.CURSE_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURSNA)
    trust:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.STONESKIN, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONESKIN)

    local power = trust:getMainLvl()
    local half = math.floor(power / 2)
    trust:addMod(xi.mod.MP, power * 5)
    trust:addMod(xi.mod.CURE_POTENCY, 5)
    trust:addMod(xi.mod.MND, half)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)

    trust:setAutoAttackEnabled(false)

    trust:setMobMod(xi.mobMod.TRUST_DISTANCE, xi.trust.movementType.MID_RANGE)
end)

m:addOverride("xi.actions.spells.trust.elivira.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.EVOKERS_ROLL, ai.r.JA, ai.s.SPECIFIC, xi.ja.EVOKERS_ROLL)  -- Refresh
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.WARLOCKS_ROLL, ai.r.JA, ai.s.SPECIFIC, xi.ja.WARLOCKS_ROLL) -- Magic Accuracy
    trust:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0, 10)

    -- Notable: Uses a balance of melee and ranged attacks.
    -- TODO: Observe his WS behaviour on retail
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.WSACC, power*3)
    trust:addMod(xi.mod.ACC, power*2)   
end)

m:addOverride("xi.actions.spells.trust.halver.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())
    
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, xi.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
    
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power * 4)
    trust:addMod(xi.mod.ENMITY, power * 25)
end)

m:addOverride("xi.actions.spells.trust.rainemard.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COMPOSURE, ai.r.JA, ai.s.SPECIFIC, xi.ja.COMPOSURE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 5, ai.r.JA, ai.s.SPECIFIC, xi.ja.CONVERT)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    trust:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, xi.effect.HASTE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HASTE)
    trust:addSimpleGambit(ai.t.CASTER, ai.c.NOT_STATUS, xi.effect.REFRESH, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.REFRESH)
    trust:addSimpleGambit(ai.t.TANK, ai.c.NOT_STATUS, xi.effect.REFRESH, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.REFRESH)
    trust:addSimpleGambit(ai.t.RANGED, ai.c.NOT_STATUS, xi.effect.FLURRY, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.FLURRY)
    trust:addSimpleGambit(ai.t.TOP_ENMITY, ai.c.NOT_STATUS, xi.effect.PHALANX, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PHALANX)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, xi.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DISPEL)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENBLIZZARD, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.ENBLIZZARD, 60)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.DIA, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DIA, 60)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SLOW, 60)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.EVASION_DOWN, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DISTRACT, 60)   

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power * 2)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ENSPELL_DMG, power / 4)
    trust:addMod(xi.mod.HASTE_MAGIC, power / 3)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power * 2)
end)

m:addOverride("xi.actions.spells.trust.zeid_ii.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SOULEATER)
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.LAST_RESORT)

    trust:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.RANDOM)
    
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power * 3)
end)

m:addOverride("xi.actions.spells.trust.gessho.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    xi.trust.teamworkMessage(trust, {
        [xi.magic.spell.NAJA_SALAHEEM] = xi.trust.messageOffset.TEAMWORK_1,
        [xi.magic.spell.ABQUHBAH] = xi.trust.messageOffset.TEAMWORK_2,
    })

    trust:addListener("WEAPONSKILL_USE", "GESSHO_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
        if wsid == 3257 then -- Shibaraku
            -- You have left me no choice. Prepare yourself!
            xi.trust.message(mobArg, xi.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)

    -- Shadows are represented by xi.effect.COPY_IMAGE, but with different icons depending on the tier
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COPY_IMAGE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.UTSUSEMI)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.KURAYAMI, 60)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HOJO, 60)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.YONIN, ai.r.JA, ai.s.SPECIFIC, xi.ja.YONIN)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power * 4)
    trust:addMod(xi.mod.DOUBLE_ATTACK, 15)
    trust:addMod(xi.mod.ENMITY, power * 60)
end)

m:addOverride("xi.actions.spells.trust.maximilian.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COPY_IMAGE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.UTSUSEMI)

    trust:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.HIGHEST)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power * 4)
    trust:addMod(xi.mod.DOUBLE_ATTACK, 15)
end)

m:addOverride("xi.actions.spells.trust.semih_lafihna.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())
    
    xi.trust.teamworkMessage(trust, {
        [xi.magic.spell.STAR_SIBYL] = xi.trust.messageOffset.TEAMWORK_1,
        [xi.magic.spell.AJIDO_MARUJIDO] = xi.trust.messageOffset.TEAMWORK_2,
    })
    
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.BARRAGE, ai.r.JA, ai.s.SPECIFIC, xi.ja.BARRAGE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SHARPSHOT, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHARPSHOT)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.DOUBLE_SHOT, ai.r.JA, ai.s.SPECIFIC, xi.ja.DOUBLE_SHOT)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0)
    
    trust:addListener("WEAPONSKILL_USE", "SEMIH_LAFIHNA_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
        if wsid == 3490 then -- Stellar Arrow
            -- I'll show you no quarter!
            xi.trust.message(mobArg, xi.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)
    
    trust:setAutoAttackEnabled(false)
    
    trust:addMod(xi.mod.STORETP, 40)
end)

m:addOverride("xi.actions.spells.trust.maat.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())
    
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.MANTRA)
    
    trust:addListener("WEAPONSKILL_USE", "MAAT_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
        if wsid == 3263 then -- Bear Killer
            --  Heh heh heh
            xi.trust.message(mobArg, xi.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)
    
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.HIGHEST)
    
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power * 3)
    trust:addMod(xi.mod.DOUBLE_ATTACK, 15)
end)

-- MEMO: Leonoyne is not to be enabled in production with current values. Test enviroment only.
--[[m:addOverride("xi.actions.spells.trust.leonoyne.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SOULEATER)
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.LAST_RESORT)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.BLIZZARD)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.THUNDER)

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power * 2)
    trust:addMod(xi.mod.MACC, power * 2)
    trust:addMod(xi.mod.DEF, power * 2)
    trust:addMod(xi.mod.MDEF, power * 2)
    trust:addMod(xi.mod.ATT, power * 3)
    trust:addMod(xi.mod.ACC, power * 5)
    trust:addMod(xi.mod.DOUBLE_ATTACK, 20)
    trust:addMod(xi.mod.TRIPLE_ATTACK, 9)
    trust:addMod(xi.mod.STORETP, 100)
    trust:addMod(xi.mod.REFRESH, 3)
end)]]

m:addOverride("xi.actions.spells.trust.mayakov.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 65, ai.r.JA, ai.s.HIGHEST_WALTZ, xi.ja.CURING_WALTZ)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NO_SAMBA, 0, ai.r.JA, ai.s.BEST_SAMBA, xi.ja.HASTE_SAMBA)
    trust:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, xi.effectFlag.WALTZABLE, ai.r.JA, ai.s.SPECIFIC, xi.ja.HEALING_WALTZ)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SABER_DANCE, ai.r.JA, ai.s.SPECIFIC, xi.ja.SABER_DANCE)
    
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
    
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power * 4)
    trust:addMod(xi.mod.STORETP, 10)
    trust:addMod(xi.mod.DOUBLE_ATTACK, 15)
end)

m:addOverride("xi.actions.spells.trust.volker.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    xi.trust.teamworkMessage(trust, {
        [xi.magic.spell.NAJI] = xi.trust.messageOffset.TEAMWORK_1,
        [xi.magic.spell.CID] = xi.trust.messageOffset.TEAMWORK_2,
        [xi.magic.spell.KLARA] = xi.trust.messageOffset.TEAMWORK_3,
    })

    trust:addSimpleGambit(ai.t.MASTER, ai.c.HPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.WARCRY, ai.r.JA, ai.s.SPECIFIC, xi.ja.WARCRY)   
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.AGGRESSOR, ai.r.JA, ai.s.SPECIFIC, xi.ja.AGGRESSOR) 
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.BERSERK, ai.r.JA, ai.s.SPECIFIC, xi.ja.BERSERK) 
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.RETALIATION, ai.r.JA, ai.s.SPECIFIC, xi.ja.RETALIATION)

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)  
    
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power * 4)
    trust:addMod(xi.mod.ENMITY, power * 25)
end)

m:addOverride("xi.actions.spells.trust.uka_totlihn.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    xi.trust.teamworkMessage(trust, {
        [xi.magic.spell.ULLEGORE] = xi.trust.messageOffset.TEAMWORK_1,
        [xi.magic.spell.MUMOR] = xi.trust.messageOffset.TEAMWORK_2,
    })

    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.JA, ai.s.HIGHEST_WALTZ, xi.ja.CURING_WALTZ)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FINISHING_MOVE_5, ai.r.JA, ai.s.SPECIFIC, xi.ja.QUICKSTEP, 20)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NO_SAMBA, 0, ai.r.JA, ai.s.BEST_SAMBA, xi.ja.HASTE_SAMBA)
    trust:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, xi.effectFlag.WALTZABLE, ai.r.JA, ai.s.SPECIFIC, xi.ja.HEALING_WALTZ)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.VIOLENT_FLOURISH)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.VIOLENT_FLOURISH)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.VIOLENT_FLOURISH)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.VIOLENT_FLOURISH)
    trust:addSimpleGambit(ai.t.SELF, ai.c.STATUS, xi.effect.FINISHING_MOVE_5, ai.r.JA, ai.s.SPECIFIC, xi.ja.REVERSE_FLOURISH, 60)
    
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)  
    
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power * 3)
    trust:addMod(xi.mod.STORETP, 10)
end)

m:addOverride("xi.actions.spells.trust.naja_salaheem.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    xi.trust.teamworkMessage(trust, {
        [xi.magic.spell.GESSHO] = xi.trust.messageOffset.TEAMWORK_1,
        [xi.magic.spell.RONGELOUTS] = xi.trust.messageOffset.TEAMWORK_2,
        [xi.magic.spell.ABQUHBAH] = xi.trust.messageOffset.TEAMWORK_3,
    })

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

    trust:addListener("WEAPONSKILL_USE", "NAJA_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
        if wsid == 3215 then -- Peacebreaker
            --  Cha-ching! Thirty gold coins!
            xi.trust.message(mobArg, xi.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)

    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.FOCUS)
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.DODGE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.COUNTERSTANCE)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power*3)
    trust:addMod(xi.mod.STORETP, 10)
end)

m:addOverride("xi.actions.spells.trust.nanaa_mihgo.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    xi.trust.teamworkMessage(trust, {
        [xi.magic.spell.ROMAA_MIHGO] = xi.trust.messageOffset.TEAMWORK_1,
    })

    trust:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.DESPOIL)

    trust:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.HIGHEST)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power*3)
    trust:addMod(xi.mod.STORETP, 10)
end)

m:addOverride("xi.actions.spells.trust.qultada.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.SAMURAI_ROLL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SAMURAI_ROLL)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.FIGHTERS_ROLL, ai.r.JA, ai.s.SPECIFIC, xi.ja.FIGHTERS_ROLL)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0, 10)

    trust:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.RANDOM)

    local power = trust:getMainLvl() / 3
    trust:addMod(xi.mod.MACC, power)
end)

m:addOverride("xi.actions.spells.trust.kupofried.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addStatusEffectEx(xi.effect.COLURE_ACTIVE, xi.effect.COLURE_ACTIVE, 6, 3, 0, xi.effect.CORSAIRS_ROLL, 120, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    trust:setAutoAttackEnabled(false)
    trust:setUnkillable(true)
end)

m:addOverride("xi.actions.spells.trust.mumor_ii.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())
    
    trust:addStatusEffectEx(xi.effect.COLURE_ACTIVE, xi.effect.COLURE_ACTIVE, 6, 3, 0, xi.effect.REGAIN, 2, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.NONE, 60)
    local power = 100 - trust:getMainLvl()
    local pow2 = math.floor(power / 3)
    trust:addMod(xi.mod.MATT, -power)
    trust:addMod(xi.mod.INT, -pow2)
end)

-- MEMO: AAHM is not to be enabled in production with current values. Test enviroment only.
--[[m:addOverride("xi.actions.spells.trust.aahm.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    -- Shadows are represented by xi.effect.COPY_IMAGE, but with different icons depending on the tier
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COPY_IMAGE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.UTSUSEMI)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.KURAYAMI, 60)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HOJO, 60)

    -- DD Mode
    trust:addSimpleGambit(ai.t.SELF, ai.c.PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.BERSERK)
    trust:addSimpleGambit(ai.t.SELF, ai.c.PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.INNIN)
    trust:addSimpleGambit(ai.t.TANK, ai.c.HPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)

    -- Tank Mode
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.WARCRY)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.YONIN)
    trust:addSimpleGambit(ai.t.MASTER, ai.c.HPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)

    local power = trust:getMainLvl() / 3

    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.ATT, power * 3)
    trust:addMod(xi.mod.ACC, power * 5)
    trust:addMod(xi.mod.UTSUSEMI_BONUS, 1)


    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
end)]]

local trustToReplaceName = "lhu_mhakaracca"

m:addOverride(string.format("xi.actions.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(3121) -- Trust: Matsui-P
    trust:renameEntity("Matsui-P")

    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COPY_IMAGE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.UTSUSEMI)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.KURAYAMI)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HOJO)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE) 
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.NONE, 45)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN) 
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.INNIN, ai.r.JA, ai.s.SPECIFIC, xi.ja.INNIN)

    trust:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.RANDOM)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power * 4)
    trust:addMod(xi.mod.DOUBLE_ATTACK, 25)
    trust:addMod(xi.mod.MP, 150)
end)

m:addOverride(string.format("xi.actions.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:printToPlayer("Matsui-P, Lets get this party started", 4, "Matsui-P") --4: MESSAGE_PARTY
        end 
    end
end)

local trustToReplaceName2 = "kuyin_hathdenna"

m:addOverride(string.format("xi.actions.spells.trust.%s.onSpellCast", trustToReplaceName2), function(caster, target, spell)
    -----------------------------------
    -- NOTE: This is the logic from xi.trust.spawn()
    -----------------------------------
    local trust = caster:spawnTrust(spell:getID())

    -- Records of Eminence: Call Forth an Alter Ego
    if caster:getEminenceProgress(932) then
        xi.roe.onRecordTrigger(caster, 932)
    end

    -----------------------------------
    -- New logic below
    -----------------------------------
    trust:setModelId(3119) -- Trust: Cornelia
    trust:renameEntity("Cornelia")

    -- local boostAmount = math.ceil((30 / 99) * caster:getMainLvl())
    trust:addStatusEffectEx(xi.effect.COLURE_ACTIVE, xi.effect.COLURE_ACTIVE, 6, 3, 0, xi.effect.GEO_HASTE, 1200, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    --trust:addStatusEffectEx(xi.effect.GEO_ACCURACY_BOOST, xi.effect.GEO_ACCURACY_BOOST, 6, 3, 0, xi.effect.GEO_ACCURACY_BOOST, boostAmount, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    --trust:addStatusEffectEx(xi.effect.GEO_MAGIC_ACC_BOOST, xi.effect.GEO_MAGIC_ACC_BOOST, 6, 3, 0, xi.effect.GEO_MAGIC_ACC_BOOST, boostAmount, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    -- TODO: Ranged accuracy boost

    trust:setAutoAttackEnabled(false)
    trust:setUnkillable(true)

    -- Cache this for later
    trust:setLocalVar("MASTER_ID", trust:getMaster():getID())
end)

m:addOverride(string.format("xi.actions.spells.trust.%s.onMobSpawn", trustToReplaceName2), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:printToPlayer("Cornelia, at your service.", 4, "Cornelia") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.actions.spells.trust.%s.onMobDespawn", trustToReplaceName2), function(mob)
    -- NOTE: Apparently getMaster() returns nil by now, so we're going to get the master's ID that
    --     : we cached earlier
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:printToPlayer("Remember: never give up!", 4, "Cornelia") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.actions.spells.trust.%s.onMobDeath", trustToReplaceName2), function(mob)
    -- Intentionally blank
end)
--[[
local rovKIBattlefieldIDs = set{
    5,    -- Shattering Stars (WAR LB5)
    6,    -- Shattering Stars (BLM LB5)
    7,    -- Shattering Stars (RNG LB5)
    70,   -- Shattering Stars (RDM LB5)
    71,   -- Shattering Stars (THF LB5)
    72,   -- Shattering Stars (BST LB5)
    101,  -- Shattering Stars (MNK LB5)
    102,  -- Shattering Stars (WHM LB5)
    103,  -- Shattering Stars (SMN LB5)
    163,  -- Survival of the Wisest (SCH LB5)
    194,  -- Shattering Stars (SAM LB5)
    195,  -- Shattering Stars (NIN LB5)
    196,  -- Shattering Stars (DRG LB5)
    517,  -- Shattering Stars (PLD LB5)
    518,  -- Shattering Stars (DRK LB5)
    519,  -- Shattering Stars (BRD LB5)
    530,  -- A Furious Finale (DNC LB5)
    1091, -- Breaking the Bonds of Fate (COR LB5)
    1123, -- Achieving True Power (PUP LB5)
    1154, -- The Beast Within (BLU LB5)
-- TODO: GEO LB5
-- TODO: RUN LB5
}

local domains =
{
    [xi.zone.CEIZAK_BATTLEGROUNDS]  = 1,
    [xi.zone.FORET_DE_HENNETIEL]    = 1,
    [xi.zone.MORIMAR_BASALT_FIELDS] = 1,
    [xi.zone.YORCIA_WEALD]          = 1,
    [xi.zone.MARJAMI_RAVINE]        = 1,
    [xi.zone.KAMIHR_DRIFTS]         = 1,
    [xi.zone.RAKAZNAR_TURRIS]       = 1,
}

m:addOverride("xi.trust.canCast", function(caster, spell, notAllowedTrustIds)
    -- Trusts must be enabled in settings
    if xi.settings.main.ENABLE_TRUST_CASTING == 0 then
        return xi.msg.basic.TRUST_NO_CAST_TRUST
    end

    -- GMs can do what they want (as long as ENABLE_TRUST_CASTING is enabled)
    if caster:getGMLevel() > 0 and caster:checkNameFlags(0x04000000) then
        return 0
    end

    -- Trusts not allowed in an alliance
    if caster:checkSoloPartyAlliance() == 2 then
        return xi.msg.basic.TRUST_NO_CAST_TRUST
    end

    -- Trusts only allowed in certain zones (Remove this for trusts everywhere)
    if not caster:canUseMisc(xi.zoneMisc.TRUST) then
        return xi.msg.basic.TRUST_NO_CALL_AE
    end

    -- You can only summon trusts if you are the party leader or solo
    local leader = caster:getPartyLeader()
    if leader and caster:getID() ~= leader:getID() then
        caster:messageSystem(xi.msg.system.TRUST_SOLO_OR_LEADER)
        return -1
    end

    -- Block summoning trusts if seeking a party
    if caster:isSeekingParty() then
        caster:messageSystem(xi.msg.system.TRUST_NO_SEEKING_PARTY)
        return -1
    end

    -- Block summoning trusts if someone recently joined party (120s)
    local lastPartyMemberAddedTime = caster:getPartyLastMemberJoinedTime()
    if os.time() - lastPartyMemberAddedTime < 120 then
        caster:messageSystem(xi.msg.system.TRUST_DELAY_NEW_PARTY_MEMBER)
        return -1
    end

    -- Trusts cannot be summoned if you have hate (Except inside Domain Invasion areas)
    local zoneID = caster:getZoneID()

    if
        caster:hasEnmity() and
        domains[zoneID] == nil
    then
        caster:messageSystem(xi.msg.system.TRUST_NO_ENMITY)
        return -1
    end

    -- Check party for trusts
    local numPt     = 0
    local numTrusts = 0
    local party     = caster:getPartyWithTrusts()

    for _, member in pairs(party) do
        if member:getObjType() == xi.objType.TRUST then
            -- Check for same trust
            if member:getTrustID() == spell:getID() then
                caster:messageSystem(xi.msg.system.TRUST_ALREADY_CALLED)
                return -1
            -- Check not allowed trust combinations (Shantotto I vs Shantotto II)
            elseif type(notAllowedTrustIds) == "number" then
                if member:getTrustID() == notAllowedTrustIds then
                    caster:messageSystem(xi.msg.system.TRUST_ALREADY_CALLED)
                    return -1
                end
            elseif type(notAllowedTrustIds) == "table" then
                for _, v in pairs(notAllowedTrustIds) do
                    if type(v) == "number" then
                        if member:getTrustID() == v then
                            caster:messageSystem(xi.msg.system.TRUST_ALREADY_CALLED)
                            return -1
                        end
                    end
                end
            end

            numTrusts = numTrusts + 1
        end

        numPt = numPt + 1
    end

    -- Max party size
    if numPt >= 6 then
        caster:messageSystem(xi.msg.system.TRUST_MAXIMUM_NUMBER)
        return -1
    end

    -- Some battlefields allow trusts after you get this ROV Key Item
    local casterBattlefieldID = caster:getBattlefieldID()
    if
        rovKIBattlefieldIDs[casterBattlefieldID] and
        not caster:hasKeyItem(xi.ki.RHAPSODY_IN_UMBER)
    then
        return xi.msg.basic.TRUST_NO_CAST_TRUST
    end

    -- Limits set by ROV Key Items
    if
        numTrusts >= 3 and
        not caster:hasKeyItem(xi.ki.RHAPSODY_IN_WHITE)
    then
        caster:messageSystem(xi.msg.system.TRUST_MAXIMUM_NUMBER)
        return -1
    elseif
        numTrusts >= 4 and
        not caster:hasKeyItem(xi.ki.RHAPSODY_IN_CRIMSON)
    then
        caster:messageSystem(xi.msg.system.TRUST_MAXIMUM_NUMBER)
        return -1
    end

    if not xi.trust.checkBattlefieldTrustCount(caster) then
        return xi.msg.basic.TRUST_NO_CAST_TRUST
    end

    return 0
end)

m:addOverride("xi.trust.spawn", function(caster, spell)
    local trust  = caster:spawnTrust(spell:getID())
    local zoneID = caster:getZoneID()

    if domains[zoneID] ~= nil then
        local dailyQuestCompleted = caster:getCharVar("[DQ]Completed")
        trust:addMod(xi.mod.HPP, 10 * dailyQuestCompleted)
        trust:addMod(xi.mod.MPP, 10 * dailyQuestCompleted)
        trust:updateHealth()
        trust:setHP(trust:getMaxHP())
        trust:setMP(trust:getMaxMP())

        if dailyQuestCompleted > 4 then
            trust:addStatusEffect(xi.effect.REFRESH, 3, 0, 0)
        elseif dailyQuestCompleted > 3 then
            trust:addStatusEffect(xi.effect.REFRESH, 2, 0, 0)
        elseif dailyQuestCompleted > 2 then
            trust:addStatusEffect(xi.effect.REFRESH, 1, 0, 0)
        end
    end

    -- Records of Eminence: Call Forth an Alter Ego
    if caster:getEminenceProgress(932) then
        xi.roe.onRecordTrigger(caster, 932)
    end

    return 0
end)
]]--
return m
