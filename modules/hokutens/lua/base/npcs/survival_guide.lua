-----------------------------------
-- Survival Guide (Leafallia)
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
require('scripts/globals/teleports')
require("scripts/globals/missions")
require("modules/module_utils")
require("scripts/zones/Leafallia/Zone")
require('scripts/globals/teleports/survival_guide')
local ID = require("scripts/zones/Leafallia/IDs")
local survival = require('scripts/globals/teleports/survival_guide_map')
-----------------------------------
local m = Module:new("survival_guide")

m:addOverride("xi.zones.Leafallia.Zone.onInitialize", function(zone)
    super(zone)

    local function paymentWindow(player, npc, posX, posY, posZ, posRot, zoneChosen)
        local gilCost = 1000
        local tabCost = 50
        if player:hasKeyItem(xi.keyItem.RHAPSODY_IN_WHITE) then
            gilCost = gilCost / 10
            tabCost = tabCost / 5
        end
        local paymentWindow =
        {
            title = string.format("Gil: %i Tabs: %i", gilCost, tabCost),
    
            options =
            {
                {
                    "Spend Gil",
                    function(playerArg)
                        if player:getGil() >= gilCost then
                            player:delGil(gilCost)
                            player:injectActionPacket(player:getID(), 6, 600, 0, 0, 0, 0, 0)

                            player:timer(1250, function(playerArg)
                                player:setPos(posX, posY, posZ, posRot, zoneChosen)
                            end)
                        else
                            player:printToPlayer("You do not have enough Gil.", 0, npc:getPacketName())
                        end
                    end,
                },
                {
                    "Spend Tabs",
                    function(playerArg)
                        if player:getCurrency('valor_point') >= tabCost then
                            player:delCurrency('valor_point', tabCost)
                            player:injectActionPacket(player:getID(), 6, 600, 0, 0, 0, 0, 0)

                            player:timer(1250, function(playerArg)
                                player:setPos(posX, posY, posZ, posRot, zoneChosen)
                            end)
                        else
                            player:printToPlayer("You do not have enough tabs.", 0, npc:getPacketName())
                        end
                    end,
                },
                {
                    "I changed my mind.",
                    function(playerArg)
                        player:printToPlayer("Don't waste my time.", 0, npc:getPacketName())
                        return
                    end,
                },
            },
        }
    
        player:customMenu(paymentWindow)
    end
    
    local function processOptionChosen(player, npc, posX, posY, posZ, posRot, zoneChosen, zoneVal)
        local guide = survival.survivalGuides[zoneVal]
        if player:hasTeleport(xi.teleport.type.SURVIVAL, guide.groupIndex - 1, guide.group - 1) then
            paymentWindow(player, npc, posX, posY, posZ, posRot, zoneChosen)
        else
            player:printToPlayer("You have not unlocked that survival guide.", 0, npc:getPacketName())
        end
    end

    local survivalguide = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Survival Guide",
        look = "0x0000810900000000000000000000000000000000",
        x = 4.3925,
        y = -0.2677,
        z = 5.4564,
        rotation = 129,
        widescan = 1,

        onTrigger = function(player, npc)
            local menu1  = {}
            local menu2  = {}
            local region1 = {}
            local region2 = {}
            local region3 = {}
            local region4 = {}
            local region5 = {}
            local region6 = {}
            local region7 = {}
            local region8 = {}
            local region9 = {}
            local reg_Gustaberg_Front = {}
            local reg_Zulkheim = {}
            local reg_Sarutabaruta_Front = {}
            local reg_Kuzotz = {}
            local reg_TuLia = {}
            local reg_Elshimo_Low = {}
            local reg_Elshimo_Up = {}
            local reg_Norvallen = {}
            local reg_Derfland = {}
            local reg_Vollbow = {}
            local reg_Gustaberg = {}
            local reg_Aragoneu = {}
            local reg_Windurst = {}
            local reg_Jeuno = {}
            local reg_San_dOria = {}
            local reg_Valdeaunia = {}
            local reg_LiTelor = {}
            local reg_Valdeaunia_Front = {}
            local reg_Ronfaure = {}
            local reg_Tavnazian_Archipelago = {}
            local reg_Fauregandi_Front = {}
            local reg_Sarutabaruta = {}
            local reg_Ronfaure_Front = {}
            local reg_Fauregandi = {}
            local reg_Derfland_Front = {}
            local reg_Arrapago_Islands = {}
            local reg_Aragoneu_Front = {}
            local reg_Qufim = {}
            local reg_Mamool_Ja_Savagelands = {}
            local reg_Norvallen_Front = {}
            local reg_Movalpolis = {}
            local reg_West_Aht_Urhgan = {}
            local reg_Kolshushu = {}
            local reg_Halvung_Territory = {}
            local reg_Bastok = {}            

            local delaySendMenu = function(playerArg, menu)
                player:timer(100, function(playerArgMenu)
                    playerArgMenu:customMenu(menu)
                end)
            end

            -- Region Menu
            menu1 =
            {
                title   = "Travel to which region?",
                options = {},
            }

            -- Zone Menu
            menu2 =
            {
                title   = "Where will you travel?",
                options = {},
            }

            region1 =
            {
                {
                    "San d'Oria.",
                    function(playerArg)
                        menu2.options = reg_San_dOria
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Bastok.",
                    function(playerArg)
                        menu2.options = reg_Bastok
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Windurst.",
                    function(playerArg)
                        menu2.options = reg_Windurst
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Jeuno.",
                    function(playerArg)
                        menu2.options = reg_Jeuno
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region2
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region2 =
            {
                {
                    "Ronfaure.",
                    function(playerArg)
                        menu2.options = reg_Ronfaure
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Gustaberg.",
                    function(playerArg)
                        menu2.options = reg_Gustaberg
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Sarutabaruta.",
                    function(playerArg)
                        menu2.options = reg_Sarutabaruta
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Zulkheim.",
                    function(playerArg)
                        menu2.options = reg_Zulkheim
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region3
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region1
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region3 =
            {
                {
                    "Derfland.",
                    function(playerArg)
                        menu2.options = reg_Derfland
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Kolshushu.",
                    function(playerArg)
                        menu2.options = reg_Kolshushu
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Aragoneu.",
                    function(playerArg)
                        menu2.options = reg_Aragoneu
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Qufim.",
                    function(playerArg)
                        menu2.options = reg_Qufim
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region4
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region2
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region4 =
            {
                {
                    "Kuzotz.",
                    function(playerArg)
                        menu2.options = reg_Kuzotz
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Vollbow.",
                    function(playerArg)
                        menu2.options = reg_Vollbow
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Elshimo Low.",
                    function(playerArg)
                        menu2.options = reg_Elshimo_Low
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Elshimo Up.",
                    function(playerArg)
                        menu2.options = reg_Elshimo_Up
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region5
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region3
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region5 =
            {
                {
                    "Norvallen.",
                    function(playerArg)
                        menu2.options = reg_Norvallen
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Movalpolis.",
                    function(playerArg)
                        menu2.options = reg_Movalpolis
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Li'Telor.",
                    function(playerArg)
                        menu2.options = reg_LiTelor
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Tu'Lia.",
                    function(playerArg)
                        menu2.options = reg_TuLia
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region6
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region4
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region6 =
            {
                {
                    "Fauregandi.",
                    function(playerArg)
                        menu2.options = reg_Fauregandi
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Valdeaunia.",
                    function(playerArg)
                        menu2.options = reg_Valdeaunia
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "West. Aht Urhgan.",
                    function(playerArg)
                        menu2.options = reg_West_Aht_Urhgan
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Arrapago Islands.",
                    function(playerArg)
                        menu2.options = reg_Arrapago_Islands
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region7
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region5
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region7 =
            {
                {
                    "Mamool Ja Savagelands.",
                    function(playerArg)
                        menu2.options = reg_Mamool_Ja_Savagelands
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Halvung Territory.",
                    function(playerArg)
                        menu2.options = reg_Halvung_Territory
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Tavnazian Archipelago.",
                    function(playerArg)
                        menu2.options = reg_Tavnazian_Archipelago
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Ronfaure Front.",
                    function(playerArg)
                        menu2.options = reg_Ronfaure_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region8
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region6
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region8 =
            {
                {
                    "Gustaberg Front.",
                    function(playerArg)
                        menu2.options = reg_Gustaberg_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Sarutabaruta Front.",
                    function(playerArg)
                        menu2.options = reg_Sarutabaruta_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Derfland Front.",
                    function(playerArg)
                        menu2.options = reg_Derfland_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Norvallen Front.",
                    function(playerArg)
                        menu2.options = reg_Norvallen_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region9
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region7
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region9 =
            {
                {
                    "Aragoneu Front.",
                    function(playerArg)
                        menu2.options = reg_Aragoneu_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Fauregandi Front.",
                    function(playerArg)
                        menu2.options = reg_Fauregandi_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Valdeaunia Front.",
                    function(playerArg)
                        menu2.options = reg_Valdeaunia_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region8
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_San_dOria =
            {
                {
                    "Northern San d'Oria.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -175.21, -4.0, 80.0, 0, xi.zone.NORTHERN_SAN_DORIA, 0)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region1
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Bastok =
            {
                {
                    "Bastok Mines.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 18.82, 0.0, -115.0, 0, xi.zone.BASTOK_MINES, 1)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region1
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Windurst =
            {
                {
                    "Port Windurst.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -220.0, -8.09, 180.15, 64, xi.zone.PORT_WINDURST, 2)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region1
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Jeuno =
            {
                {
                    "Ru'Lude Gardens.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 44.25, 10.0, -69.0, 128, xi.zone.RULUDE_GARDENS, 3)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region1
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Ronfaure =
            {
                {
                    "West. Ronfaure.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -451.4, -19.75, -218.0, 128, xi.zone.WEST_RONFAURE, 6)
                        end)
                    end,
                },
                {
                    "Bostaunieux Oubliette.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -12.88, 0.1, 25.45, 0, xi.zone.BOSTAUNIEUX_OUBLIETTE, 8)
                        end)
                    end,
                },
                {
                    "Fort Ghelsba.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -142.24, -19.93, 7.75, 96, xi.zone.FORT_GHELSBA, 7)
                        end)
                    end,
                },
                {
                    "King Ranperre's Tomb.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -120.23, 0.0, 248.57, 0, xi.zone.KING_RANPERRES_TOMB, 9)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region2
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Gustaberg =
            {
                {
                    "North Gustaberg.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -581.84, 40.0, 53.14, 96, xi.zone.NORTH_GUSTABERG, 20)
                        end)
                    end,
                },
                {
                    "Dangruf Wadi.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -23.16, 0.35, 0.15, 160, xi.zone.DANGRUF_WADI, 23)
                        end)
                    end,
                },
                {
                    "Korroloka Tunnel.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -463.82, -10.08, -22.2, 32, xi.zone.KORROLOKA_TUNNEL, 22)
                        end)
                    end,
                },
                {
                    "Zeruhn Mines.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -10.05, 0.0, 5.81, 192, xi.zone.ZERUHN_MINES, 21)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region2
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Sarutabaruta =
            {
                {
                    "West. Sarutabaruta.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -14.75, -12.0, 315.75, 0, xi.zone.WEST_SARUTABARUTA, 28)
                        end)
                    end,
                },
                {
                    "Toraimarai Canal.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -308.25, 15.0, 260.78, 192, xi.zone.TORAIMARAI_CANAL, 29)
                        end)
                    end,
                },
                {
                    "Inner Horutoto Ruins.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 452.94, -8.0, 181.07, 192, xi.zone.INNER_HORUTOTO_RUINS, 30)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region2
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Zulkheim =
            {
                {
                    "Valkurm Dunes.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 137.9, -7.5, 97.0, 162, xi.zone.VALKURM_DUNES, 11)
                        end)
                    end,
                },
                {
                    "La Theine Plateau.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 774.35, 29.0, -18.57, 224, xi.zone.LA_THEINE_PLATEAU, 10)
                        end)
                    end,
                },
                {
                    "Konschtat Highlands.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -223.0, 71.07, 828.0, 32, xi.zone.KONSCHTAT_HIGHLANDS, 12)
                        end)
                    end,
                },
                {
                    "Ordelle's Caves.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -102.91, 0.1, 632.9, 128, xi.zone.ORDELLES_CAVES, 13)
                        end)
                    end,
                },
                {
                    "Gusgen Mines.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 59.91, -67.93, -267.18, 192, xi.zone.GUSGEN_MINES, 14)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region2
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Derfland =
            {
                {
                    "Pashhow Marshlands.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 466.06, 24.0, 410.91, 32, xi.zone.PASHHOW_MARSHLANDS, 24)
                        end)
                    end,
                },
                {
                    "Crawler's Nest.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 364.0, -32.2, -22.03, 64, xi.zone.CRAWLERS_NEST, 27)
                        end)
                    end,
                },
                {
                    "Rolanberry Fields.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -227.97, 4.54, 386.94, 64, xi.zone.ROLANBERRY_FIELDS, 25)
                        end)
                    end,
                },
                {
                    "Beadeaux.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -263.99, 1.59, 105.86, 192, xi.zone.BEADEAUX, 26)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region3
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Kolshushu =
            {
                {
                    "Buburimu Peninsula.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -485.74, -32.0, 47.32, 64, xi.zone.BUBURIMU_PENINSULA, 33)
                        end)
                    end,
                },
                {
                    "Tahrongi Canyon.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -160.0, 47.25, 647.11, 192, xi.zone.TAHRONGI_CANYON, 32)
                        end)
                    end,
                },
                {
                    "Maze Of Shakhrami.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -338.99, -12.21, -179.0, 0, xi.zone.MAZE_OF_SHAKHRAMI, 34)
                        end)
                    end,
                },
                {
                    "Labyrinth Of Onzozo.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -62.3, -20.1, -280.69, 160, xi.zone.LABYRINTH_OF_ONZOZO, 35)
                        end)
                    end,
                },
                {
                    "Bibiki Bay.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 493.72, -3.04, 728.05, 0, xi.zone.BIBIKI_BAY, 31)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region3
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Aragoneu =
            {
                {
                    "Meriphataud Mountains.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -297.76, 17.0, 422.22, 224, xi.zone.MERIPHATAUD_MOUNTAINS, 36)
                        end)
                    end,
                },
                {
                    "Garlaige Citadel.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -381.75, -6.0, 363.5, 128, xi.zone.GARLAIGE_CITADEL, 39)
                        end)
                    end,
                },
                {
                    "Sauromugue Champaign.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 344.83, 6.22, -255.3, 96, xi.zone.SAUROMUGUE_CHAMPAIGN, 37)
                        end)
                    end,
                },
                {
                    "Castle Oztroja.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -221.0, 0.25, -14.25, 192, xi.zone.CASTLE_OZTROJA, 38)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region3
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Qufim =
            {
                {
                    "Qufim Island.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -251.98, -19.96, 298.21, 64, xi.zone.QUFIM_ISLAND, 44)
                        end)
                    end,
                },
                {
                    "Lower Delkfutt's Tower.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 462.73, 0.0, -51.0, 0, xi.zone.LOWER_DELKFUTTS_TOWER, 46)
                        end)
                    end,
                },
                {
                    "Behemoth's Dominion.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 337.41, 26.63, -73.95, 128, xi.zone.BEHEMOTHS_DOMINION, 45)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region3
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Kuzotz =
            {
                {
                    "Eastern Altepa Desert.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -258.88, 8.6, -265.0, 128, xi.zone.EASTERN_ALTEPA_DESERT, 50)
                        end)
                    end,
                },
                {
                    "Western Altepa Desert.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 419.33, -3.12, 11.68, 32, xi.zone.WESTERN_ALTEPA_DESERT, 51)
                        end)
                    end,
                },
                {
                    "Rabao.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -3.41, -2.7, -93.6, 64, xi.zone.RABAO, 52)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region4
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Vollbow =
            {
                {
                    "Cape Teriggan.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -186.67, 7.9, -67.0, 128, xi.zone.CAPE_TERIGGAN, 53)
                        end)
                    end,
                },
                {
                    "Kuftal Tunnel.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -16.84, -20.47, -237.0, 0, xi.zone.KUFTAL_TUNNEL, 55)
                        end)
                    end,
                },
                {
                    "Gustav Tunnel.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 296.68, -40.42, 64.68, 96, xi.zone.GUSTAV_TUNNEL, 56)
                        end)
                    end,
                },
                {
                    "Valley Of Sorrows.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -163.3, -8.29, 23.04, 0, xi.zone.VALLEY_OF_SORROWS, 54)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region4
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Elshimo_Low =
            {
                {
                    "Yuhtunga Jungle.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -239.51, 0.0, -402.77, 64, xi.zone.YUHTUNGA_JUNGLE, 57)
                        end)
                    end,
                },
                {
                    "Sea Serpent Grotto.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 223.97, -23.71, 334.99, 128, xi.zone.SEA_SERPENT_GROTTO, 58)
                        end)
                    end,
                },
                {
                    "Kazham.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -41.21, -10.0, -93.0, 0, xi.zone.KAZHAM, 59)
                        end)
                    end,
                },
                {
                    "Norg.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -13.84, 1.1, -33.14, 32, xi.zone.NORG, 60)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region4
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Elshimo_Up =
            {
                {
                    "Yhoator Jungle.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 197.82, 0.0, -81.82, 160, xi.zone.YHOATOR_JUNGLE, 61)
                        end)
                    end,
                },
                {
                    "Temple Of Uggalepih.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 60.01, -8.0, 58.19, 64, xi.zone.TEMPLE_OF_UGGALEPIH, 62)
                        end)
                    end,
                },
                {
                    "Ifrit's Cauldron.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 89.0, 0.32, -298.11, 192, xi.zone.IFRITS_CAULDRON, 63)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region4
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Norvallen =
            {
                {
                    "Jugner Forest.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 62.99, 0.0, -12.75, 65, xi.zone.JUGNER_FOREST, 16)
                        end)
                    end,
                },
                {
                    "Eldieme Necropolis.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 419.21, -52.25, -99.5, 128, xi.zone.THE_ELDIEME_NECROPOLIS, 19)
                        end)
                    end,
                },
                {
                    "Batallia Downs.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -67.0, -1.7, 448.25, 192, xi.zone.BATALLIA_DOWNS, 17)
                        end)
                    end,
                },
                {
                    "Davoi.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 221.75, -1.0, -10.0, 0, xi.zone.DAVOI, 18)
                        end)
                    end,
                },
                {
                    "Carpenter's Landing.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 224.99, -2.0, -529.26, 192, xi.zone.CARPENTERS_LANDING, 15)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region5
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Movalpolis =
            {
                {
                    "Oldton Movalpolos.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -260.78, 8.0, -54.0, 128, xi.zone.OLDTON_MOVALPOLOS, 65)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region5
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_LiTelor =
            {
                {
                    "Sanctuary Of Zi'Tah.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -44.98, 0.27, -149.86, 64, xi.zone.THE_SANCTUARY_OF_ZITAH, 47)
                        end)
                    end,
                },
                {
                    "Ro'Maeve.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 13.75, -28.25, 54.04, 32, xi.zone.ROMAEVE, 48)
                        end)
                    end,
                },
                {
                    "Dragon's Aery.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -60.33, -1.17, -33.69, 160, xi.zone.DRAGONS_AERY, 49)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region5
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_TuLia =
            {
                {
                    "Ru'Aun Gardens.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 12.99, -54.16, -594.21, 192, xi.zone.RUAUN_GARDENS, 64)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region5
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Fauregandi =
            {
                {
                    "Beaucedine Glacier.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -28.92, -59.0, -124.07, 32, xi.zone.BEAUCEDINE_GLACIER, 40)
                        end)
                    end,
                },
                {
                    "Ranguemont Pass.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -145.24, 4.37, -298.79, 160, xi.zone.RANGUEMONT_PASS, 41)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region6
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Valdeaunia =
            {
                {
                    "Xarcabard.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 203.98, -24.27, -204.31, 192, xi.zone.XARCABARD, 42)
                        end)
                    end,
                },
                {
                    "Castle Zvahl Bailey's.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 372.0, -12.05, -23.85, 64, xi.zone.CASTLE_ZVAHL_BAILEYS, 43)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region6
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_West_Aht_Urhgan =
            {
                {
                    "Aht Urhgan Whitegate.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 133.13, 0.0, 16.17, 224, xi.zone.AHT_URHGAN_WHITEGATE, 5)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region6
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Arrapago_Islands =
            {
                {
                    "Nashmau.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -18.8, 0.0, -33.01, 128, xi.zone.NASHMAU, 74)
                        end)
                    end,
                },
                {
                    "Caedarva Mire.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -660.0, -13.36, 342.78, 64, xi.zone.CAEDARVA_MIRE, 76)
                        end)
                    end,
                },
                {
                    "Arrapago Reef.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 475.97, -15.64, -20.0, 128, xi.zone.ARRAPAGO_REEF, 75)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region6
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Mamool_Ja_Savagelands =
            {
                {
                    "Wajaom Woodlands.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -838.97, -20.0, 99.19, 64, xi.zone.WAJAOM_WOODLANDS, 70)
                        end)
                    end,
                },
                {
                    "Mamook.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 217.16, -23.84, -103.14, 32, xi.zone.MAMOOK, 71)
                        end)
                    end,
                },
                {
                    "Aydeewa Subterrane.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 5.0, 20.67, -89.98, 128, xi.zone.AYDEEWA_SUBTERRANE, 72)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region7
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Halvung_Territory =
            {
                {
                    "Halvung.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 503.23, -0.17, 241.76, 32, xi.zone.HALVUNG, 73)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region7
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Tavnazian_Archipelago =
            {
                {
                    "Lufaise Meadows.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -554.0, -6.2, -57.11, 192, xi.zone.LUFAISE_MEADOWS, 66)
                        end)
                    end,
                },
                {
                    "Misareaux Coast.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -60.98, -29.96, 262.22, 64, xi.zone.MISAREAUX_COAST, 67)
                        end)
                    end,
                },
                {
                    "Phomiuna Aqueducts.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 253.18, 0.0, -266.02, 128, xi.zone.PHOMIUNA_AQUEDUCTS, 68)
                        end)
                    end,
                },
                {
                    "Sacrarium.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -219.99, -12.0, 58.27, 64, xi.zone.SACRARIUM, 69)
                        end)
                    end,
                },
                {
                    "Tavnazian Safehold.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -4.99, -28.08, 103.1, 64, xi.zone.TAVNAZIAN_SAFEHOLD, 4)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region7
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Ronfaure_Front =
            {
                {
                    "East Ronfaure [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 662.02, -18.96, -595.91, 64, xi.zone.EAST_RONFAURE_S, 78)
                        end)
                    end,
                },
                {
                    "Southern San d'Oria [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 82.02, 1.0, -66.79, 64, xi.zone.SOUTHERN_SAN_DORIA_S, 77)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region7
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Gustaberg_Front =
            {
                {
                    "North Gustaberg [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -289.0, 38.64, 531.99, 192, xi.zone.NORTH_GUSTABERG_S, 83)
                        end)
                    end,
                },
                {
                    "Grauberg [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 794.0, 71.48, 773.16, 64, xi.zone.GRAUBERG_S, 84)
                        end)
                    end,
                },
                {
                    "Bastok Markets [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -246.17, 0.0, 94.13, 160, xi.zone.BASTOK_MARKETS_S, 82)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region8
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Sarutabaruta_Front =
            {
                {
                    "West. Sarutabaruta [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 83.0, -24.65, 566.09, 192, xi.zone.WEST_SARUTABARUTA_S, 90)
                        end)
                    end,
                },
                {
                    "Fort Karugo-Narugo [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 125.37, -20.91, 605.38, 224, xi.zone.FORT_KARUGO_NARUGO_S, 91)
                        end)
                    end,
                },
                {
                    "Windurst Waters [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -57.08, -5.71, 215.99, 128, xi.zone.WINDURST_WATERS_S, 89)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region8
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Derfland_Front =
            {
                {
                    "Vunkerl Inlet [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -521.01, -32.36, 205.91, 192, xi.zone.VUNKERL_INLET_S, 85)
                        end)
                    end,
                },
                {
                    "Pashhow Marshlands [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 547.8, 25.0, -341.0, 0, xi.zone.PASHHOW_MARSHLANDS_S, 86)
                        end)
                    end,
                },
                {
                    "Rolanberry Fields [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -38.0, 0.5, -866.97, 224, xi.zone.ROLANBERRY_FIELDS_S, 87)
                        end)
                    end,
                },
                {
                    "Crawler's Nest [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 363.99, -32.2, -22.07, 64, xi.zone.CRAWLERS_NEST_S, 88)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region8
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Norvallen_Front =
            {
                {
                    "Jugner Forest [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -193.97, -7.75, -493.8, 64, xi.zone.JUGNER_FOREST_S, 79)
                        end)
                    end,
                },
                {
                    "Batallia Downs [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -404.0, -16.02, -164.28, 192, xi.zone.BATALLIA_DOWNS_S, 80)
                        end)
                    end,
                },
                {
                    "Eldieme Necropolis [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 419.29, -52.25, -99.41, 128, xi.zone.THE_ELDIEME_NECROPOLIS_S, 81)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region8
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Aragoneu_Front =
            {
                {
                    "Meriphataud Mountains [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 732.9, -33.5, -10.0, 0, xi.zone.MERIPHATAUD_MOUNTAINS_S, 92)
                        end)
                    end,
                },
                {
                    "Sauromugue Champaign [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 475.97, -8.04, -438.29, 192, xi.zone.SAUROMUGUE_CHAMPAIGN_S, 93)
                        end)
                    end,
                },
                {
                    "Garlaige Citadel [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -301.8, -6.08, 127.37, 128, xi.zone.GARLAIGE_CITADEL_S, 94)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region9
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Fauregandi_Front =
            {
                {
                    "Beaucedine Glacier [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -144.01, -80.13, 232.59, 192, xi.zone.BEAUCEDINE_GLACIER_S, 95)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region9
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_Valdeaunia_Front =
            {
                {
                    "Castle Zvahl Bailey's [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 372.0, -12.05, -23.78, 64, xi.zone.CASTLE_ZVAHL_BAILEYS_S, 96)
                        end)
                    end,
                },
                {
                    "Back",
                    function(playerArg)
                        menu1.options = region9
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }

            menu1.options = region1
            delaySendMenu(player, menu1)
        end,
    })

    utils.unused(survivalguide)
end)

return m
