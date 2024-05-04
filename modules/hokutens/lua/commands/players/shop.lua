--------------------------------------------------------------
-- func: !shop
-- desc: Opens a custom shop.
--------------------------------------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = "i"
}

commandObj.onTrigger = function(player,page)
    if (page == 0 or page == nil) then
        player:printToPlayer( '1: Crystal Shop, 2: Food Shop, 3: Pharmacy Shop, 4: Limited time Craft items')
    elseif (page == 1) then
        local stock_1 =
        {
            4238,   5000,       -- HQ Fire Crystal
            4239,   5000,       -- HQ Ice Crystal
            4240,   5000,       -- HQ Wind Crystal
            4241,   5000,       -- HQ Earth Crystal
            4242,   5000,       -- HQ Lightning Crystal
            4243,   5000,       -- HQ Water Crystal
            4244,   5000,       -- HQ Light Crystal
            4245,   5000        -- HQ Dark Crystal
        }
        xi.shop.general(player, stock_1)
        player:printToPlayer( 'Welcome to the Crystal Depot')
    elseif ( page == 2) then
        local stock_2 =
        {
            4271,   2499,       -- Rice Dumpling
            4381,   2100,       -- Meat Mithkabob
            4398,   2100,       -- Fish Mithkabob
            4457,   2100,       -- Eel Kabob
            5148,   2500,       -- Squid Sushi
            5166,   2100,       -- Coeurl Sub Sandwich
            4355,   1450,       -- Salmon Sub Sandwich
            5686,   799,        -- Cheese Sandwich
            5561,   799,        -- Moogle Pie
            4270,   999,        -- Sweet Rice Cake
            5944,   2000,       -- Frontier Soda
            5932,   1600,       -- Kitron Juice
            4424,   1100,       -- Melon Juice
            4422,   499         -- Orange Juice
        }
		xi.shop.general(player, stock_2)
		player:printToPlayer( 'Food Shop')
		
		elseif ( page == 3) then
        local stock_3 =
        {
            
            4164,   1000,    -- Prism Powder
            4165,   1000,    -- Silent Oil
            4148,   450,     -- Antidote
            4154,   1000,    -- Holy Water
            4150,   2000,    -- Eye Drops
            4151,   2000,    -- Echo Drops
            4153,   2000,    -- Bottle of Antacid
            5418,   2000,    -- Tincture
            5328,   2000,    -- Hi-Potion Drop
            5358,   2000,    -- Hi-Ether Drop
            5356,   5000,    -- Remedy Ointment
            4202,   25000,   -- Daedalus Wing
            5876,   25000,   -- Petrify Screen
            5877,   25000,   -- Terror Screen
            5878,   25000,   -- Amnesia Screen
            5879,   25000,   -- Doom Screen
            5880,   25000    -- Poison Screen
        }
        xi.shop.general(player, stock_3)
		player:printToPlayer( 'Pharmacy Shop')
		
		elseif ( page == 4) then
        local stock_4 =
        {
            635, 100,   -- Win. Tea Leaves
        }
        xi.shop.general(player, stock_4)
		player:printToPlayer( 'Limited time Craft items')
		
    else
        player:printToPlayer( string.format( "Page %i not found.", page ) )
    end
end

return commandObj