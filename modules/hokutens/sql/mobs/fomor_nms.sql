-- Buarainech
INSERT INTO `mob_droplist` VALUES(3998, 0, 0, 1000, 2858, 250); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3998, 0, 1, 1000, 2858, 250); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3998, 0, 2, 1000, 2858, 250); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3998, 0, 3, 1000, 2859, 550); -- Chunk of Cobalt Ore
INSERT INTO `mob_droplist` VALUES(3998, 0, 4, 1000, 19307, 125); -- Blunt Lance
INSERT INTO `mob_droplist` VALUES(3998, 0, 5, 1000, 11411, 188); -- Shrewd Pumps
INSERT INTO `mob_droplist` VALUES(3998, 0, 6, 1000, 2275, 200); -- Scintillant Ingot
INSERT INTO `mob_droplist` VALUES(3998, 0, 6, 1000, 747, 150); -- Orichalcum Ingot
-- Elatha
INSERT INTO `mob_droplist` VALUES(3997, 0, 0, 1000, 2858, 260); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3997, 0, 1, 1000, 2858, 260); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3997, 0, 2, 1000, 2858, 260); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3997, 0, 3, 1000, 2859, 550); -- Chunk of Cobalt Ore
INSERT INTO `mob_droplist` VALUES(3997, 0, 4, 1000, 19162, 316); -- Dull Claymore
INSERT INTO `mob_droplist` VALUES(3997, 0, 5, 1000, 15057, 272); -- Bricta's Cuffs
INSERT INTO `mob_droplist` VALUES(3997, 0, 6, 1000, 2275, 200); -- Scintillant Ingot
INSERT INTO `mob_droplist` VALUES(3997, 0, 6, 1000, 747, 82); -- Orichalcum Ingot
-- Lugh
INSERT INTO `mob_droplist` VALUES(3996, 0, 0, 1000, 2858, 500); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3996, 0, 1, 1000, 2858, 500); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3996, 0, 2, 1000, 2858, 500); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3996, 0, 3, 1000, 2859, 550); -- Chunk of Cobalt Ore
INSERT INTO `mob_droplist` VALUES(3996, 0, 4, 1000, 17767, 154); -- Chipped Scimitar
INSERT INTO `mob_droplist` VALUES(3996, 0, 5, 1000, 11410, 77); -- Setanta's Ledelsens
INSERT INTO `mob_droplist` VALUES(3996, 0, 6, 1000, 2275, 200); -- Scintillant Ingot
INSERT INTO `mob_droplist` VALUES(3996, 0, 6, 1000, 747, 86); -- Orichalcum Ingot
-- Ethniu
INSERT INTO `mob_droplist` VALUES(3995, 0, 0, 1000, 2858, 520); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3995, 0, 1, 1000, 2858, 520); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3995, 0, 2, 1000, 2858, 520); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3995, 0, 3, 1000, 2859, 550); -- Chunk of Cobalt Ore
INSERT INTO `mob_droplist` VALUES(3995, 0, 4, 1000, 19128, 200); -- Edgeless Knife
INSERT INTO `mob_droplist` VALUES(3995, 0, 5, 1000, 16376, 200); -- Bahram Cuisses
INSERT INTO `mob_droplist` VALUES(3995, 0, 6, 1000, 2275, 200); -- Scintillant Ingot
INSERT INTO `mob_droplist` VALUES(3995, 0, 7, 1000, 747, 50); -- Orichalcum Ingot
-- Tethra
INSERT INTO `mob_droplist` VALUES(3994, 0, 0, 1000, 2858, 550); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3994, 0, 0, 1000, 2858, 550); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3994, 0, 0, 1000, 2858, 550); -- Wolfram Steel Ingot
INSERT INTO `mob_droplist` VALUES(3994, 0, 0, 1000, 2859, 550); -- Chunk of Cobalt Ore
INSERT INTO `mob_droplist` VALUES(3994, 0, 0, 1000, 18617, 233); -- Cracked Staff
INSERT INTO `mob_droplist` VALUES(3994, 0, 0, 1000, 16302, 167); -- Bloodbead Gorget
INSERT INTO `mob_droplist` VALUES(3994, 0, 0, 1000, 2275, 167); -- Scintillant Ingot
INSERT INTO `mob_droplist` VALUES(3994, 0, 0, 1000, 747, 100); -- Orichalcum Ingot

