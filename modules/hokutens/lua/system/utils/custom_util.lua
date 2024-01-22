-----------------------------------
-- custom_util
-----------------------------------
require("modules/module_utils")
require("scripts/globals/utils")
require("scripts/globals/npc_util")
local cid = require("modules/hokutens/lua/system/utils/custom_id")
-----------------------------------
local m = Module:new("custom_util")

m.rate =
{
    GUARANTEED  = 1000, -- 100%
    VERY_COMMON =  240, --  24%
    COMMON      =  150, --  15%
    UNCOMMON    =  100, --  10%
    RARE        =   50, --   5%
    VERY_RARE   =   10, --   1%
    SUPER_RARE  =    5, -- 0.5%
    ULTRA_RARE  =    1, -- 0.1%
}

-- { { rate, item } }, modifier
m.pickItem = function(items, mod)
    -- sum weights
    local sum = 0
    for i = 1, #items do
        if mod ~= nil then
            sum = sum + items[i][1][mod]
        else
            sum = sum + items[i][1]
        end
    end

    -- pick weighted result
    local item = items[1]
    local pick = math.random(1, sum)
    sum = 0

    for i = 1, #items do
        if mod ~= nil then
            sum = sum + items[i][1][mod]
        else
            sum = sum + items[i][1]
        end

        if sum >= pick then
            item = items[i]
            break
        end
    end

    return item
end

m.capitalize = function(str)
    return string.upper(string.sub(str, 1, 1)) .. string.lower(string.sub(str, 2))
end

m.numWithCommas = function(n)
    local str = tostring(math.floor(n))
    local p1  = string.gsub(string.reverse(str), "(%d%d%d)","%1,")
    local p2  = string.reverse(string.gsub(p1, ",(%-?)$","%1"))

    return p2
end

-- Return the number of (Earth) seconds until next Firesday
m.nextVanaWeek = function()
    local daysRemaining    = (7 - VanadielDayOfTheWeek()) * 1440
    local minsRemaining    =  ((24 - VanadielHour()) * 60) + (60 - VanadielMinute())
    local secondsRemaining = ((daysRemaining + minsRemaining) * 60) / 25
    return os.time() + secondsRemaining
end

local processLine = function(player, prefix, row, param)
    local str = row

    if param then
        str = string.format(row, param[1], param[2], param[3], param[4])
    end

    player:printToPlayer(prefix .. str, xi.msg.channel.NS_SAY)
end

local processString = function(player, prefix, row, delay, param)
    local str = row

    if param then
        str = string.format(row, param[1], param[2], param[3], param[4])
    end

    if str:sub(1, 1) == " " then
        -- Paragraph continue
        player:timer(delay, function(playerArg)
            playerArg:printToPlayer(str, xi.msg.channel.NS_SAY)
        end)
    else
        -- New paragraph
        player:timer(delay, function(playerArg)
            playerArg:printToPlayer(prefix .. str, xi.msg.channel.NS_SAY)
        end)
    end
end

local applyEntities = function(player, entityList, func)
    local zone = player:getZone()

    for i = 1, #entityList do
        local entityName = entityList[i]
        local deEntity   = string.gsub(entityName, "_", " ")
        local result     = zone:queryEntitiesByName("DE_" .. deEntity)

        for j = 1, #result do
            func(result[j], player)
        end
    end
end

local getEntity = function(player, entityName)
    local zone     = player:getZone()
    local deEntity = string.gsub(entityName, "_", " ")
    local result   = zone:queryEntitiesByName("DE_" .. deEntity)
    return result[1]
end

local scriptedEvent = function(player, entities, events)
    local ents = {}
    for i = 1, #entities do
        ents[i] = getEntity(player, entities[i])
        ents[i]:ceSpawn(player)
    end

    for i = 1, #events do
        local event = events[i]
        local delay = 5000 + i * 1000

        player:timer(delay, function()
            ents[event[1]]:entityAnimationPacket(event[2])
        end)
    end

    return 6000 + #events * 1000
end

