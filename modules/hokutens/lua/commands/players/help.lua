-----------------------------------
-- func: help
-- desc: A help command module
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = '',
}

local function print_help(player, helpMessage)
    player:printToPlayer(helpMessage)
end

commandObj.onTrigger = function(player)
    local commands = {
		"Check wiki for more info",
		"https://hokutensffxi.fandom.com/wiki/Custom_Commands",
		"!base",
        "!dem",
        "!holla",
        "!mea",
        "!yhoat",
        "!altepa",
        "!vahzl",
        "!warp",
        "!travel",
		"!xpcampm",
        "!xpcamp",
        "!meritcamp",
        "!signet",
        "!sanction",
        "!sigil",
        "!shop",
        "!drk",
        -- Add more commands here
    }

    -- Send the help message in chunks to avoid truncation
    local chunk_size = 5
    for i = 1, #commands, chunk_size do
        local chunk = table.concat(commands, "\n", i, math.min(i + chunk_size - 1, #commands))
        print_help(player, chunk)
    end
end

return commandObj
