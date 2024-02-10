-----------------------------------
-- Area: Al'Taieu
--   NM: Jailer of Love
-- !pos 431 -0 -603 33
-- !additem 1847
-- !additem 1848
-- !additem 1849
-- Memo; the functionality of this module requires addtional functions added to the base file to over ride.
-----------------------------------
require("modules/module_utils")
require("scripts/globals/magic")
require("scripts/mixins/job_special")
require("scripts/mixins/rage")
local ID = require("scripts/zones/AlTaieu/IDs")
-----------------------------------
local Love = Module:new("love_nm")

xi.module.ensureTable("xi.zones.AlTaieu.mobs.Jailer_of_Love")

local minionGroup =
{
    [0] = 10, -- Qnxzomit
    [1] = 19, -- Qnhpemde
    [2] =  1, -- Ruphuabo
    [3] = 13, -- Qnxzomit
    [4] = 22, -- Qnhpemde
    [5] =  4, -- Ruphuabo
    [6] = 16, -- Qnxzomit
    [7] = 25, -- Qnhpemde
}

Love:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Love.onMobInitialize", function(mob)
    g_mixins.job_special(mob)
    g_mixins.rage(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:setMod(xi.mod.STUNRES, 100)
    mob:setMod(xi.mod.BLINDRES, 100)
    mob:setMod(xi.mod.BINDRES, 100)
    mob:setMod(xi.mod.GRAVITYRES, 100)
    mob:setMod(xi.mod.SLEEPRES, 100)
    mob:setMod(xi.mod.POISONRES, 100)
    mob:setMod(xi.mod.PARALYZERES, 100)
    mob:setMod(xi.mod.LULLABYRES, 100)
    mob:addMod(xi.mod.INT, 25)
    mob:addMod(xi.mod.MATT, 25)
    mob:addMod(xi.mod.REGAIN, 65)
    mob:addMod(xi.mod.CURE_POTENCY_RCVD, 65)
    mob:setMod(xi.mod.FIRE_MEVA, 150)
    mob:setMod(xi.mod.ICE_MEVA, 150)
    mob:setMod(xi.mod.WIND_MEVA, 150)
    mob:setMod(xi.mod.EARTH_MEVA, 150)
    mob:setMod(xi.mod.THUNDER_MEVA, 300)
    mob:setMod(xi.mod.WATER_MEVA, 150)
    mob:setMod(xi.mod.LIGHT_MEVA, 150)
    mob:setMod(xi.mod.DARK_MEVA, 150)
    mob:setMod(xi.mod.FIRE_SDT, 150)
    mob:setMod(xi.mod.ICE_SDT, 150)
    mob:setMod(xi.mod.WIND_SDT, 150)
    mob:setMod(xi.mod.EARTH_SDT, 150)
    mob:setMod(xi.mod.THUNDER_SDT, 300)
    mob:setMod(xi.mod.WATER_SDT, 150)
    mob:setMod(xi.mod.LIGHT_SDT, 150)
    mob:setMod(xi.mod.DARK_SDT, 150)
    mob:addMod(xi.mod.MACC, 30)
    mob:addStatusEffect(xi.effect.REFRESH, 150, 3, 0)
    mob:setMagicCastingEnabled(true)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
-- Regen and MDEF adjusted after gimmick is completed.
    mob:addStatusEffect(xi.effect.REGEN, 260, 3, 0)
    mob:addMod(xi.mod.MDEF, 500)
end)

Love:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Love.onAdditionalEffect", function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PARALYZE)
end)

Love:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Love.onMobSpawn", function(mob)
    mob:setMagicCastingEnabled(true)
    mob:setSpellList(17) -- Fire
    mob:setMod(xi.mod.FIRE_ABSORB, 100)
    mob:setMod(xi.mod.EARTH_ABSORB, 0)
    mob:setMod(xi.mod.WATER_ABSORB, 0)
    mob:setMod(xi.mod.WIND_ABSORB, 0)
    mob:setMod(xi.mod.ICE_ABSORB, 0)
    mob:setMod(xi.mod.LTNG_ABSORB, 0)
    mob:setMod(xi.mod.LIGHT_ABSORB, 0)
    mob:setMod(xi.mod.DARK_ABSORB, 0)
    mob:setMobMod(xi.mobMod.NO_STANDBACK, 0)
    mob:setMobMod(xi.mobMod.MAGIC_COOL, 15)
    mob:setMod(xi.mod.UFASTCAST, 50)
    mob:addMod(xi.mod.ATT, 207) -- 650 total atk
    mob:addMod(xi.mod.DEF, 257) -- 650 total def
    mob:addMod(xi.mod.EVA, 142) -- 460 total eva
    mob:setLocalVar("[rage]timer", 4800) -- 80 minute rage timer
