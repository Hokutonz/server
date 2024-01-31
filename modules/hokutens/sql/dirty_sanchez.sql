# Add Dirty Sanchez grasshopper as a Beastmaster pet
INSERT INTO `pet_list` (`petid`, `name`, `poolid`, `minLevel`, `maxLevel`, `time`) VALUES ('100', 'Dirty Sanchez', '10000', '75', '85', '3600');
INSERT INTO `mob_pools` (`poolid`, `name`, `packet_name`, `familyid`, `modelid`, `mJob`, `sJob`, `cmbSkill`, `cmbDelay`, `cmbDmgMult`, `behavior`, `aggro`, `true_detection`, `links`, `mobType`, `immunity`, `name_prefix`, `flag`, `entityFlags`, `animationsub`, `hasSpellScript`, `spellList`, `namevis`, `roamflag`, `skill_list_id`, `resist_id`) VALUES (10000, 'Pet_Dirty_Sanchez', 'Pet_Dirty_Sanchez', 339, 0x0000f10900000000000000000000000000000000, 1, 1, 7, 240, 100, 0, 0, 0, 0, 8, 0, 0, 449, 129, 0, 0, 0, 0, 0, 10000, 339);
UPDATE `item_basic` SET `name`='jug_of_fun_dip', `sortname`='fun_dip' WHERE  `itemid`=17917;
UPDATE `item_equipment` SET `name`='fun_dip', `level`='75' WHERE  `itemId`=17917;
UPDATE `item_weapon` SET `name`='fun_dip', `subskill`='100' WHERE  `itemId`=17917;
DELETE FROM `synth_recipes` WHERE  `ID`=74534;
INSERT INTO `mob_skill_lists` (`skill_list_name`, `skill_list_id`, `mob_skill_id`) VALUES ('Jug_DSanchez', '10000', '761');
INSERT INTO `mob_skill_lists` (`skill_list_name`, `skill_list_id`, `mob_skill_id`) VALUES ('Jug_DSanchez', '10000', '762');
UPDATE `abilities` SET `message2`='0' WHERE  `abilityId`=761;
UPDATE `abilities` SET `animation`='0' WHERE  `abilityId`=762;
UPDATE `mob_skills` SET `mob_anim_id`='2168' WHERE  `mob_skill_id`=2946;
UPDATE `mob_skills` SET `mob_anim_id`='2169' WHERE  `mob_skill_id`=2947;