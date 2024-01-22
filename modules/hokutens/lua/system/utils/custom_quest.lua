-----------------------------------
-- custom_quest
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/mixins/job_special")
local cid = require("modules/hokutens/lua/system/utils/custom_id")
local customUtil = require("modules/hokutens/lua/system/utils/custom_util")
-----------------------------------
local m = Module:new("custom_quest")

local vars =
{
    CW_TRUST = "[CW]TRUST",
}

local settings =
{
    -- Respawn of spawners
    RESPAWN = 180000, -- 3 minutes
}

m.marker =
{
    SPARKLE  = 1382,
    BLUE     = 2424,
    FRAGMENT = 2356,
    SHIMMER  = 2326,
}

m.MAIN_QUEST   = "MAIN_QUEST"
m.SIDE_QUEST   = "SIDE_QUEST"
m.NOTHING      = { "You see nothing out of the ordinary." }
m.NOTHING_ELSE = { "There is nothing else to do here." }

m.jobname =
{
    [xi.job.WAR] = { "WAR", "Warrior" },
    [xi.job.MNK] = { "MNK", "Monk" },
    [xi.job.WHM] = { "WHM", "White Mage" },
    [xi.job.BLM] = { "BLM", "Black Mage" },
    [xi.job.RDM] = { "RDM", "Red Mage" },
    [xi.job.THF] = { "THF", "Thief" },
    [xi.job.PLD] = { "PLD", "Paladin" },
    [xi.job.DRK] = { "DRK", "Dark Knight" },
    [xi.job.BST] = { "BST", "Beastmaster" },
    [xi.job.BRD] = { "BRD", "Bard" },
    [xi.job.RNG] = { "RNG", "Ranger" },
    [xi.job.SAM] = { "SAM", "Samurai" },
    [xi.job.NIN] = { "NIN", "Ninja" },
    [xi.job.DRG] = { "DRG", "Dragoon" },
    [xi.job.SMN] = { "SMN", "Summoner" },
    [xi.job.BLU] = { "BLU", "Blue Mage" },
    [xi.job.COR] = { "COR", "Corsair" },
    [xi.job.PUP] = { "PUP", "Puppetmaster" },
    [xi.job.DNC] = { "DNC", "Dancer" },
    [xi.job.SCH] = { "SCH", "Scholar" },
    [xi.job.GEO] = { "GEO", "Geomancer" },
    [xi.job.RUN] = { "RUN", "Runefencer" },
}

m.music =
{
    NONE                       =   0,
    BATTLE_THEME_SOLO          = 101,
    DUNGEON_BATTLE_THEME_PARTY = 102,
    BATTLE_THEME_PARTY         = 103,
    YUGHOTT_GROTTO             = 104,
    MHAURA                     = 105,
    FERRY                      = 106,
    SANDORIA                   = 107,
    TITLE_SCREEN               = 108,
    RONFAURE                   = 109,
    JEUNO                      = 110,
    DEATH                      = 111,
    SELBINA                    = 112,
    SARUTABARUTA               = 113,
    BATALLIA_DOWNS             = 114,
    DUNGEON_BATTLE_THEME_PARTY = 115,
    GUSTABERG                  = 116,
    RULUDE_GARDENS             = 117,
    ROLANBERRY_FIELDS          = 118,
    AWAKENING                  = 119,
    NATION_SELECTION           = 120,
    SHADOW_LORD                = 121,
    DELKFUTTS_TOWER            = 122,
    HOPELESSNESS               = 123,
    RECOLLECTION               = 124,
    BOSS_BATTLE_THEME          = 125,
    MOG_HOUSE                  = 126,
    ANXIETY                    = 127,
    AIRSHIP                    = 128,
    FISHING_UNKNOWN            = 129,
    TARU_FEMALE                = 130,
    ELVAAN_FEMALE              = 131,
    ELVAAN_MALE                = 132,
    HUME_MALE                  = 133,
    YUHTUNGA_JUNGLE            = 134,
    KAZHAM                     = 135,
    FISHING_HOOK               = 136,
    PROMATHIA_FINAL_BATTLE     = 137,
    WAJAOM                     = 149,
    WINDURST                   = 151,
    BASTOK                     = 152,
    CRYSTAL_PRELUDE            = 153,
    METALWORKS                 = 154,
    CASTLE_ZVAHL               = 155,
    CHATEAU                    = 156,
    FURY                       = 157,
    SAUROMUGUE                 = 158,
    SORROW                     = 159,
    REPRESSION                 = 160,
    DESPAIR                    = 161,
    HEAVENS_TOWER              = 162,
    SOMETIME_SOMEWHERE         = 163,
    XARCABARD                  = 164,
    GALKA                      = 165,
    MITHRA                     = 166,
    TARU_MALE                  = 167,
    HUME_FEMALE                = 168,
    REGENERACY                 = 169,
    BUCCANEERS                 = 170,
    ALTEPA_DESERT              = 171,
    NASHMAU                    = 175,
    WHITEGATE                  = 178,
    MUSIC_188                  = 188,
    MUSIC_189                  = 189,
    ZITAH                      = 190,
    BATTLE_THEME_3             = 191,
    BATTLE_DUNGEON_3           = 192,
    TOUGH_BATTLE               = 193,
    RAOGRIMMS_THEME            = 194,
    BELIEF                     = 195,
    FIGHTERS_OF_THE_CRYSTAL    = 196,
    TULIA_1                    = 197,
    EALDNARCHE                 = 198,
    GRAVITON                   = 199,
    KAMLANAUT                  = 200,
    END_THEME                  = 201,
    QUEST_THEME_1              = 202,
    QUEST_THEME_2              = 203,
    QUEST_THEME_3              = 204,
    QUEST_COMPLETION           = 205,
    YVENOILE                   = 206,
    VELUGANNON_PALACE          = 207,
    RABAO                      = 208,
    NORG                       = 209,
    TULIA_2                    = 210,
    ROMAEVE                    = 211,
    CHOCOBO                    = 212,
    HALL_OF_THE_GODS           = 213,
    DEPTHS_OF_THE_SOUL         = 218,
    ONSLAUGHT                  = 219,
    TURMOIL                    = 220,
    MOVALPOLOS                 = 221,
    PROMYVION                  = 222,
    MARCH_OF_THE_HERO          = 223,
    DUSK_AND_DAWN              = 224,
    PSOXJA                     = 225,
    CONFLICT_LIVE_FOREVER      = 226,
    GARDEN_OF_RUHMET           = 228,
    MANACLIPPER                = 229,
    TAVNAZIAN_ARCHIPELAGO      = 230,
    NAGMOLADAS_THEME           = 231,
    RULER_OF_THE_SKIES         = 232,
    ALTAIEU                    = 233,
    HAPPILY_EVER_AFTER         = 234,
    NOCTURNE_OF_THE_GODS       = 235,
    CLOUDED_DAWN               = 236,
    MEMORIA_DE_LA_STONA        = 237,
    A_NEW_MORNING              = 238,
    STARLIGHT_CELEBRATION      = 239,
    DISTANT_PROMISES           = 240,
    TIME_FOR_PRAYER            = 241,
    UNITY                      = 242,
    GRAVITONS_THEME            = 243,
    YVENOILES_THEME            = 244,
    TAVNAZIAN_SAFEHOLD         = 245,
    SUMMERFEST                 = 256,
    PROMATHIA_END_VOCAL        = 900,
}

