UPDATE `mob_groups` SET `minLevel` = "82", `maxLevel` = "82" WHERE `name` = "Qnxzomit" AND `zoneid` = "33";
UPDATE `mob_groups` SET `minLevel` = "82", `maxLevel` = "82" WHERE `name` = "Ruphuabo" AND `zoneid` = "33";
UPDATE `mob_groups` SET `minLevel` = "82", `maxLevel` = "82" WHERE `name` = "Qnhpemde" AND `zoneid` = "33";
UPDATE `mob_groups` SET `minLevel` = "92", `maxLevel` = "92" WHERE `name` = "Jailer_of_Hope" AND `zoneid` = "33";
UPDATE `mob_groups` SET `minLevel` = "92", `maxLevel` = "92" WHERE `name` = "Jailer_of_Justice" AND `zoneid` = "33";
UPDATE `mob_groups` SET `minLevel` = "92", `maxLevel` = "92" WHERE `name` = "Jailer_of_Prudence" AND `zoneid` = "33";
UPDATE `mob_groups` SET `minLevel` = "95", `maxLevel` = "95" WHERE `name` = "Jailer_of_Love" AND `zoneid` = "33";
UPDATE `mob_groups` SET `minLevel` = "100", `maxLevel` = "100" WHERE `name` = "Absolute_Virtue" AND `zoneid` = "33";

UPDATE mob_groups SET HP=5000 WHERE groupid = 51 AND `name` = 'Qnxzomit';
UPDATE mob_groups SET HP=5000 WHERE groupid = 54 AND `name` = 'Ruphuabo';
UPDATE mob_groups SET HP=5000 WHERE groupid = 55 AND `name` = 'Qnhpemde';
UPDATE mob_groups SET HP=90000 WHERE groupid = 49 AND `name` = 'Jailer_of_Hope';
UPDATE mob_groups SET HP=90000 WHERE groupid = 50 AND `name` = 'Jailer_of_Justice';
UPDATE mob_groups SET HP=50000 WHERE groupid = 52 AND `name` = 'Jailer_of_Prudence';
UPDATE mob_groups SET HP=125000, `MP`='50000' WHERE groupid = 53 AND `name` = 'Jailer_of_Love';
UPDATE mob_groups SET HP=150000 WHERE groupid = 56 AND `name` = 'Absolute_Virtue';
UPDATE mob_pools SET `mJob`='4' WHERE  `poolid`=2134;
UPDATE mob_pools SET immunity = '18431' WHERE name = "Jailer_of_Love";
UPDATE mob_pools SET entityFlags = '1157' WHERE name = "Jailer_of_Love";
-- Renaming the second Jailer of Prudence is required for module functionality
UPDATE mob_spawn_points SET mobname = 'Jailer_of_Prudence_2' WHERE `mobid` =16912847;
-- Custom spell list for Jailer of Love Dark MODE
INSERT INTO mob_spell_lists VALUES('Love_dark',982,233,1,255);      -- bio_iv (1~255)
INSERT INTO mob_spell_lists VALUES('Love_dark',982,274,1,255);      -- sleepga_ii (1~255)
INSERT INTO mob_spell_lists VALUES('Love_dark',982,360,1,255);      -- dispelga (1~255)
INSERT INTO mob_spell_lists VALUES('Love_dark',982,277,1,255);      -- dread_spikes (1~255)
INSERT INTO mob_spell_lists VALUES('Love_dark',982,275,1,255);      -- absorb-tp (1~255)
INSERT INTO mob_spell_lists VALUES('Love_dark',982,246,62,255);     -- drain_ii (62~255)
-- Custom spell list for Jailer of Love Earth MODE                  
INSERT INTO `mob_spell_lists` VALUES ('Love_earth',981,162,1,255);  -- stone_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Love_earth',981,191,1,255);  -- stonega_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Love_earth',981,210,1,255);  -- quake (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Love_earth',981,238,1,255);  -- rasp (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Love_earth',981,365,1,255);  -- breakga (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Love_earth',981,357,1,255);  -- slowga (1~255)
-- Custom spell list for Jailer of Love Light MODE                  
INSERT INTO `mob_spell_lists` VALUES ('Love_light',980,477,86,255); -- regen_iv (86~255)
INSERT INTO `mob_spell_lists` VALUES ('Love_light',980,6,80,255);   -- cure_vi (80~255)
INSERT INTO `mob_spell_lists` VALUES ('Love_light',980,35,45,255);  -- diaga_iii (45~255)
INSERT INTO `mob_spell_lists` VALUES ('Love_light',980,40,1,255);   -- banishga_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Love_light',980,31,1,255);   -- banish_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Love_light',980,22,95,255);  -- holy_ii (95~255)
INSERT INTO `mob_spell_lists` VALUES ('Love_light',980,112,1,255);  -- flash (1~255)
