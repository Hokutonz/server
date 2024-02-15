-------------------------------------------------------
-- Quest for Trust: Moogle
-------------------------------------------------------
-- Steps
-------------------------------------------------------
-- !setvar [TQ]MOOGLE 0
-- Moogle       !pos -37.0490 2.0029 63.8117 243
-- Niko         !pos 147.2183 1.0000 -110.1818 122
-- Pot          !pos 145.2381 1.0000 -92.0772 122
-- Meena        !pos 226.0769 14.3993 220.0775 160
-- Doll         !pos 246.6571 16.0000 218.4701 160
-- Rita         !pos 113.5360 -0.1875 285.4307 113
-- Soulflayer   !pos 121.1592 0.2097 271.7827 113
-- Unlocks: Trust: Moogle
-------------------------------------------------------

require("modules/module_utils")
require('scripts/globals/utils')
require('scripts/globals/player')
require('scripts/globals/npc_util')
local cq  = require("modules/hokutens/lua/system/utils/custom_quest")
local cu  = require("modules/hokutens/lua/system/utils/custom_util")
local cid = require("modules/hokutens/lua/system/utils/custom_id")
-------------------------------------------------------
local m = Module:new("tq_moogle")

local info =
{
    name   = "Mana Pool",
    author = "Tonzoffun",
    var    = "[TQ]MOOGLE",
    required =
    {
        item = { { 1430, 1 } },
        name = "red mage's testimony",
    },
    reward =
    {
        gil   = 2000,
        after = function(player)
            player:addSpell(xi.magic.spell.MOOGLE, true, true)
            player:printToPlayer("You learned Trust: Moogle.", xi.msg.channel.SYSTEM_3)
            return true
        end,
    },
}

local MOOGLE = "MOOGLE"
local NIKO   = "NIKO"
local POT    = "POT"
local MEENA  = "MEENA"
local DOLL   = "DOLL"
local RITA   = "RITA"
local SOULFLAYER   = "SOULFLAYER"

local entity =
{
    {
        id     = MOOGLE,
        name   = "Moogle",
        type   = xi.objType.NPC,
        look   = 3035,
        area   = "RuLude_Gardens",
        pos    = { -37.0490, 2.0029, 63.8117, 0 }, -- !pos -37.0490 2.0029 63.8117 243
        dialog =
        {
            NAME      = true,
            DEFAULT   = { "Kupo!" },
            START     =
            {
                "I am looking for a brave adventurer!",
                { delay = 1000 },
                " This hunt is not for the faint of heart..",
                { delay = 2000 },
                "Do not partake on this hunt if you fear death.",
                { delay = 1000 },
                " I will not take responsibility for the blood split in pursuit of glory!",
            },
            ACCEPTED =
            {
                "Very well. The choice was yours to make.",
                { delay = 1000 },
                " Don't say I didn't warn you..",
                { delay = 2000 },
                "And don't come back crying, even if you lose a limb!",
                { delay = 1000 },
                " Your fate is in your own hands adventurer.",
                { delay = 2000 },
                "Go find Niko in Ro'Maeve for your first kill!",
            },
            REMINDERNIKO = { "Go find Niko in Ro'Maeve for your first kill!" },
            WINNIKO =
            {
                "Well done adventurer, maybe you aren't as bad as your look!",
                { delay = 1000 },
                " Time will tell..",
                { delay = 2000 },
                "It only gets harder from here.. be prepared!",
                { delay = 1000 },
                " Catch your breath and get back out there!",
                { delay = 2000 },
                "Go find Meena in the Den of Rancor for your next kill!",
            },
            REMINDERMEENA = { "Go find Meena in the Den of Rancor for your next kill!" },
            WINMEENA =
            {
                "Well now, I am impressed!",
                { delay = 1000 },
                " I wonder if you have what it takes to go the distance...",
                { delay = 2000 },
                "There's no point in talking about it.. let your weapon do the talking.",
                { delay = 1000 },
                " If you defeat this fiend, I will be proud to join up with you.",
                { delay = 2000 },
                "Go find Rita in Cape Terrigan for your final kill!",
            },
            REMINDERRITA = { "Go find Rita in Cape Terrigan for your final kill!" },
            FINISH    =
            {
                "You did it! Wow.. you're a true hero!",
                { delay = 1000 },
                " I will be honored to assist you.",
                { delay = 2000 },
                "If you ever need a little extra magic in your corner..",
                { delay = 1000 },
                " Feel free to call on me, I will see you in the field!",
            },
            AFTER     = { "I will see you in the field!" },
        },
    },
    {
        id     = NIKO,
        name   = "Niko",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.TARU_M,
            face = cid.face.B4,
            head = cid.model.MOOGLE_SUIT,
            body = cid.model.MOOGLE_SUIT,
            hand = cid.model.NO_LIMBS,
            legs = cid.model.NO_LIMBS,
            feet = cid.model.NO_LIMBS,
            main = 383,
            offh = 642,
        }),
        area   = "RoMaeve",
        pos    = { 147.2183, 1.0000, -110.1818, 190 }, -- !pos 147.2183 1.0000 -110.1818 122
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Join the hunt!" },
            START    =
            {
                "Moogle sent you?",
                { delay = 1000 },
                " Okay, let's see what you got!",
            },
            SPAWN = { "Kill the beast!" },
            FINISH   =
            {
                "Not bad, adventurer.",
                { delay = 1000 },
                " Return to Moogle, I will notify him of your success here.",
            },
            REMINDER = { "Return to Moogle, I will notify him of your success here." },
        },
    },
    {
        id     = MEENA,
        name   = "Meena",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.TARU_F,
            face = cid.face.A2,
            head = cid.model.GREEN_MOOGLE_SUIT,
            body = cid.model.MOOGLE_SUIT,
            hand = cid.model.NO_LIMBS,
            legs = cid.model.NO_LIMBS,
            feet = cid.model.NO_LIMBS,
            main = 374,
            offh = 374,
        }),
        area   = "Den_of_Rancor",
        pos    = { 226.0769, 14.3993, 220.0775, 3 }, -- !pos 226.0769 14.3993 220.0775 160
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Join the hunt!" },
            START    =
            {
                "Moogle approved you?",
                { delay = 1000 },
                " I don't believe it, let's see how you do!",
            },
            SPAWN = { "For glory and honor!" },
            FINISH   =
            {
                "Hmmm, I judged you wrong.",
                { delay = 1000 },
                " Return to Moogle, I will let him know what I've seen.",
            },
            REMINDER = { "Return to Moogle, I will let him know what I've seen." },
        },
    },
    {
        id     = RITA,
        name   = "Rita",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.MITHRA,
            face = cid.face.B7,
            head = cid.model.GREEN_MOOGLE_SUIT,
            body = cid.model.MOOGLE_SUIT,
            hand = cid.model.NO_LIMBS,
            legs = cid.model.NO_LIMBS,
            feet = cid.model.NO_LIMBS,
            main = 383,
            offh = 383,
        }),
        area   = "Cape_Teriggan",
        pos    = { 113.5360, -0.1875, 285.4307, 55 }, -- !pos 113.5360 -0.1875 285.4307 113
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "Join the hunt!" },
            START    =
            {
                "Moogle let you join the hunt?",
                { delay = 1000 },
                " Well if he sent you here, you must be ready.",
            },
            SPAWN = { "To victory!!" },
            FINISH   =
            {
                "Wow! In all my years, I've never seen anything like that!",
                { delay = 1000 },
                " Return to Moogle, you are a proven warrior!",
            },
            REMINDER = { "Return to Moogle, you are a proven warrior!" },
        },
    },
    {
        id          = POT,
        name        = "Grendel",
        type        = xi.objType.MOB,
        groupId     = 37,
        groupZoneId = 9,
        area        = "RoMaeve",
        pos         = { 145.2381, 1.0000, -92.0772, 59 }, -- !pos 145.2381 1.0000 -92.0772 122
        level       = 65,
    },
    {
        id          = DOLL,
        name        = "Kaiju",
        type        = xi.objType.MOB,
        groupId     = 51,
        groupZoneId = 9,
        area        = "Den_of_Rancor",
        pos         = { 246.6571, 16.0000, 218.4701, 128 }, -- !pos 246.6571 16.0000 218.4701 160
        level       = 68,
    },
    {
        id          = SOULFLAYER,
        name        = "Baphomet",
        type        = xi.objType.MOB,
        groupId     = 43,
        groupZoneId = 54,
        area        = "Cape_Teriggan",
        pos         = { 121.1592, 0.2097, 271.7827, 161 }, -- !pos 121.1592 0.2097 271.7827 113
        level       = 70,
    },
}

