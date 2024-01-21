# Custom Quest System
by Loxley

*Last updated 2023/05/16*

## Setup

Examples will assume you have imported custom_quest.lua as follows:
```lua
local cq = require("modules/catseyexi/lua/additive_overrides/utils/custom_quest")
```

## Introduction
This system is work in progress and features are frequently added or changed. I'll attempt to keep this document up to date with changes. I will also try to update all affected quests.

Custom quests are developed as standalone modules. Overriding existing lua takes place inside `custom_quest` itself using provided helpers.

The system is designed to keep quests light on code as possible, so they become simple templates. Overall, the design is intentionally different to Interaction Framework (Used for regular quests), as that was much more verbose and the paradigm was not suitable for dynamic entities.

## Add Quest

A custom quest contains three main parts. These are provided into `cq.add` at the end of your module.

```lua
cq.add(m, {
    info   = info,
    entity = entity,
    step   = step,
})
```

## Quest Info
```lua
local info =
{
    name   = "A Matter of Trust (San d'Oria)",
    author = "Loxley"
    var    = "[CW]QUEST_15_SANDORIA",
    reward =
    {
        item  = xi.item.WILD_ONION,
        after = cq.rewardTrust(902, "Curilla", 1),
    },
}
```

The name and author provided are currently cosmetic but the name may be leveraged in future, for example to provide a quest tracker on the website, or to list milestones in game. The var you use is very important, this is used to track all quest progress. Crystal Warrior quests are preceded with `[CW]`.

### Rewards
* `item ` will take an item ID or a table (See: `npcUtil.giveItem`)
* `after` is an optional function to run after rewards are distributed. This can provide unlock messages to the player or take a helper function such as the example shown.

## Entities
There is an in depth explanation of dialog tables further down.
```lua
local entity =
{
    {
        id     = "CURILLA",                        -- Internal ID of entity, mostly used for steps
        name   = "Curilla",                        -- Visual name of NPC above model or in dialogs
        type   = xi.objType.NPC,                   -- or xi.objType.MOB
        hidden = true,                             -- NPC invivisible until revealed within cutscene
        look   = 69,                               -- Model ID or "look" string
        area   = "La_Theine_Plateau",              -- Area string for zone override to insertDynamicEntity
        pos    = { 657.894, 26.945, -122.194, 0 }, -- Position of NPC: X, Y, Z, Rotation
        dialog =
        {
            NAME     = true,                -- Show these dialog strings with the NPC's name by default
            DEFAULT  = { "Nothing." },      -- What the NPC should say if the player is not on the quest (Var value 0 or not covered by quest steps)
            START    =
            {
                "Hello.",                   -- Dialog will be printed in order with a short delay between each
                " What is it?",             -- Follow on dialog can start with a space for paragaphs ("Name:" text will be omitted)
                { emote = xi.emote.THINK }, -- Trigger emote on the current entity (Warning: This will not work with model IDs, only "look" strings)
            },
        }
    },
}
```

## Steps
The final part of the system is the core and ironically the most concise. There are many helpers which reduce the complexity to easy one liners. The step comments are included for explanation but are usually omitted. The step number here refers to the value of the variable provided in quest `info`.

```lua
local KEENA   = "KEENA"
local ANOMALY = "ANOMALY"
local WEAPON  = "WEAPON"

local step =
{
    -- Step 0
    {
        check     = cq.checks({ CW = true, level = 15 }),
        [KEENA]   = cq.talkStep("START"),
    },
    -- Step 1
    {
        [KEENA]   = cq.talkOnly("REMINDER"),
        [ANOMALY] = cq.spawnMob(WEAPON),
        [WEAPON]  = cq.killStep(),
    },
    -- Step 2
    {
        [ANOMALY] = cq.talkStep("FINISH"),
    },
    -- Step 3
    {
        [ANOMALY] = cq.talkOnly("AFTER"),
        [KEENA]   = cq.giveStep("FINISH"),
    },
}
```

### Overview
* Each step must contain a `Step` helper (eg. `talkStep`) to increment the quest variable and advance.
* The final step is assumed the end of the quest, giveStep will trigger the rewards.
* Quest "completed" status can be tracked using the final variable value (In the above example, 4).
* Helpers must be assigned to entities using their ID provided in the entity list.

### Checks
`cq.checks` provides a list of options to restrict access to the current step. Checks run before anything in the current step is executed. Any number of checks can be combined.
* `level` sets the minimum level for the current step.
* `CW` will restrict the current step the Crystal Warriors only.

## Helpers for `custom_quest`

* `talkOnly` - Executes the dialog table matching the given ID when the assigned entity is triggered.
```lua
["KEENA"]   = cq.talkOnly("REMINDER"),
```

* `talkStep` - The same as `talkOnly` but also advances the quest by incrementing the variable.
```lua
["ANOMALY"] = cq.talkOnly("AFTER"),
```

