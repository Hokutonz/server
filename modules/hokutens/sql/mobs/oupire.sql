-- Delete OLD Oupire Spell List
DELETE FROM `mob_spell_lists` WHERE  `spell_list_id`= "150";
DELETE FROM `mob_spell_lists` WHERE  `spell_list_id`= "992";
DELETE FROM `mob_spell_lists` WHERE  `spell_list_id`= "991";
DELETE FROM `mob_spell_lists` WHERE  `spell_list_id`= "990";
DELETE FROM `mob_spell_lists` WHERE  `spell_list_id`= "989";
DELETE FROM `mob_spell_lists` WHERE  `spell_list_id`= "988";
DELETE FROM `mob_spell_lists` WHERE  `spell_list_id`= "987";
DELETE FROM `mob_skill_lists` WHERE  `skill_list_id`= "284";

-- Update Ouire Animation sub from 8 to 0
UPDATE `mob_pools` SET `animationsub`='0' WHERE  `poolid`=3069;

-- Update Oupire's HP/MP Max level
UPDATE `mob_groups` SET `HP`='38000', `MP`='9999', `maxLevel`='88' WHERE  `zoneid`=72 AND `groupid`=7;

-- Oupire Spell List (Ice)
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Ice', 992, 181, 1, 255); -- Blizzaga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Ice', 992, 152, 1, 255); -- Blizzard IV
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Ice', 992, 227, 1, 255); -- Poisonga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Ice', 992, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Ice', 992, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Ice', 992, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Ice', 992, 361, 1, 255); -- Blindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Ice', 992, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Ice', 992, 274, 1, 255); -- Sleepga II
-- Oupire Spell List (Wind)
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Wind', 991, 186, 1, 255); -- Aeroga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Wind', 991, 157, 1, 255); -- Aero IV
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Wind', 991, 227, 1, 255); -- Poisonga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Wind', 991, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Wind', 991, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Wind', 991, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Wind', 991, 361, 1, 255); -- Blindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Wind', 991, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Wind', 991, 274, 1, 255); -- Sleepga II
-- Oupire Spell List (Earth)
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Earth', 990, 191, 1, 255); -- Stonega III
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Earth', 990, 162, 1, 255); -- Stone IV
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Earth', 990, 227, 1, 255); -- Poisonga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Earth', 990, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Earth', 990, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Earth', 990, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Earth', 990, 361, 1, 255); -- Blindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Earth', 990, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Earth', 990, 274, 1, 255); -- Sleepga II
-- Oupire Spell List (Thunder)
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Thunder', 989, 196, 1, 255); -- Thundaga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Thunder', 989, 167, 1, 255); -- Thunder IV
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Thunder', 989, 227, 1, 255); -- Poisonga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Thunder', 989, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Thunder', 989, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Thunder', 989, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Thunder', 989, 361, 1, 255); -- Blindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Thunder', 989, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Thunder', 989, 274, 1, 255); -- Sleepga II
-- Oupire Spell List (Water)
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Water', 988, 201, 1, 255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Water', 988, 172, 1, 255); -- Water IV
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Water', 988, 227, 1, 255); -- Poisonga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Water', 988, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Water', 988, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Water', 988, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Water', 988, 361, 1, 255); -- Blindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Water', 988, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Water', 988, 274, 1, 255); -- Sleepga II
-- Oupire Spell List (Fire)
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Fire', 987, 176, 1, 255); -- Firaga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Fire', 987, 147, 1, 255); -- Fire IV
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Fire', 987, 227, 1, 255); -- Poisonga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Fire', 987, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Fire', 987, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Fire', 987, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Fire', 987, 361, 1, 255); -- Blindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Fire', 987, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Oupire_Fire', 987, 274, 1, 255); -- Sleepga II
-- Oupire Spell List (Non-Elemental)
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 227, 1, 255); -- Poisonga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 361, 1, 255); -- Blindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 274, 1, 255); -- Sleepga II

-- Oupire Mob_Skill_Lists
INSERT INTO `mob_skill_lists` VALUES('Oupire', 284, 2106);
INSERT INTO `mob_skill_lists` VALUES('Oupire', 284, 2107);
INSERT INTO `mob_skill_lists` VALUES('Oupire', 284, 2108);
INSERT INTO `mob_skill_lists` VALUES('Oupire', 284, 2109);
INSERT INTO `mob_skill_lists` VALUES('Oupire', 284, 2110);
INSERT INTO `mob_skill_lists` VALUES('Oupire', 284, 2111);