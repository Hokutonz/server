local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

-- Define a table to keep track of the last time each player used the command
local lastCommandUsage = {}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('You can not use warp right now')
end

local function warpPlayerToHomePoint(player)
    -- Inject action packet for animation (replace animation ID as needed)
    player:injectActionPacket(player:getID(), 5, 206, 0, 0, 0, 10, 1)

    -- Delay warp using a timer
    player:timer(2000, function()
        -- Warp the player to their home point
        player:warp()
    end)
end

commandObj.onTrigger = function(player)
    -- Check if player is in jail
    if player:getCharVar('inJail') > 0 then
        error(player, "You are in jail buddy....you ain't going no where!")
        return
    end

    -- Check if the player has used the command within the cooldown period
    local lastUsageTime = lastCommandUsage[player:getID()] or 0
    local currentTime = os.time()
    local cooldownDuration = 300 -- 5 minutes cooldown
    local timeSinceLastUsage = currentTime - lastUsageTime

    if timeSinceLastUsage < cooldownDuration then
        error(player, "You must wait "..(cooldownDuration - timeSinceLastUsage).." seconds before using this command again.")
        return
    end

    -- Update the last usage time for the player
    lastCommandUsage[player:getID()] = currentTime

    -- Warp the player to their home point with animation
    warpPlayerToHomePoint(player)

    -- Notify the player
    player:printToPlayer("You are being warped to your home point.")
end

return commandObj

