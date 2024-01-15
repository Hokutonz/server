-------------------------------------------------------
-- Missing Rum (Lv66)
-------------------------------------------------------
-- Steps
-------------------------------------------------------
-- !setvar [LB]MISSING_RUM 0
-- Jacquotte      !pos 72.6208 -6.0000 -137.1521 50
-- Morgan         !pos -459.0443 -3.0000 -404.4373 54
-- Azathoth       !pos -455.6972 -3.0000 -418.3553 54
-- Jacquotte      !pos 72.6208 -6.0000 -137.1521 50
-- Unlocks: Lv71-75 (COR LB5)
-------------------------------------------------------
-- !setvar [LB]MISSING_RUM 6

require("modules/module_utils")
require('scripts/globals/utils')
require('scripts/globals/player')
require('scripts/globals/npc_util')
local cq  = require("modules/catseyexi/lua/additive_overrides/utils/custom_quest")
local cu  = require("modules/catseyexi/lua/additive_overrides/utils/custom_util")
local cid = require("modules/catseyexi/lua/additive_overrides/utils/custom_id")
-------------------------------------------------------
local m = Module:new("lb_quest-missing_rum")

local info =
{
    name   = "Missing Rum",
    author = "Tonzoffun",
    var    = "[LB]MISSING_RUM",
    required =
    {
        item = { { 2332, 1 } },
        name = "corsair's testimony",
    },
    reward =
    {
        gil   = 500,
        after = function(player)
            player:setCharVar("[LB]COR", 1)
            if player:getLevelCap() < 75 then
                player:setLevelCap(75);
                player:PrintToPlayer("Your level cap has increased to 75.", xi.msg.channel.SYSTEM_3)
            end
            return true
        end,
    },
}

local JACQUOTTE = "JACQUOTTE"
local MORGAN    = "MORGAN"
local KRAKEN    = "KRAKEN"

