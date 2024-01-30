-------------------------------------------------------
-- Valentine's Day Trust Holiday Event
-------------------------------------------------------
-- Steps
-------------------------------------------------------
-- !setvar [HD]VALENTINES 0
-- Mumor        !pos -13.1705, -0.0092, 10.1813 281
-- Ryan         !pos 85.2728 1.0000 116.2715 230
-- Joey         !pos -57.3628 -3.5000 24.1878 238
-- Mike         !pos -203.9843 -6.8224 -59.2930 235
-- Addison      !pos 8.4781 0.5000 1.4577 242
-- Sebastian    !pos -20.5640 -0.1000 -58.9475 245
-- !setvar [HD]VALENTINES 18
-------------------------------------------------------

require("modules/module_utils")
require('scripts/globals/utils')
require('scripts/globals/player')
require('scripts/globals/npc_util')
local cq  = require("modules/hokutens/lua/system/utils/custom_quest")
local cu  = require("modules/hokutens/lua/system/utils/custom_util")
local cid = require("modules/hokutens/lua/system/utils/custom_id")
-------------------------------------------------------
local m = Module:new("valentines_day_trust")

local info =
{
    name   = "Be My Valentine",
    author = "Tonzoffun",
    var    = "[HD]VALENTINES",
    chocolate =
    {
        item = { { 5230, 1 } }, -- Love Chocolate
    },
    required  =
    {
        item = { { 5230, 1 } },
        name = "love chocolate",
    },
    reward =
    {
        item  = 5681, -- Cupid Chocolate
        after = function(player)
            player:addSpell(xi.magic.spell.MUMOR_II, true, true)
            player:printToPlayer("You learned Trust: Mumor II.", xi.msg.channel.SYSTEM_3)
            return true
        end,
    },
}

local MUMOR     = "MUMOR"
local RYAN      = "RYAN"
local JOEY      = "JOEY"
local MIKE      = "MIKE"
local ADDISON   = "ADDISON"
local SEBASTIAN = "SEBASTIAN"