local step =
{
    {
        [MOOGLE] = cq.talkStep("START"),
    },
    {
        [MOOGLE] = cq.menuStep("Join the hunt?", { { "Yes", "ACCEPTED" }, { "No" } }, 1, info.name ),
    },
    {
        [MOOGLE] = cq.talkOnly("REMINDERNIKO"),
        [NIKO]   = cq.talkStep("START"),
    },
    {
        [NIKO] = cq.menuSpawn(POT, "Ready to fight?", { { "Not yet." }, { "I'm ready.", "SPAWN" } }, 2, false),
        [POT]  = cq.killStep(),
    },
    {
        [NIKO] = cq.talkStep("FINISH"),
    },
    {
        [NIKO]   = cq.talkOnly("REMINDER"),
        [MOOGLE] = cq.talkStep("WINNIKO"),
    },
    {
        [MOOGLE] = cq.talkOnly("REMINDERMEENA"),
        [MEENA]   = cq.talkStep("START"),
    },
    {
        [MEENA] = cq.menuSpawn(DOLL, "Ready to fight?", { { "Not yet." }, { "I'm ready.", "SPAWN" } }, 2, false),
        [DOLL]  = cq.killStep(),
    },
    {
        [MEENA] = cq.talkStep("FINISH"),
    },
    {
        [MEENA]   = cq.talkOnly("REMINDER"),
        [MOOGLE] = cq.talkStep("WINMEENA"),
    },
    {
        [MOOGLE] = cq.talkOnly("REMINDERRITA"),
        [RITA]   = cq.talkStep("START"),
    },
    {
        [RITA] = cq.menuSpawn(SOULFLAYER, "Ready to fight?", { { "Not yet." }, { "I'm ready.", "SPAWN" } }, 2, false),
        [SOULFLAYER]  = cq.killStep(),
    },
    {
        [RITA] = cq.talkStep("FINISH"),
    },
    {
        [RITA]   = cq.talkOnly("REMINDER"),
        [MOOGLE] = cq.giveStep("FINISH", info.reward, info.name, cq.music.JEUNO),
    },
    {
        [MOOGLE] = cq.talkOnly("AFTER"),
    }
}

cq.add(m, {
    info   = info,
    entity = entity,
    step   = step,
})

return m
