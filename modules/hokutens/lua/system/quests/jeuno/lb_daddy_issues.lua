-------------------------------------------------------
-- Daddy Issues (Lv66)
-------------------------------------------------------
-- Steps
-------------------------------------------------------
-- !setvar [LB]DADDY_ISSUES 0
-- Brittany      !pos -56.8856 0.0001 99.0318 244
-- Mindy         !pos 480.5514 0.1380 -153.2160 82
-- Daddy         !pos 466.2906 -0.9709 -149.1866 82
-- Brittany      !pos -56.8856 0.0001 99.0318 244
-- Unlocks: Lv71-75 (DNC LB5)
-------------------------------------------------------
-- !setvar [LB]DADDY_ISSUES 6

require("modules/module_utils")
require('scripts/globals/utils')
require('scripts/globals/player')
require('scripts/globals/npc_util')
local cq  = require("modules/catseyexi/lua/additive_overrides/utils/custom_quest")
local cu  = require("modules/catseyexi/lua/additive_overrides/utils/custom_util")
local cid = require("modules/catseyexi/lua/additive_overrides/utils/custom_id")
-------------------------------------------------------
local m = Module:new("lb_quest-daddy_issues")

local info =
{
    name   = "Daddy Issues",
    author = "Tonzoffun",
    var    = "[LB]DADDY_ISSUES",
    required =
    {
        item = { { 2556, 1 } },
        name = "dancer's testimony",
    },
    reward =
    {
        gil   = 500,
        after = function(player)
            player:setCharVar("[LB]DNC", 1)
            if player:getLevelCap() < 75 then
                player:setLevelCap(75);
                player:PrintToPlayer("Your level cap has increased to 75.", xi.msg.channel.SYSTEM_3)
            end
            return true
        end,
    },
}

local BRITTANY = "BRITTANY"
local MINDY    = "MINDY"
local MALBORO  = "MALBORO"