local function questAccepted(player, questName)
    player:printToPlayer(string.format("\129\158 Quest Accepted: %s", questName), xi.msg.channel.SYSTEM_3)
end

local function questCompleted(player, questName, music)
    player:printToPlayer(string.format("\129\159 Quest Completed: %s", questName), xi.msg.channel.SYSTEM_3)

    player:changeMusic(0, 67)
    player:changeMusic(1, 67)
    player:timer(5000, function(playerArg)
        player:changeMusic(0, music or 0)
        player:changeMusic(1, music or 0)
    end)
end

m.rewardTrust = function(id, name, limit)
    return function(player)
        if
            limit ~= nil and
            player:getCharVar(vars.CW_TRUST) == limit - 1
        then
            player:setCharVar(vars.CW_TRUST, limit)
            player:printToPlayer(string.format("Your trust capacity has increased to %i.", limit), xi.msg.channel.SYSTEM_3)
        end

        if id > -1 then
            player:addSpell(id, true, true)
            player:printToPlayer(string.format("You learned Trust: %s!", name), xi.msg.channel.NS_SAY)
        end

        return true
    end
end

m.rewardSlots = function(player, unlock)
    local bag = unlock[1]
    local bagName = unlocks.bagNames[bag]
    local bagIncrease = unlock[2]

    local oldSize = player:getContainerSize(bag)
    player:changeContainerSize(bag, bagIncrease)
    local newSize = player:getContainerSize(bag)

    local str = string.format(
        "\129\154  Your %s capacity has been increased by %i from %i to %i! \129\154",
        bagName, bagIncrease, oldSize, newSize)

    player:printToPlayer(str, xi.msg.channel.SYSTEM_3)
end

m.sprinterShoes = function()
    return function(player)
        if  -- Check if all three quests are completed
            player:getCharVar("[CW]TRUST_SANDORIA") >= 10 and
            player:getCharVar("[CW]TRUST_BASTOK")   >= 8 and
            player:getCharVar("[CW]TRUST_WINDURST") >= 10
        then
            npcUtil.giveItem(player, 15754) -- Sprinter's Shoes
        end

        return true
    end
end

m.fieldTunica = function()
    return function(player)
        if  -- Check if all three quests are completed
            player:getCharVar("[CW]MINING_MY_BUSINESS") >= 2 and
            player:getCharVar("[CW]HATCHET_JOB")        >= 2 and
            player:getCharVar("[CW]REAPING_REWARDS")    >= 2
        then
            npcUtil.giveItem(player, 14374) -- Field Tunica
        end

        return true
    end
end

local rollAugments = function(augments)
    local result = {}

    for k, v in pairs(augments) do
        local field = v

        if type(v) == "table" then
            field = math.random(v[1], v[2])
        end

        table.insert(result, field)
    end

    return result
end

local tierAugments = function(tiers)
    local result = math.random(0, 100)

    if result < 10 then
        return tiers[3]
    elseif result < 25 then
        return tiers[2]
    else
        return tiers[1]
    end
end

local function getTradedItem(trade, itemID)
    for i = 0, trade:getSlotCount()-1 do
        local item = trade:getItemId(i)

        if trade:getItemId(i) == itemID then
            return trade:getItem(i)
        end
    end
end

m.transferAugments = function(player, trade, sourceID, destID)
    local ID   = zones[player:getZoneID()]
    local item = getTradedItem(trade, sourceID)

    if player:getFreeSlotsCount() > 0 then
        local aug0, aug0v = item:getAugment(0)
        local aug1, aug1v = item:getAugment(1)
        local aug2, aug2v = item:getAugment(2)
        local aug3, aug3v = item:getAugment(3)

        player:tradeComplete()

        player:addItem(destID, 1, aug0, aug0v, aug1, aug1v, aug2, aug2v, aug3, aug3v)

        player:timer(1000, function()
            player:messageSpecial(ID.text.ITEM_OBTAINED, destID)
        end)
    end
    

    player:tradeComplete()
end

m.giveAugmentRoll = function(player, item, augs)
    local ID = zones[player:getZoneID()]

    if player:getFreeSlotsCount() > 0 then
        local rolling = augs

        -- If passed a table of tables, assume tiered
        if type(augs[1]) == "table" then
            rolling = tierAugments(augs)
        end

        local rolls = rollAugments(rolling)

        player:addItem(item, 1, unpack(rolls))
        player:messageSpecial(ID.text.ITEM_OBTAINED, item)

        return true
    else
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, item)
        return false
    end
end

m.jobReward = function(rewards, questVar, resetStep)
    return function(player, npc, tbl)
        local job      = player:getMainJob()
        local varName  = string.format("%s_%s",       questVar, m.jobname[job][1])
        local midnight = string.format("%s_MIDNIGHT", questVar)
        local received = player:getCharVar(varName)

        npc:entityAnimationPacket("open")
        npc:timer(5000, function(npcArg)
            npcArg:entityAnimationPacket("close")
        end)

        -- Skip jobs that don't have rewards
        if rewards[job] ~= nil then
            local receivedJobRewards = false

            -- Check each item in the reward list for the player's current job
            for k, v in pairs(rewards[job]) do
                -- Check player has not already received this item for this job
                if not utils.mask.getBit(received, k) then
                    if npcUtil.giveItem(player, v) then
                        -- Make sure the player can't receive this item again for this job
                        local result = utils.mask.setBit(received, k, true)
                        player:setCharVar(varName, result)

                        -- Ensure this variable is up to date
                        received = player:getCharVar(varName)
                        receivedJobRewards = true
                    else
                        -- Unable to distribute item (Inventory full etc.)
                         -- Return false to allow re-attempt (Or continuation to receive remaining rewards)
                        return false
                    end
                end
            end

            if receivedJobRewards then
                player:printToPlayer(string.format("You received the job rewards for %s!", m.jobname[job][2]))
            end
        end

        -- Give default reward to everyone
        if
            rewards[0] ~= nil and
            not npcUtil.giveItem(player, rewards[0])
        then
            -- Unable to distribute item (Inventory full etc.)
            return false
        end

        -- Prevent more rewards before tomorrow
        player:setCharVar(midnight, getMidnight())

        -- Reset quest to this step
        player:setCharVar(questVar, resetStep)
    end
