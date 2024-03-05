-----------------------------------
-- Pirate Attack! (custom module)
-----------------------------------
require('scripts/globals/conquest')
require('scripts/globals/missions')
require('scripts/globals/npc_util')
-----------------------------------
local m = Module:new("pirate_attack")

local entityTable = {}
local pTable =
{
--- [mobNumber] = {          name,       x,      y,      z, rot, groupid,    drop, level, skill, spell, look },
    [1]         = { 'Crossbones_1',  6.520, -7.163, 15.442,  82,      10,    3973,    45,   227,     0, '0x0000340200000000000000000000000000000000' },  -- Crossbones (WAR)
    [2]         = { 'Crossbones_2', -5.843, -7.163, 15.764,  22,      11,    3973,    45,   227,    28, '0x00003C0200000000000000000000000000000000' },  -- Crossbones (BLM)
    [3]         = { 'Crossbones_3',  6.656, -7.163,  7.692,  99,      10,    3973,    45,   227,     0, '0x0000340200000000000000000000000000000000' },  -- Crossbones (WAR)
    [4]         = { 'Crossbones_4', -6.230, -7.163,  7.306,  27,      11,    3973,    45,   227,    28, '0x00003C0200000000000000000000000000000000' },  -- Crossbones (BLM)
    [5]         = { 'Silverhook',    2.146, -7.163, 20.436,  65,      13,    3971,    50,   227,   983, '0x0000390200000000000000000000000000000000' },  -- Blackbeard
    [6]         = { 'Blackbeard',   -1.719, -7.163, 20.943,  65,      13,    3972,    50,   227,   984, '0x00003A0200000000000000000000000000000000' },  -- Silverhook
}

-- Function for variable work when mob spawns.
local function setPirateVariables()
    SetServerVariable("[PIRATES]Attack", 1)
    SetServerVariable("[PIRATES]StartTime", os.time() + 50)
end

-- Function for variable work when mob dies.
local function resetPirateVariables()
    SetServerVariable("[PIRATES]Attack", 0)
    SetServerVariable("[PIRATES]StarTime", 0)
end

-- Function to control background music
local function SetZoneMusic(zone, block, track)
    for _, player in pairs(zone:getPlayers()) do
        player:changeMusic(block, track)
    end
end

-- Function to despawn pirates when ferry event ends but pirates were not defeated.
local function despawnPirates()
    for _, pirateID in ipairs(entityTable) do
        if GetMobByID(pirateID):isAlive() then
            DespawnMob(pirateID)
        end

        -- Remove pirates from our entity table
        -- print(string.format("Despawning/Removing pirate from entityTable: %s", pirateID))
        table.remove(entityTable, pirateID)
    end
end

local function setupMob(mob, mobNumber)
    mob:setSpawn(pTable[mobNumber][2], pTable[mobNumber][3], pTable[mobNumber][4], pTable[mobNumber][5])
    mob:setDropID(pTable[mobNumber][7])
    mob:setMobLevel(pTable[mobNumber][8])

    mob:setMobMod(xi.mobMod.SKILL_LIST, pTable[mobNumber][9])
    mob:setMobMod(xi.mobMod.SPELL_LIST, pTable[mobNumber][10])
    mob:setMobMod(xi.mobMod.DETECTION, 0x006)
    mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)

    mob:setRoamFlags(xi.roamFlag.SCRIPTED)

    mob:spawn()

    mob:injectActionPacket(mob:getID(), 6, 602, 0, 0, 0, 0, 0)

    -- Strip identifier from mob's name
    if string.find(mob:getName(), "s_") then
        mob:renameEntity("Crossbones")
    end

    -- Store Mob ID in case we need to despawn later
    -- print(string.format("Adding pirate to entityTable: %s", mob:getID()))
    table.insert(entityTable, mob:getID())
end

