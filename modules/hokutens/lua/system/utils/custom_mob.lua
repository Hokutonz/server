-----------------------------------
-- Custom Mobs
-----------------------------------
require("modules/module_utils")
require("scripts/globals/utils")
local cu  = require("modules/catseyexi/lua/additive_overrides/utils/custom_util")
-----------------------------------
local m = Module:new("custom_mob")

local camp =
{
    ["Beaucedine_Glacier"] =
    {
        {
            name        = "Frost Diremite",
            level       = 24,
            groupId     = 11,
            groupZoneId = 27,
            respawn     = utils.minutes(5),
            drops       =
            {
                { cu.rate.VERY_COMMON, 1700 }, -- Bloodthread (24%)
                { cu.rate.RARE,         924 }, -- Fiend Blood ( 5%)
            },
            
            spawn       =
            {
                { -201.062, -40.012, -236.237, 229 }, -- !pos -201.062 -40.012 -236.237 111
                { -187.508, -39.592, -244.336,  44 },
                { -174.402, -39.481, -244.503,   0 },
                { -154.727, -40.064, -237.331, 238 },
                { -154.731, -40.051, -204.285, 148 },
                { -176.637, -39.230, -195.791, 119 },
                { -183.290, -40.250, -226.539, 248 },
            },
        },
    },
    ["Wajaom_Woodlands"] =
    {
        {
            name        = "Toucan",
            level       = { 30, 32 },
            groupId     = 14,
            groupZoneId = 4,
            respawn     = 90,
            mods        =
            {
               [xi.mobMod.NO_LINK] = 1,
            },
            drops       =
            {
                { cu.rate.UNCOMMON, xi.item.BIRD_FEATHER }, -- Bird Feather 10%
                { cu.rate.RARE,     xi.item.BIRD_EGG     }, -- Bird Egg      5%
            },

            spawn    =
            {
                -- (M-7)
                { 668.539, -20.271, 263.981,  44 }, -- !pos 668.539 -20.271 263.981 51
                { 679.122, -20.250, 264.888,  70 },
                { 678.675, -18.165, 256.218, 152 },
                { 688.901, -17.482, 250.605, 181 },
                { 690.014, -19.384, 260.696, 105 },

                { 734.458, -19.500, 254.670,  35 },
                { 745.947, -20.250, 248.837,  67 },
                { 739.491, -19.374, 238.634, 120 },
                { 729.472, -17.262, 246.041, 190 },
                { 717.506, -18.000, 252.892, 247 },

                { 724.498, -15.921, 234.302,  49 },
                { 715.267, -15.955, 236.256, 151 },
                { 714.694, -16.097, 244.861,  92 },
                { 708.963, -17.018, 250.685, 116 },
                { 702.484, -16.503, 250.040, 165 },
            },
        },
        {
            name        = "Greater Toucan",
            level       = { 40, 42 },
            groupId     = 14,
            groupZoneId = 4,
            respawn     = 90,
            mods        =
            {
               [xi.mobMod.NO_LINK] = 1,
            },
            drops       =
            {
                { cu.rate.UNCOMMON, xi.item.BIRD_FEATHER }, -- Bird Feather 10%
                { cu.rate.RARE,     xi.item.BIRD_EGG     }, -- Bird Egg      5%
            },

            spawn    =
            {
                -- Giwahb Watchtower (F-5)
                { -360.957, -31.754, 651.968,  41 }, -- !pos -360.957 -31.754 651.968 51
                { -375.427, -34.000, 642.494,  47 },
                { -377.708, -33.717, 651.414, 199 },
                { -381.193, -35.739, 674.460,  32 },
                { -387.499, -36.127, 661.615, 239 },

                { -373.949, -34.000, 667.105, 170 },
                { -364.090, -31.518, 662.785,  24 },
                { -360.111, -31.823, 673.137, 188 },
                { -365.816, -32.233, 680.047,  32 },
                { -371.518, -33.756, 685.985, 145 },

                { -378.986, -35.500, 692.817, 214 },
                { -369.164, -34.826, 692.420,  99 },
                { -365.113, -36.250, 704.954, 107 },
                { -355.762, -36.279, 704.697, 206 },
                { -357.413, -33.103, 689.462,  24 },
            },
        },
    },
}

for zoneName, bestiary in pairs(camp) do
    m:addOverride(string.format("xi.zones.%s.Zone.onInitialize", zoneName), function(zone)
        super(zone)

        for _, mobInfo in pairs(bestiary) do
            for _, pos in pairs(mobInfo.spawn) do
                local dynamicEntity =
                {
                    name        = mobInfo.name,
                    objtype     = xi.objType.MOB,
                    groupId     = mobInfo.groupId,
                    groupZoneId = mobInfo.groupZoneId,
                    x           = pos[1],
                    y           = pos[2],
                    z           = pos[3],
                    rotation    = pos[4],
                    widescan    = 1,
                }

                if mobInfo.look ~= nil then 
                    dynamicEntity.look = mobInfo.look
                end

                dynamicEntity.onMobInitialize = function(mob)
                    mob:setMobMod(xi.mobMod.DETECTION, 0x08)
                    mob:setMobMod(xi.mobMod.CHARMABLE,    0)

                    if mobInfo.notorious then
                        mob:setMobMod(xi.mobMod.CHECK_AS_NM,  1)
                    end
                end

                dynamicEntity.onMobSpawn = function(mob)
                    if type(mobInfo.level) == "table" then -- Roll level if table (random range)
                        mob:setMobLevel(math.random(mobInfo.level[1], mobInfo.level[2]))
                    else
                        mob:setMobLevel(mobInfo.level)
                    end

                    if mobInfo.mods ~= nil then
                        for mod, value in pairs(mobInfo.mods) do
                            mob:setMobMod(mod, value)
                        end
                    end
                end

                dynamicEntity.onMobDeath = function(mob, player, optParams)
                    if type(mobInfo.respawn) == "table" then -- Roll next respawn if table (random range)
                        mob:setRespawnTime(math.random(mobInfo.respawn[1], mobInfo.respawn[2]))
                    end

                    if
                        mobInfo.drops ~= nil and -- If mob has table defined drops, roll them
                        player ~= nil            -- Check the player reference so we don't crash
                    then
                        for _, v in ipairs(mobInfo.drops) do
                            player:addTreasure(v[2], mob, v[1])
                        end
                    end
                end

                local entity = zone:insertDynamicEntity(dynamicEntity)

                entity:setSpawn(pos[1], pos[2], pos[3], pos[4])

                if type(mobInfo.respawn) == "table" then
                    entity:setRespawnTime(math.random(mobInfo.respawn[1], mobInfo.respawn[2]))
                else
                    entity:setRespawnTime(mobInfo.respawn)
                end

                if mobInfo == nil and mobInfo.dropID then
                    entity:setDropID(mobInfo.dropID)
                else
                    entity:setDropID(0)
                end

                entity:spawn()
            end
        end
    end)
end

return m