local entity =
{
    {
        id     = MUMOR,
        name   = "Mumor",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.HUME_F,
            face = cid.face.A8,
            head = cid.model.STARLET,
            body = cid.model.STARLET,
            hand = cid.model.STARLET,
            legs = cid.model.STARLET,
            feet = cid.model.STARLET,
            main = 373,
            offh = 373,
        }),
        area   = "Leafallia",
        pos    = { -13.1705, -0.0092, 10.1813, 17 }, -- !pos -13.1705, -0.0092, 10.1813 281
        dialog =
        {
            NAME      = true,
            DEFAULT   = { "Will you be my valentine?" },
            START     =
            {
                "Hey cutie! Do you have a second?",
                { delay = 1000 },
                " It's almost Valentine's Day and I need some help delivering my Valentine's Day gifts!",
                { delay = 1000 },
                "If you help me out, I'll make it worth your while!",
                { emote = xi.emote.GRIN },
            },
            ACCEPTED =
            {
                "Great!! I knew I could count on you. I'm wrapping my gifts now!",
                { emote = xi.emote.CHEER },
                { delay = 2000 },
                " Please come talk to me when you're ready to start!",
            },
            TORYAN =
            {
                "Please take these chocolates and deliver them to my suitors.",
                { delay = 3000 },
                " First up is my lovely Ryan, you can always find him in Lion Springs Tavern.",
            },
            REMINDERRYAN = { "Please deliver a chocolate to Ryan at the Lion Springs Tavern." },
            TOJOEY =
            {
                "Isn't Ryan just delicious!? I can't wait to see him later tonight.",
                { delay = 1000 },
                " When I think about what he's going to do to me.. I just...... oh sorry!! Where were we?",
                { emote = xi.emote.STAGGER },
                { delay = 3000 },
                "Next up is my bashful prince, Joey. He's so romantic and always writes me poems and beautiful songs.",
                { delay = 1000 },
                " He said he'll be waiting for me at Timbre Timbers Tavern.",
            },
            REMINDERJOEY = { "Please deliver a chocolate to Joey at the Timbre Timbers Tavern." },
            TOMIKE =
            {
                "Wasn't Joey just so dreamy..",
                { delay = 1000 },
                " I still keep every letter I get from him.. I hope my other suitors don't find them.. hehe!",
                { emote = xi.emote.LAUGH },
                { delay = 3000 },
                "Now for my boy toy, Mike! I don't always let him play, but he's always good for a fun time.",
                { delay = 1000 },
                " He claims he was picking up something nice for me at the Goldsmith's Guild today. I wonder what it is!",
            },
            REMINDERMIKE = { "Please deliver a chocolate to Mike at the Goldsmith's Guild." },
            TOADDI =
            {
                "Did you see what he got me?!?! I can't wait to find out!",
                { delay = 1000 },
                " Next up is Addison. What?? You didn't think it'd only be boys, did you? Hehe.",
                { emote = xi.emote.BLUSH },
                { delay = 2000 },
                "She's waiting for me in Heavens Tower, I hope she doesn't get started without me!",
            },
            REMINDERADDI = { "Please deliver a chocolate to Addison at Heavens Tower." },
            TOSEB =
            {
                "Be honest! Who do you think is prettier??",
                { delay = 1000 },
                " On second thought, don't answer that! I can't afford to be disappointed today!",
                { emote = xi.emote.PANIC },
                { delay = 3000 },
                "Finally, my last chocolate goes to my favorite lover, my big boy Sebastian!",
                { delay = 1000 },
                " He always fills me with so much.... joy. He'll be at the Merry Minstrel Meadhouse getting toasty!",
            },
            REMINDERSEB = { "Please deliver a chocolate to Sebastion at the Merry Minstrel Meadhouse." },
            FINISH    =
            {
                "Don't you see why I end the night with Sebastian?",
                { delay = 1000 },
                " If I started with him, well... the others might notice.",
                { emote = xi.emote.SMILE },
                { delay = 3000 },
                "Thanks again for helping me out!! Now just remember one thing.",
                { delay = 1000 },
                " If anyone asks, I only had one valentine! Hehehehehe...",
            },
            AFTER     = { "Will you be my valentine?" },
        },
    },
    {
        id     = RYAN,
        name   = "Ryan",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.HUME_M,
            face = cid.face.B4,
            head = cid.model.NO_LIMBS,
            body = cid.model.BENEDIGHT,
            hand = cid.model.NO_LIMBS,
            legs = cid.model.BENEDIGHT,
            feet = cid.model.NO_LIMBS,
        }),
        area   = "Southern_San_dOria",
        pos    = { 85.2728, 1.0000, 116.2715, 255 }, -- !pos 85.2728 1.0000 116.2715 230
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "I'm waiting on my valentine." },
            START    =
            {
                "Mumor sent you?! What present did she send you with?",
                { emote = xi.emote.HURRAY },
            },
            REQUEST = { "Please hand over her present." },
            FINISH = {
                string.format("Wow!! A %s from my love, Mumor..", info.required.name),
                { delay = 1000 },
                " I could die tomorrow a happy man knowing she's thinking of me today.",
                { emote = xi.emote.PSYCH },
                { delay = 3000 },
                "Please tell her I will be waiting right here for her tonight.",
            },
            REMINDER = { "Please tell Mumor I will be waiting right here for her tonight." },
        },
    },
    {
        id     = JOEY,
        name   = "Joey",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.ELVAAN_M,
            face = cid.face.A6,
            head = cid.model.DECENNIAL,
            body = cid.model.DECENNIAL,
            hand = cid.model.NO_LIMBS,
            legs = cid.model.DECENNIAL,
            feet = cid.model.NO_LIMBS,
        }),
        area   = "Windurst_Waters",
        pos    = { -57.3628, -3.5000, 24.1878, 228 }, -- !pos -57.3628 -3.5000 24.1878 238
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Have you seen my valentine?" },
            START    =
            {
                "You've seen my darling Mumor? Is she as lovely as I remember?",
                { emote = xi.emote.SMILE },
                { delay = 2000 },
                " Did she send you with a present?",
            },
            REQUEST = { "Please give me her present." },
            FINISH = {
                string.format("I can't believe I got a %s from Mumor! She must really like me!!", info.required.name),
                { emote = xi.emote.HURRAY },
                { delay = 3000 },
                "Please tell her I won't move from this spot until I see her.",
            },
            REMINDER = { "Please tell Mumor I won't move from this spot until I see her." },
        },
    },
    {
        id     = MIKE,
        name   = "Mike",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.TARU_M,
            face = cid.face.A8,
            head = cid.model.AGENT,
            body = cid.model.AGENT,
            hand = cid.model.AGENT,
            legs = cid.model.AGENT,
            feet = cid.model.AGENT,
        }),
        area   = "Bastok_Markets",
        pos    = { -203.9843, -6.8224, -59.2930, 198 }, -- !pos -203.9843 -6.8224 -59.2930 235
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Hmmm.. what to buy......" },
            START    =
            {
                "What?!?! Mumor is willing to see me tonight!",
                { emote = xi.emote.DANCE },
                " And she sent me a chocolate, please give it to me!"
            },
            REQUEST = { "Please give the chocolate to me." },
            FINISH = {
                "I'm so lucky! I can't wait to climb... I mean... see her.",
                { emote = xi.emote.CLAP },
                { delay = 3000 },
                "Please let her know I will wait here forever if I need to.",
            },
            REMINDER = { "Please let Mumor know I will wait here forever if I need to." },
        },
    },
    {
        id     = ADDISON,
        name   = "Addison",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.HUME_F,
            face = cid.face.B4,
            head = cid.model.OPALINE_DRESS,
            body = cid.model.OPALINE_DRESS,
            hand = cid.model.OPALINE_DRESS,
            legs = cid.model.OPALINE_DRESS,
            feet = cid.model.OPALINE_DRESS,
        }),
        area   = "Heavens_Tower",
        pos    = { 8.4781, 0.5000, 1.4577, 112 }, -- !pos 8.4781 0.5000 1.4577 242
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Tonight will be perfect." },
            START    =
            {
                "What's this? You've brought me a gift from Mumor?",
                { emote = xi.emote.SHOCKED },
                { delay = 1000 },
                "You must let me have it right away!",
            },
            REQUEST = { "Please let me have the gift right away." },
            FINISH = {
                string.format("She's so sweet!! A %s was our special way of saying \"I'm thinking about you\".", info.required.name),
                { delay = 1000 },
                " I just know that I'll melt in her arms next time she's here.",
                { emote = xi.emote.STAGGER },
                { delay = 3000 },
                "Please tell her I will be right here, waiting for her kiss.",
            },
            REMINDER = { "Please tell Mumor I will be right here, waiting for her kiss." },
        },
    },
    {
        id     = SEBASTIAN,
        name   = "Sebastian",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.GALKA,
            face = cid.face.A7,
            head = cid.model.NO_LIMBS,
            body = cid.model.SWIMSUIT,
            hand = cid.model.NO_LIMBS,
            legs = cid.model.SWIMSUIT,
            feet = cid.model.NO_LIMBS,
        }),
        area   = "Lower_Jeuno",
        pos    = { -20.5640, -0.1000, -58.9475, 150 }, -- !pos -20.5640 -0.1000 -58.9475 245
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "You buy the next round!" },
            START    =
            {
                "MUMOR!? Mmmmmmmm.. *hiccup*..",
                { emote = xi.emote.STAGGER },
                { delay = 3000 },
                " Give.. CHOCOLATE!!",
            },
            REQUEST = { "GIVE!! CHOCO.. *hiccup*.. LATE!!" },
            FINISH = {
                string.format("Yummy!! %s *hiccup*, MUMOR!!", info.required.name),
                { emote = xi.emote.STAGGER },
                { delay = 3000 },
                " ME.. WANT.. MUMOR!!!",
                { delay = 3000 },
                "GO.. *hiccup* GET.. MUMOR... NOW!",
            },
            REMINDER = { "GO.. *hiccup* GET.. MUMOR... NOW!" },
        },
    },
}

