-------------------------------------------------------
-- Revenge of the Nerds (Lv66)
-------------------------------------------------------
-- Steps
-------------------------------------------------------
-- !setvar [LB]REVENGE_NERDS 0
-- Lewis        !pos 376.8156 -40.0000 22.0515 175
-- Poindexter   !pos -39.9865 25.0000 506.2377 90
-- Worm         !pos -51.0453 25.0000 496.1035 90
-- Lewis        !pos 376.8156 -40.0000 22.0515 175
-- Unlocks: Lv71-75 (SCH LB5)
-------------------------------------------------------
-- !setvar [LB]REVENGE_NERDS 6

require("modules/module_utils")
require('scripts/globals/utils')
require('scripts/globals/player')
require('scripts/globals/npc_util')
local cq  = require("modules/catseyexi/lua/additive_overrides/utils/custom_quest")
local cu  = require("modules/catseyexi/lua/additive_overrides/utils/custom_util")
local cid = require("modules/catseyexi/lua/additive_overrides/utils/custom_id")
-------------------------------------------------------
local m = Module:new("lb_quest-revenge_of_the_nerds")

local info =
{
    name   = "Revenge of the Nerds",
    author = "Tonzoffun",
    var    = "[LB]REVENGE_NERDS",
    required =
    {
        item = { { 2557, 1 } },
        name = "scholar's testimony",
    },
    reward =
    {
        gil   = 500,
        after = function(player)
            player:setCharVar("[LB]SCH", 1)
            if player:getLevelCap() < 75 then
                player:setLevelCap(75);
                player:PrintToPlayer("Your level cap has increased to 75.", xi.msg.channel.SYSTEM_3)
            end
            return true
        end,
    },
}

local LEWIS      = "LEWIS"
local POINDEXTER = "POINDEXTER"
local BOOK       = "BOOK"

