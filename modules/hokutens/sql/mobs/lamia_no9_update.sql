-- Lamias_Avatar
DELETE FROM `mob_pools` WHERE poolid = "2358";
INSERT INTO `mob_pools` VALUES (2358,'Lamias_Avatar','Lamias_Avatar',34,0x0000140000000000000000000000000000000000,4,4,7,240,100,0,0,0,1,0,0,0,129,0,0,0,0,0,0,40,34);
-- Lamia_No9
INSERT INTO `mob_skills` VALUES (1929,1278,'pole_swing',0,7.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (1762,1193,'belly_dance',0,7.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skill_lists` VALUES ('Lamie_No9', 5020, 1758); -- tail_slap
INSERT INTO `mob_skill_lists` VALUES ('Lamie_No9', 5020, 1759); -- hypnotic_sway
INSERT INTO `mob_skill_lists` VALUES ('Lamie_No9', 5020, 1762); -- belly_dance
INSERT INTO `mob_skill_lists` VALUES ('Lamie_No9', 5020, 1929); -- pole_swing
UPDATE `mob_pools` SET skill_list_id = "5020" WHERE poolid = "2367";
UPDATE `mob_groups` SET HP = "6500", dropid = "4001" WHERE poolid = "2367" AND groupid = "63";
-- Lamia_No9 Drops
-- DELETE FROM `mob_droplist` WHERE dropId = 4001;
INSERT INTO `mob_droplist` VALUES (4001,0,0,1000,14960,300); -- Evoker's Gages
INSERT INTO `mob_droplist` VALUES (4001,0,0,1000,1869,100); -- Lamia Skin
INSERT INTO `mob_droplist` VALUES (4001,0,0,1000,2167,10); -- Lamian Armlet
