-------------------------------------------------------
-- Immortal Kombat! (Lv66)
-------------------------------------------------------
-- Steps
-------------------------------------------------------
-- !setvar [LB]IMMORTAL_KOMBAT 0
-- Nandiyah      !pos 67.4631 -6.000 -78.7001 50
-- Razhud        !pos -132.2776 11.6864 -490.6990 68
-- Rektum Ja Ja  !pos -139.1137 12.3915 -495.7480 68
-- Nandiyah      !pos 67.4631 -6.000 -78.7001 50
-- Unlocks: Lv71-75 (BLU LB5)
-------------------------------------------------------
-- !setvar [LB]IMMORTAL_KOMBAT 6

require("modules/module_utils")
require('scripts/globals/utils')
require('scripts/globals/player')
require('scripts/globals/npc_util')
local cq  = require("modules/hokutens/lua/system/utils/custom_quest")
local cu  = require("modules/hokutens/lua/system/utils/custom_util")
local cid = require("modules/hokutens/lua/system/utils/custom_id")
-------------------------------------------------------
local m = Module:new("lb_quest-immortal_kombat")

local info =
{
    name   = "Immortal Kombat!",
    author = "Tonzoffun",
    var    = "[LB]IMMORTAL_KOMBAT",
    required =
    {
        item = { { 2331, 1 } },
        name = "blue mage's testimony",
    },
    reward =
    {
        gil   = 500,
        after = function(player)
            player:setCharVar("[LB]BLU", 1)
            if player:getLevelCap() < 75 then
                player:setLevelCap(75);
                player:PrintToPlayer("Your level cap has increased to 75.", xi.msg.channel.SYSTEM_3)
            end
            return true
        end,
    },
}

local NANDIYAH = "NANDIYAH"
local RAZHUD   = "RAZHUD"
local MAMOOLJA = "MAMOOLJA"

local entity =
{
    {
        id     = NANDIYAH,
        name   = "Nandiyah",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.HUME_M,
            face = cid.face.B4,
            head = cid.model.BLUE_MAGE_RELIC,
            body = cid.model.BLUE_MAGE_RELIC,
            hand = cid.model.BLUE_MAGE_RELIC,
            legs = cid.model.BLUE_MAGE_RELIC,
            feet = cid.model.BLUE_MAGE_RELIC,
            main = 419,
            offh = 419,
        }),
        area      = "Aht_Urhgan_Whitegate",
        pos       = { 67.4631, -6.000, -78.7001, 193 }, -- !pos 67.4631 -6.000 -78.7001 50
        dialog    =
        {
            NAME      = true,
            DEFAULT   = { "I do not recognize your authority to talk to me..." },
            START     =
            {
                { emote = xi.emote.SALUTE },
                "Soldier! The time has come to test your might.", 
                { delay = 1000 },
                string.format(" Before we begin, bring me a %s to show your dedication to our cause.", info.required.name),
            },
            REMINDER  = { string.format("Bring me a %s to show your dedication to our cause.", info.required.name), },
            DELIVERED =
            {
                { emote = xi.emote.THINK },
                "Hmmm. I see. Maybe you are indeed worthy...",
                { delay = 1000 },
                " Seek out Razhud in the Aydeewa Subterrane.",
                { delay = 2000 },
                "If he finds you worthy, I will impart on you the greatest of our knowledge.",
            },
            REMINDER2 = { "Seek out Razhud in the Aydeewa Subterrane." },
            FINISH    =
            {
                { emote = xi.emote.KNEEL },
                "You are indeed worth of my respect.",
                { delay = 1000 },
                " As promised, I will pass our secrets along to you.",
                { delay = 2000 },
                "Go forth and represent our noble cause.",
            },
            AFTER     = { "I have nothing left to teach you." },
        },
    },
    {
        id     = RAZHUD,
        name   = "Razhud",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.HUME_M,
            face = cid.face.B2,
            head = cid.model.BLUE_MAGE_ARTIFACT,
            body = cid.model.BLUE_MAGE_ARTIFACT,
            hand = cid.model.BLUE_MAGE_ARTIFACT,
            legs = cid.model.BLUE_MAGE_ARTIFACT,
            feet = cid.model.BLUE_MAGE_ARTIFACT,
            main = 384,
            offh = 384,
        }),
        area   = "Aydeewa_Subterrane",
        pos    = { -132.2776, 11.6864, -490.6990, 159 }, -- !pos -132.2776 11.6864 -490.6990 68
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "I don't believe I have any orders dealing with you." },
            START    =
            {
                { emote = xi.emote.SALUTE },
                "Nandiyah has informed me you are here to help.",
                { delay = 1000 },
                " We have lost weeks of progress due to attacks by the Mamool Ja.",
                { delay = 2000 },
                "If you help clear the way, I will put in a good word for you to Nandiyah.",
            },
            HELP     = { "Now is your chance to test your might." },
            SPAWN    = { "Here it comes now, do your duty soldier! FINISH HIM!!" },
            FINISH   =
            {
                { emote = xi.emote.KNEEL },
                "Thank you for your assistance soldier, we may continue our work now.",
                { delay = 1000 },
                " Report back to Nandiyah, I will inform him of your worthiness.",
            },
            REMINDER = { "Report back to Nandiyah." },
        },
    },
    {
        id          = MAMOOLJA,
        name        = "Rektum Ja Ja",
        type        = xi.objType.MOB,
        look        = "0x0600470600000000000000000000000000000000",
        groupId     = 27,
        groupZoneId = 51,
        area        = "Aydeewa_Subterrane",
        pos         = { -139.1137, 12.3915, -495.7480, 183 }, -- !pos -139.1137 12.3915 -495.7480 68
        level       = 68,
    },
}

local step =
{
    {
        check      = cq.checks({ level = 66, job = xi.job.BLU }),
        [NANDIYAH] = cq.talkStep("START", info.name),
    },
    {
        [NANDIYAH] =
        {
            onTrigger = cq.talkOnly("REMINDER"),
            onTrade   = cq.tradeStep("DELIVERED", "REMINDER", info.required.item),
        }
    },
    {
        [NANDIYAH] = cq.talkOnly("REMINDER2"),
        [RAZHUD]   = cq.talkStep("START"),
    },
    {
        check      = cq.checks({ level = 66, job = xi.job.BLU }),
        [RAZHUD]   = cq.menuSpawn(MAMOOLJA, { "HELP", "Agree to help?" }, { { "Not yet." }, { "I'm ready.", "SPAWN" } }, 2, false, { levelCap = 70, partySize = 1, subjob = false }),
        [MAMOOLJA] = cq.killStep(),
    },
    {
        [RAZHUD]   = cq.talkStep("FINISH"),
    },
    {
        [RAZHUD]   = cq.talkOnly("REMINDER"),
        [NANDIYAH] = cq.giveStep("FINISH", info.reward, info.name, cq.music.WHITEGATE),
    },
    {
        check      = cq.checks({ job = xi.job.BLU }),
        [NANDIYAH] = cq.talkOnly("AFTER"),
    }
}

cq.add(m, {
    info   = info,
    entity = entity,
    step   = step,
})

return m
