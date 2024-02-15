-- Excalibur
UPDATE item_mods SET value = "13" WHERE itemId = "18276" and modId = "431";
INSERT INTO item_mods VALUES (18276,501,7);    -- ITEM_ADDEFFECT_CHANCE
INSERT INTO item_mods VALUES (18276,950,7);    -- ITEM_ADDEFFECT_TYPE
INSERT INTO item_mods VALUES (18276,499,7);    -- ITEM_SUBEFFECT
-- Tizona
UPDATE item_mods SET value = "14" WHERE itemId = "19006" and modId = "431";
INSERT INTO item_mods VALUES (19006,501,15);    -- ITEM_ADDEFFECT_CHANCE
-- Modify status arrows and bolts for balanced gameplay in lvl. 75 cap.
-- Demon Arrow
UPDATE item_mods SET value = "15" WHERE itemId = "18159" and modId = "501"; -- ITEM_ADDEFFECT_CHANCE: 15
UPDATE item_mods SET value = "15" WHERE itemId = "18159" and modId = "953"; -- ITEM_ADDEFFECT_DURATION: 15
-- Kabura Arrow
UPDATE item_mods SET value = "5" WHERE itemId = "17325" and modId = "501"; -- ITEM_ADDEFFECT_CHANCE: 5
UPDATE item_mods SET value = "5" WHERE itemId = "17325" and modId = "953"; -- ITEM_ADDEFFECT_DURATION: 5
-- Poison Arrow
UPDATE item_mods SET value = "10" WHERE itemId = "18157" and modId = "501"; -- ITEM_ADDEFFECT_CHANCE: 10
UPDATE item_mods SET value = "10" WHERE itemId = "18157" and modId = "953"; -- ITEM_ADDEFFECT_DURATION: 10
-- Sleep Arrow
UPDATE item_mods SET value = "1" WHERE itemId = "18158" and modId = "501"; -- ITEM_ADDEFFECT_CHANCE: 1
UPDATE item_mods SET value = "5" WHERE itemId = "18158" and modId = "953"; -- ITEM_ADDEFFECT_DURATION: 5
-- Acid Bolt
UPDATE item_mods SET value = "20" WHERE itemId = "18148" and modId = "953"; -- ITEM_ADDEFFECT_DURATION: 20
-- Sleep Bolt
UPDATE item_mods SET value = "1" WHERE itemId = "18149" and modId = "501"; -- ITEM_ADDEFFECT_CHANCE: 1
UPDATE item_mods SET value = "5" WHERE itemId = "18149" and modId = "953"; -- ITEM_ADDEFFECT_DURATION: 5
-- Venom Bolt
UPDATE item_mods SET value = "10" WHERE itemId = "18152" and modId = "501"; -- ITEM_ADDEFFECT_CHANCE: 10
UPDATE item_mods SET value = "10" WHERE itemId = "18152" and modId = "953"; -- ITEM_ADDEFFECT_DURATION: 10