UPDATE `mob_groups` SET `respawntime`='14400', `spawntype`='0', `dropid`='3996', `HP`='34433', `MP`='20000', `maxLevel`='82' WHERE  `zoneid`=171 AND `groupid`=18;
UPDATE `mob_groups` SET `respawntime`='14400', `spawntype`='0', `dropid`='3994', `HP`='25291', `MP`='20000', `maxLevel`='82' WHERE  `zoneid`=175 AND `groupid`=23;
UPDATE `mob_groups` SET `respawntime`='14400', `spawntype`='0', `dropid`='3995', `HP`='25291', `MP`='20000', `maxLevel`='82' WHERE  `zoneid`=175 AND `groupid`=14;
UPDATE `mob_groups` SET `respawntime`='14400', `spawntype`='0', `dropid`='3998', `HP`='17214', `MP`='20000', `maxLevel`='82' WHERE  `zoneid`=164 AND `groupid`=18;
UPDATE `mob_groups` SET `respawntime`='14400', `spawntype`='0', `dropid`='3997', `HP`='49486', `MP`='20000', `maxLevel`='82' WHERE  `zoneid`=164 AND `groupid`=15;


UPDATE `mob_pools` SET `spellList`='997', `skill_list_id`='5012' WHERE  `poolid`=5143;
UPDATE `mob_pools` SET `spellList`='996', `skill_list_id`='5013' WHERE  `poolid`=5144;
UPDATE `mob_pools` SET `spellList`='995', `skill_list_id`='5014' WHERE  `poolid`=4696;
UPDATE `mob_pools` SET `spellList`='994', `skill_list_id`='5015' WHERE  `poolid`=6885;
UPDATE `mob_pools` SET `spellList`='993', `skill_list_id`='5016' WHERE  `poolid`=6886;
UPDATE `mob_pools` SET `modelid`=0x0500F60300000000000000000000000000000000 WHERE  `poolid`=5143;

DELETE FROM `mob_spell_lists` WHERE  `spell_list_id`= "997";
DELETE FROM `mob_spell_lists` WHERE  `spell_list_id`= "996";
DELETE FROM `mob_spell_lists` WHERE  `spell_list_id`= "995";
DELETE FROM `mob_spell_lists` WHERE  `spell_list_id`= "994";
DELETE FROM `mob_spell_lists` WHERE  `spell_list_id`= "993";
DELETE FROM `mob_skill_lists` WHERE  `skill_list_id`= "5012";
DELETE FROM `mob_skill_lists` WHERE  `skill_list_id`= "5013";
DELETE FROM `mob_skill_lists` WHERE  `skill_list_id`= "5014";
DELETE FROM `mob_skill_lists` WHERE  `skill_list_id`= "5015";
DELETE FROM `mob_skill_lists` WHERE  `skill_list_id`= "5016";