local processTable = function(player, prefix, row, delay, param)
    -- Face
    -- Turn entity to face target
    if
        row.face   ~= nil and
        row.entity ~= nil
    then
        local entity = getEntity(player, row.entity)
        if entity == nil then
            return
        end

        if row.face == "player" then
            entity:ceFace(player)
        elseif type(row.face) == "number" then
            entity:ceTurn(player, row.face)
        else
            local otherEntity = getEntity(player, row.face)
            if otherEntity then
                entity:ceFaceNpc(player, otherEntity)
            end
        end

    elseif row.removeEffect ~= nil then
        if player:hasStatusEffect(row.removeEffect) then
            player:delStatusEffect(row.removeEffect)
        end

    elseif row.charvar ~= nil then
        player:setCharVar(row.charvar, row.value)

    elseif row.costume ~= nil then
        player:setCostume(row.costume)

    elseif row.message ~= nil then
        player:printToPlayer(row.message, xi.msg.channel.SYSTEM_3)

    elseif row.say ~= nil then
        player:printToPlayer(row.say, xi.msg.channel.NS_SAY)

    elseif row.emotion ~= nil then
        player:printToPlayer(row.emotion, 8)

    elseif row.music ~= nil then
        player:changeMusic(0, row.music)
        player:changeMusic(1, row.music)

    elseif
        row.scripted_event ~= nil and
        row.scripted_event.events ~= nil and
        row.scripted_event.entities ~= nil
    then
        return scriptedEvent(player, row.scripted_event.entities, row.scripted_event.events)

    -- NPC Animation Packet
    -- Send an animation packet for the NPC
    elseif
        row.entity ~= nil and
        row.packet ~= nil
    then
        local entity = getEntity(player, row.entity)
        entity:entityAnimationPacket(row.packet)

    -- NPC Independent Animation Packet
    -- Send an independent animation packet for the NPC
    elseif
        row.animate ~= nil
    then
        if row.entity ~= nil then
            local entity = getEntity(player, row.entity)

            if row.target == "player" then
                entity:ceAnimate(player, player, row.animate, row.mode or 0)
            else
                entity:ceAnimate(player, entity, row.animate, row.mode or 0)
            end
        else
            player:independentAnimation(player, row.animate, row.mode or 0)
        end

    -- Emote NPC
    -- Sends an emote from the source NPC onto the target NPC or player
    elseif row.emote  ~= nil then
        if row.entity == "player" then
            player:selfEmote(player, row.emote, xi.emoteMode.MOTION)

        elseif row.entity ~= nil then
            local entity = getEntity(player, row.entity)
            entity:ceEmote(player, row.emote, xi.emoteMode.MOTION)

        elseif
            param ~= nil and
            param.npc ~= nil
        then
            param.npc:ceEmote(player, row.emote, xi.emoteMode.MOTION)
        end

    -- Animation
    -- Set an animation on the target
    elseif row.animation ~= nil then
        if row.target and row.target == "player" then
            local anim = player:getAnimation()

            player:setAnimation(row.animation)

            player:timer(row.duration, function(player)
                player:setAnimation(anim)
            end)

            return row.duration
        end

    -- Move Dynamic Entity
    -- TODO: Doesn't seem to work (yet)
    elseif
        row.move   ~= nil and
        row.entity ~= nil
    then
        local entity = getEntity(player, row.entity)

        for i = 1, #row.move do
            entity:timer(200, function(npcArg)
                entity:ceMove(player, row.move[i][1], row.move[i][2], row.move[i][3])
            end)
        end

    -- Spawn Dynamic Entities
    elseif row.spawn ~= nil then
        applyEntities(player, row.spawn, function(entity, playerArg)
            entity:ceSpawn(playerArg)
        end)

    -- Despawn Dynamic Entities
    elseif row.despawn ~= nil then
        applyEntities(player, row.despawn, function(entity, playerArg)
            entity:ceDespawn(playerArg)
        end)

    -- Glimpse
    -- Temporarily spawn NPCs then despawn after a short interval
    elseif row.glimpse ~= nil then
        applyEntities(player, row.glimpse[2], function(entity, playerArg)
            entity:ceSpawn(playerArg)
            entity:timer(row.glimpse[1], function(npcArg)
                entity:ceDespawn(playerArg)
            end)
        end)
    end
end

-- Returns the total delay from a dialogTable
m.dialogDelay = function(tbl)
    if not tbl or #tbl == 0 then
        print(string.format("[CU] Dialog table for %s missing or empty.", npcName))
        return
    end

    local total = 0

    for i = 1, #tbl do
        local row = tbl[i]
        local nextDelay = 1500

        if row.delay ~= nil then
            nextDelay = row.delay

        elseif row.duration ~= nil then
            nextDelay = row.duration

        elseif row.move ~= nil then
            nextDelay = 200 * #row.move

        elseif row.scripted_event then
            nextDelay = 5000 + 1000 * #row.scripted_event.events

        elseif type(row) == "table" then
            nextDelay = 0
        end

        total = total + nextDelay
    end

    return total
