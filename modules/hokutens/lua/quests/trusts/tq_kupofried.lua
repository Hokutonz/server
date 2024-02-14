-------------------------------------------------------
-- Quest for Trust: Kupofried
-------------------------------------------------------
-- Steps
-------------------------------------------------------
-- !setvar [TQ]KUPOFRIED 0
-- Kupdi Koop     !pos -30.0313 -1.5000 3.4004 244
-- Kupqu Kogi     !pos 126.9526 -0.2006 70.5492 230
-- Kupta Kapa     !pos -400.1685 -8.9601 -427.6339 100
-- Pukla Puki     !pos 18.4967 -4.2500 51.8218 241
-- Puksi Piko     !pos -254.7187 -3.1209 -247.9654 145
-- Kipli Kipp     !pos -8.8077, 0.0000, -68.7734 234
-- Kupofried      !pos -337.2846 -8.3356 151.2480 173
-- Death Eater    !pos -340.7982 -5.4325 164.7233 173
-- Unlocks: Trust: Kupofried
-------------------------------------------------------

require("modules/module_utils")
require('scripts/globals/utils')
require('scripts/globals/player')
require('scripts/globals/npc_util')
local cq  = require("modules/hokutens/lua/system/utils/custom_quest")
local cu  = require("modules/hokutens/lua/system/utils/custom_util")
local cid = require("modules/hokutens/lua/system/utils/custom_id")
-------------------------------------------------------
local m = Module:new("tq_kupofried")

local info =
{
    name   = "Wealth of Experience",
    author = "Tonzoffun",
    var    = "[TQ]KUPOFRIED",
    required1 =
    {
        item = { { 4401, 1 } },
        name = "moat carp",
    },
    required2 =
    {
        item = { { 498, 1 } },
        name = "yagudo necklace",
    },
    reward =
    {
        gil   = 2000,
        after = function(player)
            player:addSpell(xi.magic.spell.KUPOFRIED, true, true)
            player:printToPlayer("You learned Trust: Kupofried.", xi.msg.channel.SYSTEM_3)
            return true
        end,
    },
}

local KUPDI  = "KUPDI"
local KUPQU  = "KUPQU"
local PUKLA  = "PUKLA"
local KIPLI  = "KIPLI"
local KUPTA  = "KUPTA"
local PUKSI  = "PUKSI"
local KUPO   = "KUPO"
local BOGY   = "BOGY"