-- Buarainech
INSERT INTO `mob_skill_lists` VALUES('Buarainech', 5012, 248); -- Grim Halo
INSERT INTO `mob_skill_lists` VALUES('Buarainech', 5012, 116); -- Penta Thrust
INSERT INTO `mob_skill_lists` VALUES('Buarainech', 5012, 120); -- Impulse Drive
INSERT INTO `mob_skill_lists` VALUES('Buarainech', 5012, 114); -- Raiden Thrust
INSERT INTO `mob_skill_lists` VALUES('Buarainech', 5012, 249); -- Netherspikes
-- Elatha
INSERT INTO `mob_skill_lists` VALUES('Elatha', 5013, 248); -- Grim Halo
INSERT INTO `mob_skill_lists` VALUES('Elatha', 5013, 249); -- Netherspikes
INSERT INTO `mob_skill_lists` VALUES('Elatha', 5013, 242); -- Carnal Nightmare
INSERT INTO `mob_skill_lists` VALUES('Elatha', 5013, 52); -- Shockwave
INSERT INTO `mob_skill_lists` VALUES('Elatha', 5013, 56); -- Ground Strike
INSERT INTO `mob_skill_lists` VALUES('Elatha', 5013, 51); -- Freezebite
-- Lugh
INSERT INTO `mob_skill_lists` VALUES('Lugh', 5014, 247); -- Foxfire
INSERT INTO `mob_skill_lists` VALUES('Lugh', 5014, 249); -- Netherspikes
INSERT INTO `mob_skill_lists` VALUES('Lugh', 5014, 242); -- Carnal Nightmare
INSERT INTO `mob_skill_lists` VALUES('Lugh', 5014, 34); -- Red Lotus Blade
INSERT INTO `mob_skill_lists` VALUES('Lugh', 5014, 38); -- Circle Blade
INSERT INTO `mob_skill_lists` VALUES('Lugh', 5014, 42); -- Savage Blade
-- Ethniu
INSERT INTO `mob_skill_lists` VALUES('Ethniu', 5015, 247); -- Foxfire
INSERT INTO `mob_skill_lists` VALUES('Ethniu', 5015, 249); -- Netherspikes
INSERT INTO `mob_skill_lists` VALUES('Ethniu', 5015, 242); -- Carnal Nightmare
INSERT INTO `mob_skill_lists` VALUES('Ethniu', 5015, 19); -- Gust Slash
INSERT INTO `mob_skill_lists` VALUES('Ethniu', 5015, 20); -- Cyclone
INSERT INTO `mob_skill_lists` VALUES('Ethniu', 5015, 25); -- Evisceration
-- Tethra
INSERT INTO `mob_skill_lists` VALUES('Tethra', 5016, 248); -- Grim Halo
INSERT INTO `mob_skill_lists` VALUES('Tethra', 5016, 249); -- Netherspikes
INSERT INTO `mob_skill_lists` VALUES('Tethra', 5016, 242); -- Carnal Nightmare
INSERT INTO `mob_skill_lists` VALUES('Tethra', 5016, 177); -- Rock Crusher
INSERT INTO `mob_skill_lists` VALUES('Tethra', 5016, 178); -- Earth Crusher
INSERT INTO `mob_skill_lists` VALUES('Tethra', 5016, 184); -- Retribution