local entity =
{
    {
        id     = LEWIS,
        name   = "Lewis",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.TARU_M,
            face = cid.face.B2,
            head = cid.model.ARGUTE,
            body = cid.model.ARGUTE,
            hand = cid.model.ARGUTE,
            legs = cid.model.ARGUTE,
            feet = cid.model.ARGUTE,
        }),
        area      = "The_Eldieme_Necropolis_[S]",
        pos       = { 376.8156, -40.0000, 22.0515, 0 }, -- !pos 376.8156 -40.0000 22.0515 175
        dialog    =
        {
            NAME      = true,
            DEFAULT   = { "Hmmm.. let's see, the average air speed of a european swallow is 24 mph, interesting.." },
            START     =
            {
                { emote = xi.emote.WAVE },
                "Hello follow scholar, would you like to join our book club?",
                { delay = 1000 },
                string.format(" Before you can be accepted, please bring an offering of a %s.", info.required.name),
            },
            REMINDER  = { string.format("Bring me a %s, then you can join our book club.", info.required.name), },
            DELIVERED =
            {
                { emote = xi.emote.WELCOME },
                "Great! Thanks for that, welcome to the club!",
                { delay = 1000 },
                " You are free to access any of the books in our private library.",
                { delay = 2000 },
                "Feel free to find a good spot in here to read, just be careful of travelling too far outside.",
                { delay = 1000 },
                " Some of the books don't like to be too far from home, the older the book, the more sensitive to change.",
                { delay = 2000 },
                { emote = xi.emote.HUH },
                "Which reminds me, didn't Poindexter say he was headed to Pashhow Marshlands [S]?",
                { delay = 1000 },
                " Oh no!! Did he take the ancient text from the great knowledge spirit's library!??",
            },
            REMINDER2 = { "Please go check on Poindexter in Pashhow Marshlands [S] and make sure he's okay!" },
            FINISH    =
            {
                { emote = xi.emote.AMAZED },
                "Thank the heavens for your return! We were very concerned for your safety you were gone so long!",
                { delay = 1000 },
                " I hope everything was okay out there..",
                { delay = 2000 },
                { emote = xi.emote.SHOCKED },
                "His book came alive!? Oh wow!! I've heard of something like this happening before.",
                { delay = 1000 },
                " Please forgive me, I must make a note of this discovery, please take this as exchange for this knowledge.",
            },
            AFTER     = { "Find a good spot and get studying, there's only A+ students allowed in this book club!" },
        },
    },
    {
        id     = POINDEXTER,
        name   = "Poindexter",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.TARU_M,
            face = cid.face.A8,
            head = cid.model.SCHOLARS,
            body = cid.model.SCHOLARS,
            hand = cid.model.SCHOLARS,
            legs = cid.model.SCHOLARS,
            feet = cid.model.SCHOLARS,
        }),
        area   = "Pashhow_Marshlands_[S]",
        pos    = { -39.9865, 25.0000, 506.2377, 66 }, -- !pos -39.9865 25.0000 506.2377 90
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Wow! I can't put this book down.. it's filled with so much information!" },
            START    =
            {
                { emote = xi.emote.NOD },
                "Greetings! It's not often I see new recruits to our book club.",
                { delay = 1000 },
                " What's that? Of course I know you aren't supposed to go too far from the book club.",
                { delay = 2000 },
                { emote = xi.emote.HUH },
                "Sorry, I totally got lost in this book, I just kept walking and didn't even realize I had made it this far!",
                { delay = 1000 },
                " I'm pretty sure that's just a tale they tell new recruits so they don't lose any valuable books.",

            },
            HELP     = { "Hey... why is this book moving.. you're seeing this right!?" },
            SPAWN    = { "It's alive!! What on earth?? Please help me!!" },
            FINISH   =
            {
                { emote = xi.emote.STAGGER },
                "Phew! What a close call.. I've never heard of a book coming alive before..",
                { delay = 1000 },
                " If you weren't here to save me, I shudder to think of what could have happened. Thank you!",
                { delay = 2000 },
                "Of course I will return to the book club at once, I will meet you there.",
                { delay = 1000 },
                " Lewis will definitely want to hear about this!!",
            },
            REMINDER = { "I will meet you at the book club in The Eldieme Necropolis [S], let's tell Lewis about this." },
        },
    },
    {
        id          = BOOK,
        name        = "Ancient Text",
        type        = xi.objType.MOB,
        look        = "0x0000b40800000000000000000000000000000000",
        groupId     = 13,
        groupZoneId = 165,
        area        = "Pashhow_Marshlands_[S]",
        pos         = { -51.0453, 25.0000, 496.1035, 237 }, -- !pos -51.0453 25.0000 496.1035 90
        level       = 68,
    },
}

local step =
{
    {
        check   = cq.checks({ level = 66, job = xi.job.SCH }),
        [LEWIS] = cq.talkStep("START", info.name),
    },
    {
        [LEWIS] =
        {
            onTrigger = cq.talkOnly("REMINDER"),
            onTrade   = cq.tradeStep("DELIVERED", "REMINDER", info.required.item),
        }
    },
    {
        [LEWIS]      = cq.talkOnly("REMINDER2"),
        [POINDEXTER] = cq.talkStep("START"),
    },
    {
        check        = cq.checks({ level = 66, job = xi.job.SCH }),
        [POINDEXTER] = cq.menuSpawn(BOOK, { "HELP", "Agree to help?" }, { { "Not yet." }, { "I'm ready.", "SPAWN" } }, 2, false, { levelCap = 70, partySize = 1, subjob = false }),
        [BOOK]       = cq.killStep(),
    },
    {
        [POINDEXTER]   = cq.talkStep("FINISH"),
    },
    {
        [POINDEXTER] = cq.talkOnly("REMINDER"),
        [LEWIS]      = cq.giveStep("FINISH", info.reward, info.name, cq.music.WHITEGATE),
    },
    {
        check   = cq.checks({ job = xi.job.SCH }),
        [LEWIS] = cq.talkOnly("AFTER"),
    }
}

cq.add(m, {
    info   = info,
    entity = entity,
    step   = step,
})

return m
