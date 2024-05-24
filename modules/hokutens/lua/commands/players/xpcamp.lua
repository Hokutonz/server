local commandObj = {}

commandObj.cmdprops = 
{
    permission = 0,
    parameters = 'is'
}

-- Zone list with messages
local zoneList = {
    {10, 0x14, 0x60, xi.zone.VALKURM_DUNES, 132.5020, - 7.5000, 94.9417, 191, "10-20 Start with page 1 and go to (E-7), At ~Lv 24, move to page 3 or 5 and take up your camp at the Oasis (I-7)"},
    {14, 0x14, 0x15, xi.zone.MAZE_OF_SHAKHRAMI, -339.4012, -10.9801, -169.0158, 192,"14-25 This is an ideal camp using sub BLM for the fastest leveling speed Just do pages in order till you want to move camps."},
    {24, 0x14, 0x08, xi.zone.QUFIM_ISLAND, -260.0685, -20.0000, 300.0856, 249,"24-40 Page 3 (H-5) til ~Lv37 or page 5 with right party set up, For this page, you will camp (G-6). This will take you to 40."},
    {25, 0x14, 0x5B, xi.zone.KORROLOKA_TUNNEL, 442.1136, -30.3122, 181.5787, 183,
    "25-44 Page 1 until around level ~Lv33. Change to page 4, Until level ~Lv44. You can easily move to !xpcamp 36 at this point."},
    {32, 0x14, 0x3E, xi.zone.EASTERN_ALTEPA_DESERT, -62.6454, 3.9492, 233.6983, 91,"32-36 Page 1 is roaming the desert, killing spiders."},
    {36, 0x14, 0x2C, xi.zone.CRAWLERS_NEST, 355.0850, -32.2608, -22.2605, 122,"36-56 Page 1 from the Grounds Tome near the entrance. You may need a party member or two until level 40 Or the use of Trusts."},
    {40, 0x14, 0x14, xi.zone.GARLAIGE_CITADEL, -379.7122, -5.9999, 365.8749, 61,
    "40-50 Page 2 This is a roaming camp from the entrance to the first Banishing Gate. Your targets are bats and beetles"},
    {41, 0x14, 0x07, xi.zone.ROLANBERRY_FIELDS, -91.8976, -0.9868, -905.9633, 171,"40-49 Page 5 and make your way to G-11 > H-12 area. Once you have been here awhile, you will figure out a figure 8 style route." },
    {42, 0x14, 0x34, xi.zone.GUSTAV_TUNNEL, -59.6356, -10.4150, -128.8245, 61,"42-50 page 1 works. Beward of Bune"},
    {48, 0x14, 0x3E, xi.zone.EASTERN_ALTEPA_DESERT, -259.0851, 8.5445, -263.0285, 224," 48-59 Page 5, Killing Gobs... and a Manticore"},
    {50, 0x14, 0x44, xi.zone.THE_BOYAHDA_TREE, 74.9833, 8.8262, 142.0288, 121,"54-75 Page 1, It's slow kills at first but speeds up with Grounds Tombs bonuses."},
    {52, 0x14, 0x42, xi.zone.WESTERN_ALTEPA_DESERT, -217.0238, -11.1485, 104.0706, 176," 52-60 Page 3, (11 mobs, WTF!). When soloing, the beetles give massive amounts of EXP and goes rather fast. This camp is located in the H-8 > H-7 area"},
    {54, 0x14, 0xBD, xi.zone.WAJAOM_WOODLANDS, -200.0807, -10.0000, 79.7890, 179,"54-62 There is no page bonus for this camp, but the EXP is amazing camp near G-8, Kill Lesser Colibri"},
    {60, 0x14, 0x7D, xi.zone.ROMAEVE, 0.2414, -8.1300, -146.6911, 195,"60-75 Choose page 1, and you run the entire map in a circle. Magic users beware! Magic agroes from very far and even through walls)"},
    {62, 0x14, 0x3D, xi.zone.CAPE_TERIGGAN, -187.4448, 7.9840, -74.6200, 196,"60-75 One of the best solo camps, and a great place to level up your skills! Get page 1, Your camp will be around the Outpost."},
    {64, 0x14, 0x5A, xi.zone.KUFTAL_TUNNEL, -21.3402, -19.9031, -235.2025, 171,"60-75 Page 1 is your target, and it's best to camp near the sandfalls at (J-9). Guivre roams the main area. Take care."},
    {66, 0x14, 0x58, xi.zone.IFRITS_CAULDRON, -17.3719, 3.5274, -257.7261, 42," 60-75 Get page 2, The mobs per page and page yields makes this currently the best camp. Can do merits here also."},
    {68, 0x14, 0x2D, xi.zone.RANGUEMONT_PASS, 286.5375, -65.5019, 262.6855, 124,"65-75 Page 6, This camp is awesome and yields amazing EXP after just a half an hour or so of killing, but is very dangerous."},
    -- Add more zones here
}

-- Error function that says player's name before error printout
local function error(player, msg)
    player:printToPlayer(player:getName() .. ' ' .. msg)
end

-- Function to handle injecting the action packet and teleporting the player
local function teleportPlayer(player, x, y, z, rot, zone, instructions)
    -- Inject action packet for teleportation
    player:injectActionPacket(player:getID(), 5, 235, 0, 0, 0, 10, 1)

    -- Delay teleportation and set player's position
    player:timer(2000, function()
        player:setPos(x, y, z, rot, zone)
        player:printToPlayer("Camp Info: " .. instructions)  -- Print instructions to the player
    end)
end

commandObj.onTrigger = function(player, args)
    if player:hasEnmity() then
        player:printToPlayer("You can't use this command when you have Enmity.")
        return
    end

    -- Check if player is in jail
    if player:getCharVar('inJail') > 0 then
        error(player, "you are in jail buddy....you ain't going nowhere!")
        return
    end

    -- Parse arguments to get camp number
    local num = tonumber(args)
    if not num or num == 0 then
        error(player, 'you have to put in a valid !xpcamp number')
        return
    end

    -- Find the camp matching the provided number
    for _, zoneData in pairs(zoneList) do
        if zoneData[1] == num then
            -- Check if they have KI to enter this area
            if zoneData[4] == xi.zone.WAJAOM_WOODLANDS and not player:hasKeyItem(xi.ki.BOARDING_PERMIT) then
                error(player, 'You need a Boarding Permit to access this zone.')
                return
            end
            -- Teleport the player to the camp
            teleportPlayer(player, zoneData[5], zoneData[6], zoneData[7], zoneData[8], zoneData[4], zoneData[9])  -- Pass instructions to teleport function
            return
        end
    end

    -- If no matching camp is found, print an error message
    error(player, 'you have put in an invalid !xpcamp number, try again.')
end

return commandObj

