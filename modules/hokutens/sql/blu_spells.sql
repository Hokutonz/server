# Allow BLU to use Battery Charge at 75
DELETE FROM spell_list WHERE spellid = "662";
INSERT INTO `spell_list` VALUES (662, 'battery_charge', 0x0000000000000000000000000000004b000000000000, 3, 0, 7, 0, 1, 43, 50, 3500, 11000, 230, 0, 798, 2000, 6, 0, 1.00, 1, 165, 0, 0, 'TOAU');

# Allow BLU to use Plenilune Embrace at 75
DELETE FROM spell_list WHERE spellid = "658";
INSERT INTO `spell_list` VALUES (658, 'plenilune_embrace', 0x0000000000000000000000000000004b000000000000, 3, 0, 7, 0, 3, 43, 106, 2750, 12000, 7, 0, 793, 2000, 0, 0, 1.00, 0, 0, 0, 204, 'TOAU');