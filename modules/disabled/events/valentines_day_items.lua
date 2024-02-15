-----------------------------------
-- Valentine's Day Items Holiday Event
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
require("scripts/globals/missions")
require("modules/module_utils")
local cq  = require("modules/hokutens/lua/system/utils/custom_quest")
local cu  = require("modules/hokutens/lua/system/utils/custom_util")
local cid = require("modules/hokutens/lua/system/utils/custom_id")
require("scripts/zones/Leafallia/Zone")
local ID = require("scripts/zones/Leafallia/IDs")
-----------------------------------
local m = Module:new("valentines_day_items")

m:addOverride("xi.zones.Leafallia.Zone.onInitialize", function(zone)
    super(zone)

    local vday_stock =
    {
        25607,  50000,   -- Starlet Flower
        26975,  50000,   -- Starlet Jabot
        27112,  50000,   -- Starlet Gloves
        27297,  50000,   -- Starlet Skirt
        27468,  50000,   -- Starlet Boots
        26889,  10000,   -- Heart Apron
        26890,  25000,   -- Heart Apron +1
        18399,  10000,   -- Charm Wand
        18400,  25000,   -- Charm Wand +1
        18844,  10000,   -- Miracle Wand
        18845,  25000,   -- Miracle Wand +1
        21095,  10000,   -- Heartbeater
        21096,  25000,   -- Heartbeater +1
        21086,  10000,   -- Heartstopper 
        21087,  25000,   -- Heartstopper +1
        25850,  10000,   -- Pink Subligar
         3654,   5000,   -- Tender Bouquet
         5884,     10,   -- Rengedama (fireworks)
    }

    local juliet = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Juliet",
        look   = cu.lookTable({
            race = xi.race.MITHRA,
            face = cid.face.A4,
            head = cid.model.OPALINE_DRESS,
            body = cid.model.HEART_APRON,
            hand = cid.model.DANCER_ARTIFACT_F,
            legs = cid.model.PRETTY_PINK_SUBLIGAR,
            feet = cid.model.DANCER_ARTIFACT_F,
            main = 728,
            offh = 755,
        }),
        x = -12.1825,
        y = -0.0079,
        z = 11.3976,
        rotation = 32,
        widescan = 0,

        onTrade = function(player, npc, trade)
        end,

        -- Offer Valentine's Day Items if Trust quest is completed
        onTrigger = function(player, npc)
            npc:ceFace(player)
            npc:timer(5000, function(npcArg)
                npc:setRotation(32)
            end)
            --npc:ceEmote(player, xi.emote.HURRAY, xi.emoteMode.MOTION)
            if player:getCharVar("[HD]VALENTINES") == 18 then
                player:printToPlayer("Have a beautiful Valentine's Day!", 0, npc:getPacketName())
                if not player:hasKeyItem(xi.ki.CHOCOBO_CHAIR) then
                    player:addKeyItem(xi.ki.CHOCOBO_CHAIR)
                    player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.CHOCOBO_CHAIR)
                end
                xi.shop.general(player, vday_stock)
            else
                player:printToPlayer("Please help Mumor out first!", 0, npc:getPacketName())
            end
        end,
    })

    utils.unused(juliet)
end)

return m
