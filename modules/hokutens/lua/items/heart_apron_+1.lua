-----------------------------------
-- ID: 26890
-- Heart Apron +1 (Rare Ex)
-- [Body] All Races
-- DEF:2 CHR+2
-- Dispense: "Confectionary goods"
-- LV 1 WAR MNK WHM BLM RDM THF PLD DRK BST BRD RNG SAM NIN DRG SMN BLU COR PUP DNC SCH GEO RUN
-----------------------------------
require("modules/module_utils")
--------------------------------------------

local m = Module:new("heart_apron_+1")

xi.module.ensureTable("xi.items.heart_apron_+1")

m:addOverride("xi.items.heart_apron_+1.onItemCheck", function(target)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end)

m:addOverride("xi.items.heart_apron_+1.onItemUse", function(target)
    local ID = zones[target:getZoneID()]
    local rand = math.random(1, 11)
    if rand == 1 then
        target:addItem(xi.item.HANDFUL_OF_BLOODY_CHOCOLATE, 1)
        target:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.HANDFUL_OF_BLOODY_CHOCOLATE)
    elseif rand == 2 then
        target:addItem(xi.item.PIECE_OF_BUBBLE_CHOCOLATE, 1)
        target:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.PIECE_OF_BUBBLE_CHOCOLATE)
    elseif rand == 3 then
        target:addItem(xi.item.JUG_OF_SELBINA_MILK, 1)
        target:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.JUG_OF_SELBINA_MILK)
    elseif rand == 4 then
        target:addItem(xi.item.KUKURU_BEAN, 1)
        target:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.KUKURU_BEAN)
    elseif rand == 5 then
        target:addItem(xi.item.POT_OF_MAPLE_SUGAR, 1)
        target:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.POT_OF_MAPLE_SUGAR)
    elseif rand == 6 then
        target:addItem(xi.item.SCARLET_RIBBON, 1)
        target:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.SCARLET_RIBBON)
    elseif rand == 7 then
        target:addItem(xi.item.BAG_OF_GRAIN_SEEDS, 1)
        target:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.BAG_OF_GRAIN_SEEDS)
    elseif rand == 8 then
        target:addItem(xi.item.ACORN_COOKIE, 1)
        target:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.ACORN_COOKIE)
    elseif rand == 9 then
        target:addItem(xi.item.CINNA_COOKIE, 1)
        target:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.CINNA_COOKIE)
    elseif rand == 10 then
        target:addItem(xi.item.GINGER_COOKIE, 1)
        target:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.GINGER_COOKIE)
    elseif rand == 11 then
        target:addItem(xi.item.CHUNK_OF_GOBLIN_CHOCOLATE, 1)
        target:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.CHUNK_OF_GOBLIN_CHOCOLATE)
    end
end)

return m