* `menuStep` - Creates a `customMenu`, with `title` and a table of `options`. The second parameter (eg. "TAKEN") is an optional dialog table ID to perform after this option is seleted. The last parameter (eg. 1) specifies which option advances the step by incrementing the quest variable.
```lua
["BOOK"]   = cq.menuStep("Take the book?", { { "Yes", "TAKEN" }, { "No" } }, 1),
```

* `menuSpawn` - Similar to `menuStep` but spawns a mob when the correct option is chosen.
```lua
["LOST_ITEM"]  = cq.menuSpawn("APPARITION", "Look inside the cart?", { { "Let's do it." }, { "I'm scared." } }, 1 ),
```

* `spawnMob` - Spawns the mob matching the given entity ID upon triggering the assigned entity/NPC.
```lua
["ANOMALY"] = cq.spawnMob("WEAPON"),
```

* `killStep` - Advances the step by incrementing the quest variable when the assigned mob dies (onMobDeath).
```lua
["WEAPON"]  = cq.killStep(),
```

* `tradeStep` - Advances the step by incrementing the quest variable when the correct items are traded. The first and second parameters are dialog table IDs to run when the trade is accepted or declined respectively. The item can be item ID, or a table (See: `npcUtil.tradeHasExactly`). Must be assigned to `onTrade` in a table for the entity step. Final parameter is an optional reward table to be distributed upon a matching trade.
["MOBLIN"]  =
{
    onTrade = cq.tradeStep("ACCEPTED", "DECLINED", xi.item.BONE_CHIP, info.reward),
}
```

* `tradeTable` - Exchanges an item for a random reward from an assigned weighted table using `customUtil.pickItem` but does not advance the step. The first and second parameters are dialog tables IDs to run when the trade is accepted or declined respectively. Must be assigned to `onTrade` in a table for the entity step.
```lua
["MOBLIN"]  =
{
    onTrade = cq.tradeTable("ACCEPTED", "DECLINED", itemTable),
}
```
Example reward table:
```lua
local itemTable =
{
    [xi.item.IGNEOUS_ROCK] =
    {
        { customUtil.rate.VERY_COMMON, xi.item.SHARD_OF_OBSIDIAN,   "a shard of obsidian"   }, --  (24%)
        { customUtil.rate.COMMON,      xi.item.CHUNK_OF_SILVER_ORE, "a chunk of silver ore" }, --  (15%)
        { customUtil.rate.RARE,        xi.item.PERIDOT,             "a peridot"             }, --  ( 5%)
    }
}
```

* `rewardTrust` - This is a reward helper and shouldn't be used in steps. The first parameter is an ID for the trust to be awarded. The second is the trust name for the player message. The third is an *optional* parameter to update the current Trust limit of the player.
```lua
cq.rewardTrust(902, "Curilla", 1),
```

# Dialog Tables

The Custom Quest System leans heavily on Dialog Tables provided by `custom_util`. There is no need to include this directly inside your quests, as `custom_quest` already handles it.

```lua
local customUtil = require("modules/catseyexi/lua/additive_overrides/utils/custom_util")
```

Each row of the dialog table is executed at an interval (Currently 1500ms), some functions return values to manipulate the delay of the next row.

```lua
dialogTable = function(player, tbl, npcName, param)
```
The `player` refence and the table itself are mandatory. `npcName` and `param` are optional. When npcName is provided and not empty (""), strings will be prepended with it.

If `param` contains an npc reference (eg. `{ npc = npc }`), the NPC will turn to face the player for the duration of the table and reset after the last row of dialog. This is handled using `custom_event.cpp` functionality using packets and no change will occur to any other players.

* `string` - Most rows in a dialog table are just strings, which can contain up to 4 (Currently) placeholders for `string.format`. This is automatically called when a `param` table is supplied.

* `function` - Rows in a dialog table can be arbitrary functions, which run sequentially according to their position in the table. For example, to hand out items at the end of dialog.

* `delay` - Delays all subsequent rows by a number of milliseconds.
```lua
{ delay = 3000 },
```

* `emote` -  Trigger emote on the current entity (Warning: This will not work with model IDs, only "look" strings)
```lua
{ emote = xi.emote.CHEER },
```

* `animation` - Sets the target to an animation ID for the duration in milliseconds. Resets to original the animation ID once complete.
```lua
{ animation = 48, target = "player", duration = 3000 }, -- Crouch down
```

* `spawn` - Spawn a list of dynamic entities that were added with `hidden = true`.
```lua
{ spawn = { "Curilla" } }
```

* `despawn` - Despawn a list of dynamic entities.
```lua
{ despawn = { "Curilla" } }
```

* `glimpse` - Spawn a list of dynamic entities for a brief period (eg. 5000ms), before despawning them again.
```lua
{ glimpse = { 5000, { "Orc_Memory_1", "Orc_Memory_2", "Orc_Memory_3" } } },
```
