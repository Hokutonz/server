-----------------------------------
-- Organ Harvester (Port Jeuno)
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
require("scripts/globals/missions")
require("modules/module_utils")
require("scripts/zones/Leafallia/Zone")
local ID = require("scripts/zones/Leafallia/IDs")
-----------------------------------
local m = Module:new("organ_harvester")

m:addOverride("xi.zones.Leafallia.Zone.onInitialize", function(zone)
    super(zone)

    local itemList =
    {
        -- Item Name            | Item Var              | Item ID       | Stack Size
        -- Sea Organs
        {"Phuabo Organ",        "[Organ]Phuabo",        1784,           12},
        {"Xzomit Organ",        "[Organ]Xzomit",        1785,           12},
        {"Aern Organ",          "[Organ]Aern",          1786,           12},
        {"Hpemde Organ",        "[Organ]Hpemde",        1787,           12},
        {"Yovra Organ",         "[Organ]Yovra",         1788,           12},
        {"Euvhi Organ",         "[Organ]Euvhi",         1818,           12},
        {"H.Q. Phuabo Organ",   "[Organ]HQPhuabo",      1852,           1},
        {"H.Q. Xzomit Organ",   "[Organ]HQXzomit",      1855,           1},
        {"H.Q. Aern Organ",     "[Organ]HQAern",        1900,           1},
        {"H.Q. Hpemde Organ",   "[Organ]HQHpemde",      1871,           1},
        {"H.Q. Euvhi Organ",    "[Organ]HQEuvhi",       1899,           1},
        {"Luminian Tissue",     "[Organ]LTissue",       1783,           12},
        -- Apollyon Items
        {"Argyro Rivet",        "[Apo]WAR",             1931,           12},
        {"Ancient Brass",       "[Apo]MNK",             1933,           12},
        {"Benedict Yarn",       "[Apo]WHM",             1935,           12},
        {"Diabolic Yarn",       "[Apo]BLM",             1937,           12},
        {"Cardinal Cloth",      "[Apo]RDM",             1939,           12},
        {"Light Filament",      "[Apo]THF",             1941,           12},
        {"White Rivet",         "[Apo]PLD",             1943,           12},
        {"Black Rivet",         "[Apo]DRK",             1945,           12},
        {"Fetid Lanolin",       "[Apo]BST",             1947,           12},
        {"Brown Doeskin",       "[Apo]BRD",             1949,           12},
        {"Charcoal Cotton",     "[Apo]RNG",             1951,           12},
        {"Kurogane",            "[Apo]SAM",             1953,           12},
        {"Ebony Lacquer",       "[Apo]NIN",             1955,           12},
        {"Blue Rivet",          "[Apo]DRG",             1957,           12},
        {"Astral Leather",      "[Apo]SMN",             1959,           12},
        {"Flameshun Cloth",     "[Apo]BLU",             2657,           12},
        {"Canvas Toile",        "[Apo]COR",             2659,           12},
        {"Corduroy Cloth",      "[Apo]PUP",             2661,           12},
        {"Gold Stud",           "[Apo]DNC",             2715,           12},
        {"Electrum Stud",       "[Apo]SCH",             2717,           12},
        -- Temenos Items
        {"Ecarlate Cloth",      "[Tem]WAR",             1930,           12},
        {"Utopian Gold Thread", "[Tem]MNK",             1932,           12},
        {"Benedict Silk",       "[Tem]WHM",             1934,           12},
        {"Diabolic Silk",       "[Tem]BLM",             1936,           12},
        {"Ruby Silk Thread",    "[Tem]RDM",             1938,           12},
        {"Supple Skin",         "[Tem]THF",             1940,           12},
        {"Snowy Cermet",        "[Tem]PLD",             1942,           12},
        {"Dark Orichalcum",     "[Tem]DRK",             1944,           12},
        {"Smalt Leather",       "[Tem]BST",             1946,           12},
        {"Coiled Yarn",         "[Tem]BRD",             1948,           12},
        {"Chameleon Yarn",      "[Tem]RNG",             1950,           12},
        {"Scarlet Odoshi",      "[Tem]SAM",             1952,           12},
        {"Plaited Cord",        "[Tem]NIN",             1954,           12},
        {"Cobalt Mythril Sheet","[Tem]DRG",             1956,           12},
        {"Glittering Yarn",     "[Tem]SMN",             1958,           12},
        {"Luminian Thread",     "[Tem]BLU",             2656,           12},
        {"Silkworm Thread",     "[Tem]COR",             2658,           12},
        {"Pantin Wire",         "[Tem]PUP",             2660,           12},
        {"Filet Lace",          "[Tem]DNC",             2714,           12},
        {"Brilliantine",        "[Tem]SCH",             2716,           12},
    }

    local organhavester = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Organ-Harvester",
        look = 3092,
        x = -35.1121,
        y = -0.2468,
        z = 29.8375,
        rotation = 19,
        widescan = 1,

        -- Trade in sea organs for storage
        onTrade = function(player, npc, trade)
            local totalItems = 0
            local itemQty = 0
            local newItemTotal = 0
            
            -- Calculate total item count
            for i = 1, #itemList do
                totalItems = totalItems + trade:getItemQty(itemList[i][3])
            end

            -- Validate only items were traded
            if trade:getItemCount() ~= totalItems then
                player:printToPlayer("Please only trade me valid items.", 0, npc:getPacketName())
                return
            end

            -- Store the items and print the confirmation messages
            for i = 1, #itemList do
                itemQty = trade:getItemQty(itemList[i][3])
                if itemQty > 0 then
                    newItemTotal = itemQty + player:getCharVar(itemList[i][2])
                    player:setCharVar(itemList[i][2], newItemTotal)
                    player:printToPlayer(string.format("[%s] -> Stored: %d, New Total: %d", itemList[i][1], itemQty, newItemTotal), 17)
                end
            end

            -- Complete the trade (take their items)
            player:tradeComplete()
        end,

        -- Retrieve items from storage
        onTrigger = function(player, npc)
            local mainMenu  = {}
            local organ1    = {}
            local organ2    = {}
            local apollyon1 = {}
            local apollyon2 = {}
            local apollyon3 = {}
            local apollyon4 = {}
            local temenos1  = {}
            local temenos2  = {}
            local temenos3  = {}
            local temenos4  = {}
            local phuabo    = {}
            local xzomit    = {}
            local aern      = {}
            local hpemde    = {}
            local yovra     = {}
            local euvhi     = {}
            local hqPhuabo  = {}
            local hqXzomit  = {}
            local hqAern    = {}
            local hqHpemde  = {}
            local hqEuvhi   = {}
            local lTissue   = {}
            local apoWAR    = {}
            local apoMNK    = {}
            local apoWHM    = {}
            local apoBLM    = {}
            local apoRDM    = {}
            local apoTHF    = {}
            local apoPLD    = {}
            local apoDRK    = {}
            local apoBST    = {}
            local apoBRD    = {}
            local apoRNG    = {}
            local apoSAM    = {}
            local apoNIN    = {}
            local apoDRG    = {}
            local apoSMN    = {}
            local apoBLU    = {}
            local apoCOR    = {}
            local apoPUP    = {}
            local apoDNC    = {}
            local apoSCH    = {}
            local temWAR    = {}
            local temMNK    = {}
            local temWHM    = {}
            local temBLM    = {}
            local temRDM    = {}
            local temTHF    = {}
            local temPLD    = {}
            local temDRK    = {}
            local temBST    = {}
            local temBRD    = {}
            local temRNG    = {}
            local temSAM    = {}
            local temNIN    = {}
            local temDRG    = {}
            local temSMN    = {}
            local temBLU    = {}
            local temCOR    = {}
            local temPUP    = {}
            local temDNC    = {}
            local temSCH    = {}

            -- Handles changing pages
            local delaySendMenu = function(player, page)
                player:timer(400, function(playerArg)
                    playerArg:customMenu(page)
                end)
            end

            -- Handles giving back items to players
            local giveBackItem = function(item, itemAmt, backPage)
                local itemName  = itemList[item][1]
                local itemVar   = itemList[item][2]
                local itemID    = itemList[item][3]
                local stackSize = itemList[item][4]
                local itemCount = player:getCharVar(itemVar)
                local freeSlots = player:getFreeSlotsCount()
                if itemCount == 0 or itemCount < itemAmt then
                    player:printToPlayer(string.format("You don't have enough %s stored for that.",itemName), 0, npc:getPacketName())
                elseif freeSlots < math.ceil(itemAmt / stackSize) then
                    player:printToPlayer("You don't have enough inventory space for that.", 0, npc:getPacketName())
                else
                    if npcUtil.giveItem(player, {{itemID, itemAmt}}) then
                        player:setCharVar(itemVar,itemCount - itemAmt)
                        return
                    end
                end

                delaySendMenu(player, backPage)
            end

            --------------------------------------------
            --------------- Main Menus -----------------
            --------------------------------------------
            -- Main menu
            mainMenu = 
            {
                title = "Access storage for",
                options = {
                    {
                        "Sea Organs",
                        function(playerArg)
                            delaySendMenu(player, organ1)
                        end,
                    },
                    {
                        "Apollyon Items",
                        function(playerArg)
                            delaySendMenu(player, apollyon1)
                        end,
                    },
                    {
                        "Temenos Items",
                        function(playerArg)
                            delaySendMenu(player, temenos1)
                        end,
                    },
                    {
                        "None",
                        function(playerArg)
                            return
                        end,
                    },
                }
            }

            -- Organ menu, page 1 (NQ organs)
            organ1 =
            {
                title = "Choose an organ to retrieve",
                options = {
                    {
                        "Phuabo",
                        function(playerArg)
                            delaySendMenu(player, phuabo)
                        end,
                    },
                    {
                        "Xzomit",
                        function(playerArg)
                            delaySendMenu(player, xzomit)
                        end,
                    },
                    {
                        "Aern",
                        function(playerArg)
                            delaySendMenu(player, aern)
                        end,
                    },
                    {
                        "Hpemde",
                        function(playerArg)
                            delaySendMenu(player, hpemde)
                        end,
                    },
                    {
                        "Yovra",
                        function(playerArg)
                            delaySendMenu(player, yovra)
                        end,
                    },
                    {
                        "Euvhi",
                        function(playerArg)
                            delaySendMenu(player, euvhi)
                        end,
                    },
                    {
                        "Next",
                        function(playerArg)
                            delaySendMenu(player, organ2)
                        end
                    },
                    {
                        "Menu",
                        function(playerArg)
                            delaySendMenu(player, mainMenu)
                        end,
                    },
                },
            }
            
            -- Organ menu, page 2 (HQ organs)
            organ2 =
            {
                title = "Choose an organ to retrieve",
                options = {
                    {
                        "H.Q. Phuabo",
                        function(playerArg)
                            delaySendMenu(player, hqPhuabo)
                        end,
                    },
                    {
                        "H.Q. Xzomit",
                        function(playerArg)
                            delaySendMenu(player, hqXzomit)
                        end,
                    },
                    {
                        "H.Q. Aern",
                        function(playerArg)
                            delaySendMenu(player, hqAern)
                        end,
                    },
                    {
                        "H.Q. Hpemde",
                        function(playerArg)
                            delaySendMenu(player, hqHpemde)
                        end,
                    },
                    {
                        "H.Q. Euvhi",
                        function(playerArg)
                            delaySendMenu(player, hqEuvhi)
                        end,
                    },
                    {
                        "Luminian Tissue",
                        function(playerArg)
                            delaySendMenu(player, lTissue)
                        end,
                    },
                    {
                        "Prev",
                        function(playerArg)
                            delaySendMenu(player, organ1)
                        end
                    },
                    {
                        "Menu",
                        function(playerArg)
                            delaySendMenu(player, mainMenu)
                        end
                    },
                },
            }

            -- Apollyon menu, page 1 (WAR to RDM)
            apollyon1 =
            {
                title = "Job:",
                options = {
                    {
                        "WAR",
                        function(playerArg)
                            delaySendMenu(player, apoWAR)
                        end,
                    },
                    {
                        "MNK",
                        function(playerArg)
                            delaySendMenu(player, apoMNK)
                        end,
                    },
                    {
                        "WHM",
                        function(playerArg)
                            delaySendMenu(player, apoWHM)
                        end,
                    },
                    {
                        "BLM",
                        function(playerArg)
                            delaySendMenu(player, apoBLM)
                        end,
                    },
                    {
                        "RDM",
                        function(playerArg)
                            delaySendMenu(player, apoRDM)
                        end,
                    },
                    {
                        "Next",
                        function(playerArg)
                            delaySendMenu(player, apollyon2)
                        end
                    },
                    {
                        "Menu",
                        function(playerArg)
                            delaySendMenu(player, mainMenu)
                        end
                    },
                },
            }

            -- Apollyon menu, page 2 (THF to BRD)
            apollyon2 =
            {
                title = "Job:",
                options = {
                    {
                        "THF",
                        function(playerArg)
                            delaySendMenu(player, apoTHF)
                        end,
                    },
                    {
                        "PLD",
                        function(playerArg)
                            delaySendMenu(player, apoPLD)
                        end,
                    },
                    {
                        "DRK",
                        function(playerArg)
                            delaySendMenu(player, apoDRK)
                        end,
                    },
                    {
                        "BST",
                        function(playerArg)
                            delaySendMenu(player, apoBST)
                        end,
                    },
                    {
                        "BRD",
                        function(playerArg)
                            delaySendMenu(player, apoBRD)
                        end,
                    },
                    {
                        "Next",
                        function(playerArg)
                            delaySendMenu(player, apollyon3)
                        end
                    },
                    {
                        "Prev",
                        function(playerArg)
                            delaySendMenu(player, apollyon1)
                        end
                    },
                    {
                        "Menu",
                        function(playerArg)
                            delaySendMenu(player, mainMenu)
                        end
                    },
                },
            }

            -- Apollyon menu, page 3 (RNG to SMN)
            apollyon3 =
            {
                title = "Job:",
                options = {
                    {
                        "RNG",
                        function(playerArg)
                            delaySendMenu(player, apoRNG)
                        end,
                    },
                    {
                        "SAM",
                        function(playerArg)
                            delaySendMenu(player, apoSAM)
                        end,
                    },
                    {
                        "NIN",
                        function(playerArg)
                            delaySendMenu(player, apoNIN)
                        end,
                    },
                    {
                        "DRG",
                        function(playerArg)
                            delaySendMenu(player, apoDRG)
                        end,
                    },
                    {
                        "SMN",
                        function(playerArg)
                            delaySendMenu(player, apoSMN)
                        end,
                    },
                    {
                        "Next",
                        function(playerArg)
                            delaySendMenu(player, apollyon4)
                        end
                    },
                    {
                        "Prev",
                        function(playerArg)
                            delaySendMenu(player, apollyon2)
                        end
                    },
                    {
                        "Menu",
                        function(playerArg)
                            delaySendMenu(player, mainMenu)
                        end
                    },
                },
            }

            -- Apollyon menu, page 4 (BLU to SCH)
            apollyon4 =
            {
                title = "Job:",
                options = {
                    {
                        "BLU",
                        function(playerArg)
                            delaySendMenu(player, apoBLU)
                        end,
                    },
                     {
                        "COR",
                        function(playerArg)
                            delaySendMenu(player, apoCOR)
                        end,
                    },
                    {
                        "PUP",
                        function(playerArg)
                            delaySendMenu(player, apoPUP)
                        end,
                    },
                    {
                        "DNC",
                        function(playerArg)
                            delaySendMenu(player, apoDNC)
                        end,
                    },
                    {
                        "SCH",
                        function(playerArg)
                            delaySendMenu(player, apoSCH)
                        end,
                    },
                    {
                        "Prev",
                        function(playerArg)
                            delaySendMenu(player, apollyon3)
                        end
                    },
                    {
                        "Menu",
                        function(playerArg)
                            delaySendMenu(player, mainMenu)
                        end
                    },
                },
            }

            -- Temenos menu, page 1 (WAR to RDM)
            temenos1 =
            {
                title = "Job:",
                options = {
                    {
                        "WAR",
                        function(playerArg)
                            delaySendMenu(player, temWAR)
                        end,
                    },
                    {
                        "MNK",
                        function(playerArg)
                            delaySendMenu(player, temMNK)
                        end,
                    },
                    {
                        "WHM",
                        function(playerArg)
                            delaySendMenu(player, temWHM)
                        end,
                    },
                    {
                        "BLM",
                        function(playerArg)
                            delaySendMenu(player, temBLM)
                        end,
                    },
                    {
                        "RDM",
                        function(playerArg)
                            delaySendMenu(player, temRDM)
                        end,
                    },
                    {
                        "Next",
                        function(playerArg)
                            delaySendMenu(player, temenos2)
                        end
                    },
                    {
                        "Menu",
                        function(playerArg)
                            delaySendMenu(player, mainMenu)
                        end
                    },
                },
            }

            -- Temenos menu, page 2 (THF to BRD)
            temenos2 =
            {
                title = "Job:",
                options = {
                    {
                        "THF",
                        function(playerArg)
                            delaySendMenu(player, temTHF)
                        end,
                    },
                    {
                        "PLD",
                        function(playerArg)
                            delaySendMenu(player, temPLD)
                        end,
                    },
                    {
                        "DRK",
                        function(playerArg)
                            delaySendMenu(player, temDRK)
                        end,
                    },
                    {
                        "BST",
                        function(playerArg)
                            delaySendMenu(player, temBST)
                        end,
                    },
                    {
                        "BRD",
                        function(playerArg)
                            delaySendMenu(player, temBRD)
                        end,
                    },
                    {
                        "Next",
                        function(playerArg)
                            delaySendMenu(player, temenos3)
                        end
                    },
                    {
                        "Prev",
                        function(playerArg)
                            delaySendMenu(player, temenos1)
                        end
                    },
                    {
                        "Menu",
                        function(playerArg)
                            delaySendMenu(player, mainMenu)
                        end
                    },
                },
            }

            -- Temenos menu, page 3 (RNG to SMN)
            temenos3 =
            {
                title = "Job:",
                options = {
                    {
                        "RNG",
                        function(playerArg)
                            delaySendMenu(player, temRNG)
                        end,
                    },
                    {
                        "SAM",
                        function(playerArg)
                            delaySendMenu(player, temSAM)
                        end,
                    },
                    {
                        "NIN",
                        function(playerArg)
                            delaySendMenu(player, temNIN)
                        end,
                    },
                    {
                        "DRG",
                        function(playerArg)
                            delaySendMenu(player, temDRG)
                        end,
                    },
                    {
                        "SMN",
                        function(playerArg)
                            delaySendMenu(player, temSMN)
                        end,
                    },
                    {
                        "Next",
                        function(playerArg)
                            delaySendMenu(player, temenos4)
                        end
                    },
                    {
                        "Prev",
                        function(playerArg)
                            delaySendMenu(player, temenos2)
                        end
                    },
                    {
                        "Menu",
                        function(playerArg)
                            delaySendMenu(player, mainMenu)
                        end
                    },
                },
            }

            -- Temenos menu, page 4 (BLU to SCH)
            temenos4 =
            {
                title = "Job:",
                options = {
                    {
                        "BLU",
                        function(playerArg)
                            delaySendMenu(player, temBLU)
                        end,
                    },
                     {
                        "COR",
                        function(playerArg)
                            delaySendMenu(player, temCOR)
                        end,
                    },
                    {
                        "PUP",
                        function(playerArg)
                            delaySendMenu(player, temPUP)
                        end,
                    },
                    {
                        "DNC",
                        function(playerArg)
                            delaySendMenu(player, temDNC)
                        end,
                    },
                    {
                        "SCH",
                        function(playerArg)
                            delaySendMenu(player, temSCH)
                        end,
                    },
                    {
                        "Prev",
                        function(playerArg)
                            delaySendMenu(player, temenos3)
                        end
                    },
                    {
                        "Menu",
                        function(playerArg)
                            delaySendMenu(player, mainMenu)
                        end
                    },
                },
            }

            --------------------------------------------
            ------------ Sea Organ Menus ---------------
            --------------------------------------------
            -- Phuabo Organ
            phuabo =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[1][2]),itemList[1][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(1, 1, organ1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(1, 2, organ1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(1, 6, organ1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(1, 12, organ1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(1, player:getCharVar(itemList[1][2]), organ1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, organ1)
                        end
                    },
                },
            }

            -- Xzomit Organ
            xzomit =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[2][2]),itemList[2][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(2, 1, organ1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(2, 2, organ1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(2, 6, organ1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(2, 12, organ1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(2, player:getCharVar(itemList[2][2]), organ1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, organ1)
                        end
                    },
                },
            }

            
            -- Aern Organ
            aern =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[3][2]),itemList[3][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(3, 1, organ1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(3, 2, organ1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(3, 6, organ1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(3, 12, organ1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(3, player:getCharVar(itemList[3][2]), organ1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, organ1)
                        end
                    },
                },
            }
            
            -- Hpemde Organ
            hpemde =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[4][2]),itemList[4][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(4, 1, organ1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(4, 2, organ1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(4, 6, organ1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(4, 12, organ1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(4, player:getCharVar(itemList[4][2]), organ1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, organ1)
                        end
                    },
                },
            }
            
            -- Yovra Organ
            yovra =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[5][2]),itemList[5][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(5, 1, organ1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(5, 2, organ1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(5, 6, organ1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(5, 12, organ1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(5, player:getCharVar(itemList[5][2]), organ1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, organ1)
                        end
                    },
                },
            }
            
            -- Euvhi Organ
            euvhi =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[6][2]),itemList[6][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(6, 1, organ1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(6, 2, organ1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(6, 6, organ1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(6, 12, organ1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(6, player:getCharVar(itemList[6][2]), organ1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, organ1)
                        end
                    },
                },
            }
            
            -- H.Q. Phuabo Organ
            hqPhuabo =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[7][2]),itemList[7][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(7, 1, organ2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(7, 2, organ2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(7, 6, organ2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(7, 12, organ2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(7, player:getCharVar(itemList[7][2]), organ2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, organ2)
                        end
                    },
                },
            }
            
            -- H.Q. Xzomit Organ
            hqXzomit =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[8][2]),itemList[8][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(8, 1, organ2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(8, 2, organ2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(8, 6, organ2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(8, 12, organ2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(8, player:getCharVar(itemList[8][2]), organ2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, organ2)
                        end
                    },
                },
            }
            
            -- H.Q. Aern Organ
            hqAern =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[9][2]),itemList[9][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(9, 1, organ2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(9, 2, organ2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(9, 6, organ2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(9, 12, organ2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(9, player:getCharVar(itemList[9][2]), organ2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, organ2)
                        end
                    },
                },
            }
            
            -- H.Q. Hpemde Organ
            hqHpemde =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[10][2]),itemList[10][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(10, 1, organ2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(10, 2, organ2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(10, 6, organ2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(10, 12, organ2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(10, player:getCharVar(itemList[10][2]), organ2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, organ2)
                        end
                    },
                },
            }
            
            -- H.Q. Euvhi Organ
            hqEuvhi =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[11][2]),itemList[11][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(11, 1, organ2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(11, 2, organ2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(11, 6, organ2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(11, 12, organ2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(11, player:getCharVar(itemList[11][2]), organ2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, organ2)
                        end
                    },
                },
            }

            -- Luminian Tissue
            lTissue =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[12][2]),itemList[12][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(12, 1, organ2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(12, 2, organ2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(12, 6, organ2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(12, 12, organ2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(12, player:getCharVar(itemList[12][2]), organ2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, organ2)
                        end
                    },
                },
            }

            --------------------------------------------
            ---------- Apollyon Items Menus ------------
            --------------------------------------------
            -- Argyro Rivet
            apoWAR =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[13][2]),itemList[13][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(13, 1, apollyon1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(13, 2, apollyon1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(13, 6, apollyon1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(13, 12, apollyon1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(13, player:getCharVar(itemList[13][2]), apollyon1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon1)
                        end
                    },
                },
            }

            -- Ancient Brass
            apoMNK =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[14][2]),itemList[14][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(14, 1, apollyon1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(14, 2, apollyon1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(14, 6, apollyon1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(14, 12, apollyon1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(14, player:getCharVar(itemList[14][2]), apollyon1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon1)
                        end
                    },
                },
            }

            -- Benedict Yarn
            apoWHM =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[15][2]),itemList[15][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(15, 1, apollyon1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(15, 2, apollyon1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(15, 6, apollyon1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(15, 12, apollyon1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(15, player:getCharVar(itemList[15][2]), apollyon1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon1)
                        end
                    },
                },
            }

            -- Diabolic Yarn
            apoBLM =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[16][2]),itemList[16][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(16, 1, apollyon1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(16, 2, apollyon1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(16, 6, apollyon1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(16, 12, apollyon1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(16, player:getCharVar(itemList[16][2]), apollyon1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon1)
                        end
                    },
                },
            }

            -- Cardinal Cloth
            apoRDM =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[17][2]),itemList[17][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(17, 1, apollyon1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(17, 2, apollyon1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(17, 6, apollyon1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(17, 12, apollyon1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(17, player:getCharVar(itemList[17][2]), apollyon1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon1)
                        end
                    },
                },
            }

            -- Light Filament
            apoTHF =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[18][2]),itemList[18][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(18, 1, apollyon2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(18, 2, apollyon2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(18, 6, apollyon2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(18, 12, apollyon2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(18, player:getCharVar(itemList[18][2]), apollyon2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon2)
                        end
                    },
                },
            }

            -- White Rivet
            apoPLD =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[19][2]),itemList[19][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(19, 1, apollyon2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(19, 2, apollyon2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(19, 6, apollyon2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(19, 12, apollyon2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(19, player:getCharVar(itemList[19][2]), apollyon2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon2)
                        end
                    },
                },
            }

            -- Black Rivet
            apoDRK =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[20][2]),itemList[20][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(20, 1, apollyon2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(20, 2, apollyon2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(20, 6, apollyon2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(20, 12, apollyon2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(20, player:getCharVar(itemList[20][2]), apollyon2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon2)
                        end
                    },
                },
            }

            -- Fetid Lanolin
            apoBST =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[21][2]),itemList[21][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(21, 1, apollyon2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(21, 2, apollyon2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(21, 6, apollyon2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(21, 12, apollyon2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(21, player:getCharVar(itemList[21][2]), apollyon2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon2)
                        end
                    },
                },
            }

            -- Brown Doeskin
            apoBRD =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[22][2]),itemList[22][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(22, 1, apollyon2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(22, 2, apollyon2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(22, 6, apollyon2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(22, 12, apollyon2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(22, player:getCharVar(itemList[22][2]), apollyon2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon2)
                        end
                    },
                },
            }

            -- Charcoal Cotton
            apoRNG =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[23][2]),itemList[23][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(23, 1, apollyon3)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(23, 2, apollyon3)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(23, 6, apollyon3)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(23, 12, apollyon3)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(23, player:getCharVar(itemList[23][2]), apollyon3)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon3)
                        end
                    },
                },
            }

            -- Kurogane
            apoSAM =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[24][2]),itemList[24][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(24, 1, apollyon3)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(24, 2, apollyon3)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(24, 6, apollyon3)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(24, 12, apollyon3)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(24, player:getCharVar(itemList[24][2]), apollyon3)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon3)
                        end
                    },
                },
            }

            -- Ebony Lacquer
            apoNIN =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[25][2]),itemList[25][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(25, 1, apollyon3)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(25, 2, apollyon3)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(25, 6, apollyon3)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(25, 12, apollyon3)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(25, player:getCharVar(itemList[25][2]), apollyon3)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon3)
                        end
                    },
                },
            }

            -- Blue Rivet
            apoDRG =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[26][2]),itemList[26][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(26, 1, apollyon3)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(26, 2, apollyon3)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(26, 6, apollyon3)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(26, 12, apollyon3)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(26, player:getCharVar(itemList[26][2]), apollyon3)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon3)
                        end
                    },
                },
            }

            -- Astral Leather
            apoSMN =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[27][2]),itemList[27][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(27, 1, apollyon3)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(27, 2, apollyon3)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(27, 6, apollyon3)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(27, 12, apollyon3)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(27, player:getCharVar(itemList[27][2]), apollyon3)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon3)
                        end
                    },
                },
            }

            -- Flameshun Cloth
            apoBLU =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[28][2]),itemList[28][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(28, 1, apollyon4)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(28, 2, apollyon4)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(28, 6, apollyon4)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(28, 12, apollyon4)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(28, player:getCharVar(itemList[28][2]), apollyon4)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon4)
                        end
                    },
                },
            }

            -- Canvas Toile
            apoCOR =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[29][2]),itemList[29][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(29, 1, apollyon4)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(29, 2, apollyon4)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(29, 6, apollyon4)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(29, 12, apollyon4)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(29, player:getCharVar(itemList[29][2]), apollyon4)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon4)
                        end
                    },
                },
            }

            -- Corduroy Cloth
            apoPUP =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[30][2]),itemList[30][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(30, 1, apollyon4)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(30, 2, apollyon4)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(30, 6, apollyon4)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(30, 12, apollyon4)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(30, player:getCharVar(itemList[30][2]), apollyon4)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon4)
                        end
                    },
                },
            }

            -- Gold Stud
            apoDNC =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[31][2]),itemList[31][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(31, 1, apollyon4)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(31, 2, apollyon4)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(31, 6, apollyon4)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(31, 12, apollyon4)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(31, player:getCharVar(itemList[31][2]), apollyon4)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon4)
                        end
                    },
                },
            }

            -- Electrum Stud
            apoSCH =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[32][2]),itemList[32][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(32, 1, apollyon4)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(32, 2, apollyon4)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(32, 6, apollyon4)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(32, 12, apollyon4)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(32, player:getCharVar(itemList[32][2]), apollyon4)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, apollyon4)
                        end
                    },
                },
            }

            --------------------------------------------
            ----------- Temenos Items Menus ------------
            --------------------------------------------
            -- Ecarlate Cloth
            temWAR =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[33][2]),itemList[33][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(33, 1, temenos1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(33, 2, temenos1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(33, 6, temenos1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(33, 12, temenos1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(33, player:getCharVar(itemList[33][2]), temenos1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos1)
                        end
                    },
                },
            }

            -- Utopian Gold Thread
            temMNK =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[34][2]),itemList[34][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(34, 1, temenos1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(34, 2, temenos1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(34, 6, temenos1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(34, 12, temenos1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(34, player:getCharVar(itemList[34][2]), temenos1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos1)
                        end
                    },
                },
            }

            -- Benedict Silk
            temWHM =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[35][2]),itemList[35][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(35, 1, temenos1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(35, 2, temenos1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(35, 6, temenos1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(35, 12, temenos1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(35, player:getCharVar(itemList[35][2]), temenos1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos1)
                        end
                    },
                },
            }

            -- Diabolic Silk
            temBLM =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[36][2]),itemList[36][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(36, 1, temenos1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(36, 2, temenos1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(36, 6, temenos1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(36, 12, temenos1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(36, player:getCharVar(itemList[36][2]), temenos1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos1)
                        end
                    },
                },
            }

            -- Ruby Silk Thread
            temRDM =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[37][2]),itemList[37][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(37, 1, temenos1)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(37, 2, temenos1)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(37, 6, temenos1)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(37, 12, temenos1)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(37, player:getCharVar(itemList[37][2]), temenos1)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos1)
                        end
                    },
                },
            }

            -- Supple Skin
            temTHF =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[38][2]),itemList[38][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(38, 1, temenos2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(38, 2, temenos2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(38, 6, temenos2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(38, 12, temenos2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(38, player:getCharVar(itemList[38][2]), temenos2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos2)
                        end
                    },
                },
            }

            -- Snowy Cermet
            temPLD =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[39][2]),itemList[39][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(39, 1, temenos2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(39, 2, temenos2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(39, 6, temenos2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(39, 12, temenos2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(39, player:getCharVar(itemList[39][2]), temenos2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos2)
                        end
                    },
                },
            }

            -- Dark Orichalcum
            temDRK =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[40][2]),itemList[40][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(40, 1, temenos2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(40, 2, temenos2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(40, 6, temenos2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(40, 12, temenos2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(40, player:getCharVar(itemList[40][2]), temenos2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos2)
                        end
                    },
                },
            }

            -- Smalt Leather
            temBST =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[41][2]),itemList[41][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(41, 1, temenos2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(41, 2, temenos2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(41, 6, temenos2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(41, 12, temenos2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(41, player:getCharVar(itemList[41][2]), temenos2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos2)
                        end
                    },
                },
            }

            -- Coiled Yarn
            temBRD =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[42][2]),itemList[42][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(42, 1, temenos2)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(42, 2, temenos2)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(42, 6, temenos2)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(42, 12, temenos2)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(42, player:getCharVar(itemList[42][2]), temenos2)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos2)
                        end
                    },
                },
            }
            
            -- Chameleon Yarn
            temRNG =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[43][2]),itemList[43][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(43, 1, temenos3)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(43, 2, temenos3)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(43, 6, temenos3)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(43, 12, temenos3)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(43, player:getCharVar(itemList[43][2]), temenos3)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos3)
                        end
                    },
                },
            }

            -- Scarlet Odoshi
            temSAM =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[44][2]),itemList[44][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(44, 1, temenos3)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(44, 2, temenos3)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(44, 6, temenos3)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(44, 12, temenos3)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(44, player:getCharVar(itemList[44][2]), temenos3)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos3)
                        end
                    },
                },
            }

            -- Plaited Cord
            temNIN =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[45][2]),itemList[45][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(45, 1, temenos3)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(45, 2, temenos3)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(45, 6, temenos3)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(45, 12, temenos3)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(45, player:getCharVar(itemList[45][2]), temenos3)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos3)
                        end
                    },
                },
            }

            -- Cobalt Mythril Sheet
            temDRG =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[46][2]),itemList[46][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(46, 1, temenos3)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(46, 2, temenos3)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(46, 6, temenos3)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(46, 12, temenos3)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(46, player:getCharVar(itemList[46][2]), temenos3)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos3)
                        end
                    },
                },
            }

            -- Glittering Yarn
            temSMN =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[47][2]),itemList[47][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(47, 1, temenos3)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(47, 2, temenos3)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(47, 6, temenos3)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(47, 12, temenos3)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(47, player:getCharVar(itemList[47][2]), temenos3)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos3)
                        end
                    },
                },
            }
            
            -- Luminian Thread
            temBLU =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[48][2]),itemList[48][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(48, 1, temenos4)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(48, 2, temenos4)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(48, 6, temenos4)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(48, 12, temenos4)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(48, player:getCharVar(itemList[48][2]), temenos4)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos4)
                        end
                    },
                },
            }

            -- Silkworm Thread
            temCOR =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[49][2]),itemList[49][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(49, 1, temenos4)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(49, 2, temenos4)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(49, 6, temenos4)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(49, 12, temenos4)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(49, player:getCharVar(itemList[49][2]), temenos4)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos4)
                        end
                    },
                },
            }

            -- Pantin Wire
            temPUP =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[50][2]),itemList[50][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(50, 1, temenos4)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(50, 2, temenos4)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(50, 6, temenos4)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(50, 12, temenos4)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(50, player:getCharVar(itemList[50][2]), temenos4)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos4)
                        end
                    },
                },
            }

            -- Filet Lace
            temDNC =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[51][2]),itemList[51][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(51, 1, temenos4)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(51, 2, temenos4)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(51, 6, temenos4)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(51, 12, temenos4)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(51, player:getCharVar(itemList[51][2]), temenos4)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos4)
                        end
                    },
                },
            }

            -- Brilliantine
            temSCH =
            {
                title = string.format("%d %s stored, Retrieve:",player:getCharVar(itemList[52][2]),itemList[52][1]),
                options = {
                    {
                        "[ 1]",
                        function(playerArg)
                            giveBackItem(52, 1, temenos4)
                        end,
                    },
                    {
                        "[ 2]",
                        function(playerArg)
                            giveBackItem(52, 2, temenos4)
                        end,
                    },
                    {
                        "[ 6]",
                        function(playerArg)
                            giveBackItem(52, 6, temenos4)
                        end,
                    },
                    {
                        "[12]",
                        function(playerArg)
                            giveBackItem(52, 12, temenos4)
                        end,
                    },
                    {
                        "[All]",
                        function(playerArg)
                            giveBackItem(52, player:getCharVar(itemList[52][2]), temenos4)
                        end,
                    },
                    {
                        "Back",
                        function(playerArg)
                            delaySendMenu(player, temenos4)
                        end
                    },
                },
            }

            -- Display Main Menu at Start
            delaySendMenu(player, mainMenu)
        end,
    })

    utils.unused(organhavester)
end)

return m
