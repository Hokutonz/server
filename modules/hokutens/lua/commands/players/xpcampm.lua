local commandObj = {}

commandObj.cmdprops = {
    permission = 0,
    parameters = 'is'
}

require('modules/module_utils')

local menu = {}
local pages = {}
local currentPageIndex = 1

local teleportPlayer = function(player, x, y, z, rot, zone, instructions)
    -- Check if the player has the BOARDING_PERMIT item
    if zone == xi.zone.WAJAOM_WOODLANDS and not player:hasKeyItem(xi.ki.BOARDING_PERMIT) then
        player:printToPlayer("You need the Key Item (Boading Permit) to teleport to Wajaom Woodlands.")
        return
    end

    player:injectActionPacket(player:getID(), 5, 235, 0, 0, 0, 10, 1)

    player:timer(2000, function()
        player:setPos(x, y, z, rot, zone)
        player:printToPlayer("Camp Info: " .. instructions)
    end)
end


pages = {
    {
        title = 'Page 1',
        options = {
            {
                'Valkurm Dunes (10-20)',
                function(playerArg)
                    teleportPlayer(playerArg, 132.5020, -7.5000, 94.9417, 191, xi.zone.VALKURM_DUNES, "Start with page 1 and go to (E-7). At ~Lv 24, move to page 3 or 5 and take up your camp at the Oasis (I-7)")
                end,
            },
            {
                'Maze of Shakhrami (14-25)',
                function(playerArg)
                    teleportPlayer(playerArg, -339.4012, -10.9801, -169.0158, 192, xi.zone.MAZE_OF_SHAKHRAMI, "This is an ideal camp using sub BLM for the fastest leveling speed. Just do pages in order till you want to move camps.")
                end,
            },
            {
                'Qufim Island (24-40)',
                function(playerArg)
                    teleportPlayer(playerArg, -260.0685, -20.0000, 300.0856, 249, xi.zone.QUFIM_ISLAND, "(H-5) til ~Lv37 or page 5 with right party set up, For this page, you will camp (G-6). This will take you to 40.")
                end,
            },
            {
                'Korroloka Tunnel (25-44)',
                function(playerArg)
                    teleportPlayer(playerArg, 442.1136, -30.3122, 181.5787, 183, xi.zone.KORROLOKA_TUNNEL, "Page 1 till level 33ish. Then change to page 4 until level 44. At this point you can move on to Crawlers Nest")
                end,
            },
        },
    },
    {
        title = 'Page 2',
        options = {
            {
                'Eastern Altepa Desert (32-36)',
                function(playerArg)
                    teleportPlayer(playerArg, -62.6454, 3.9492, 233.6983, 91, xi.zone.EASTERN_ALTEPA_DESERT, "Page 1 is roaming the desert, killing spiders.")
                end,
            },
            {
                'Crawlers Nest (36-56)',
                function(playerArg)
                    teleportPlayer(playerArg, 355.0850, -32.2608, -22.2605, 122, xi.zone.CRAWLERS_NEST, "Page 1 from the Grounds Tome near the entrance. You may need a party member or two until level 40 Or the use of Trusts.")
                end,
            },
            {
                'Garlaige Citadel (40-50)',
                function(playerArg)
                    teleportPlayer(playerArg, -379.7122, -5.9999, 365.8749, 61, xi.zone.GARLAIGE_CITADEL, "Page 2 This is a roaming camp from the entrance to the first Banishing Gate. Your targets are bats and beetles.")
                end,
            },
            {
                'Rolanberry Fields (40-49)',
                function(playerArg)
                    teleportPlayer(playerArg, -91.8976, -0.9868, -905.9633, 171, xi.zone.ROLANBERRY_FIELDS, "Page 5 and make your way to G-11 > H-12 area. Once you have been here awhile, you will figure out a figure 8 style route.")
                end,
            },
        },
    },
    {
        title = 'Page 3',
        options = {
            {
                'Gustav Tunnel (42-50)',
                function(playerArg)
                    teleportPlayer(playerArg, -59.6356, -10.4150, -128.8245, 61, xi.zone.GUSTAV_TUNNEL, "Page 1 works, Beward of NM Bune.")
                end,
            },
			{
                'Eastern Altepa Desert (48-59)',
                function(playerArg)
                    teleportPlayer(playerArg, -259.0851, 8.5445, -263.0285, 224, xi.zone.EASTERN_ALTEPA_DESERT, "Page 5, Killing Gobs... and a Manticore.")
                end,
            },
			{
                'The Boyahda Tree (54-75)',
                function(playerArg)
                    teleportPlayer(playerArg, 74.9833, 8.8262, 142.0288, 121, xi.zone.THE_BOYAHDA_TREE, "Page 1, It's slow kills at first but speeds up with Grounds Tombs bonuses")
                end,
			},
			{
                'Western Altepa Desert (52-60)',
                function(playerArg)
                    teleportPlayer(playerArg, -217.0238, -11.1485, 104.0706, 176, xi.zone.WESTERN_ALTEPA_DESERT, "Page 3, (11 mobs, WTF!). When soloing, the beetles give massive amounts of EXP and goes rather fast. This camp is located in the H-8 > H-7 area")
                end,
            },
        },
    },
    {
        title = 'Page 4',
        options = {
            {
                'Wajaom Woodlands (54-62)',
                function(playerArg)
                    teleportPlayer(playerArg, -200.0807, -10.0000, 79.7890, 179, xi.zone.WAJAOM_WOODLANDS, "There is no page bonus for this camp, but the EXP is amazing camp near G-8, Kill Lesser Colibri")
                end,
            },
            {
                'Romaeve (60-75)',
                function(playerArg)
                    teleportPlayer(playerArg, 0.2414, -8.1300, -146.6911, 195, xi.zone.ROMAEVE, "Choose page 1, and run the entire map in a circle. Magic users beware! Magic agroes from very far and even through walls)")
                end,
            },
            {
                'Cape Teriggan (60-75)',
                function(playerArg)
                    teleportPlayer(playerArg, -187.4448, 7.9840, -74.6200, 196, xi.zone.CAPE_TERIGGAN, "One of the best solo camps, and a great place to level up your skills!Get page 1, Your camp will be around the Outpost.")
                end,
            },
            {
                'Kuftal Tunnel (60-75)',
                function(playerArg)
                    teleportPlayer(playerArg, -21.3402, -19.9031, -235.2025, 171, xi.zone.KUFTAL_TUNNEL, "Page 1 It's best to camp near the sandfalls at (J-9). Guivre roams the main area. Take care.")
                end,	
            },
		},
    },
    {
        title = 'Page 5',
        options = {
            {
                'Ifrits Cauldron (60-75)',
                function(playerArg)
                    teleportPlayer(playerArg, -17.3719, 3.5274, -257.7261, 42, xi.zone.IFRITS_CAULDRON, "Page 2, The mobs per page and page yields makes this currently the best camp. Can do merits here also.")
                end,
            },
            {
                'Ranguemont Pass (65-75)',
                function(playerArg)
                    teleportPlayer(playerArg, 286.5375, -65.5019, 262.6855, 124, xi.zone.RANGUEMONT_PASS, "Page 6, This camp is awesome and yields amazing EXP after just a half an hour or so of killing, but is very dangerous.")
                end,
            },
        },
    },
}

local delaySendMenu = function(player)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

local displayCurrentPage = function(player)
    menu.title = pages[currentPageIndex].title
    menu.options = pages[currentPageIndex].options
    delaySendMenu(player)
end

local nextPage = function(player)
    currentPageIndex = currentPageIndex + 1
    if currentPageIndex > #pages then
        currentPageIndex = 1
    end
    displayCurrentPage(player)
end

local previousPage = function(player)
    currentPageIndex = currentPageIndex - 1
    if currentPageIndex < 1 then
        currentPageIndex = #pages
    end
    displayCurrentPage(player)
end

for i = 1, #pages do
    table.insert(pages[i].options, {'Next Page', nextPage})
    table.insert(pages[i].options, {'Previous Page', previousPage})
end

-- Add the check for jail before triggering the commandObj
commandObj.onTrigger = function(player, args)
    if player:getCharVar('inJail') > 0 then
        player:printToPlayer("You are in jail buddy... you ain't going nowhere!")
        return
    end
	
	if player:hasEnmity() then
        player:printToPlayer("You can't use this command when you have Enmity.")
        return
    end

    currentPageIndex = 1
    displayCurrentPage(player)
end

return commandObj