local entity =
{
    {
        id     = BRITTANY,
        name   = "Brittany",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.HUME_F,
            face = cid.face.B2,
            head = cid.model.STARLET,
            body = cid.model.STARLET,
            hand = cid.model.STARLET,
            legs = cid.model.STARLET,
            feet = cid.model.STARLET,
        }),
        area      = "Upper_Jeuno",
        pos       = { -56.8856, 0.0001, 99.0318, 181 }, -- !pos -56.8856 0.0001 99.0318 244
        dialog    =
        {
            NAME      = true,
            DEFAULT   = { "Don't I totally look cute?!" },
            START     =
            {
                { emote = xi.emote.CHEER },
                "Hey there!! Oooomg!! So I totally like just heard of a like totally scary story!",
                { delay = 1000 },
                string.format(" If you bring me a %s, I'll like totally tell you all about it!!", info.required.name),
            },
            REMINDER  = { string.format("Bring me a %s, then I'll like totally tell you the story I heard.", info.required.name), },
            DELIVERED =
            {
                { emote = xi.emote.HURRAY },
                "Yay!! You totally did it! Okaaaaay.. so like my friend Bethany, not Brittany, that's totally me, silly!",
                { delay = 1000 },
                " She like totally told me about this scary story that happened years ago to a girl who was totally just like us!",
                { delay = 2000 },
                { emote = xi.emote.PANIC },
                "Bethany said that like this girl had to fight a crazy scary monster! It was huge and green and had terrible breath!",
                { delay = 1000 },
                " Isn't that gross! OMG I totally would freak out if that happened to me!",
                { delay = 2000 },
                "She said it happened in some like jungle place.. Jugner Forest I think, but like yeeears ago!",
            },
            REMINDER2 = { "Can you believe that like happened in Jugner Forest so totally long ago!??" },
            FINISH    =
            {
                { emote = xi.emote.SHOCKED },
                "Heeey! Long time no see!! OMG what!??? You met her!?? What do you mean?",
                { delay = 1000 },
                " That like doesn't even make sense, but whaaaaaatever floats your boat I guess.",
                { delay = 2000 },
                { emote = xi.emote.BLUSH },
                "I like totally missed you while you were gone, if I give you a present will you stay here with me??",
                { delay = 1000 },
                " Here.. like you can totally have this. Do you like want to watch me dance?",
            },
            AFTER     = { "Thanks for like totally staying to cheer me on!" },
        },
    },
    {
        id     = MINDY,
        name   = "Mindy",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.HUME_F,
            face = cid.face.A8,
            head = cid.model.ETOILE,
            body = cid.model.ETOILE,
            hand = cid.model.ETOILE,
            legs = cid.model.ETOILE,
            feet = cid.model.ETOILE,
        }),
        area   = "Jugner_Forest_[S]",
        pos    = { 480.5514, 0.1380, -153.2160, 86 }, -- !pos 480.5514 0.1380 -153.2160 82
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Hiiiiii! Don't I have like the best dance moves you've ever seen??" },
            START    =
            {
                { emote = xi.emote.SHOCKED },
                "Oh hi! I like totally didn't see you there.",
                { delay = 1000 },
                " I have no idea how I made it all the way out here, I just kept practicing my dance moves.",
                { delay = 2000 },
                { emote = xi.emote.HUH },
                "Next thing I knew I was like way out here and now I'm like totally lost!!",
                { delay = 1000 },
                " OMG!! Did you hear that?? What was that!!??",

            },
            HELP     = { "Can you like totally help me look around for whatever made that sound??" },
            SPAWN    = { "Eeeeeeeek!! Kill it!! I'm too pretty to die this young!" },
            FINISH   =
            {
                { emote = xi.emote.BLUSH },
                "You totally just like saved my life. I like totally owe you!!",
                { delay = 1000 },
                " But can you do me a huge favor??? Like can we just agree that I totally like killed it myself?",
                { delay = 2000 },
                "What?? You come from the future? OMG! So you can totally check and see if they heard about how I killed it!",
            },
            REMINDER = { "I totally hope this story reaches dancers in the future and they like know how brave I was." },
        },
    },
    {
        id          = MALBORO,
        name        = "Daddy",
        type        = xi.objType.MOB,
        look        = "0x00007c0100000000000000000000000000000000",
        groupId     = 13,
        groupZoneId = 90,
        area        = "Jugner_Forest_[S]",
        pos         = { 466.2906, -0.9709, -149.1866, 28 }, -- !pos 466.2906 -0.9709 -149.1866 82
        level       = 68,
    },
}

local step =
{
    {
        check      = cq.checks({ level = 66, job = xi.job.DNC }),
        [BRITTANY] = cq.talkStep("START", info.name),
    },
    {
        [BRITTANY] =
        {
            onTrigger = cq.talkOnly("REMINDER"),
            onTrade   = cq.tradeStep("DELIVERED", "REMINDER", info.required.item),
        }
    },
    {
        [BRITTANY] = cq.talkOnly("REMINDER2"),
        [MINDY]    = cq.talkStep("START"),
    },
    {
        check     = cq.checks({ level = 66, job = xi.job.DNC }),
        [MINDY]   = cq.menuSpawn(MALBORO, { "HELP", "Agree to help?" }, { { "Not yet." }, { "I'm ready.", "SPAWN" } }, 2, false, { levelCap = 70, partySize = 1, subjob = false }),
        [MALBORO] = cq.killStep(),
    },
    {
        [MINDY]   = cq.talkStep("FINISH"),
    },
    {
        [MINDY]    = cq.talkOnly("REMINDER"),
        [BRITTANY] = cq.giveStep("FINISH", info.reward, info.name, cq.music.JEUNO),
    },
    {
        check      = cq.checks({ job = xi.job.DNC }),
        [BRITTANY] = cq.talkOnly("AFTER"),
    }
}

cq.add(m, {
    info   = info,
    entity = entity,
    step   = step,
})

return m
