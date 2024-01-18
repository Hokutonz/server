-----------------------------------
require("modules/module_utils")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/weaponskillids")
-----------------------------------
local m = Module:new("premium_trusts")

------------------------------------
-- TRUST: August                  --
------------------------------------
m:addOverride("xi.actions.spells.trust.august.onMagicCastingCheck", function(caster, target, spell)
    local renewalCost = 250000
    local playerGil   = caster:getGil()
    local trustLease  = caster:getCharVar("[TRUST]LeaseTime") - os.time()

    -- Fetch time.
    local time = trustLease

    -- Fetch days and remove them from time.
    local daysLeft = math.floor(time / 86400)
    time           = time - daysLeft * 86400 -- Now we have Time(s) minus the days.

    -- Fetch hours
    local hoursLeft = math.floor(time / 3600)
    time            = time - hoursLeft * 3600 -- Now we have Time(s) minus days and hours.

    -- Fetch minutes
    local minutesLeft = math.floor(time / 60)
    time              = time - minutesLeft * 60 -- Now we have Time(s) minus days, hours and minutes.

    -- Expired
    if trustLease <= 0 then
        local menu =
        {
            title   = "Renew your Trust Lease?",
            onStart = function(player)
                -- NOTE: This could be used to lock the player in place
                playerArg:printToPlayer("Your premium trust lease has expired.", xi.msg.channel.NS_SAY)
            end,

            options =
            {
                {
                    "Yes.",
                    function(player)
                        -- Currency check here
                        if playerGil >= renewalCost then
                            local newLeaseExpiry = os.time() + 604800 -- Regularly we wouldnt use os.time() again. However, I can keep a menu open.
                            player:setGil(playerGil - renewalCost)
                            player:setCharVar("[TRUST]LeaseTime", newLeaseExpiry)

                            caster:printToPlayer(string.format("Your lease will expire in %s days, %s hours, %s minutes and %s seconds.", daysLeft, hoursLeft, minutesLeft, time), xi.msg.channel.NS_SAY)

                            return xi.msg.basic.STATUS_PREVENTS
                        else
                            player:printToPlayer("You don't have enough gil to renew your lease.", xi.msg.channel.NS_SAY)
                            return xi.msg.basic.STATUS_PREVENTS
                        end
                    end,
                },
                {
                    "Not right now!",
                    function(player)
                        return xi.msg.basic.STATUS_PREVENTS
                    end,
                },
            }
        }
        caster:customMenu(menu)

    -- Can cast, unless not. (Trust limit, etc.)
    else
        local timeLeft = trustLease / 3600

        caster:printToPlayer(string.format("Your lease will expire in %s days, %s hours, %s minutes and %s seconds.", daysLeft, hoursLeft, minutesLeft, time), xi.msg.channel.NS_SAY)
        return xi.trust.canCast(caster, spell)
    end
end)