end

m.dialogTable = function(player, tbl, npcName, param)
    local prefix = ""

    if not tbl or #tbl == 0 then
        print(string.format("[CU] Dialog table for %s missing or empty.", npcName))
        return
    end

    if type(tbl) ~= "table" then
        print("[CU] Dialog is a string but must be a table.")
        return
    end

    if player:getLocalVar("[CU]BLOCKING") == 1 then
        return
    end

    if npcName and string.len(npcName) > 0 then
        prefix = string.format("%s : ", npcName)
    end

    if param and param.npc then
        if tbl[1].noturn == nil then
            param.npc:ceFace(player)
        end

        player:setLocalVar("[CU]BLOCKING", 1)
    end

    if #tbl == 1 then
        if type(tbl[1]) == "table" then
            processTable(player, prefix, tbl[1], 0, param)
        else
            processLine(player, prefix, tbl[1], param)
        end

        -- Reset NPC position after single line dialog
        if param and param.npc then
            player:timer(3000, function(playerArg)
                param.npc:ceReset(player)
                player:setLocalVar("[CU]BLOCKING", 0)
            end)
        end

        return
    end

    local delay = 0

    for i = 1, #tbl do
        local row = tbl[i]
        local nextDelay = 1500

        if type(row) == "function" then
            -- Delayed function
            player:timer(delay, tbl[i])

        elseif type(row) == "string" then
            processString(player, prefix, row, delay, param)

        -- Process tables
        else
            player:timer(delay, function(playerArg)
                processTable(player, prefix, row, delay, param)
            end)

            if row.delay ~= nil then
                nextDelay = row.delay

            elseif row.duration ~= nil then
                nextDelay = row.duration

            -- TODO: Get this working
            elseif row.move ~= nil then
                nextDelay = 200 * #row.move

            elseif row.scripted_event ~= nil then
                nextDelay = 5000 + 1000 * #row.scripted_event.events

            else
                nextDelay = 0
            end
        end

        delay = delay + nextDelay
    end

    if param and param.npc then
        player:timer(delay + 3000, function(playerArg)
            param.npc:ceReset(player)
            player:setLocalVar("[CU]BLOCKING", 0)
        end)
    end
end

m.decToLE = function(num)
    local hex = string.format("%04x", num)
    return string.sub(hex, 3, 4) .. string.sub(hex, 1, 2)
end

local modelSlot = { "head", "body", "hand", "legs", "feet", "main", "offh" }

m.lookTable = function(tbl)
    local str = "00"  -- NPC or Mob

    if tbl.face then
        str = str .. string.format("%02x", tbl.face)
    else
        str = str .. "01"
    end

    if tbl.race then
        str = str .. string.format("%02x", tbl.race)
    else
        str = str .. "01"
    end

    for k, v in pairs(modelSlot) do
        if tbl[v] then
            str = str .. m.decToLE(tbl[v])
        else
            str = str .. "0000"
        end
    end

    str = str .. "0000" -- Ranged slot

    return "0x01" .. string.upper(str)
end

