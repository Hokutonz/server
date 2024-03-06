-------------------------------------------------------
-- Quest for Trust: Koru-Moru
-------------------------------------------------------
-- Steps
-------------------------------------------------------
-- !setvar [TQ]KORUMORU 0
-- Koru-Moru        !pos 38.4248 9.0000 -30.9715 243
-- F. Mage Tracks   !pos 38.4248 9.0000 -30.9715 243
-- Fallen Mage      !pos 208.2955 -19.7864 81.8708 127
-- Unlocks: Trust: Koru-Moru
-------------------------------------------------------

require("modules/module_utils")
require('scripts/globals/utils')
require('scripts/globals/player')
require('scripts/globals/npc_util')
local cq  = require("modules/hokutens/lua/system/utils/custom_quest")
local cu  = require("modules/hokutens/lua/system/utils/custom_util")
local cid = require("modules/hokutens/lua/system/utils/custom_id")
-------------------------------------------------------
local m = Module:new("tq_korumoru")

local info =
{
    name   = "Crimson Taru",
    author = "Tonzoffun",
    var    = "[TQ]KORUMORU",
    required1 =
    {
        item = { { 4681, 1 } },
        name = "scroll of Barpoison",
    },
    required2 =
    {
        item = { { 4708, 1 } },
        name = "scroll of Enfire",
    },
    required3 =
    {
        item = { { 4868, 1 } },
        name = "scroll of Dispel",
    },
    required4 =
    {
        item = { { 4717, 1 } },
        name = "scroll of Refresh",
    },
    reward =
    {
        gil   = 2000,
        after = function(player)
            player:addSpell(xi.magic.spell.KORU_MORU, true, true)
            player:printToPlayer("You learned Trust: Koru-Moru.", xi.msg.channel.SYSTEM_3)
            return true
        end,
    },
}

local KORUMORU     = "Koru-Moru"
local TRACKS       = "TRACKS"
local FALLENMAGE   = "FALLENMAGE"

local entity =
{
    {
        id     = KORUMORU,
        name   = "Koru-Moru",
        type   = xi.objType.NPC,
        look   = '0x01000a0513101720173017400b50006000701180',
        area   = "RuLude_Gardens",
        pos    = { 38.4248, 9.0000, -30.9715, 130 }, -- !pos 38.4248 9.0000 -30.9715 243
        dialog =
        {
            NAME      = true,
            DEFAULT   = { "I'm here on official business." },
            START     =
            {
                "Hmmm.. you wish to enlist my services?",
                { delay = 1000 },
                " We will see how familiar you are with my craft first.",
                { delay = 1000 },
                string.format("First, bring me a %s.", info.required1.name),
            },
            REMINDER1  = { string.format("Bring me a %s.", info.required1.name) },
            DELIVERED1 =
            {
                "So you are at least slightly familiar with my magic.",
                { delay = 1000 },
                " That's good.. we'll see how much you know.",
                { delay = 1000 },
                string.format("Next, bring me a %s.", info.required2.name),
            },
            REMINDER2  = { string.format("Bring me a %s.", info.required2.name) },
            DELIVERED2 =
            {
                "Interesting.. maybe someone did give you some hints.",
                { delay = 1000 },
                " This next one should stump you!",
                { delay = 1000 },
                string.format("Next, bring me a %s.", info.required3.name),
            },
            REMINDER3  = { string.format("Bring me a %s.", info.required3.name) },
            DELIVERED3 =
            {
                "I see... maybe I underestimated you.",
                { delay = 1000 },
                " To prove to me you really know my magic, I require one more test.",
                { delay = 1000 },
                string.format("Lastly, bring me a %s.", info.required4.name),
            },
            REMINDER4  = { string.format("Bring me a %s.", info.required4.name) },
            DELIVERED4 =
            {
                "!?",
                { delay = 1000 },
                " Well I'm speechless, you really do know your Red Mage magic..",
                { delay = 2000 },
                "Knowing it is only half the battle though, you must prove you can defeat it!",
                { delay = 1000 },
                " Find and kill a Fallen Mage and I'll join your crusade.",
                { delay = 2000 },
                "They're usually roaming around in Behemoth's Dominion, their tracks aren't hard to find.",
            },
            REMINDER5  = { "Find and kill a Fallen Mage at Behemoth's Dominion, their tracks aren't hard to find." },
            FINISH   =
            {
                "Well you can walk the walk!",
                { delay = 1000 },
                " You have proven yourself worthy of my help.",
                { delay = 1000 },
                "You have earned this.",
            },
            AFTER  = { "I'm here on official business." },
        },
    },
    {
        id     = TRACKS,
        name   = "F. Mage Tracks",
        type   = xi.objType.NPC,
        look   = '0x0000340000000000000000000000000000000000',
        area   = "Behemoths_Dominion",
        pos    = { -199.5599, -20.1358, 86.6927 }, -- !pos -199.5599 -20.1358 86.6927 127
        dialog =
        {
            DEFAULT  = { "There is nothing out of the ordinary here." },
            START     =
            {
                { animation = 48, target = "player", duration = 3000 }, -- Crouch down
                { emotion = "examines the tracks left in the snow." },
            },
            FINISH     =
            {
                { animation = 48, target = "player", duration = 3000 }, -- Crouch down
                { emotion = "watches the tracks fade away." },
            },
        },
    },
    {
        id          = FALLENMAGE,
        name        = "Fallen Mage",
        type        = xi.objType.MOB,
        groupId     = 39,
        groupZoneId = 28,
        area        = "Behemoths_Dominion",
        pos         = { -208.2955, -19.7864, 81.8708, 231 }, -- !pos 208.2955 -19.7864 81.8708 127
        level       = 60,
    },
}

local step =
{
    {
        [KORUMORU] = cq.talkStep("START", info.name),
    },
    {
        [KORUMORU] =
        {
            onTrigger = cq.talkOnly("REMINDER1"),
            onTrade   = cq.tradeStep("DELIVERED1", "REMINDER1", info.required1.item),
        }
    },
    {
        [KORUMORU] =
        {
            onTrigger = cq.talkOnly("REMINDER2"),
            onTrade   = cq.tradeStep("DELIVERED2", "REMINDER2", info.required2.item),
        }
    },
    {
        [KORUMORU] =
        {
            onTrigger = cq.talkOnly("REMINDER3"),
            onTrade   = cq.tradeStep("DELIVERED3", "REMINDER3", info.required3.item),
        }
    },
    {
        [KORUMORU] =
        {
            onTrigger = cq.talkOnly("REMINDER4"),
            onTrade   = cq.tradeStep("DELIVERED4", "REMINDER4", info.required4.item),
        }
    },
    {
        [KORUMORU] = cq.talkOnly("REMINDER5"),
        [TRACKS]   = cq.talkStep("START"),
    },
    {
        [TRACKS]     = cq.menuSpawn(FALLENMAGE, "Follow the tracks?", { { "Not yet." }, { "I'm ready." } }, 2, false),
        [FALLENMAGE] = cq.killStep(),
    },
    {
        [TRACKS]   = cq.talkOnly("FINISH"),
        [KORUMORU] = cq.giveStep("FINISH", info.reward, info.name, cq.music.JEUNO),
    },
    {
        [KORUMORU]   = cq.talkOnly("AFTER"),
    },
}

cq.add(m, {
    info   = info,
    entity = entity,
    step   = step,
})

return m
