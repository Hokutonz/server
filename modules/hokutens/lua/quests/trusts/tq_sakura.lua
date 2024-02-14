-------------------------------------------------------
-- Quest for Trust: Sakura
-------------------------------------------------------
-- Steps
-------------------------------------------------------
-- !setvar [TQ]SAKURA 0
-- Sakura         !pos -52.3793 8.2001 85.0337 244
-- Peep           !pos -59.5849 8.2000 85.2577 244
-- Yip            !pos -155.1023 0.8418 391.4258 104
-- Kip            !pos -152.8696 1.0077 388.5037 104
-- Chocobo Eater  !pos -145.0016 0.1175 377.6899 104
-- Unlocks: Trust: Sakura
-------------------------------------------------------

require("modules/module_utils")
require('scripts/globals/utils')
require('scripts/globals/player')
require('scripts/globals/npc_util')
local cq  = require("modules/hokutens/lua/system/utils/custom_quest")
local cu  = require("modules/hokutens/lua/system/utils/custom_util")
local cid = require("modules/hokutens/lua/system/utils/custom_id")
-------------------------------------------------------
local m = Module:new("tq_sakura")

local info =
{
    name   = "Chocobo Savior",
    author = "Tonzoffun",
    var    = "[TQ]SAKURA",
    required =
    {
        item = { { 534, 1 } },
        name = "gausebit grass",
    },
    reward =
    {
        gil   = 2000,
        after = function(player)
            player:addSpell(xi.magic.spell.SAKURA, true, true)
            player:printToPlayer("You learned Trust: Sakura.", xi.msg.channel.SYSTEM_3)
            return true
        end,
    },
}

local SAKURA     = "SAKURA"
local PEEP       = "PEEP"
local KIP        = "KIP"
local YIP        = "YIP"
local CHOCOEATER = "CHOCOEATER"

local entity =
{
    {
        id     = SAKURA,
        name   = "Sakura",
        type   = xi.objType.NPC,
        look   = 3031,
        area   = "Upper_Jeuno",
        pos    = { -52.3793, 8.2001, 85.0337, 189 }, -- !pos -52.3793 8.2001 85.0337 244
        dialog =
        {
            NAME      = true,
            DEFAULT   = { "*kweh*" },
            START     =
            {
                "*kweh*",
                { delay = 1000 },
                " Please.. *kweh*",
                { delay = 1000 },
                string.format("Please.. bring me a %s.", info.required.name),
            },
            REMINDER  = { string.format("Please.. bring me a %s.", info.required.name) },
            DELIVERED =
            {
                "*kweh*",
                { delay = 1000 },
                " Thanks! .. *kweh*",
                { delay = 1000 },
                "Talk.. *kweh* to Peep.",
            },
            REMINDER2 = { "Talk.. *kweh* to Peep." },
        },
    },
    {
        id     = PEEP,
        name   = "Peep",
        type   = xi.objType.NPC,
        look   = 3031,
        area   = "Upper_Jeuno",
        pos    = { -59.5849, 8.2000, 85.2577, 225 }, -- !pos -59.5849 8.2000 85.2577 244
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "*kweh*" },
            START    =
            {
                "*kweh*",
                { delay = 1000 },
                " Children.. *kweh*",
                { delay = 1000 },
                "Children.. trapped!",
                { delay = 1000 },
                " *kweh*",
                { delay = 1000 },
                "Jugner.. Forest.. *kweh* lake.",
            },
            REMINDER = { "Jugner.. Forest.. *kweh* lake." },
            FINISH   =
            {
                "*kweh* *kweh*",
                { delay = 1000 },
                " Thank.. you!",
                { delay = 1000 },
                "Please.. *kweh* take this!",
            },
            AFTER  = { "*kweh* Savior!" },
        },
    },
    {
        id     = KIP,
        name   = "Kip",
        type   = xi.objType.NPC,
        look   = 3031,
        area   = "Jugner_Forest",
        pos    = { -152.8696, 1.0077, 388.5037, 48 }, -- !pos -152.8696 1.0077 388.5037 104
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "*kweh*" },
            HELP     = { "Halp! *kweh*" },
            SPAWN    = { "Don't let it.. *kweh* eat us!" },
            FINISH   =
            {
                "*kweh* *kweh*",
                { delay = 1000 },
                " You saved.. *kweh* us!",
                { delay = 1000 },
                "Tell Peep.. *kweh* we're safe!",
            },
            REMINDER = { "Tell Peep.. *kweh* we're safe!" },
        },
    },
    {
        id     = YIP,
        name   = "Yip",
        type   = xi.objType.NPC,
        look   = 3031,
        area   = "Jugner_Forest",
        pos    = { -155.1023, 0.8418, 391.4258, 41 }, -- !pos -155.1023 0.8418 391.4258 104
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "*kweh*" },
            START    = { "Halp.. *kweh* us!" },
            AFTER   =
            {
                "*kweh*",
                { delay = 1000 },
                " Thanks! *kweh*",
            },
        },
    },
    {
        id          = CHOCOEATER,
        name        = "Chocobo Eater",
        type        = xi.objType.MOB,
        groupId     = 49,
        groupZoneId = 193,
        area        = "Jugner_Forest",
        pos         = { -145.0016, 0.1175, 377.6899, 136 }, -- !pos -145.0016 0.1175 377.6899 104
        level       = 30,
    },
}

local step =
{
    {
        [SAKURA] = cq.talkStep("START", info.name),
    },
    {
        [SAKURA] =
        {
            onTrigger = cq.talkOnly("REMINDER"),
            onTrade   = cq.tradeStep("DELIVERED", "REMINDER", info.required.item),
        }
    },
    {
        [SAKURA] = cq.talkOnly("REMINDER2"),
        [PEEP]   = cq.talkStep("START"),
    },
    {
        [PEEP] = cq.talkOnly("REMINDER"),
        [YIP]  = cq.talkOnly("START"),
        [KIP]  = cq.talkStep("HELP"),
    },
    {
        [KIP]  = cq.menuSpawn(CHOCOEATER, "Help the chicks?", { { "Not yet." }, { "I'm ready.", "SPAWN" } }, 2, false),
        [CHOCOEATER] = cq.killStep(),
    },
    {
        [YIP]  = cq.talkOnly("AFTER"),
        [KIP]  = cq.talkStep("FINISH"),
    },
    {
        [KIP] = cq.talkOnly("REMINDER"),
        [PEEP] = cq.giveStep("FINISH", info.reward, info.name, cq.music.JEUNO),
    },
    {
        [PEEP] = cq.talkOnly("AFTER"),
    }
}

cq.add(m, {
    info   = info,
    entity = entity,
    step   = step,
})

return m