end)

Love:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Love.onMobEngaged", function(mob, target)
    mob:hideName(false)
    mob:setUntargetable(false)
    mob:setAnimationSub(2)
    mob:setMagicCastingEnabled(true)
    mob:setLocalVar("fightTIME", 0)
end)

Love:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Love.onMobFight", function(mob, target)
    local astralFLOW = mob:getLocalVar("astralFLOW")
    local astralPETS = mob:getLocalVar("astralPETS")
    local fightTIME = mob:getLocalVar("fightTIME")
    local intervalTIME = 120 -- Define time between magic phase shifts.
    local isBusy = false
    local lifePercent = mob:getHPP()
    local MAGICphase = mob:getLocalVar("MAGICphase")
    local act = mob:getCurrentAction()
    if
        act == xi.act.MOBABILITY_START or
        act == xi.act.MOBABILITY_USING or
        act == xi.act.MOBABILITY_FINISH or
        act == xi.act.MAGIC_CASTING or
        act == xi.act.MAGIC_START or
        act == xi.act.MAGIC_FINISH
    then
        isBusy = true
    end
-- Don't change elemental phases while busy.
    if
        mob:actionQueueEmpty() and
        not isBusy
    then
-- Magic phase logic.
        if MAGICphase == 0
        then
            mob:setLocalVar("fightTIME", mob:getBattleTime())
            mob:setLocalVar("MAGICphase", 1)
            mob:useMobAbility(624) -- Dust cloud
        end

        if MAGICphase == 1 and
            mob:getBattleTime() - fightTIME > intervalTIME
        then
            mob:setLocalVar("fightTIME", mob:getBattleTime())
            mob:setLocalVar("MAGICphase", 2)
            mob:useMobAbility(624) -- Dust cloud
        end

        if MAGICphase == 2 and
            mob:getBattleTime() - fightTIME > intervalTIME
        then
            mob:setLocalVar("fightTIME", mob:getBattleTime())
            mob:setLocalVar("MAGICphase", 3)
            mob:useMobAbility(624) -- Dust cloud
        end

        if MAGICphase == 3 and
            mob:getBattleTime() - fightTIME > intervalTIME
        then
            mob:setLocalVar("fightTIME", mob:getBattleTime())
            mob:setLocalVar("MAGICphase", 4)
            mob:useMobAbility(624) -- Dust cloud
        end

        if MAGICphase == 4 and
            mob:getBattleTime() - fightTIME > intervalTIME
        then
            mob:setLocalVar("fightTIME", mob:getBattleTime())
            mob:setLocalVar("MAGICphase", 5)
            mob:useMobAbility(624) -- Dust cloud
        end

        if MAGICphase == 5 and
            mob:getBattleTime() - fightTIME > intervalTIME
        then
            mob:setLocalVar("fightTIME", mob:getBattleTime())
            mob:setLocalVar("MAGICphase", 6)
            mob:useMobAbility(624) -- Dust cloud
        end

        if MAGICphase == 6 and
            mob:getBattleTime() - fightTIME > intervalTIME
        then
            mob:setLocalVar("fightTIME", mob:getBattleTime())
            mob:setLocalVar("MAGICphase", 7)
            mob:useMobAbility(624) -- Dust cloud
        end

        if MAGICphase == 7 and
            mob:getBattleTime() - fightTIME > intervalTIME
        then
            mob:setLocalVar("fightTIME", mob:getBattleTime())
            mob:setLocalVar("MAGICphase", 8)
            mob:useMobAbility(624) -- Dust cloud
        end

        if MAGICphase == 8 and
            mob:getBattleTime() - fightTIME > intervalTIME
        then
            mob:setLocalVar("fightTIME", mob:getBattleTime())
            mob:setLocalVar("MAGICphase", 1)
            mob:useMobAbility(624) -- Dust cloud
        end