-- Mob Logic
m:addOverride("xi.zones.Ship_bound_for_Mhaura_Pirates.Zone.onZoneTick", function(zone)
    super(zone)

    if
        GetServerVariable("[PIRATES]Attack") == 1 and
        os.time() >= GetServerVariable("[PIRATES]StartTime")
    then
        -- Iterate through mob table to spawn pirates
        for i = 1, 6 do
            local mob = zone:insertDynamicEntity({
                objtype     = xi.objType.MOB,
                name        = pTable[i][1],
                look        = pTable[i][11],
                groupId     = pTable[i][6],
                groupZoneId = 227,
                widescan    = 1,
            })

           setupMob(mob, i)
        end

        -- Set pirate music
        SetZoneMusic(zone, 0, 170)
        SetZoneMusic(zone, 1, 170)

        -- Stop infinitely spawning mobs
        resetPirateVariables()
    end
end)

m:addOverride("xi.zones.Ship_bound_for_Selbina_Pirates.Zone.onZoneTick", function(zone)
    if
        GetServerVariable("[PIRATES]Attack") == 1 and
        os.time() >= GetServerVariable("[PIRATES]StartTime")
    then
        -- Iterate through mob table to spawn pirates
        for i = 1, 6 do
            local mob = zone:insertDynamicEntity({
                objtype     = xi.objType.MOB,
                name        = pTable[i][1],
                look        = pTable[i][11],
                groupId     = pTable[i][6],
                groupZoneId = 227,
                widescan    = 1,
            })

           setupMob(mob, i)
        end

        -- Set pirate music
        SetZoneMusic(zone, 0, 170)
        SetZoneMusic(zone, 1, 170)

        -- Stop infinitely spawning mobs
        resetPirateVariables()
    end
end)

m:addOverride("xi.zones.Mhaura.Zone.onEventFinish", function(player, csid, option)
    if csid == 200 then
        local DepartureTime = VanadielHour()

        if DepartureTime % 8 == 0 then
            if GetServerVariable('Mhaura_Destination') > 84 then
                -- Set event variables
                setPirateVariables()
                player:setPos(0, 0, 0, 0, xi.zone.SHIP_BOUND_FOR_SELBINA_PIRATES)
            else
                player:setPos(0, 0, 0, 0, xi.zone.SHIP_BOUND_FOR_SELBINA)
            end
        elseif DepartureTime % 8 == 4 then
            player:setPos(0, 0, 0, 0, xi.zone.OPEN_SEA_ROUTE_TO_AL_ZAHBI)
        else
            player:setPos(8, -1, 5, 62, 249) -- Something went wrong, dump them on the dock for safety.
        end
    elseif csid == 322 then
        player:setCharVar('COP_shikarees_story', 1)
    end
end)

m:addOverride("xi.zones.Selbina.Zone.onEventFinish", function(player, csid, option)
    if csid == 200 then
        if GetServerVariable('Selbina_Destination') > 84 then
            -- Set event variables
            setPirateVariables()
            player:setPos(0, 0, 0, 0, xi.zone.SHIP_BOUND_FOR_MHAURA_PIRATES)
        else
            player:setPos(0, 0, 0, 0, xi.zone.SHIP_BOUND_FOR_MHAURA)
        end
    elseif
        csid == 1101 and
        npcUtil.completeQuest(player, xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.I_LL_TAKE_THE_BIG_BOX, { item = 14226, fameArea = xi.quest.fame_area.NORG, var = { 'Enagakure_Killed', 'illTakeTheBigBoxCS' } })
    then
        player:delKeyItem(xi.ki.SEANCE_STAFF)
    end
end)

-- Clean up if pirates weren't killed
m:addOverride("xi.zones.Ship_bound_for_Mhaura_Pirates.Zone.onEventFinish", function(player, csid, option)
    super(player, csid, option)

    despawnPirates()
end)

m:addOverride("xi.zones.Ship_bound_for_Selbina_Pirates.Zone.onEventFinish", function(player, csid, option)
    super(player, csid, option)

    despawnPirates()
end)

return m
