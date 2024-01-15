-----------------------------------
-- custom_unlocks
-- Unlocks for various progression milestones
-----------------------------------
require("modules/module_utils")
require("scripts/globals/quests")
require("scripts/globals/missions")
-----------------------------------
local m = Module:new("custom_unlocks")

m.bagNames =
{
    [xi.inv.INVENTORY]  = "Inventory",
    [xi.inv.MOGSAFE]    = "Mog Safe",
    [xi.inv.STORAGE]    = "Storage",
    [xi.inv.TEMPITEMS]  = "Temp. Items",
    [xi.inv.MOGLOCKER]  = "Mog Locker",
    [xi.inv.MOGSATCHEL] = "Mog Satchel",
    [xi.inv.MOGSACK]    = "Mog Sack",
    [xi.inv.MOGCASE]    = "Mog Case",
    [xi.inv.WARDROBE]   = "Mog Wardrobe 1",
    [xi.inv.MOGSAFE2]   = "Mog Safe 2",
    [xi.inv.WARDROBE2]  = "Mog Wardrobe 2",
    [xi.inv.WARDROBE3]  = "Mog Wardrobe 3",
    [xi.inv.WARDROBE4]  = "Mog Wardrobe 4",
    [xi.inv.WARDROBE5]  = "Mog Wardrobe 5",
    [xi.inv.WARDROBE6]  = "Mog Wardrobe 6",
    [xi.inv.WARDROBE7]  = "Mog Wardrobe 7",
    [xi.inv.WARDROBE8]  = "Mog Wardrobe 8",
    [xi.inv.RECYCLEBIN] = "Recycle Bin",
}

m.wardrobeQuests =
{
    -- Advanced Job Quests: San d'Oria
    [xi.quest.log_id.SANDORIA] =
    {
        [xi.quest.id.sandoria.A_KNIGHTS_TEST]                  = { xi.inv.WARDROBE, 1 }, -- Paladin Job Quest
        [xi.quest.id.sandoria.THE_HOLY_CREST]                  = { xi.inv.WARDROBE, 1 }, -- Dragoon Job Quest
    },

    -- Advanced Job Quests: Bastok
    [xi.quest.log_id.BASTOK] =
    {
        [xi.quest.id.bastok.BLADE_OF_DARKNESS]                 = { xi.inv.WARDROBE, 1 }, -- Dark Knight Quest
        [xi.quest.id.bastok.AYAME_AND_KAEDE]                   = { xi.inv.WARDROBE, 1 }, -- Ninja Quest
    },

    -- Advanced Job Quests: Jeuno
    [xi.quest.log_id.JEUNO] =
    {
        [xi.quest.id.jeuno.PATH_OF_THE_BEASTMASTER]            = { xi.inv.WARDROBE, 1 }, -- Beastmaster Quest
        [xi.quest.id.jeuno.PATH_OF_THE_BARD]                   = { xi.inv.WARDROBE, 1 }, -- Bard Quest
        [xi.quest.id.jeuno.LAKESIDE_MINUET]                    = { xi.inv.WARDROBE, 1 }, -- Dancer Quest
        [xi.quest.id.jeuno.CHOCOBOS_WOUNDS]                    = { xi.inv.WARDROBE, 1 }, -- Chocobo License
        [xi.quest.id.jeuno.IN_DEFIANT_CHALLENGE]               = { xi.inv.WARDROBE, 1 }, -- Limit Break 1
        [xi.quest.id.jeuno.ATOP_THE_HIGHEST_MOUNTAINS]         = { xi.inv.WARDROBE, 1 }, -- Limit Break 2
    },

    -- Advanced Job Quests: Windurst
    [xi.quest.log_id.WINDURST] =
    {
        [xi.quest.id.windurst.THE_FANGED_ONE]                  = { xi.inv.WARDROBE, 1 }, -- Ranger Quest
        [xi.quest.id.windurst.I_CAN_HEAR_A_RAINBOW]            = { xi.inv.WARDROBE, 1 }, -- Summoner Quest
    },

    -- Advanced Job Quests: Outlands
    [xi.quest.log_id.OUTLANDS] =
    {
        [xi.quest.id.outlands.FORGE_YOUR_DESTINY]              = { xi.inv.WARDROBE,  1 }, -- Samurai Quest
        [xi.quest.id.outlands.DIVINE_MIGHT]                    = { xi.inv.WARDROBE2, 4 }, -- (ZM) Divine Might
    },

    -- Advanced Job Quests: Aht Urhgan
    [xi.quest.log_id.AHT_URHGAN] =
    {
        [xi.quest.id.ahtUrhgan.AN_EMPTY_VESSEL]                = { xi.inv.WARDROBE, 1 }, -- Blue Mage Quest
        [xi.quest.id.ahtUrhgan.LUCK_OF_THE_DRAW]               = { xi.inv.WARDROBE, 1 }, -- Corsair Quest
        [xi.quest.id.ahtUrhgan.NO_STRINGS_ATTACHED]            = { xi.inv.WARDROBE, 1 }, -- Puppetmaster Quest
    },

    -- Advanced Job Quests: Crystal War
    [xi.quest.log_id.CRYSTAL_WAR] =
    {
        [xi.quest.id.crystalWar.A_LITTLE_KNOWLEDGE]            = { xi.inv.WARDROBE, 1 }, -- Scholar Quest
    },

    [xi.quest.log_id.OTHER_AREAS] =
    {
        [xi.quest.id.otherAreas.ELDER_MEMORIES]                = { xi.inv.WARDROBE, 1 }, -- Subjob (Selbina)
        [xi.quest.id.otherAreas.THE_OLD_LADY]                  = { xi.inv.WARDROBE, 1 }, -- Subjob (Mhaura)
    },
}

