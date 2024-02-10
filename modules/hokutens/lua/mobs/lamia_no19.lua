---------------------------------------
-- Spawn conditions for Lamia No.19
---------------------------------------
require("modules/module_utils")
require("scripts/globals/mobs")
---------------------------------------

local m = Module:new("nm_lamia_no19")

local settings =
{
    id      = 16998868,
    spawn =
    {
        min   =   3600, --   1 hour
        max   =  10800, --   3 hours
        rate  =     20, -- 20% chance
        delay =   3000, --   3 seconds upon death
    },
}

local placeholder =
{
    ["Lamia_Dancer"] =
    {
        16998518,
    },

    ["Lamias_Elemental"] =
    {
        16998519,
    },

    ["Qutrub"] =
    {
        16998512,
        16998513,
        16998514,
        16998515,
        16998516,
        16998517,
    },

    ["Ashakku"] =
    {
        16998506,
        16998507,
        16998508,
        16998509,
        16998510,
        16998511,
    },
}

local function spawnChance(player)
    local mob = GetMobByID(settings.id)

    if mob:isAlive() or mob:getRespawnTime() > 0 then
        return
    end

    if math.random(1, 100) <= settings.spawn.rate then
        player:printToPlayer("You feel an eerie sense of foreboding.", xi.msg.channel.NS_SAY)
        mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos())

        mob:timer(settings.spawn.delay, function(mobArg)
            mob:spawn()
        end)
    else
        player:printToPlayer("You feel an unsettling presence in this area.", xi.msg.channel.NS_SAY)
    end
end

m:addOverride("xi.zones.Arrapago_Reef.mobs.Lamia_No19.onMobDeath", function(mob)
    mob:setRespawnTime(math.random(settings.spawn.min, settings.spawn.max))
end)

for k, v in pairs(placeholder) do
    xi.module.ensureTable(string.format("xi.zones.Arrapago_Reef.mobs.%s", k))

    m:addOverride(string.format("xi.zones.Arrapago_Reef.mobs.%s.onMobEngaged", k), function(mob)
        for i = 1, #v do
            if mob:getID() == v[i] then
                mob:addListener("ATTACK", "CHECK_DEATH", function(mobArg, player, action)
                    if
                        player ~= nil and
                        player:getHPP() == 0
                    then
                        spawnChance(player)
                    end
                end)
            end
        end
    end)
end

return m