local function delaySendMenu(player, menu)
    player:timer(100, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

m.simpleMenu = function(player, npc, tbl, func, title, currentPage, param)
    local options  = {}
    local max      = 1
    local lastPage = math.floor((#tbl - 1) / 4)
    local page     = currentPage

    if currentPage == nil then
        page = 0
    end

    if page > 0 then
        table.insert(options, {
            "(Prev)",
            function(player)
                m.simpleMenu(player, npc, tbl, func, title, page - 1, param)
            end,
        })
    end

    for i = 1, 4 do
        local item  = tbl[page * 4 + i]
        local block = false

        if
            param ~= nil and
            param.milestone ~= nil
        then
            local milestoneVal = player:getCharVar(param.milestone)

            if utils.mask.getBit(milestoneVal, page * 4 + i) then
                block = true
            end
        end

        if item ~= nil then
            local itemName = item[1]
            local itemCost = item[3]
            local label    = itemName

            if itemCost > 0 then
                if block then
                    label = string.format("-Claimed- (%u)", itemCost)
                else
                    label = string.format("%s (%u)", label, itemCost)
                end
            end

            table.insert(options, {
                label,
                function(playerArg)
                    if not block then
                        func(player, npc, item)
                    end
                end
            })

            max = page * 4 + i
        end
    end

    if max < #tbl then
        table.insert(options, {
            "(Next)",
            function(player)
                m.simpleMenu(player, npc, tbl, func, title, page + 1, param)
            end,
        })
    end

    delaySendMenu(player, {
        title   = title,
        options = options,
    })
end

m.categoryMenu = function(player, npc, tbl, func, title)
    local options = {}

    for _, category in pairs(tbl) do
        table.insert(options, {
            category[1],
            function()
                if type(category[2]) == "table" then
                    m.simpleMenu(player, npc, category[2], func, title)
                else
                    category[2](player, npc)
                end
            end,
        })
    end

    delaySendMenu(player, {
        title   = title,
        options = options,
    })
end

m.overrideDuplicate = function(entity, event, func)
    if not entity then
        return
    end

    local origEvent = event .. "Orig"

    if entity[origEvent] == nil then
        if entity[event] then
            entity[origEvent] = entity[event]
        else
            entity[origEvent] = function()
                -- Do nothing
            end
        end
    end

    local thisenv = getfenv(entity[event])
    local env = { super = entity[origEvent] }

    setmetatable(env, { __index = thisenv })
    setfenv(func, env)

    entity[event] = func
end

local function entitySetup(de, entity)
    if entity.objtype == xi.objType.NPC then
        de.onTrigger = entity.onTrigger
        de.onTrade   = entity.onTrade

    elseif entity.objtype == xi.objType.MOB then
        de.onMobSpawn      = entity.onMobSpawn
        de.onMobDespawn    = entity.onMobDespawn
        de.onMobDeath      = entity.onMobDeath
        de.onMobDeathEx    = entity.onMobDeathEx
        de.onMobFight      = entity.onMobFight
        de.onMobDisengage  = entity.onMobDisengage
        de.onMobInitialize = entity.onMobInitialize
    end
end

local function entityRefresh(de, entity, zone)
    local result = zone:queryEntitiesByName("DE_" .. entity.name)

    if result ~= nil then
        for _, de in pairs(result) do
            de:setPos(entity.x, entity.y, entity.z, entity.rotation)

            if entity.hideName then
                de:hideName(true)
            end

            if entity.untargetable then
                de:setUntargetable(true)
            end
        end
    end
end

m.liveReload = function(mod, tbl)
    for zoneName, entityList in pairs(tbl) do
        if entityList == nil then
            print("[CU] Attempted entity liveReload with empty list")
            return
        end

        for _, entity in pairs(entityList) do
            mod:addOverride(string.format("xi.zones.%s.Zone.onInitialize", zoneName), function(zone)
                super(zone)

                local result = zone:insertDynamicEntity(entity)

                if entity.hidden then
                    result:setStatus(xi.status.DISAPPEAR)
                end

                if entity.hideName then
                    result:hideName(true)
                end

                if entity.untargetable then
                    result:setUntargetable(true)
                end
            end)

            if
                xi ~= nil and
                xi.zones ~= nil and
                xi.zones[zoneName] ~= nil and
                xi.zones[zoneName].npcs ~= nil
            then
                local de = xi.zones[zoneName].npcs["DE_" .. entity.name]

                if de ~= nil then
                    printf("[CU] Attempting liveReload of DE_%s", entity.name)
                    entitySetup(de, entity)

                    local zone = GetZone(cid.zone[zoneName])

                    if zone ~= nil then
                        entityRefresh(de, entity, zone)
                    end
                end
            end
        end
    end
end

m.reloadOverride = function(mod, str, func)
    mod:addOverride(str, func)

    local path = utils.splitStr(str, ".")

    if
        xi ~= nil and
        xi.zones ~= nil and
        xi.zones[path[3]] ~= nil and                -- Zone_Name
        xi.zones[path[3]][path[4]] ~= nil and       -- Zone_Name.npcs
        xi.zones[path[3]][path[4]][path[5]] ~= nil  -- Zone_Name.npcs.Entity
    then
        xi.zones[path[3]][path[4]][path[5]][path[6]] = func
    end
end

return m