local entity =
{
    {
        id     = JACQUOTTE,
        name   = "Jacquotte",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.ELVAAN_F,
            face = cid.face.A7,
            head = cid.model.CORSAIR_RELIC,
            body = cid.model.CORSAIR_RELIC,
            hand = cid.model.CORSAIR_RELIC,
            legs = cid.model.CORSAIR_RELIC,
            feet = cid.model.CORSAIR_RELIC,
            main = 189,
            offh = 189,
        }),
        area      = "Aht_Urhgan_Whitegate",
        pos       = { 72.6208, -6.0000, -137.1521, 216 }, -- !pos 72.6208 -6.0000 -137.1521 50
        dialog    =
        {
            NAME      = true,
            DEFAULT   = { "What are ye lookin' at, scallywag!?" },
            START     =
            {
                { emote = xi.emote.YES },
                "Ahoy, avast ye! The name's admiral Jacquotte.. ye lookin' fir a crew to sail the briny deep with?",
                { delay = 1000 },
                string.format(" If ye bring me a %s, then maybe we'll talk.", info.required.name),
            },
            REMINDER  = { string.format("Bring me a %s, then maybe we'll talk.", info.required.name), },
            DELIVERED =
            {
                { emote = xi.emote.THINK },
                "I see yer not just a deck rat, are ye? Doesn't mean ye won't find yer way to davy jones' locker!",
                { delay = 1000 },
                " A few days ago, me prized bottle of rum went missin'. Ye find it fir me, and I'll give ye a spot on me ship.",
                { delay = 2000 },
                { emote = xi.emote.ANGRY },
                "One of me captains claimed he put it back in me quarters, but I'll jump the plank meself if he didn't take it, that swine!",
                { delay = 1000 },
                " I'd start yer search with him. Last I saw, he was sailin' towards the Arrapago Reef. Git to it!",
            },
            REMINDER2 = { "Go find that useless captain in Arrapago Reef and git me rum back!" },
            FINISH    =
            {
                { emote = xi.emote.ANGRY },
                "I see ye comin' back empty handed.. I didn't figure ye fir a failure.",
                { delay = 1000 },
                " I don't want any excuses, dead men tell no tales ye know!",
                { delay = 2000 },
                { emote = xi.emote.LAUGH },
                "I'm only pullin' yer peg leg, I knew all along that carouser drank it, I just wanted to see ye in action.",
                { delay = 1000 },
                " A deals a deal, take this booty. Ye earned a place on me ship when yer ready, pirate!",
            },
            AFTER     = { "Ye have earned a place on me ship when yer ready, pirate!" },
        },
    },
    {
        id     = MORGAN,
        name   = "Morgan",
        type   = xi.objType.NPC,
        look   = cu.lookTable({
            race = xi.race.ELVAAN_M,
            face = cid.face.B1,
            head = cid.model.CORSAIR_ARTIFACT,
            body = cid.model.CORSAIR_ARTIFACT,
            hand = cid.model.CORSAIR_ARTIFACT,
            legs = cid.model.CORSAIR_ARTIFACT,
            feet = cid.model.CORSAIR_ARTIFACT,
            main = 188,
            offh = 188,
        }),
        area   = "Arrapago_Reef",
        pos    = { -459.0443, -3.0000, -404.4373, 35 }, -- !pos -459.0443 -3.0000 -404.4373 54
        dialog =
        {
            NAME     = true,
            DEFAULT  = { "What do ye *hiccup* w-want!" },
            START    =
            {
                { emote = xi.emote.NO },
                "I haven't seen *hiccup* any rum anywhere! How dare ye *hiccup* acuse captain Morgan!!",
                { delay = 1000 },
                " I should send ye to swim *hiccup* with the fishes!",
                { delay = 2000 },
                { emote = xi.emote.STAGGER },
                "Ye better git outta me *hiccup* sight before I... ok, aye.. I MAY have seen the rum.",
                { delay = 1000 },
                " But ye gotta prove yer a real pirate before *hiccup* I tell ye anythin'!",

            },
            HELP     = { "Ye sure yer a *hiccup* pirate? Ye look pretty weak, prove me wrong?" },
            SPAWN    = { "Go git it!! Hahah *hiccup* ahaha!!" },
            FINISH   =
            {
                { emote = xi.emote.CHEER },
                "Wow! Ye sure know yer stuff pirate! Yer still a just a *hiccup* barnacle on me shoe!",
                { delay = 1000 },
                " Don't ye forgit it! I'm just gunna *hiccup* rest fir a bit...... *snore*",
            },
            REMINDER = { "Lit me sleep!! Go back and annoy Jacquotte wit' yer yappin'!" },
        },
    },
    {
        id          = KRAKEN,
        name        = "Azathoth",
        type        = xi.objType.MOB,
        groupId     = 10,
        groupZoneId = 58,
        area        = "Arrapago_Reef",
        pos         = { -455.6972, -3.0000, -418.3553, 176 }, -- !pos -455.6972 -3.0000 -418.3553 54
        level       = 63,
    },
}

local step =
{
    {
        check       = cq.checks({ level = 66, job = xi.job.COR }),
        [JACQUOTTE] = cq.talkStep("START", info.name),
    },
    {
        [JACQUOTTE] =
        {
            onTrigger = cq.talkOnly("REMINDER"),
            onTrade   = cq.tradeStep("DELIVERED", "REMINDER", info.required.item),
        }
    },
    {
        [JACQUOTTE] = cq.talkOnly("REMINDER2"),
        [MORGAN]    = cq.talkStep("START"),
    },
    {
        check    = cq.checks({ level = 66, job = xi.job.COR }),
        [MORGAN] = cq.menuSpawn(KRAKEN, { "HELP", "Agree to help?" }, { { "Not yet." }, { "I'm ready.", "SPAWN" } }, 2, false, { levelCap = 70, partySize = 1, subjob = false }),
        [KRAKEN] = cq.killStep(),
    },
    {
        [MORGAN] = cq.talkStep("FINISH"),
    },
    {
        [MORGAN]    = cq.talkOnly("REMINDER"),
        [JACQUOTTE] = cq.giveStep("FINISH", info.reward, info.name, cq.music.WHITEGATE),
    },
    {
        check       = cq.checks({ job = xi.job.COR }),
        [JACQUOTTE] = cq.talkOnly("AFTER"),
    }
}

cq.add(m, {
    info   = info,
    entity = entity,
    step   = step,
})

return m
