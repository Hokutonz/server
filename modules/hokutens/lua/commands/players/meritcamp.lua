local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local zoneList = {
    { 'birds', 0x14, 0xBE, xi.zone.BHAFLAU_THICKETS, -522.4387, -12.0045, -36.0205, 80, "Bird Camp!, take care not to drop to next area its a cluster fuck!"},
    { 'pudding', 0x14, 0xC7, xi.zone.MOUNT_ZHAYOLM, 179.8123, -27.1972, 128.3442, 197, "Pudding Camp! Everyone loves pudding. <(^o^)>"},
    { 'puks', 0x14, 0xBE, xi.zone.BHAFLAU_THICKETS, -64.2718, -17.6059, -625.1524, 131, "Puk Camp! Also good camp for BLM's to kill Mamool Ja's Raptor pet."},
    { 'imps', 0x14, 0xD0, xi.zone.CAEDARVA_MIRE, 540.4501, -18.3835, -430.3322, 191, "Imp Camp!.....Wait what was i doing? Take care of Amnesia and Silence."},
    -- Add more camps here
}

local function error(player, msg)
    player:printToPlayer(player:getName() .. ' ' .. msg)
end

local function teleportPlayer(player, x, y, z, rot, zone, instructions)
    player:injectActionPacket(player:getID(), 5, 235, 0, 0, 0, 10, 1)

    player:timer(2000, function()
        player:setPos(x, y, z, rot, zone)
        player:printToPlayer("Camp Info: " .. instructions)
    end)
end

commandObj.onTrigger = function(player, args)
    if player:hasEnmity() then
        player:printToPlayer("you can't use this command when you have Enmity.")
        return
    end

    if player:getCharVar('inJail') > 0 then
        error(player, "you are in jail buddy....you ain't going nowhere!")
        return
    end

    local foundCamp = false
    for _, campData in pairs(zoneList) do
        if string.lower(args) == campData[1] then
            -- Check if the player needs a key item for this zone
            if (campData[4] == xi.zone.BHAFLAU_THICKETS or campData[4] == xi.zone.MOUNT_ZHAYOLM or campData[4] == xi.zone.CAEDARVA_MIRE) and not player:hasKeyItem(xi.ki.BOARDING_PERMIT) then
                error(player, 'you need a Boarding Permit to access this zone.')
                return
            end
            -- Teleport the player to the camp
            teleportPlayer(player, campData[5], campData[6], campData[7], campData[8], campData[4], campData[9])
            foundCamp = true
            break
        end
    end

    if not foundCamp then
        error(player, 'Invalid camp keyword. Available options: puks, birds, etc.')
    end
end

return commandObj