m:addOverride("xi.actions.spells.trust.august.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())
    local augustLevel = trust:getMainLvl()

    -- Reset LocalVar on Spawn
    caster:setLocalVar("daybreak_WS", 0)

    -- Increase HP & MP
    trust:setMod(xi.mod.HP, 9 * augustLevel)
    trust:setMod(xi.mod.MP, 2 * augustLevel)
    trust:updateHealth()
    trust:addHP(trust:getMaxHP())
    trust:addMP(trust:getMaxMP())

    -- AAEV PullOver
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

    -- Melee Skills (Added TP)
    trust:setMobSkillAttack(1197)
    -- TP Controller
    trust:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.RANDOM, 1500)
    -- Logic
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE) -- Provoke
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 70, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE) -- Cure
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL) -- Sentinel
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.REPRISAL, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.REPRISAL) -- Reprisal
    -- Retail shows a range of CD (Unsure if Haste effected)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)
    -- Daybreak Varaible
    caster:setLocalVar("daybreak_CD", os.time() + 180) -- Apply CD on spawn

    -- Daybreak Logic
    trust:addListener("COMBAT_TICK", "AUGUST_COMBAT_TICK", function(trustArg, targetArg)
        local coolDown = caster:getLocalVar("daybreak_CD")

        if caster:getMainLvl() >= 75 and coolDown < os.time() then
            -- remove PDT buff
            trustArg:setMod(xi.mod.DMGPHYS, 0) -- DMG reset from Daybreak.lua
            caster:setLocalVar("daybreak_WS", 0) -- Reset LocalVar
            -- Cooldown of Daybreak
            if (trust:getTarget():getMainLvl() > caster:getMainLvl() + 10) and trust:getTP() >= 1000 then -- 100% trigger if mobLvl > player + 10
                trustArg:useMobAbility(3652)
                trustArg:setTP(0)
                caster:setLocalVar("daybreak_CD", os.time() + 180)
                caster:setLocalVar("daybreak_WS", 1)

            elseif trust:getTP() >= 1000 then
                local roll = math.random(1, 10)

                if roll <= 3 then -- 30% trigger
                    trustArg:useMobAbility(3652)
                    trustArg:setTP(0)
                    caster:setLocalVar("daybreak_CD", os.time() + 180)
                    caster:setLocalVar("daybreak_WS", 1)
                else
                    print("Daybreak: 2 min CD")
                    caster:setLocalVar("daybreak_CD", os.time() + 120)
                end
            end
        end

        if caster:getLocalVar("daybreak_WS") == 1 and coolDown > os.time() then
            local randomTP = math.random(1, 2)

            if trust:getTP() >= 1000  and randomTP == 1 then
                trustArg:useMobAbility(3656)
                trustArg:setTP(0)
                caster:setLocalVar("daybreak_WS", 2)
            elseif trust:getTP() >= 1000  and randomTP == 2 then
                trustArg:useMobAbility(3657)
                trustArg:setTP(0)
                caster:setLocalVar("daybreak_WS", 2)
            end

        elseif caster:getLocalVar("daybreak_WS") == 2 and trust:getTP() >= 1000 then
            trustArg:useMobAbility(3658)
            trustArg:setTP(0)
            caster:setLocalVar("daybreak_WS", 0)
        end

    end)
end)

m:addOverride("xi.actions.spells.trust.august.onMobSpawn", function(caster, target, spell)
end)

m:addOverride("xi.actions.spells.trust.august.onMobDespawn", function(mob)
    mob:removeListener("AUGUST_COMBAT_TICK")
end)

------------------------------------
-- TRUST: Shantotto II            --
------------------------------------
m:addOverride("xi.actions.spells.trust.shantotto_ii.onMagicCastingCheck", function(caster, target, spell)
    local renewalCost = 250000
    local playerGil   = caster:getGil()
    local trustLease  = caster:getCharVar("[TRUST]LeaseTime") - os.time()

    -- Fetch time.
    local time = trustLease

    -- Fetch days and remove them from time.
    local daysLeft = math.floor(time / 86400)
    time           = time - daysLeft * 86400 -- Now we have Time(s) minus the days.

    -- Fetch hours
    local hoursLeft = math.floor(time / 3600)
    time            = time - hoursLeft * 3600 -- Now we have Time(s) minus days and hours.

    -- Fetch minutes
    local minutesLeft = math.floor(time / 60)
    time              = time - minutesLeft * 60 -- Now we have Time(s) minus days, hours and minutes.

    -- Expired
    if trustLease <= 0 then
        local menu =
        {
            title   = "Renew your Trust Lease?",
            onStart = function(player)
                -- NOTE: This could be used to lock the player in place
                playerArg:printToPlayer("Your premium trust lease has expired.", xi.msg.channel.NS_SAY)
            end,

            options =
            {
                {
                    "Yes.",
                    function(player)
                        -- Currency check here
                        if playerGil >= renewalCost then
                            local newLeaseExpiry = os.time() + 604800 -- Regularly we wouldnt use os.time() again. However, I can keep a menu open.
                            player:setGil(playerGil - renewalCost)
                            player:setCharVar("[TRUST]LeaseTime", newLeaseExpiry)

                            caster:printToPlayer(string.format("Your lease will expire in %s days, %s hours, %s minutes and %s seconds.", daysLeft, hoursLeft, minutesLeft, time), xi.msg.channel.NS_SAY)

                            return xi.msg.basic.STATUS_PREVENTS
                        else
                            player:printToPlayer("You don't have enough gil to renew your lease.", xi.msg.channel.NS_SAY)
                            return xi.msg.basic.STATUS_PREVENTS
                        end
                    end,
                },
                {
                    "Not right now!",
                    function(player)
                        return xi.msg.basic.STATUS_PREVENTS
                    end,
                },
            }
        }
        caster:customMenu(menu)

    -- Can cast, unless not. (Trust limit, etc.)
    else
        local timeLeft = trustLease / 3600

        caster:printToPlayer(string.format("Your lease will expire in %s days, %s hours, %s minutes and %s seconds.", daysLeft, hoursLeft, minutesLeft, time), xi.msg.channel.NS_SAY)
        return xi.trust.canCast(caster, spell)
    end
end)