m.customQuests =
{
    { { "[RUN]Unlocked", 1 }, { xi.inv.WARDROBE, 1 } }, -- Runefencer Quest
    { { "GEO_Unlocked",  1 }, { xi.inv.WARDROBE, 1 } }, -- Geomancer Quest
}
-- Total (Jobs): 16

m.wardrobeMissions =
{
    -- Nation Missions: San d'Oria
    [xi.mission.log_id.SANDORIA] =
    {
        [xi.mission.id.sandoria.SMASH_THE_ORCISH_SCOUTS]       = { xi.inv.WARDROBE, 1, true },
        [xi.mission.id.sandoria.BAT_HUNT]                      = { xi.inv.WARDROBE, 1, true },
        [xi.mission.id.sandoria.SAVE_THE_CHILDREN]             = { xi.inv.WARDROBE, 1, true },
        [xi.mission.id.sandoria.THE_RESCUE_DRILL]              = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.THE_DAVOI_REPORT]              = { xi.inv.WARDROBE, 1, true },
        [xi.mission.id.sandoria.JOURNEY_ABROAD]                = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.INFILTRATE_DAVOI]              = { xi.inv.WARDROBE, 1, true },
        [xi.mission.id.sandoria.THE_CRYSTAL_SPRING]            = { xi.inv.WARDROBE, 1, true },
        [xi.mission.id.sandoria.APPOINTMENT_TO_JEUNO]          = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.MAGICITE]                      = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.THE_RUINS_OF_FEI_YIN]          = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.THE_SHADOW_LORD]               = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.LEAUTES_LAST_WISHES]           = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.RANPERRES_FINAL_REST]          = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.PRESTIGE_OF_THE_PAPSQUE]       = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.THE_SECRET_WEAPON]             = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.COMING_OF_AGE]                 = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.LIGHTBRINGER]                  = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.BREAKING_BARRIERS]             = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.sandoria.THE_HEIR_TO_THE_LIGHT]         = { xi.inv.WARDROBE, 1 },
    }, -- Total: 20

    -- Nation Missions: Bastok
    [xi.mission.log_id.BASTOK] =
    {
        [xi.mission.id.bastok.THE_ZERUHN_REPORT]               = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.GEOLOGICAL_SURVEY]               = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.FETICHISM]                       = { xi.inv.WARDROBE, 1, true },
        [xi.mission.id.bastok.THE_CRYSTAL_LINE]                = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.WADING_BEASTS]                   = { xi.inv.WARDROBE, 1, true },
        [xi.mission.id.bastok.THE_EMISSARY]                    = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.THE_FOUR_MUSKETEERS]             = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.TO_THE_FORSAKEN_MINES]           = { xi.inv.WARDROBE, 1, true },
        [xi.mission.id.bastok.JEUNO]                           = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.MAGICITE]                        = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.DARKNESS_RISING]                 = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.XARCABARD_LAND_OF_TRUTHS]        = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.RETURN_OF_THE_TALEKEEPER]        = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.THE_PIRATES_COVE]                = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.THE_FINAL_IMAGE]                 = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.ON_MY_WAY]                       = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.THE_CHAINS_THAT_BIND_US]         = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.ENTER_THE_TALEKEEPER]            = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.THE_SALT_OF_THE_EARTH]           = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.bastok.WHERE_TWO_PATHS_CONVERGE]        = { xi.inv.WARDROBE, 1 },
    }, -- Total: 20

    --Nation Missions: Windurst
    [xi.mission.log_id.WINDURST] =
    {
        [xi.mission.id.windurst.THE_HORUTOTO_RUINS_EXPERIMENT] = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.THE_HEART_OF_THE_MATTER]       = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.THE_PRICE_OF_PEACE]            = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.LOST_FOR_WORDS]                = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.A_TESTING_TIME]                = { xi.inv.WARDROBE, 1, true },
        [xi.mission.id.windurst.THE_THREE_KINGDOMS]            = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.TO_EACH_HIS_OWN_RIGHT]         = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.WRITTEN_IN_THE_STARS]          = { xi.inv.WARDROBE, 1, true },
        [xi.mission.id.windurst.A_NEW_JOURNEY]                 = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.MAGICITE]                      = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.THE_FINAL_SEAL]                = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.THE_SHADOW_AWAITS]             = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.FULL_MOON_FOUNTAIN]            = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.SAINTLY_INVITATION]            = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.THE_SIXTH_MINISTRY]            = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.AWAKENING_OF_THE_GODS]         = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.VAIN]                          = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.THE_JESTER_WHOD_BE_KING]       = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.DOLL_OF_THE_DEAD]              = { xi.inv.WARDROBE, 1 },
        [xi.mission.id.windurst.MOON_READING]                  = { xi.inv.WARDROBE, 1 },
    }, -- Total: 20

    -- Zilart Missions
    [xi.mission.log_id.ZILART] =
    {
        [xi.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH]         = { xi.inv.WARDROBE2, 2 }, -- ZM 4
        [xi.mission.id.zilart.HEADSTONE_PILGRIMAGE]            = { xi.inv.WARDROBE2, 2 }, -- ZM 5
        [xi.mission.id.zilart.THE_CHAMBER_OF_ORACLES]          = { xi.inv.WARDROBE2, 2 }, -- ZM 6
        [xi.mission.id.zilart.RETURN_TO_DELKFUTTS_TOWER]       = { xi.inv.WARDROBE2, 2 }, -- ZM 8
        [xi.mission.id.zilart.ARK_ANGELS]                      = { xi.inv.WARDROBE2, 4 }, -- ZM 13
        [xi.mission.id.zilart.THE_CELESTIAL_NEXUS]             = { xi.inv.WARDROBE2, 3 }, -- ZM 16
    }, -- Total: 15

    -- Chains of Promathia Missions
    [xi.mission.log_id.COP] =
    {
        [xi.mission.id.cop.THE_MOTHERCRYSTALS]                 = { xi.inv.WARDROBE2, 3 },
        [xi.mission.id.cop.DISTANT_BELIEFS]                    = { xi.inv.WARDROBE2, 2 },
        [xi.mission.id.cop.ANCIENT_VOWS]                       = { xi.inv.WARDROBE2, 2 },
        [xi.mission.id.cop.DARKNESS_NAMED]                     = { xi.inv.WARDROBE2, 2 },
        [xi.mission.id.cop.THE_SAVAGE]                         = { xi.inv.WARDROBE2, 2 },
        [xi.mission.id.cop.DESIRES_OF_EMPTINESS]               = { xi.inv.WARDROBE2, 2 },
        [xi.mission.id.cop.THREE_PATHS]                        = { xi.inv.WARDROBE2, 3 },
        [xi.mission.id.cop.ONE_TO_BE_FEARED]                   = { xi.inv.WARDROBE2, 5 },
        [xi.mission.id.cop.THE_WARRIORS_PATH]                  = { xi.inv.WARDROBE2, 2 },
        [xi.mission.id.cop.DAWN]                               = { xi.inv.WARDROBE2, 2 },
    }, -- Total: 25

    -- TOAU
    [xi.mission.log_id.TOAU] =
    {
        [xi.mission.id.toau.THE_BLACK_COFFIN]                  = { xi.inv.WARDROBE2, 3 },
        [xi.mission.id.toau.SHIELD_OF_DIPLOMACY]               = { xi.inv.WARDROBE2, 2 },
        [xi.mission.id.toau.PUPPET_IN_PERIL]                   = { xi.inv.WARDROBE2, 3 },
        [xi.mission.id.toau.SHADES_OF_VENGEANCE]               = { xi.inv.WARDROBE2, 2 },
        [xi.mission.id.toau.LEGACY_OF_THE_LOST]                = { xi.inv.WARDROBE2, 2 },
        [xi.mission.id.toau.PATH_OF_DARKNESS]                  = { xi.inv.WARDROBE2, 3 },
        [xi.mission.id.toau.NASHMEIRAS_PLEA]                   = { xi.inv.WARDROBE2, 5 },
    }, -- Total: 20
}

return m
