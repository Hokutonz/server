-------------------------------------------------------
-- Master of Puppets (Lv66)
-------------------------------------------------------
-- Steps
-------------------------------------------------------
-- !setvar [LB]MASTER_PUPPETS 0
-- Kirk      !pos -286.2880 -12.0200 -83.6707 235
-- Lars      !pos 461.4646 -34.1743 102.7589 79
-- Ktulu     !pos 479.0318 -36.2500 106.8963 79
-- Kirk      !pos -286.2880 -12.0200 -83.6707 235
-- Unlocks: Lv71-75 (PUP LB5)
-------------------------------------------------------
-- !setvar [LB]MASTER_PUPPETS 6

require("modules/module_utils")
require('scripts/globals/utils')
require('scripts/globals/player')
require('scripts/globals/npc_util')
local cq  = require("modules/hokutens/lua/system/utils/custom_quest")
local cu  = require("modules/hokutens/lua/system/utils/custom_util")
local cid = require("modules/hokutens/lua/system/utils/custom_id")
-------------------------------------------------------
local m = Module:new("lb_quest-master_of_puppets")

local info =
{
    name   = "Master of Puppets",
    author = "Tonzoffun",
    var    = "[LB]MASTER_PUPPETS",
    required =
    {
        item = { { 2333, 1 } },
        name = "puppetmaster's testimony",
    },
    reward =
    {
        gil   = 500,
        after = function(player)
            player:setCharVar("[LB]PUP", 1)
            if player:getLevelCap() < 75 then
                player:setLevelCap(75);
                player:printToPlayer("Your level cap has increased to 75.", xi.msg.channel.SYSTEM_3)
            end
            return true
        end,
    },
}

local KIRK       = "KIRK"
local LARS       = "LARS"
local SOULFLAYER = "SOULFLAYER"

local entity =
{
    {
        id     = KIRK,
        name   = "Kirk",
        type   = xi.objType.NPC,
        look   = 3029,
        area   = "Bastok_Markets",
        pos    = { -286.2880, -12.0200, -83.6707, 89 }, -- !pos -286.2880 -12.0200 -83.6707 235
        dialog =
        {
            NAME      = true,
            DEFAULT   = { "I choose to live, not just exist..." },
            START     =
            {
                { emote = xi.emote.WAVE },
                "You there! You look like just the kind of adventurer I need.", 
                { delay = 2000 },
                string.format(" But first, bring me a %s to show me I can trust you.", info.required.name),
            },
            REMINDER  = { string.format("Bring me a %s to show me I can trust you.", info.required.name), },
            DELIVERED =
            {
                { emote = xi.emote.PSYCH },
                "I knew it! You're exactly who I hoped you would be!",
                { delay = 1000 },
                " I need you to help me seek and destroy my kind's sworn enemy.",
                { delay = 2000 },
                "So many puppets have been blackened and deactivated due to this menace.",
                { emote = xi.emote.CRY },
                { delay = 1000 },
                " It's sad but true, so here comes revenge ...And justice for all!",
                { delay = 2000 },
                "As we speak, Lars, is on the front lines in Caedarva Mire, go back him up!",
            },
            REMINDER2 = { "Make haste to Caedarva Mire! Lars is waiting on the front lines to meet you!" },
            FINISH    =
            {
                { emote = xi.emote.CHEER },
                "Welcome home!! I thought this day would never come!",
                { delay = 1000 },
                " We can finally turn the page on that harvester of sorrow, all thanks to you.",
                { delay = 2000 },
                { emote = xi.emote.BOW },
                "Wherever I may roam, I will never forget this kindness you have shown us.",
                { delay = 1000 },
                " You have earned this. Hopefully this gift will help fuel your road to ever greater power!",
            },
            AFTER     = { "The memory remains forever of your great victory, my dearest friend." },
        },
    },
    {
        id     = LARS,
        name   = "Lars",
        type   = xi.objType.NPC,
        look   = 3030,
        area   = "Caedarva_Mire",
        pos    = { 461.4646, -34.1743, 102.7589, 28 }, -- !pos 461.4646 -34.1743 102.7589 79
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Boredom comes from a boring mind..." },
            START    =
            {
                { emote = xi.emote.HURRAY },
                "Our savior has arrived!! Now we can fight fire with fire!",
                { delay = 1000 },
                " If darkness had a son, it would answer to the call of Ktulu.",
                { delay = 2000 },
                { emote = xi.emote.KNEEL },
                "Please save our kind from this creeping death before my battery dies and I disappear.",
                { delay = 1000 },
                " Nothing else matters until it sleeps and fades to black.",
            },
            HELP     = { "Will you stand and fight against this unforgiven destroyer of our race?" },
            SPAWN    = { "There it is!! The one that has been killing all my brethren!" },
            FINISH   =
            {
                { emote = xi.emote.CLAP },
                "YOU DID IT! We have not known peace for a long 72 seasons.",
                { delay = 1000 },
                " I can't believe its reign is finally over.",
                { delay = 2000 },
                "You must be the one to bring the good tidings to Kirk!",
            },
            REMINDER = { "Bring the good tidings to Kirk!" },
        },
    },
    {
        id          = SOULFLAYER,
        name        = "Ktulu",
        type        = xi.objType.MOB,
        look        = "0x0000ef0600000000000000000000000000000000",
        groupId     = 58,
        groupZoneId = 79,
        area        = "Caedarva_Mire",
        pos         = { 479.0318, -36.2500, 106.8963, 101 }, -- !pos 479.0318 -36.2500 106.8963 79
        level       = 68,
    },
}

local step =
{
    {
        check  = cq.checks({ level = 66, job = xi.job.PUP }),
        [KIRK] = cq.talkStep("START", info.name),
    },
    {
        [KIRK] =
        {
            onTrigger = cq.talkOnly("REMINDER"),
            onTrade   = cq.tradeStep("DELIVERED", "REMINDER", info.required.item),
        }
    },
    {
        [KIRK] = cq.talkOnly("REMINDER2"),
        [LARS] = cq.talkStep("START"),
    },
    {
        check        = cq.checks({ level = 66, job = xi.job.PUP }),
        [LARS]       = cq.menuSpawn(SOULFLAYER, { "HELP", "Agree to help?" }, { { "Not yet." }, { "I'm ready.", "SPAWN" } }, 2, false, { levelCap = 70, partySize = 1, subjob = false }),
        [SOULFLAYER] = cq.killStep(),
    },
    {
        [LARS]   = cq.talkStep("FINISH"),
    },
    {
        [LARS] = cq.talkOnly("REMINDER"),
        [KIRK] = cq.giveStep("FINISH", info.reward, info.name, cq.music.BASTOK),
    },
    {
        check  = cq.checks({ job = xi.job.PUP }),
        [KIRK] = cq.talkOnly("AFTER"),
    }
}

cq.add(m, {
    info   = info,
    entity = entity,
    step   = step,
})

return m