m:addOverride("xi.actions.spells.trust.shantotto_ii.onSpellCast", function(caster, target, spell)
end)

------------------------------------
-- TRUST: Ygnas                   --
------------------------------------
m:addOverride("xi.actions.spells.trust.ygnas.onMagicCastingCheck", function(caster, target, spell)
    local renewalCost = 250000
    local playerGil   = caster:getGil()
    local trustLease  = caster:getCharVar("[TRUST]LeaseTime") - os.time()

    -- Fetch time.
    local time = trustLease

    -- Fetch days and remove them from time.
    local daysLeft = math.floor(time / 86400)
    time           = time - daysLeft * 86400 -- Now we have Time(s) minus the days.

    -- Fetch hours
    local hoursLeft = math.floor(time / 3600)
    time            = time - hoursLeft * 3600 -- Now we have Time(s) minus days and hours.

    -- Fetch minutes
    local minutesLeft = math.floor(time / 60)
    time              = time - minutesLeft * 60 -- Now we have Time(s) minus days, hours and minutes.

    -- Expired
    if trustLease <= 0 then
        local menu =
        {
            title   = "Renew your Trust Lease?",
            onStart = function(player)
                -- NOTE: This could be used to lock the player in place
                playerArg:printToPlayer("Your premium trust lease has expired.", xi.msg.channel.NS_SAY)
            end,

            options =
            {
                {
                    "Yes.",
                    function(player)
                        -- Currency check here
                        if playerGil >= renewalCost then
                            local newLeaseExpiry = os.time() + 604800 -- Regularly we wouldnt use os.time() again. However, I can keep a menu open.
                            player:setGil(playerGil - renewalCost)
                            player:setCharVar("[TRUST]LeaseTime", newLeaseExpiry)

                            caster:printToPlayer(string.format("Your lease will expire in %s days, %s hours, %s minutes and %s seconds.", daysLeft, hoursLeft, minutesLeft, time), xi.msg.channel.NS_SAY)

                            return xi.msg.basic.STATUS_PREVENTS
                        else
                            player:printToPlayer("You don't have enough gil to renew your lease.", xi.msg.channel.NS_SAY)
                            return xi.msg.basic.STATUS_PREVENTS
                        end
                    end,
                },
                {
                    "Not right now!",
                    function(player)
                        return xi.msg.basic.STATUS_PREVENTS
                    end,
                },
            }
        }
        caster:customMenu(menu)

    -- Can cast, unless not. (Trust limit, etc.)
    else
        local timeLeft = trustLease / 3600

        caster:printToPlayer(string.format("Your lease will expire in %s days, %s hours, %s minutes and %s seconds.", daysLeft, hoursLeft, minutesLeft, time), xi.msg.channel.NS_SAY)
        return xi.trust.canCast(caster, spell)
    end
end)

m:addOverride("xi.actions.spells.trust.ygnas.onSpellCast", function(caster, target, spell)
end)

return m