-- Define each magic phase below.
        if MAGICphase == 1 then -- Casts fire and absorbs fire.
            mob:setSpellList(484) -- Fire
            mob:setMod(xi.mod.FIRE_ABSORB, 100)
            mob:setMod(xi.mod.EARTH_ABSORB, 0)
            mob:setMod(xi.mod.WATER_ABSORB, 0)
            mob:setMod(xi.mod.WIND_ABSORB, 0)
            mob:setMod(xi.mod.ICE_ABSORB, 0)
            mob:setMod(xi.mod.LTNG_ABSORB, 0)
            mob:setMod(xi.mod.LIGHT_ABSORB, 0)
            mob:setMod(xi.mod.DARK_ABSORB, 0)

        elseif MAGICphase == 2 then  -- Casts earth and absorbs earth.
            mob:setSpellList(981) -- Earth
            mob:setMod(xi.mod.FIRE_ABSORB, 0)
            mob:setMod(xi.mod.EARTH_ABSORB, 100)
            mob:setMod(xi.mod.WATER_ABSORB, 0)
            mob:setMod(xi.mod.WIND_ABSORB, 0)
            mob:setMod(xi.mod.ICE_ABSORB, 0)
            mob:setMod(xi.mod.LTNG_ABSORB, 0)
            mob:setMod(xi.mod.LIGHT_ABSORB, 0)
            mob:setMod(xi.mod.DARK_ABSORB, 0)

        elseif MAGICphase == 3 then -- Casts water and absorbs water.
            mob:setSpellList(192) -- Water
            mob:setMod(xi.mod.FIRE_ABSORB, 0)
            mob:setMod(xi.mod.EARTH_ABSORB, 0)
            mob:setMod(xi.mod.WATER_ABSORB, 100)
            mob:setMod(xi.mod.WIND_ABSORB, 0)
            mob:setMod(xi.mod.ICE_ABSORB, 0)
            mob:setMod(xi.mod.LTNG_ABSORB, 0)
            mob:setMod(xi.mod.LIGHT_ABSORB, 0)
            mob:setMod(xi.mod.DARK_ABSORB, 0)

        elseif MAGICphase == 4 then -- Casts wind and absorbs wind.
            mob:setSpellList(302) -- Wind
            mob:setMod(xi.mod.FIRE_ABSORB, 0)
            mob:setMod(xi.mod.EARTH_ABSORB, 0)
            mob:setMod(xi.mod.WATER_ABSORB, 0)
            mob:setMod(xi.mod.WIND_ABSORB, 100)
            mob:setMod(xi.mod.ICE_ABSORB, 0)
            mob:setMod(xi.mod.LTNG_ABSORB, 0)
            mob:setMod(xi.mod.LIGHT_ABSORB, 0)
            mob:setMod(xi.mod.DARK_ABSORB, 0)

        elseif MAGICphase == 5 then -- Casts ice and absorbs ice.
            mob:setSpellList(167) -- Ice
            mob:setMod(xi.mod.FIRE_ABSORB, 0)
            mob:setMod(xi.mod.EARTH_ABSORB, 0)
            mob:setMod(xi.mod.WATER_ABSORB, 0)
            mob:setMod(xi.mod.WIND_ABSORB, 0)
            mob:setMod(xi.mod.ICE_ABSORB, 100)
            mob:setMod(xi.mod.LTNG_ABSORB, 0)
            mob:setMod(xi.mod.LIGHT_ABSORB, 0)
            mob:setMod(xi.mod.DARK_ABSORB, 0)

        elseif MAGICphase == 6 then -- Casts thunder and absorbs thunder.
            mob:setSpellList(482) -- Thunder
            mob:setMod(xi.mod.FIRE_ABSORB, 0)
            mob:setMod(xi.mod.EARTH_ABSORB, 0)
            mob:setMod(xi.mod.WATER_ABSORB, 0)
            mob:setMod(xi.mod.WIND_ABSORB, 0)
            mob:setMod(xi.mod.ICE_ABSORB, 0)
            mob:setMod(xi.mod.LTNG_ABSORB, 100)
            mob:setMod(xi.mod.LIGHT_ABSORB, 0)
            mob:setMod(xi.mod.DARK_ABSORB, 0)

        elseif MAGICphase == 7 then -- Casts light and absorbs light.
            mob:setSpellList(980) -- Light
            mob:setMod(xi.mod.FIRE_ABSORB, 0)
            mob:setMod(xi.mod.EARTH_ABSORB, 0)
            mob:setMod(xi.mod.WATER_ABSORB, 0)
            mob:setMod(xi.mod.WIND_ABSORB, 0)
            mob:setMod(xi.mod.ICE_ABSORB, 0)
            mob:setMod(xi.mod.LTNG_ABSORB, 0)
            mob:setMod(xi.mod.LIGHT_ABSORB, 100)
            mob:setMod(xi.mod.DARK_ABSORB, 0)

        elseif MAGICphase == 8 then -- Cast dark and absorbs dark.
            mob:setSpellList(982) -- Dark
            mob:setMod(xi.mod.FIRE_ABSORB, 0)
            mob:setMod(xi.mod.EARTH_ABSORB, 0)
            mob:setMod(xi.mod.WATER_ABSORB, 0)
            mob:setMod(xi.mod.WIND_ABSORB, 0)
            mob:setMod(xi.mod.ICE_ABSORB, 0)
            mob:setMod(xi.mod.LTNG_ABSORB, 0)
            mob:setMod(xi.mod.LIGHT_ABSORB, 0)
            mob:setMod(xi.mod.DARK_ABSORB, 100)
        end
    end