end

m.tradeWeekly = function(rewards, questVar, success, decline)
    return function(player, npc, trade, entity, var, step)
        local week = rewards[VanadielRSERace()]

        if npcUtil.tradeHasExactly(trade, week.required) then
            local delay  = customUtil.dialogDelay(entity.dialog[success])
            local result = week.rewards[math.random(1, #week.rewards)]

            -- Delay rewards until after success dialog
            npc:timer(delay, function(npgArg)
                if m.giveAugmentRoll(player, result.item, result.augs) then
                    player:setCharVar(questVar, customUtil.nextVanaWeek())
                    player:tradeComplete()
                end
            end)

            customUtil.dialogTable(player, entity.dialog[success], entity.name, { npc = npc })
        else
            customUtil.dialogTable(player, entity.dialog[decline], entity.name, { [1] = week.name, npc = npc })
        end
    end
end

m.talkWeekly = function(rewards, text)
    return function(player, npc, entity)
        local week = rewards[VanadielRSERace()]
        customUtil.dialogTable(player, entity.dialog[text], entity.name, { [1] = week.name, npc = npc })
    end
end

local function getEntity(player, entityName)
    local zone     = player:getZone()
    local deEntity = string.gsub(entityName, "_", " ")
    local result   = zone:queryEntitiesByName("DE_" .. deEntity)
    return result[1]
end

local function getEntities(player, entityName)
    local zone     = player:getZone()
    local deEntity = string.gsub(entityName, "_", " ")
    local result   = zone:queryEntitiesByName("DE_" .. deEntity)
    return result
end

local function getEntityInfo(entities, entityID)
    local entityInfo = nil

    for k, v in pairs(entities) do
        if v.id == entityID then
            entityInfo = v
        end
    end

    if entityInfo == nil then
        print(string.format("[CE] Unable to match mob %s with quest entities", entityID))
    end

    return entityInfo
end

local function entityFromID(player, entities, entityID)
    local entityInfo = getEntityInfo(entities, entityID)
    return getEntity(player, entityInfo.name)
end

local function hideNPC(npc)
    npc:setStatus(xi.status.INVISIBLE)

    npc:timer(settings.RESPAWN, function(npcArg)
        npcArg:setStatus(xi.status.NORMAL)
    end)
end

local function dialogFrom(tbl)
    if tbl.dialog and not tbl.dialog.NAME then
        return ""
    elseif tbl.from then
        return tbl.from
    else
        return tbl.name
    end
end

local function getStepFunctions(steps, id)
    local func = {}

    for i = 1, #steps do
        if steps[i][id] ~= nil then
            func[i] = steps[i][id]
        end
    end

    return func
end

m.talkStep = function(text, questName)
    return function(player, npc, tbl, var, step)
        customUtil.dialogTable(player, tbl.dialog[text], dialogFrom(tbl), { npc = npc })

        local delay = customUtil.dialogDelay(tbl.dialog[text])
        player:timer(delay, function(playerArg)
            player:setCharVar(var, step)

            if questName ~= nil then
                questAccepted(player, questName)
            end
        end)
    end
end

m.checkStep = function(text, alternative, name, check)
    return function(player, npc, tbl, var, step)
        if (m.checks(check))(player) then
            customUtil.dialogTable(player, tbl.dialog[text], dialogFrom(tbl), { npc = npc })

            local delay = customUtil.dialogDelay(tbl.dialog[text])
            player:timer(delay, function(playerArg)
                player:setCharVar(var, step)

                if questName ~= nil then
                    questAccepted(player, questName)
                end
            end)
        else
            customUtil.dialogTable(player, tbl.dialog[alternative], dialogFrom(tbl), { npc = npc })
        end
    end
end

m.talkFinish = function(text, questName, music)
    return function(player, npc, tbl, var, step)
        customUtil.dialogTable(player, tbl.dialog[text], dialogFrom(tbl), { npc = npc })

        local delay = customUtil.dialogDelay(tbl.dialog[text])
        player:timer(delay, function(playerArg)
            player:setCharVar(var, step)

            if questName ~= nil then
                questCompleted(player, questName, music)
            end
        end)
    end
end

m.talkOnly = function(text)
    return function(player, npc, tbl)
        customUtil.dialogTable(player, tbl.dialog[text], dialogFrom(tbl), { npc = npc })
    end
end

m.talkTally = function(text, varName)
    return function(player, npc, tbl)
        customUtil.dialogTable(player, tbl.dialog[text], dialogFrom(tbl), { [1] = player:getCharVar(varName) + 1, npc = npc })
    end
end

local function setEncounter(entity, params)
    entity:addStatusEffectEx(
        xi.effect.LEVEL_RESTRICTION,
        xi.effect.LEVEL_RESTRICTION,
        params.levelCap,
        0,
        0,
        0,
        0,
        0,
        xi.effectFlag.DEATH + xi.effectFlag.ON_ZONE + xi.effectFlag.CONFRONTATION
    )

    if params.subjob ~= nil and params.subjob == false then
        entity:addStatusEffectEx(
            xi.effect.SJ_RESTRICTION,
            xi.effect.SJ_RESTRICTION,
            0,
            0,
            0,
            0,
            0,
            0,
            xi.effectFlag.DEATH + xi.effectFlag.ON_ZONE
        )
    end
end

local function applyLevelCap(player, params)
    if
        params ~= nil and
        params.levelCap ~= nil
    then
        local zoneID   = player:getZoneID()
        local alliance = player:getAlliance()

        for i = 1, #alliance do
            if alliance[i]:getZoneID() == zoneID then
                setEncounter(alliance[i], params)

                local pet = alliance[i]:getPet()

                if pet ~= nil then
                    setEncounter(pet, params)
                end
            end
        end
    end
end

local levelCaps =
{
    16, -- Promyvion - Holla
    18, -- Promyvion - Dem
    20, -- Promyvion - Mea
    22, -- Promyvion-Vahzl
    28, -- Sacrarium
    29, -- Riverne Site B01
    30, -- Riverne Site A01
}

local function isLevelCappedZone(zoneID)
    for k, v in pairs(levelCaps) do
        if v == zoneID then
            return true
        end
    end

    return false
end

local function removeLevelCap(player)
    local zoneID   = player:getZoneID()

    if isLevelCappedZone(zoneID) then
        return
    end

    local alliance = player:getAlliance()

    for i = 1, #alliance do
        if alliance[i]:getZoneID() == zoneID then
            alliance[i]:delStatusEffect(xi.effect.LEVEL_RESTRICTION)

            local pet = alliance[i]:getPet()

            if pet ~= nil then
                pet:delStatusEffect(xi.effect.LEVEL_RESTRICTION)
            end
        end
    end
end

local function resetAllStep(player, var, step, setStep)
    if player ~= nil then
        local zoneID   = player:getZoneID()
        local alliance = player:getAlliance()

        for i = 1, #alliance do
            if
                alliance[i]:isPC() and 
                alliance[i]:getZoneID() == zoneID and
                alliance[i]:getCharVar(var) == step
            then
                alliance[i]:setCharVar(var, setStep)
            end
        end
    end
end

local function incrementAllStep(player, var, step)
    if player ~= nil then
        local zoneID   = player:getZoneID()
        local alliance = player:getAlliance()

        for i = 1, #alliance do
            if
                alliance[i]:isPC() and 
                alliance[i]:getZoneID() == zoneID and
                alliance[i]:getCharVar(var) == step
            then
                alliance[i]:incrementCharVar(var, 1)
            end
        end
    end
end

local function spawnMobID(player, entities, entityID, params)
    local mobInfo    = getEntityInfo(entities, entityID)
    local zone       = player:getZone()
    local result     = zone:queryEntitiesByName("DE_" .. mobInfo.name)

    for k, v in pairs(result) do
        if v ~= nil and not v:isAlive() then
            v:setSpawn(mobInfo.pos[1], mobInfo.pos[2], mobInfo.pos[3], mobInfo.pos[4])

            if mobInfo.dropID then
                v:setDropID(mobInfo.dropID)
            else
                v:setDropID(0)
            end

            v:spawn()
            v:setMobLevel(mobInfo.level)
            v:updateClaim(player)
            v:setLocalVar("NO_CASKET", 1)
            v:setRespawnTime(0)

            if mobInfo.mods ~= nil then
                for mod, value in pairs(mobInfo.mods) do
                    v:setMod(mod, value)
                end
            end

            if mobInfo.hp ~= nil then
                v:setHP(mobInfo.hp)
            end

            if params ~= nil then
                v:setMobMod(xi.mobMod.DRAW_IN, 2)
                setEncounter(v, params)
            end
        end
    end
end

local function mobsAlive(player, entities, entityID)
    local mobInfo    = getEntityInfo(entities, entityID)
    local zone       = player:getZone()
    local result     = zone:queryEntitiesByName("DE_" .. mobInfo.name)

    for k, v in pairs(result) do
        if v:isAlive() then
            player:printToPlayer("An encounter is already in progress.", xi.msg.channel.SYSTEM_3)
            return true
        end
    end

    return false
end

local function delaySpawn(player, npc, delay, entityTable, entities, hideSpawner, params)
    if entityTable.mob ~= nil then
        for k, v in pairs(entityTable.mob) do
            if mobsAlive(player, entities, v) then
                return false
            end
        end
    else
        if type(entityTable) == "table" then
            for k, v in pairs(entityTable) do
                if mobsAlive(player, entities, v) then
                    return false
                end
            end
        else
            if mobsAlive(player, entities, entityTable) then
                return false
            end
        end
    end

    if params ~= nil then
        if
            params.partySize ~= nil and
            player:getPartySize() > params.partySize
        then
            player:printToPlayer("Your party is too large to begin this encounter.", xi.msg.channel.SYSTEM_3)
            return false
        end

        if
            params.job ~= nil and
            player:getMainJob() ~= params.job
        then
            player:printToPlayer("Your job is incorrect for this encounter.", xi.msg.channel.SYSTEM_3)
            return false
        end
    end

 -- Only skip this if hideSpawner is false
    if hideSpawner == nil or hideSpawner then
        hideNPC(npc)
    end

    applyLevelCap(player, params)

    npc:timer(delay, function(npcArg)
        if type(entityTable) == "table" then
            -- Use mobs and props
            if entityTable.mob ~= nil then
                for k, v in pairs(entityTable.mob) do
                    spawnMobID(player, entities, v, params)
                end

                for k, v in pairs(entityTable.prop) do
                    local props = getEntities(player, v)

                    -- Props should be visible for entire party/alliance
                    for _, prop in pairs(props) do
                        local alliance = player:getAlliance()

                        for i = 1, #alliance do
                            prop:ceSpawn(alliance[i])
                        end
                    end
                end

            -- Use mobs only
            else
                for k, v in pairs(entityTable) do
                    spawnMobID(player, entities, v, params)
                end
            end
        else
            spawnMobID(player, entities, entityTable, params)
        end
    end)

    return true
end

m.menuSpawn = function(entityTable, title, opt, select, hideSpawner, params)
    if entityTable == nil then
        print("[CQ] menuSpawn entity table is not defined.")
        return
    end

    return function(player, npc, tbl, var, step, entities)
        -- Prevent players opening menu while in dialog
        if player:getLocalVar("[CU]BLOCKING") == 1 then
            return
        end

        local options = {}
        local i = 1

        for i = 1, #opt do
            if i == select then

                table.insert(options, {
                    opt[i][1],
                    function()
                        if entityTable.prop ~= nil then
                            for k, v in pairs(entityTable.prop) do
                                local props = getEntities(player, v)

                                for _, prop in pairs(props) do
                                    prop:ceSpawn(player)
                                end
                            end
                        end

                        local delay = 0

                        -- Perform dialog for all party members
                        if opt[i][2] ~= nil then
                            delay = customUtil.dialogDelay(tbl.dialog[opt[i][2]])
                            local alliance = player:getAlliance()

                            for j = 1, #alliance do
                                customUtil.dialogTable(alliance[j], tbl.dialog[opt[i][2]], dialogFrom(tbl), { npc = npc })
                            end
                        end

                        delaySpawn(player, npc, delay, entityTable, entities, hideSpawner, params)
                    end,
                })
            else
                table.insert(options, {
                    opt[i][1],
                    function()
                    end,
                })
            end
        end

        local delay = 0

        if type(title) == "table" then
            delay = customUtil.dialogDelay(tbl.dialog[title[1]])
            customUtil.dialogTable(player, tbl.dialog[title[1]], dialogFrom(tbl), { npc = npc })

            player:timer(delay, function(playerArg)
                playerArg:customMenu({
                    title   = title[2],
                    options = options,
                })
            end)
        else
            player:customMenu({
                title   = title,
                options = options,
            })
        end
    end
end

-- Menu based rewards, repeatable until all collected
m.menuReward = function(obj)
    return function(player, npc, tbl, var, step)
        -- Prevent players opening menu while in dialog
        if player:getLocalVar("[CU]BLOCKING") == 1 then
            return
        end

        local options = {}
        local i = 1

        local progress = player:getCharVar(obj.progress[1])

        for i = 1, #obj.options do
            if utils.mask.getBit(progress, i) == false then
                table.insert(options, {
                    obj.options[i][1],
                    function()
                        local delay = customUtil.dialogDelay(tbl.dialog[obj.message[2]])
                        customUtil.dialogTable(player, tbl.dialog[obj.message[2]], dialogFrom(tbl), { npc = npc })
                        player:setLocalVar("[CU]REWARD", 1)

                        npc:timer(delay, function(playerArg)
                            if npcUtil.giveItem(player, obj.options[i][2]) then
                                local result = utils.mask.setBit(progress, i, true)

                                player:setCharVar(obj.progress[1], result)
                                questCompleted(player, obj.complete[1], obj.complete[2])

                                -- Check if all options are now received
                                local finished = true

                                for j = 1, #obj.options do
                                    if not utils.mask.getBit(result, j) then
                                        finished = false
                                    end
                                end

                                if finished then
                                    -- Quest completed, advance to end
                                    player:setCharVar(var, step)
                                else
                                    -- Reset to previous step
                                    player:setCharVar(var, obj.progress[2])
                                end
                            end

                            player:setLocalVar("[CU]REWARD", 0)
                        end)
                    end,
                })
            end
        end

        player:customMenu({
            title   = obj.message[1],
            options = options,
        })
    end
end

m.menuStep = function(title, opt, select, questName, finish, music)
    return function(player, npc, tbl, var, step)
        -- Prevent players opening menu while in dialog
        if player:getLocalVar("[CU]BLOCKING") == 1 then
            return
        end

        local options = {}
        local i = 1

        for i = 1, #opt do
            if i == select then

                table.insert(options, {
                    opt[i][1],
                    function()
                        if opt[i][2] ~= nil then
                            local delay = customUtil.dialogDelay(tbl.dialog[opt[i][2]])
                            customUtil.dialogTable(player, tbl.dialog[opt[i][2]], dialogFrom(tbl), { npc = npc })

                            if opt[i][3] ~= nil then
                                if player:getLocalVar("[CU]REWARD") == 1 then
                                    return
                                end

                                player:setLocalVar("[CU]REWARD", 1)
                            end

                            npc:timer(delay, function(playerArg)
                                -- Optionally give item after dialog
                                if opt[i][3] ~= nil then
                                    if npcUtil.giveItem(player, opt[i][3]) then
                                        player:setCharVar(var, step)

                                        if questName ~= nil then
                                            questAccepted(player, questName)
                                        end
                                    end
                                else
                                    player:setCharVar(var, step)

                                    if questName ~= nil then
                                        if finish ~= nil then
                                            questCompleted(player, questName, music)
                                        else
                                            questAccepted(player, questName)
                                        end
                                    end
                                end

                                player:setLocalVar("[CU]REWARD", 0)
                            end)
                        end
                    end,
                })
            else
                table.insert(options, {
                    opt[i][1],
                    function()
                        if opt[i][2] ~= nil then
                            customUtil.dialogTable(player, tbl.dialog[opt[i][2]], dialogFrom(tbl), { npc = npc })
                        end
                    end,
                })
            end
        end

        player:customMenu({
            title   = title,
            options = options,
        })
    end
end

local giveReward = function(player, reward)
    if reward.item ~= nil then
        if reward.augment ~= nil then
            local ID = zones[player:getZoneID()]

            if player:getFreeSlotsCount() > 0 then
                player:addItem(reward.item, 1, unpack(reward.augment))
                player:messageSpecial(ID.text.ITEM_OBTAINED, reward.item)
            else
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, reward.item)
                return false
            end
        elseif not npcUtil.giveItem(player, reward.item) then
            return false
        end
    end

    if reward.gil ~= nil then
        npcUtil.giveCurrency(player, "gil", reward.gil)
    end

    if reward.keyitem ~= nil then
        npcUtil.giveKeyItem(player, reward.keyitem)
    end

    return true
end

local giveAfter = function(player, reward)
    if reward and reward.after ~= nil then
        local result = reward.after(player)

        if type(result) ~= "boolean" then
            print("[CQ] Reward \"after\" function did not return a boolean!")
            return false
        else
            return result
        end
    end
end

m.restoreJob = function(text, name, music)
    return function(player, npc, tbl, var, step)
        local deaths = player:getDeaths()

        if #deaths > 0 then
            local options =
            {
                {
                    "None",
                    function()
                    end,
                },
            }

            for k, v in pairs(deaths) do
                table.insert(options, {
                    string.format("Lv%u %s", v[2], xi.jobNames[v[1]][2]),
                    function(playerArg)
                        player:changeJob(v[1])
                        player:setLevel(v[2] - 1)
                        player:addExp(1)

                        player:setCharVar(var, step)
                        player:setUnbreakable(false)

                        customUtil.dialogTable(player, tbl.dialog[text], dialogFrom(tbl), { npc = npc })

                        local delay = customUtil.dialogDelay(tbl.dialog[text])

                        playerArg:timer(delay, function()
                            questCompleted(player, name, music)
                        end)
                    end,
                })
            end

            player:customMenu({
                title   = "Restore previous job?",
                options = options
            })
        else
            player:setCharVar(var, step)
            player:setUnbreakable(false)

            customUtil.dialogTable(player, tbl.dialog[text], dialogFrom(tbl), { npc = npc })

            local delay = customUtil.dialogDelay(tbl.dialog[text])

            playerArg:timer(delay, function()
                questCompleted(player, name, music)
            end)
        end
    end
end

m.giveStart = function(text, reward, name)
    return function(player, npc, tbl, var, step)
        if player:getLocalVar("[CU]REWARD") == 1 then
            return
        end

        player:setLocalVar("[CU]REWARD", 1)
        local delay = customUtil.dialogDelay(tbl.dialog[text])
        customUtil.dialogTable(player, tbl.dialog[text], dialogFrom(tbl), { npc = npc })

        player:timer(delay, function(playerArg)
            if giveReward(player, reward) then
                player:setCharVar(var, step)
                giveAfter(player, reward)

                if name ~= nil then
                    questAccepted(player, name)
                end
            end

            player:setLocalVar("[CU]REWARD", 0)
        end)
    end
end

m.giveStep = function(text, reward, name, music)
    return function(player, npc, tbl, var, step)
        if player:getLocalVar("[CU]REWARD") == 1 then
            return
        end

        player:setLocalVar("[CU]REWARD", 1)
        local delay = customUtil.dialogDelay(tbl.dialog[text])
        customUtil.dialogTable(player, tbl.dialog[text], dialogFrom(tbl), { npc = npc })

        player:timer(delay, function(playerArg)
            if giveReward(player, reward) then
                player:setCharVar(var, step)
                giveAfter(player, reward)

                if name ~= nil then
                    questCompleted(player, name, music)
                end
            end

            player:setLocalVar("[CU]REWARD", 0)
        end)
    end
end

m.giveConditional = function(condition, text, reward)
    return function(player, npc, tbl, var, step)
        if player:getLocalVar("[CU]REWARD") == 1 then
            return
        end

        player:setLocalVar("[CU]REWARD", 1)

        if condition == "job" then
            local job   = player:getMainJob()
            local delay = customUtil.dialogDelay(tbl.dialog[text][job])
            customUtil.dialogTable(player, tbl.dialog[text][job], dialogFrom(tbl), { npc = npc })

            player:timer(delay, function(playerArg)
                if npcUtil.giveItem(player, reward[job]) then
                    player:setCharVar(var, step)
                end

                player:setLocalVar("[CU]REWARD", 0)
            end)
        end
    end
end

local checkList =
{
    cw = function(player, val)
        return player:isCrystalWarrior() == val
    end,

    ucw = function(player, val)
        return player:isUnbreakable() == val
    end,

    level = function(player, val)
        return player:getMainLvl() >= val
    end,

    job  = function(player, val)
        return player:getMainJob() == val
    end,

    jobvar = function(player, var)
        return player:getMainJob() == player:getCharVar(var)
    end,

    vareq = function(player, val)
        return player:getCharVar(val[1]) == val[2]
    end,

    vargt = function(player, val)
        return player:getCharVar(val[1]) > val[2]
    end,

    varlt = function(player, val)
        return player:getCharVar(val[1]) < val[2]
    end,

    zero = function(player, variable)
        return player:getCharVar(variable) == 0
    end,

    cooldown = function(player, variable)
        return os.time() > player:getCharVar(variable)
    end,

    item = function(player, item)
        return player:hasItem(item)
    end,
}

m.checks = function(tbl)
    return function(player)
        local pass = true

        for k, v in pairs(tbl) do
            if not checkList[string.lower(k)](player, v) then
                pass = false
            end
        end

        return pass
    end
end

m.spawnMob = function(entityID, text, hideSpawner, params)
    return function(player, npc, entity, var, step, entities)
        local mobInfo = getEntityInfo(entities, entityID)
        local delay   = 0

        if mobsAlive(player, entities, entityID) then
            return
        end

        if text then
            delay = customUtil.dialogDelay(entity.dialog[text])
            customUtil.dialogTable(player, entity.dialog[text], dialogFrom(entity), { npc = npc })
        end

        npc:timer(delay, function(npcArg)
            if mobsAlive(player, entities, entityID) then
                return
            end

            local zone       = player:getZone()
            local result     = zone:queryEntitiesByName("DE_" .. mobInfo.name)

            -- Only skip this if hideSpawner is false
            if hideSpawner == nil or hideSpawner then
                hideNPC(npcArg)
            end

            applyLevelCap(player, params)

            for k, v in pairs(result) do
                 if v and not v:isAlive() then
                    v:setSpawn(mobInfo.pos[1], mobInfo.pos[2], mobInfo.pos[3], mobInfo.pos[4])

                    if mobInfo.dropID ~= nil then
                        v:setDropID(mobInfo.dropID)
                    else
                        v:setDropID(0)
                    end

                    v:spawn()
                    v:setMobLevel(mobInfo.level)
                    v:updateClaim(player)
                    v:setLocalVar("NO_CASKET", 1)
                    v:setRespawnTime(0)

                    if mobInfo.mods ~= nil then
                        for mod, value in pairs(mobInfo.mods) do
                            v:setMod(mod, value)
                        end
                    end

                    if mobInfo.hp ~= nil then
                        v:setHP(mobInfo.hp)
                    end

                    if params ~= nil then
                        v:setMobMod(xi.mobMod.DRAW_IN, 2)
                        setEncounter(v, params)
                    end
                end
            end
        end)
    end
end

local getSteps = function(var, entity, steps, entities)
    local func = getStepFunctions(steps, entity.id)

    return function(player, npc)
        if entity.dialog == nil then
            return
        end

        local step = player:getCharVar(var) + 1

        if
            func[step] == nil or
            (
                steps[step].check and
                not steps[step].check(player)
            )
        then
            customUtil.dialogTable(player, entity.dialog.DEFAULT, dialogFrom(entity))
        else
            if type(func[step]) == "table" then
                if func[step]["onTrigger"] ~= nil then
                    func[step]["onTrigger"](player, npc, entity, var, step, entities)
                else
                    customUtil.dialogTable(player, entity.dialog.DEFAULT, dialogFrom(entity))
                end
            else
                func[step](player, npc, entity, var, step, entities)
            end
        end
    end
end

local function awardGive(player, var, reward)
    local var = string.format("[CW]Helper_%s", string.upper(var))

    -- Make sure player can't claim reward more than once every 24 hours
    if os.time() > player:getCharVar(var) then
        print(string.format("[HELPER] %s has claimed a reward for helping with %s.", player:getName(), var))
        player:setCharVar(var, getMidnight())

        -- Set var on player for use in leaderboards
        player:setCharVar("[CW]HELPER", player:getCharVar("[CW]HELPER") + 1)
        npcUtil.giveItem(player, reward)
    end
end

local function awardHelper(player, var, updatedStep, params)
    local zoneID      = player:getZoneID()
    local alliance    = player:getAlliance()
    local cooldownVar = var

    if params.var ~= nil then
        cooldownVar = params.var
    end

    for i = 1, #alliance do
        if
            alliance[i]:isPC() and 
            alliance[i]:getZoneID() == zoneID and
            alliance[i]:getCharVar(var) ~= updatedStep
        then
            awardGive(alliance[i], cooldownVar, params.helper)
        end
    end
    
end

m.killStep = function(entityID, mobs, resetStep, params)
    return function(mob, player, entity, var, step, entities)
        local pass = false

        if mobs ~= nil then
            local clear = true

            for k, v in pairs(mobs) do
                local ent = entityFromID(mob, entities, v)
                if ent:isAlive() then
                    clear = false
                end
            end

            if clear then
                pass = true
                if resetStep ~= nil then
                    resetAllStep(player, var, step - 1, resetStep)
                else
                    incrementAllStep(player, var, step - 1)
                end
            end
        else
            pass = true

            if resetStep ~= nil then
                resetAllStep(player, var, step - 1, resetStep)
            else
                incrementAllStep(player, var, step - 1)
            end
        end

        -- Always remove level cap when all enemies are dead
        if pass then
            removeLevelCap(player)

            if
                params ~= nil and
                params.helper ~= nil
            then
                local updatedStep = step

                if resetStep ~= nil then
                    updatedStep = resetStep
                end

                awardHelper(player, var, updatedStep, params)
            end
        end

        -- Respawn spawner
        if pass and entityID ~= nil then
            local spawner = entityFromID(mob, entities, entityID)

            if spawner then
                spawner:setStatus(xi.status.NORMAL)
            end
        end
    end
end

m.tradeTable = function(success, decline, tbl, questName, music)
    return function(player, npc, trade, entity, var, step)
        for k, v in pairs(tbl) do
            if npcUtil.tradeHasExactly(trade, k) then
                local delay  = customUtil.dialogDelay(entity.dialog[success])
                local result = customUtil.pickItem(tbl[k])

                if player:getLocalVar("[CU]REWARD") == 1 then
                    return
                end

                player:setLocalVar("[CU]REWARD", 1)

                -- Delay rewards until after success dialog
                npc:timer(delay, function(npgArg)
                    if npcUtil.giveItem(player, result[2]) then
                        player:tradeComplete()

                        if questName ~= nil then
                            questCompleted(player, questName, music)
                        end
                    end

                    player:setLocalVar("[CU]REWARD", 0)
                end)

                customUtil.dialogTable(player, entity.dialog[success], dialogFrom(entity), { [1] = result[3], npc = npc })
            else
                customUtil.dialogTable(player, entity.dialog[decline], dialogFrom(entity), { [1] = result[3], npc = npc })
            end
        end
    end
end

m.tradeStep = function(success, decline, items, reward, questName, music)
    return function(player, npc, trade, entity, var, step)
        if player:getLocalVar("[CU]REWARD") == 1 then
            return
        end

        if npcUtil.tradeHasExactly(trade, items) then
            player:setLocalVar("[CU]REWARD", 1)
            local delay = customUtil.dialogDelay(entity.dialog[success])
            customUtil.dialogTable(player, entity.dialog[success], dialogFrom(entity), { npc = npc })

            player:timer(delay, function(playerArg)
                if
                    reward == nil or
                    giveReward(player, reward)
                then
                    player:tradeComplete()
                    player:incrementCharVar(var, 1)
                    giveAfter(player, reward)

                    if questName ~= nil then
                        questCompleted(player, questName, music)
                    end

                    player:setLocalVar("[CU]REWARD", 0)
                end
            end)
        else
            customUtil.dialogTable(player, entity.dialog[decline], dialogFrom(entity), { npc = npc })
        end
    end
end

m.tradeOnly = function(success, decline, items, reward, tallyvar, tallyadd, questName, music)
    return function(player, npc, trade, entity, var, step)
        if player:getLocalVar("[CU]REWARD") == 1 then
            return
        end

        if npcUtil.tradeHasExactly(trade, items) then
            player:setLocalVar("[CU]REWARD", 1)
            local delay = customUtil.dialogDelay(entity.dialog[success])

            if tallyvar ~= nil then
                local amount = player:getCharVar(tallyvar) + tallyadd
                player:setCharVar(tallyvar, amount)
                customUtil.dialogTable(player, entity.dialog[success], dialogFrom(entity), { [1] = amount, npc = npc })
            else
                customUtil.dialogTable(player, entity.dialog[success], dialogFrom(entity), { npc = npc })
            end

            player:timer(delay, function(playerArg)
                if
                    reward == nil or
                    giveReward(player, reward)
                then
                    player:tradeComplete()
                    giveAfter(player, reward)

                    if questName ~= nil then
                        questCompleted(player, questName, music)
                    end

                    player:setLocalVar("[CU]REWARD", 0)
                end
            end)
        else
            customUtil.dialogTable(player, entity.dialog[decline], dialogFrom(entity), { npc = npc })
        end
    end
end

m.tradeCount = function(tbl)
    return function(player, npc, trade, entity, var, step)
        if npcUtil.tradeHasExactly(trade, tbl.items) then
            local amount = player:getCharVar(tbl.var) + 6
            player:setCharVar(tbl.var, amount)

            if amount >= tbl.require then
                local delay = customUtil.dialogDelay(entity.dialog[tbl.after[1]])
                customUtil.dialogTable(player, entity.dialog[tbl.after[1]], dialogFrom(entity), { [1] = amount, npc = npc })

                player:timer(delay, function(playerArg)
                    if
                        tbl.after[2] == nil or
                        giveReward(player, tbl.after[2])
                    then
                        player:tradeComplete()
                        player:incrementCharVar(var, 1)
                        giveAfter(player, reward)

                        if tbl.questName ~= nil then
                            questCompleted(player, tbl.questName, tbl.music)
                        end
                    end
                end)
            else
                local delay = customUtil.dialogDelay(entity.dialog[tbl.before[1]])
                customUtil.dialogTable(player, entity.dialog[tbl.before[1]], dialogFrom(entity), { [1] = amount, npc = npc })

                player:timer(delay, function(playerArg)
                    if
                        tbl.before[2] == nil or
                        giveReward(player, tbl.before[2])
                    then
                        player:tradeComplete()
                        giveAfter(player, reward)

                        if tbl.questName ~= nil then
                            questCompleted(player, tbl.questName, tbl.music)
                        end
                    end
                end)
            end
        else
            customUtil.dialogTable(player, entity.dialog[tbl.decline], dialogFrom(entity), { npc = npc })
        end
    end
end

local getTradeSteps = function(var, entity, steps, tbl)
    local func = getStepFunctions(steps, entity.id)

    return function(player, npc, trade)
        local step = player:getCharVar(var) + 1

        if func[step] ~= nil and func[step]["onTrade"] then
            func[step]["onTrade"](player, npc, trade, entity, var, step)
        end
    end
end

m.transform = function(hp, model, skills, originalModel, originalSkills)
    return function(mob, target)
        if mob:getHPP() <= hp then
            -- Do some kind of animation
            mob:setModelId(model)
            mob:setMobMod(xi.mobMod.SKILL_LIST, skills)
        else
            mob:setModelId(originalModel)
            mob:setMobMod(xi.mobMod.SKILL_LIST, originalSkills)
        end
    end
end

local getMobSteps = function(event, var, entity, steps, entities)
    local func = getStepFunctions(steps, entity.id)

    return function(mob, player)
        -- TODO:
        -- How do we respawn the marker if we don't know the step?
        if player == nil then
            return
        end

        local step = player:getCharVar(var) + 1

        if
            func[step] == nil or
            (
                steps[step].check and
                not steps[step].check(player)
            )
        then
            return
        end

        if type(func[step]) == "table" then
            if func[step][event] ~= nil then
                func[step][event](mob, player, entity, var, step, entities)
            end
        elseif event == "onMobDeath" then
            func[step](mob, player, entity, var, step, entities)
        end
    end
end

local function entitySetup(dynamicEntity, tbl, entity)
    if
        entity.type == xi.objType.NPC or
        entity.marker ~= nil
    then
        dynamicEntity.onTrigger = getSteps(tbl.info.var, entity, tbl.step, tbl.entity)
        dynamicEntity.onTrade   = getTradeSteps(tbl.info.var, entity, tbl.step, tbl.entity)

    elseif entity.type == xi.objType.MOB then
        dynamicEntity.groupId     = entity.groupId
        dynamicEntity.groupZoneId = entity.groupZoneId

        dynamicEntity.onMobDeath     = getMobSteps("onMobDeath", tbl.info.var, entity, tbl.step, tbl.entity)
        dynamicEntity.onMobFight     = getMobSteps("onMobFight", tbl.info.var, entity, tbl.step, tbl.entity)
        dynamicEntity.onMobDisengage = function(mob)
            DespawnMob(mob:getID())
        end

        dynamicEntity.onMobInitialize = function(mob)
            mob:setMobMod(xi.mobMod.DETECTION, 0x08)
            mob:setMobMod(xi.mobMod.CHECK_AS_NM,  1)
            mob:setMobMod(xi.mobMod.CHARMABLE,    0)

            if entity.jobSpecial then
                g_mixins.job_special(mob)
            end
        end
    end
end

local function entityAfter(de, entity)
    if entity.animation then
        de:setAnimation(entity.animation)
    end

    if entity.hidden then
        de:setStatus(xi.status.DISAPPEAR)
    end

    if entity.hidename ~= nil then
        de:hideName(entity.hidename)
    end

    -- Hide names and HP for side-quest/sparkle markers
    if entity.marker ~= nil then
        de:hideName(true)
        de:hideHP(true)
    end

    if entity.hidehp ~= nil then
        de:hideHP(entity.hidehp)
    end

    if entity.notarget ~= nil then
        de:setUntargetable(entity.notarget)
    end

    if
        entity.type == xi.objType.MOB and
        entity.dialog ~= nil
    then
        print(string.format("[CQ] %s is a mob but has been assigned dialog. Do not do this.", entyity.name))
    end
end

local function entityRefresh(dynamicEntity, zone, tbl, entity)
    local result = zone:queryEntitiesByName("DE_" .. entity.name)

    if result ~= nil then
        for _, de in pairs(result) do
            de:setPos(entity.pos[1], entity.pos[2], entity.pos[3], entity.pos[4])

            if type(entity.look) == "string" then
                de:setLookString(entity.look)

            -- TODO:
            elseif entity.marker == nil then
                de:setModelId(entity.look)
            end

            entityAfter(de, entity)
        end
        printf("[CQ] Entity DE_%s was updated.", entity.name)
    else
        printf("[CQ] Entity DE_%s not found.", entity.name)
    end
end

m.add = function(source, tbl)
    if xi.settings.main.ENABLE_CW == 0 then
        return
    end

    local zoneList  = {}
    tbl.entities = {}

    for k, v in pairs(tbl.entity) do
        if zoneList[v.area] == nil then
            zoneList[v.area] = {}
        end

        if v.id then
            zoneList[v.area][v.id] = v
        else
            print(string.format("[CQ] Entity %s has no defined ID", v.name))
        end
    end

    for k, v in pairs(zoneList) do
        if
            xi ~= nil and
            xi.zones ~= nil and
            xi.zones[k] ~= nil and
            xi.zones[k].npcs ~= nil
        then
            for id, entity in pairs(v) do
                local dynamicEntity = xi.zones[k].npcs["DE_" .. entity.name]

                if dynamicEntity ~= nil then
                    entitySetup(dynamicEntity, tbl, entity)

                    local zone = GetZone(cid.zone[k])

                    if zone ~= nil then
                        entityRefresh(dynamicEntity, zone, tbl, entity)
                    end
                end
            end
        end

        source:addOverride(string.format("xi.zones.%s.Zone.onInitialize", k), function(zone)
            super(zone)

            for id, entity in pairs(v) do
                local dynamicEntity =
                {
                    name       = entity.name,
                    objtype    = entity.type or xi.objType.NPC,
                    namevis    = entity.namevis or 0,
                    flags      = entity.flags or 0,
                    x          = entity.pos[1],
                    y          = entity.pos[2],
                    z          = entity.pos[3],
                    rotation   = entity.pos[4] or 0,
                    widescan   = 1,
                }

                if entity.marker ~= nil then
                    if entity.marker == m.MAIN_QUEST then
                        dynamicEntity.look = m.marker.SHIMMER
                    else
                        dynamicEntity.look = m.marker.SPARKLE
                    end
                end

                if entity.look ~= nil then 
                    dynamicEntity.look = entity.look
                end

                entitySetup(dynamicEntity, tbl, entity)

                tbl.entities[id] = zone:insertDynamicEntity(dynamicEntity)

                entityAfter(tbl.entities[id], entity)
            end
        end)
    end
end

return m