-- Buarainech
INSERT INTO `mob_spell_lists` VALUES('Buarainech', 997, 532, 1, 255); -- Blue Magic: Blitzstrahl
INSERT INTO `mob_spell_lists` VALUES('Buarainech', 997, 644, 1, 255); -- Blue Magic: Mind Blast
INSERT INTO `mob_spell_lists` VALUES('Buarainech', 997, 616, 1, 255); -- Blue Magic: Temporal Shift
INSERT INTO `mob_spell_lists` VALUES('Buarainech', 997, 615, 1, 255); -- Blue Magic: Plasma Charge
INSERT INTO `mob_spell_lists` VALUES('Buarainech', 997, 212, 1, 255); -- Black Magic: Burst
INSERT INTO `mob_spell_lists` VALUES('Buarainech', 997, 196, 1, 255); -- Black Magic: Thundaga III
INSERT INTO `mob_spell_lists` VALUES('Buarainech', 997, 167, 1, 255); -- Black Magic: Thunder IV
INSERT INTO `mob_spell_lists` VALUES('Buarainech', 997, 512, 1, 252); -- Stun
INSERT INTO `mob_spell_lists` VALUES('Buarainech', 997, 57, 1, 252); -- Haste
-- Elatha
INSERT INTO `mob_spell_lists` VALUES('Elatha', 996, 531, 1, 255); -- Blue Magic: Ice Break
INSERT INTO `mob_spell_lists` VALUES('Elatha', 996, 535, 1, 255); -- Blue Magic: Cold Wave
INSERT INTO `mob_spell_lists` VALUES('Elatha', 996, 608, 1, 255); -- Blue Magic: Frost Breath
INSERT INTO `mob_spell_lists` VALUES('Elatha', 996, 206, 1, 255); -- Black Magic: Freeze
INSERT INTO `mob_spell_lists` VALUES('Elatha', 996, 181, 1, 255); -- Black Magic: Blizzaga III
INSERT INTO `mob_spell_lists` VALUES('Elatha', 996, 152, 1, 255); -- Black Magic: Blizzard IV
-- Lugh
INSERT INTO `mob_spell_lists` VALUES('Lugh', 995, 588, 1, 255); -- Blue Magic: Lowing
INSERT INTO `mob_spell_lists` VALUES('Lugh', 995, 591, 1, 255); -- Blue Magic: Heat Breath
INSERT INTO `mob_spell_lists` VALUES('Lugh', 995, 645, 1, 255); -- Blue Magic: Exuviation
INSERT INTO `mob_spell_lists` VALUES('Lugh', 995, 204, 1, 255); -- Black Magic: Flare
INSERT INTO `mob_spell_lists` VALUES('Lugh', 995, 176, 1, 255); -- Black Magic: Firaga III
INSERT INTO `mob_spell_lists` VALUES('Lugh', 995, 147, 1, 255); -- Black Magic: Fire IV
-- Ethniu
INSERT INTO `mob_spell_lists` VALUES('Ethniu', 994, 563, 1, 255); -- Blue Magic: Hecatomb Wave
INSERT INTO `mob_spell_lists` VALUES('Ethniu', 994, 647, 1, 255); -- Blue Magic: Zephyr Mantle
INSERT INTO `mob_spell_lists` VALUES('Ethniu', 994, 561, 1, 255); -- Blue Magic: Frightful Roar
INSERT INTO `mob_spell_lists` VALUES('Ethniu', 994, 208, 1, 255); -- Black Magic: Tornado
INSERT INTO `mob_spell_lists` VALUES('Ethniu', 994, 186, 1, 255); -- Black Magic: Aeroga III
INSERT INTO `mob_spell_lists` VALUES('Ethniu', 994, 157, 1, 255); -- Black Magic: Aero IV
INSERT INTO `mob_spell_lists` VALUES('Ethniu', 994, 359, 1, 255); -- White Magic: Silencega
INSERT INTO `mob_spell_lists` VALUES('Ethniu', 994, 366, 1, 255); -- Black Magic: Graviga
-- Tethra
INSERT INTO `mob_spell_lists` VALUES('Tethra', 993, 524, 1, 255); -- Blue Magic: Sandspin
INSERT INTO `mob_spell_lists` VALUES('Tethra', 993, 548, 1, 255); -- Blue Magic: Filamented Hold
INSERT INTO `mob_spell_lists` VALUES('Tethra', 993, 555, 1, 255); -- Blue Magic: Magnetite Cloud
INSERT INTO `mob_spell_lists` VALUES('Tethra', 993, 210, 1, 255); -- Black Magic: Quake
INSERT INTO `mob_spell_lists` VALUES('Tethra', 993, 191, 1, 255); -- Black Magic: Stonega III
INSERT INTO `mob_spell_lists` VALUES('Tethra', 993, 162, 1, 255); -- Black Magic: Stone IV
INSERT INTO `mob_spell_lists` VALUES('Tethra', 993, 357, 1, 255); -- White Magic: Slowga
INSERT INTO `mob_spell_lists` VALUES('Tethra', 993, 365, 1, 255); -- Black Magic: Breakga