-- Reduce regen after nine Xzomits and Hpemdes are killed.
    if
        mob:getLocalVar("JoL_Regen_Reduction") == 0 and
        mob:getLocalVar("JoL_Qn_xzomit_Killed") >= 9 and
        mob:getLocalVar("JoL_Qn_hpemde_Killed") >= 9
    then
        mob:setLocalVar("JoL_Regen_Reduction", 1)
        mob:addMod(xi.mod.REGEN, -210) -- Regen at 50
        mob:addMod(xi.mod.MDEF, -470) -- +30 MDEF
        mob:setMobMod(xi.mobMod.NO_STANDBACK, 0)
    end
-- Spawn minions in 2.5 minute intervals.
    if os.time() > mob:getLocalVar("pop_pets") then
        mob:setLocalVar("pop_pets", os.time() + 150)

        local spawns = mob:getLocalVar("SPAWNS")
        if spawns < 8 then
            local minionOffset = ID.mob.JAILER_OF_LOVE + minionGroup[spawns]
            SpawnMob(minionOffset + 0):updateEnmity(target)
            SpawnMob(minionOffset + 1):updateEnmity(target)
            SpawnMob(minionOffset + 2):updateEnmity(target)
        else
-- Determine which sharks are currently spawned.
            local phuaboUp = {}
            local phuaboDn = {}
            for i = ID.mob.JAILER_OF_LOVE + 1, ID.mob.JAILER_OF_LOVE + 9 do
                local phuabo = GetMobByID(i)
                if phuabo:isAlive() then
                    table.insert(phuaboUp, i)
                elseif not phuabo:isSpawned() then
                    table.insert(phuaboDn, i)
                end
            end
-- How many sharks spawn depends on number currently alive.
            local numToSpawn = 0
            if #phuaboUp == 2 then
                numToSpawn = 1
            elseif #phuaboUp == 0 or #phuaboUp == 3 then
                numToSpawn = 3
            elseif #phuaboUp == 1 then
                numToSpawn = math.random(1, 3)
            end