local entity =
{
    {
        id     = KUPDI,
        name   = "Kupdi Koop",
        type   = xi.objType.NPC,
        look   = 82,
        area   = "Upper_Jeuno",
        pos    = { -30.0313, -1.5000, 3.4004, 204 }, -- !pos -30.0313 -1.5000 3.4004 244
        dialog =
        {
            NAME      = true,
            DEFAULT   = { "... kupo?" },
            START     =
            {
                "You there! Have you seen Kupofried anywhere?",
                { delay = 1000 },
                " Last I saw him, he was talking with Kupqu in Southern San d'Oria.",
                { delay = 1000 },
                "Maybe he'll know where to find him!",
            },
            REMINDERKUPQU  = { "Go find Kupqu in Southern San d'Oria and see if he knows where Kupofried is." },
            NOKUPQU =
            {
                "Hmmm.. Kupqu didn't know where he was, huh?",
                { delay = 1000 },
                " Well that strange.. maybe try Pukla in Windurst Woods? He's Kupofried's best friend.",
            },
            REMINDERPUKLA = { "Try Pukla in Windurst Woods." },
            NOPUKLA =
            {
                "What!? Not even Pukla knows where he is??",
                { delay = 1000 },
                " This is very concerning! Where could he possibly be?",
                { delay = 5000 },
                "I guess the only person left to check is Kipli.",
                { delay = 1000 },
                " She is usually hanging around in Bastok Mines trying to buy ore.",
            },
            REMINDERKIPLI = { "Check with Kipli in Bastok Mines." },
            FINISH    =
            {
                "Oh thank god you finally found him!",
                { delay = 1000 },
                " Of course he found trouble, I should have known.",
                { delay = 2000 },
                "Well I guess I should reward you for all that trouble..",
                { delay = 1000 },
                " Take this so you'll never again have to go looking for him again!",
            },
            AFTER     = { "Thanks again for all your help!" },
        },
    },
    {
        id     = KUPQU,
        name   = "Kupqu Kogi",
        type   = xi.objType.NPC,
        look   = 981,
        area   = "Southern_San_dOria",
        pos    = { 126.9526, -0.2006, 70.5492, 193 }, -- !pos 126.9526 -0.2006 70.5492 230
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Hmmm, where did he go." },
            START    =
            {
                "What's that? Kupofried has gone missing again?",
                { delay = 1000 },
                " Why am I not surprised..",
                { delay = 2000 },
                "I haven't seen him since yesterday, sorry.",
                { delay = 1000 },
                " Have you checked by the lake in West Ronfaure?",
                { delay = 2000 },
                "Sometimes he and Kupta go fishing down there.",
            },
            REMINDER1 = { "Check with Kupta by the lake in West Ronfaure." },
            FINISH   =
            {
                "Kupta hasn't seen him either, eh?",
                { delay = 1000 },
                " Well tell Kupdi if you guys do find him, I'm looking for him as well.",
            },
            REMINDER2 = { "Tell Kupdi I'm looking for him as well." },
        },
    },
    {
        id     = KUPTA,
        name   = "Kupta Kapa",
        type   = xi.objType.NPC,
        look   = 2401,
        area   = "West_Ronfaure",
        pos    = { -400.1685, -8.9601, -427.6339, 189 }, -- !pos -400.1685 -8.9601 -427.6339 100
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Don't scare the fish away!" },
            START    =
            {
                string.format("Shhh.. unless you have a %s, then shove off and don't scare the fish!", info.required1.name),
            },
            REMINDER1 = { string.format("Shhh.. unless you have a %s, then shove off and don't scare the fish!", info.required1.name) },
            FINISH   =
            {
                "Thanks mate! You're looking for Kupofried, eh?",
                { delay = 1000 },
                " I'd love to help, but I haven't seen him, sorry.",
                { delay = 2000 },
                "Tell Kupqu hello for me when you see him again.",
            },
            REMINDER2 = { "Tell Kupqu hello for me when you see him again." },
        },
    },
    {
        id     = PUKLA,
        name   = "Pukla Puki",
        type   = xi.objType.NPC,
        look   = 2364,
        area   = "Windurst_Woods",
        pos    = { 18.4967, -4.2500, 51.8218, 128 }, -- !pos 18.4967 -4.2500 51.8218 241
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Sup?" },
            START    =
            {
                "Yoo! Haha, good ol' Kupofried's MIA again?",
                { delay = 1000 },
                " That sounds like him.",
                { delay = 2000 },
                "He's probably chillin' with Puksi.",
                { delay = 3000 },
                "They're probably by that spring in Giddeus.",
                { delay = 1000 },
                " I wish I could join them, it's a great spot to smoke.",
            },
            REMINDER1 = { "He's probably with Puksi by that spring in Giddeus." },
            FINISH   =
            {
                "No luck from Puksi? That is strange..",
                { delay = 1000 },
                " Tell Kupdi he's probably just off finding some dank herb.",
            },
            REMINDER2 = { "Tell Kupdi he's probably just off finding some dank herb." },
        },
    },
    {
        id     = PUKSI,
        name   = "Puksi Piko",
        type   = xi.objType.NPC,
        look   = 2405,
        area   = "Giddeus",
        pos    = { -254.7187, -3.1209, -247.9654, 129 }, -- !pos -254.7187 -3.1209 -247.9654 145
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Huh? Nothing's going on here." },
            START    =
            {
                string.format("You startled me! I dropped my %s, could you find one for me?", info.required2.name),
            },
            REMINDER1 = { string.format("I dropped my %s, could you find one for me?", info.required2.name) },
            FINISH   =
            {
                "Phew! My wife would kill me if I lost that!",
                { delay = 2000 },
                " Sorry you made the trip out here for nothing, but I haven't seen Kupofried my friend.",
                { delay = 3000 },
                "Could you tell Pukla that I found an excellent recipe for his Honey?",
            },
            REMINDER2 = { "Tell Pukla that I found an excellent recipe for his Honey." },
        },
    },
    {
        id     = KIPLI,
        name   = "Kipli Kipp",
        type   = xi.objType.NPC,
        look   = 2406,
        area   = "Bastok_Mines",
        pos    = { -8.8077, 0.0000, -68.7734, 68 }, -- !pos -8.8077, 0.0000, -68.7734 234
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Hey!! I'm always in the market for fancy ores!" },
            START    =
            {
                "Hey there! Could you please help me??",
                { delay = 2000 },
                "My friend Kupofried got attacked!!",
                { delay = 1000 },
                " Please go help him in Korroloka Tunnel!!",
            },
            REMINDER1 = { "Please go help Kupofried in Korroloka Tunnel!!" },
            FINISH   =
            {
                "Thank god he's okay!! Phew, you really saved the day!",
                { delay = 1000 },
                " Let Kupdi know he's okay now.",
            },
            REMINDER2 = { "Let Kupdi know he's okay now." },
        },
    },
    {
        id     = KUPO,
        name   = "Kupofried",
        type   = xi.objType.NPC,
        look   = 3093,
        area   = "Korroloka_Tunnel",
        pos    = { -337.2846, -8.3356, 151.2480, 137 }, -- !pos -337.2846 -8.3356 151.2480 173
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "I knew I shouldn't have gone this far in the tunnel." },
            HELP     = { "Help me please!" },
            SPAWN    = { "Kill it dead!!" },
            FINISH   =
            {
                "Thanks so much! I thought I was a goner there for a minute!",
                { delay = 1000 },
                " Oh, Kipli sent you!? What would I do without her?",
                { delay = 3000 },
                "Please let her know I'm okay now.",
            },
            REMINDER = { "Please let Kipli know I'm okay now." },
        },
    },
    {
        id          = BOGY,
        name        = "Death Eater",
        type        = xi.objType.MOB,
        groupId     = 20,
        groupZoneId = 173,
        area        = "Korroloka_Tunnel",
        pos         = { -340.7982, -5.4325, 164.7233, 59 }, -- !pos -340.7982 -5.4325 164.7233 173
        level       = 40,
    },
}

