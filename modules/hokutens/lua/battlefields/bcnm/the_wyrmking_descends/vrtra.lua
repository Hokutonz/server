-----------------------------------
-- Area: Riverne - Site B01 (BCNM)
--   NM: Tiamat
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/mobs")
require("modules/module_utils")
-----------------------------------
local m  = Module:new("wyrmking_vrtra")
-----------------------------------

xi.module.ensureTable("xi.zones.Riverne-Site_B01.mobs.Vrtra")

local offsets = { 7, 9, 11, 8, 10, 12 }

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Vrtra.onMobSpawn", function(mob)
    local currentTime = os.time()

    -- Set Mob variables.
    mob:setLocalVar("twohourTime", currentTime + 60)
    mob:setLocalVar("spawnTime", currentTime + math.random(1, 3) * 10)

    -- Set mob modifiers.
    mob:setMobMod(xi.mobMod.GA_CHANCE, 75)
    mob:setMod(xi.mod.DEF, 466)
    mob:setMod(xi.mod.ATT, 344)
    mob:setMod(xi.mod.EVA, 450)
    mob:setMod(xi.mod.UFASTCAST, 50)
    mob:setMod(xi.mod.DARK_RES_RANK, 11)
    mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
    mob:setMod(xi.mod.UDMGRANGE, -5000)
    mob:setMod(xi.mod.UDMGMAGIC, -5000)
    mob:setMod(xi.mod.UDMGBREATH, -5000)
    mob:setMod(xi.mod.MATT, 75)
    mob:setMobMod(xi.mobMod.SIGHT_RANGE, 30)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)

    -- Turn on Bahamut's damage shields until pet dies
    local bahamut = GetMobByID(zones[mob:getZoneID()].mob.BAHAMUT_V2)

    bahamut:setLocalVar("Enable_Shields", 1)
    bahamut:setLocalVar("Announce_Shields", 0)
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Vrtra.onMobDeath", function(mob, player, optParams)
    -- Turn off Bahamut's damage shields and prepare announcement.
    local bahamut = GetMobByID(zones[mob:getZoneID()].mob.BAHAMUT_V2)

    bahamut:setLocalVar("Enable_Shields", 0)
    bahamut:setLocalVar("Shields_Announced", 0)

    -- If vrtra dies then kill all pets.
    if optParams.isKiller or optParams.noKiller then
        local mobId = mob:getID()

        for i, offset in ipairs(offsets) do
            local pet = GetMobByID(mobId + offset)
            if pet:isAlive() then
                pet:setHP(0)
            end
        end
    end
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Vrtra.onMobEngaged", function(mob)
    -- If engaged then send pets at target
    for i, offset in ipairs(offsets) do
        local pet = GetMobByID(mob:getID() + offset)
        if pet:isAlive() then
            pet:updateEnmity(mob:getTarget())
        end
    end
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Vrtra.onMobFight", function(mob, target)
    local currentTime = os.time()
    local twohourTime = mob:getLocalVar("twohourTime")
    local spawnTime   = mob:getLocalVar("spawnTime")

    -- Spams Charm in bv2 version every 5s
    if
        currentTime >= twohourTime and
        mob:checkDistance(target) < 17 and
        mob:canUseAbilities()
    then
        mob:setLocalVar("skill_tp", mob:getTP())
        mob:useMobAbility(710)
        mob:setLocalVar("twohourTime", currentTime + 30)
    end

    -- Spawns 1 pet.
    if currentTime >= spawnTime then
        local mobId = mob:getID()

        for _, offset in ipairs(offsets) do
            local pet = GetMobByID(mobId + offset)

            if not pet:isSpawned() then
                mob:entityAnimationPacket("casm")
                mob:setAutoAttackEnabled(false)
                mob:setMagicCastingEnabled(false)
                mob:setMobAbilityEnabled(false)

                mob:timer(3000, function(mobArg)
                    if mobArg:isAlive() then
                        mobArg:entityAnimationPacket("shsm")
                        mobArg:setAutoAttackEnabled(true)
                        mobArg:setMagicCastingEnabled(true)
                        mobArg:setMobAbilityEnabled(true)
                        pet:spawn()
                        local pos = mobArg:getPos()
                        pet:setPos(pos.x, pos.y, pos.z)
                        local options = { followDistance = 0.0 }
                        xi.follow.follow(pet, mobArg, options)
                        if mobArg:getTarget() ~= nil then
                            pet:updateEnmity(target)
                        end
                    end
                end)

                break
            end
        end

        mob:setLocalVar("spawnTime", currentTime + 10)
    end
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Vrtra.onMobWeaponSkill", function(target, mob, skill)
    if skill:getID() == 710 then
        mob:addTP(mob:getLocalVar("skill_tp"))
        mob:setLocalVar("skill_tp", 0)
    end
end)

m:addOverride("xi.zones.Riverne-Site_B01.mobs.Vrtra.onAdditionalEffect", function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENDARK, { power = math.random(45, 90), chance = 10 })
end)

return m