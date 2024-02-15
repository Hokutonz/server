-- -----------------------------------------------
-- Remove lv 76-99 gear from AH to reduce clutter
-- -----------------------------------------------

-- Clear AH sellable flag from item
UPDATE item_basic, item_equipment SET item_basic.flags = item_basic.flags & ~0x0040 WHERE item_equipment.`level` > 75 AND (item_basic.flags & 0x0040) = 1 AND item_equipment.itemId = item_basic.itemid;

-- Set to invalid category
UPDATE item_basic, item_equipment SET item_basic.aH = 255 WHERE item_equipment.`level` > 75 AND item_basic.aH > 0 AND item_equipment.itemId = item_basic.itemid;


-- -----------------------------------------------
-- Remove itemLevel gear from AH to reduce clutter
-- -----------------------------------------------

-- Clear AH sellable flag from item
UPDATE item_basic, item_equipment SET item_basic.flags = item_basic.flags & ~0x0040 WHERE item_equipment.ilevel > 0 AND (item_basic.flags & 0x0040) AND item_equipment.itemId = item_basic.itemid;

-- Set to invalid category
UPDATE item_basic, item_equipment SET item_basic.aH = 255 WHERE item_equipment.ilevel > 0 AND item_basic.aH > 0 AND item_equipment.itemId = item_basic.itemid;


-- -----------------------------------------------
-- Remove lv 76-99 gear from Goblin Mystery box
-- -----------------------------------------------

-- Clear ITEM_FLAG_MYSTERY_BOX from item
UPDATE item_basic, item_equipment SET item_basic.flags = item_basic.flags & ~0x0004 WHERE item_equipment.`level` > 75 AND (item_basic.flags & 0x0004) AND item_equipment.itemId = item_basic.itemid;


-- -----------------------------------------------
-- Remove itemLevel gear from Goblin Mystery box
-- -----------------------------------------------

-- Clear ITEM_FLAG_MYSTERY_BOX from item
UPDATE item_basic, item_equipment SET item_basic.flags = item_basic.flags & ~0x0004 WHERE item_equipment.ilevel > 0 AND (item_basic.flags & 0x0004) AND item_equipment.itemId = item_basic.itemid;


-- -----------------------------------------------
-- Remove Pulse Weapons from Goblin Mystery box
-- -----------------------------------------------

UPDATE item_basic SET item_basic.flags = item_basic.flags & ~0x0004 WHERE (item_basic.flags & 0x0004) AND item_basic.itemid = 19174; -- Bifrost (Borealis)
UPDATE item_basic SET item_basic.flags = item_basic.flags & ~0x0004 WHERE (item_basic.flags & 0x0004) AND item_basic.itemid = 17669; -- Undulant Black (Sagasinger)
UPDATE item_basic SET item_basic.flags = item_basic.flags & ~0x0004 WHERE (item_basic.flags & 0x0004) AND item_basic.itemid = 22086; -- Elegy's Respite (Xoanon)
UPDATE item_basic SET item_basic.flags = item_basic.flags & ~0x0004 WHERE (item_basic.flags & 0x0004) AND item_basic.itemid = 19298; -- Carver (Ikarigiri)
UPDATE item_basic SET item_basic.flags = item_basic.flags & ~0x0004 WHERE (item_basic.flags & 0x0004) AND item_basic.itemid = 18904; -- Somnia Melodiam (Ephemeron)
UPDATE item_basic SET item_basic.flags = item_basic.flags & ~0x0004 WHERE (item_basic.flags & 0x0004) AND item_basic.itemid = 18525; -- Hax (Himthige)
UPDATE item_basic SET item_basic.flags = item_basic.flags & ~0x0004 WHERE (item_basic.flags & 0x0004) AND item_basic.itemid = 22107; -- Tonzoffun (Ullr)
UPDATE item_basic SET item_basic.flags = item_basic.flags & ~0x0004 WHERE (item_basic.flags & 0x0004) AND item_basic.itemid = 21519; -- Face Breakers (Karambit)
UPDATE item_basic SET item_basic.flags = item_basic.flags & ~0x0004 WHERE (item_basic.flags & 0x0004) AND item_basic.itemid = 21830; -- Broken Promise (Drepanum)