local step =
{
    {
        [KUPDI] = cq.talkStep("START", info.name),
    },
    {
        [KUPDI] = cq.talkOnly("REMINDERKUPQU"),
        [KUPQU] = cq.talkStep("START"),
    },
    {
        [KUPQU] = cq.talkOnly("REMINDER1"),
        [KUPTA] = cq.talkStep("START"),
    },
    {
        [KUPTA] =
        {
            onTrigger = cq.talkOnly("REMINDER1"),
            onTrade   = cq.tradeStep("FINISH", "REMINDER1", info.required1.item),
        }
    },
    {
        [KUPTA] = cq.talkOnly("REMINDER2"),
        [KUPQU] = cq.talkStep("FINISH"),
    },
    {
        [KUPQU] = cq.talkOnly("REMINDER2"),
        [KUPDI] = cq.talkStep("NOKUPQU"),
    },
    {
        [KUPDI] = cq.talkOnly("REMINDERPUKLA"),
        [PUKLA] = cq.talkStep("START"),
    },
    {
        [PUKLA] = cq.talkOnly("REMINDER1"),
        [PUKSI] = cq.talkStep("START"),
    },
    {
        [PUKSI] =
        {
            onTrigger = cq.talkOnly("REMINDER1"),
            onTrade   = cq.tradeStep("FINISH", "REMINDER1", info.required2.item),
        }
    },
    {
        [PUKSI] = cq.talkOnly("REMINDER2"),
        [PUKLA] = cq.talkStep("FINISH"),
    },
    {
        [PUKLA] = cq.talkOnly("REMINDER2"),
        [KUPDI] = cq.talkStep("NOPUKLA"),
    },
    {
        [KUPDI] = cq.talkOnly("REMINDERKIPLI"),
        [KIPLI] = cq.talkStep("START"),
    },
    {
        [KIPLI] = cq.talkOnly("REMINDER1"),
        [KUPO]  = cq.talkStep("HELP"),
    },
    {
        [KUPO] = cq.menuSpawn(BOGY, "Help Kupofried?", { { "Not yet." }, { "I'm ready.", "SPAWN" } }, 2, false),
        [BOGY] = cq.killStep(),
    },
    {
        [KUPO] = cq.talkStep("FINISH"),
    },
    {
        [KUPO]  = cq.talkOnly("REMINDER"),
        [KIPLI] = cq.talkStep("FINISH"),
    },
    {
        [KIPLI] = cq.talkOnly("REMINDER2"),
        [KUPDI] = cq.giveStep("FINISH", info.reward, info.name, cq.music.JEUNO),
    },
    {
        [KUPDI] = cq.talkOnly("AFTER"),
    }
}

cq.add(m, {
    info   = info,
    entity = entity,
    step   = step,
})

return m