local step =
{
    {
        [MUMOR] = cq.talkStep("START"),
    },
    {
        [MUMOR] = cq.menuStep("Want to help me?", { { "Yes", "ACCEPTED" }, { "No" } }, 1, info.name ),
    },
    {
        [MUMOR] = cq.giveStep("TORYAN", info.chocolate),
    },
    {
        [MUMOR] = cq.talkOnly("REMINDERRYAN"),
        [RYAN]  = cq.talkStep("START"),
    },
    {
        [RYAN] =
        {
            onTrigger = cq.talkOnly("REQUEST"),
            onTrade   = cq.tradeStep("FINISH", "REQUEST", info.required.item),
        }
    },
    {
        [RYAN]  = cq.talkOnly("REMINDER"),
        [MUMOR] = cq.giveStep("TOJOEY", info.chocolate),
    },
    {
        [MUMOR] = cq.talkOnly("REMINDERJOEY"),
        [JOEY]  = cq.talkStep("START"),
    },
    {
        [JOEY] =
        {
            onTrigger = cq.talkOnly("REQUEST"),
            onTrade   = cq.tradeStep("FINISH", "REQUEST", info.required.item),
        }
    },
    {
        [JOEY]  = cq.talkOnly("REMINDER"),
        [MUMOR] = cq.giveStep("TOMIKE", info.chocolate),
    },
    {
        [MUMOR] = cq.talkOnly("REMINDERMIKE"),
        [MIKE]  = cq.talkStep("START"),
    },
    {
        [MIKE] =
        {
            onTrigger = cq.talkOnly("REQUEST"),
            onTrade   = cq.tradeStep("FINISH", "REQUEST", info.required.item),
        }
    },
    {
        [MIKE]  = cq.talkOnly("REMINDER"),
        [MUMOR] = cq.giveStep("TOADDI", info.chocolate),
    },
    {
        [MUMOR]   = cq.talkOnly("REMINDERADDI"),
        [ADDISON] = cq.talkStep("START"),
    },
    {
        [ADDISON] =
        {
            onTrigger = cq.talkOnly("REQUEST"),
            onTrade   = cq.tradeStep("FINISH", "REQUEST", info.required.item),
        }
    },
    {
        [ADDISON] = cq.talkOnly("REMINDER"),
        [MUMOR]   = cq.giveStep("TOSEB", info.chocolate),
    },
    {
        [MUMOR]     = cq.talkOnly("REMINDERSEB"),
        [SEBASTIAN] = cq.talkStep("START"),
    },
    {
        [SEBASTIAN] =
        {
            onTrigger = cq.talkOnly("REQUEST"),
            onTrade   = cq.tradeStep("FINISH", "REQUEST", info.required.item),
        }
    },
    {
        [SEBASTIAN] = cq.talkOnly("REMINDER"),
        [MUMOR]     = cq.giveStep("FINISH", info.reward, info.name, cq.music.LEAFALLIA),
    },
    {
        [MUMOR] = cq.talkOnly("AFTER"),
    }
}

cq.add(m, {
    info   = info,
    entity = entity,
    step   = step,
})

return m