-- Spawn sharks.
            for i = 1, math.min(numToSpawn, #phuaboDn) do
                SpawnMob(phuaboDn[i]):updateEnmity(target)
            end
        end
        mob:setLocalVar("SPAWNS", spawns + 1)
    end
-- Astral flow logic.
    if lifePercent <= 90 and astralFLOW == 0 then
        mob:useMobAbility(734) -- Astral Flow
        mob:setLocalVar("astralFLOW", 1)
        mob:setLocalVar("astralPETS", 1)
    end

    if lifePercent <= 80 and astralFLOW == 1 then
        mob:useMobAbility(734) -- Astral Flow
        mob:setLocalVar("astralFLOW", 2)
        mob:setLocalVar("astralPETS", 1)
    end

    if lifePercent <= 70 and astralFLOW == 2 then
        mob:useMobAbility(734) -- Astral Flow
        mob:setLocalVar("astralFLOW", 3)
        mob:setLocalVar("astralPETS", 1)
    end

   if lifePercent <= 60 and astralFLOW == 3 then
        mob:useMobAbility(734) -- Astral Flow
        mob:setLocalVar("astralFLOW", 4)
        mob:setLocalVar("astralPETS", 1)
    end

    if lifePercent <= 50 and astralFLOW == 4 then
        mob:useMobAbility(734) -- Astral Flow
        mob:setLocalVar("astralFLOW", 5)
        mob:setLocalVar("astralPETS", 1)
    end

    if lifePercent <= 40 and astralFLOW == 5 then
        mob:useMobAbility(734) -- Astral Flow
        mob:setLocalVar("astralFLOW", 6)
        mob:setLocalVar("astralPETS", 1)
    end

    if lifePercent <= 30 and astralFLOW == 6 then
        mob:useMobAbility(734) -- Astral Flow
        mob:setLocalVar("astralFLOW", 7)
        mob:setLocalVar("astralPETS", 1)
    end

    if lifePercent <= 20 and astralFLOW == 7 then
        mob:useMobAbility(734) -- Astral Flow
        mob:setLocalVar("astralFLOW", 8)
        mob:setLocalVar("astralPETS", 1)
    end

    if lifePercent <= 10 and astralFLOW == 8 then
        mob:useMobAbility(734) -- Astral Flow
        mob:setLocalVar("astralFLOW", 9)
        mob:setLocalVar("astralPETS", 1)
    end

    if lifePercent <= 5 and astralFLOW == 9 then
        mob:useMobAbility(734) -- Astral Flow
        mob:setLocalVar("astralFLOW", 10)
        mob:setLocalVar("astralPETS", 1)
    end
-- Pets will use WS when JOL uses astral flow.
    if astralPETS == 1 then
        for i = ID.mob.JAILER_OF_LOVE + 1, ID.mob.JAILER_OF_LOVE + 27 do
            local pet = GetMobByID(i)
            if pet and pet:isAlive() then
                mob:setLocalVar("astralPETS", 0)
                pet:timer(1500, function(petArg)
                    if petArg:getFamily() == 269 then -- Xzomit
                        petArg:useMobAbility(1349) -- Mantle pierce
                    elseif petArg:getFamily() == 144 then -- Hpemde
                        petArg:useMobAbility(1367) -- Sinuate rush
                    elseif petArg:getFamily() == 194 then -- Shark
                        petArg:useMobAbility(1353) -- Aerial collision
                    end
                end)
            end
        end
    end
end)

Love:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Love.onSpellPrecast", function(mob, spell)
-- Modify these spells to AOE and 30 yalms.
    if spell:getID() == 23 or -- Dia
        spell:getID() == 24 or -- Dia II
        spell:getID() == 25 or -- Dia III
        spell:getID() == 56 or -- Slow
        spell:getID() == 58 or -- Paralyze
        spell:getID() == 59 or -- Silence
        spell:getID() == 79 or -- Slow II
        spell:getID() == 112 or -- Flash
        spell:getID() == 216 or -- Gravity
        spell:getID() == 220 or -- Poison
        spell:getID() == 221 or -- Poison II
        spell:getID() == 233 or -- Bio IV
        spell:getID() == 235 or -- Burn
        spell:getID() == 236 or -- Frost
        spell:getID() == 237 or -- Choke
        spell:getID() == 238 or -- Rasp
        spell:getID() == 239 or -- Shock
        spell:getID() == 246 or -- Drain II
        spell:getID() == 247 or -- Aspir
        spell:getID() == 252 or -- Stun
        spell:getID() == 258 or -- Bind
        spell:getID() == 275 -- Absorb-tp
    then
        spell:setAoE(xi.magic.aoe.RADIAL)
        spell:setFlag(xi.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setMPCost(1)
    end
end)

Love:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Love.onMobDeath", function(mob, player, optParams)
-- Set CharVar for free item campaign, May 2023.
    player:setCharVar("FIC_may_2023", 1)
    player:incrementCharVar("[LB]JOL", 1)
-- Despawn all pets on death.
    for despawnMob = 16912849, 16912875 do
        DespawnMob(despawnMob)
    end
end)

Love:addOverride("xi.zones.AlTaieu.mobs.Jailer_of_Love.onMobDespawn", function(mob)
-- Despawn all pets on death.
    for despawnMob = 16912849, 16912875 do
        DespawnMob(despawnMob)
    end
    mob:resetLocalVars()
-- Absolute Virtue spawn logic. Not coded, leave commented out.
    --[[if math.random(1, 100) <= 25 then -- 25% chance to spawn Absolute Virtue
        SpawnMob(ID.mob.ABSOLUTE_VIRTUE)
    end]]--
end)

return Love
