-- Totentanz ENM Battlefield Setup

-- Variables
SET @ALWAYS = 1000;  -- Always, 100%
SET @VCOMMON = 240;  -- Very common, 24%
SET @COMMON = 150;   -- Common, 15%
SET @UNCOMMON = 100; -- Uncommon, 10%
SET @RARE = 50;      -- Rare, 5%
SET @VRARE = 10;     -- Very rare, 1%
SET @SRARE = 5;      -- Super Rare, 0.5%
SET @URARE = 1;      -- Ultra rare, 0.1%

-- Setup Drop Lists
-- Handled by Armoury Crate

-- Setup Battlefield Instance
DELETE FROM `bcnm_battlefield` WHERE `bcnmId` = 676;
INSERT INTO `bcnm_battlefield` VALUES (676,1,16810051,3); -- Totentanz (1)
INSERT INTO `bcnm_battlefield` VALUES (676,1,16810052,3);
INSERT INTO `bcnm_battlefield` VALUES (676,1,16810053,3);
INSERT INTO `bcnm_battlefield` VALUES (676,1,16810054,3);
INSERT INTO `bcnm_battlefield` VALUES (676,1,16810055,3);
INSERT INTO `bcnm_battlefield` VALUES (676,1,16810056,3);
INSERT INTO `bcnm_battlefield` VALUES (676,1,16810057,3);
INSERT INTO `bcnm_battlefield` VALUES (676,1,16810058,3);
INSERT INTO `bcnm_battlefield` VALUES (676,1,16810059,3);
INSERT INTO `bcnm_battlefield` VALUES (676,1,16810060,3);
INSERT INTO `bcnm_battlefield` VALUES (676,2,16810062,3); -- Totentanz (2)
INSERT INTO `bcnm_battlefield` VALUES (676,2,16810063,3);
INSERT INTO `bcnm_battlefield` VALUES (676,2,16810064,3);
INSERT INTO `bcnm_battlefield` VALUES (676,2,16810065,3);
INSERT INTO `bcnm_battlefield` VALUES (676,2,16810066,3);
INSERT INTO `bcnm_battlefield` VALUES (676,2,16810067,3);
INSERT INTO `bcnm_battlefield` VALUES (676,2,16810068,3);
INSERT INTO `bcnm_battlefield` VALUES (676,2,16810069,3);
INSERT INTO `bcnm_battlefield` VALUES (676,2,16810070,3);
INSERT INTO `bcnm_battlefield` VALUES (676,2,16810071,3);
INSERT INTO `bcnm_battlefield` VALUES (676,3,16810073,3); -- Totentanz (3)
INSERT INTO `bcnm_battlefield` VALUES (676,3,16810074,3);
INSERT INTO `bcnm_battlefield` VALUES (676,3,16810075,3);
INSERT INTO `bcnm_battlefield` VALUES (676,3,16810076,3);
INSERT INTO `bcnm_battlefield` VALUES (676,3,16810077,3);
INSERT INTO `bcnm_battlefield` VALUES (676,3,16810078,3);
INSERT INTO `bcnm_battlefield` VALUES (676,3,16810079,3);
INSERT INTO `bcnm_battlefield` VALUES (676,3,16810080,3);
INSERT INTO `bcnm_battlefield` VALUES (676,3,16810081,3);
INSERT INTO `bcnm_battlefield` VALUES (676,3,16810082,3);

-- Setup Mob Groups & Pools
DELETE FROM `mob_groups` WHERE `name` = 'Gwyn_Ap_Knudd';
DELETE FROM `mob_groups` WHERE `name` = 'Cadaver_Warrior';
DELETE FROM `mob_groups` WHERE `name` = 'Cadaver_Witch';
DELETE FROM `mob_groups` WHERE `name` = 'Erdgeist';

DELETE FROM `mob_pools` WHERE `name` = 'Gwyn_Ap_Knudd';
DELETE FROM `mob_pools` WHERE `name` = 'Cadaver_Warrior';
DELETE FROM `mob_pools` WHERE `name` = 'Cadaver_Witch';
DELETE FROM `mob_pools` WHERE `name` = 'Erdgeist';

INSERT INTO `mob_groups` VALUES (15,1860,8,'Gwyn_Ap_Knudd',0,128,0,25000,5000,80,80,0);
INSERT INTO `mob_groups` VALUES (16,598,8,'Cadaver_Warrior',0,128,0,900,0,70,71,0);
INSERT INTO `mob_groups` VALUES (17,599,8,'Cadaver_Witch',0,128,0,800,0,70,71,0);
INSERT INTO `mob_groups` VALUES (18,1250,8,'Erdgeist',0,128,0,750,0,70,71,0);

INSERT INTO `mob_pools` VALUES (598,'Cadaver_Warrior','Cadaver_Warrior',227,0x00003C0200000000000000000000000000000000,1,1,5,240,100,0,1,1,1,18,0,0,6,2179,0,0,0,0,0,227,227);
INSERT INTO `mob_pools` VALUES (599,'Cadaver_Witch','Cadaver_Witch',227,0x0000340200000000000000000000000000000000,4,4,10,240,100,0,1,1,1,18,0,0,6,2691,0,0,499,0,0,227,227);
INSERT INTO `mob_pools` VALUES (1250,'Erdgeist','Erdgeist',121,0x0000700100000000000000000000000000000000,4,4,12,240,100,0,1,1,1,18,0,0,561,3203,0,0,499,0,0,121,121);
INSERT INTO `mob_pools` VALUES (1860,'Gwyn_Ap_Knudd','Gwyn_Ap_Knudd',74,0x0000530500000000000000000000000000000000,4,4,12,290,100,0,1,1,1,18,6204,32,930,159,0,0,898,0,0,74,74);

-- Setup Mob Skills
-- Intentionally Blank

-- Setup Mob Spawn Points
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810051';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810052';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810053';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810054';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810055';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810056';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810057';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810058';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810059';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810060';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810062';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810063';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810064';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810065';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810066';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810067';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810068';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810069';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810070';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810071';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810073';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810074';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810075';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810076';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810077';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810078';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810079';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810080';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810081';
DELETE FROM `mob_spawn_points` WHERE `mobid` = '16810082';

INSERT INTO `mob_spawn_points` VALUES (16810051,'Gwyn_Ap_Knudd','Gwyn Ap Knudd',15,-565,2.999,-431,61);
INSERT INTO `mob_spawn_points` VALUES (16810052,'Cadaver_Warrior','Cadaver Warrior',16,-539.103,-0.004,-425.733,103);
INSERT INTO `mob_spawn_points` VALUES (16810053,'Cadaver_Warrior','Cadaver Warrior',16,-540.587,-0.213,-430.560,250);
INSERT INTO `mob_spawn_points` VALUES (16810054,'Cadaver_Warrior','Cadaver Warrior',16,-562.209,3.068,-434.418,64);
INSERT INTO `mob_spawn_points` VALUES (16810055,'Cadaver_Witch','Cadaver Witch',17,-570.718,2.169,-429.408,28);
INSERT INTO `mob_spawn_points` VALUES (16810056,'Cadaver_Witch','Cadaver Witch',17,-580.026,0.498,-480.156,64);
INSERT INTO `mob_spawn_points` VALUES (16810057,'Cadaver_Witch','Cadaver Witch',17,-542.928,-0.250,-445.372,95);
INSERT INTO `mob_spawn_points` VALUES (16810058,'Erdgeist','Erdgeist',18,-565.825,2.274,-447.007,193);
INSERT INTO `mob_spawn_points` VALUES (16810059,'Erdgeist','Erdgeist',18,-544.757,-0.042,-443.543,64);
INSERT INTO `mob_spawn_points` VALUES (16810060,'Erdgeist','Erdgeist',18,-587.746,-1.557,-471.799,105);
INSERT INTO `mob_spawn_points` VALUES (16810062,'Gwyn_Ap_Knudd','Gwyn Ap Knudd',15,-6.000,2.924,129.000,61);
INSERT INTO `mob_spawn_points` VALUES (16810063,'Cadaver_Warrior','Cadaver Warrior',16,21.472,-0.144,133.668,64);
INSERT INTO `mob_spawn_points` VALUES (16810064,'Cadaver_Warrior','Cadaver Warrior',16,1.409,1.384,110.937,64);
INSERT INTO `mob_spawn_points` VALUES (16810065,'Cadaver_Warrior','Cadaver Warrior',16,-8.425,2.191,132.875,64);
INSERT INTO `mob_spawn_points` VALUES (16810066,'Cadaver_Witch','Cadaver Witch',17,-10.143,2.029,129.993,64);
INSERT INTO `mob_spawn_points` VALUES (16810067,'Cadaver_Witch','Cadaver Witch',17,-19.973,0.296,75.118,64);
INSERT INTO `mob_spawn_points` VALUES (16810068,'Cadaver_Witch','Cadaver Witch',17,17.647,-0.390,114.029,64);
INSERT INTO `mob_spawn_points` VALUES (16810069,'Erdgeist','Erdgeist',18,-5.250,2.134,112.394,193);
INSERT INTO `mob_spawn_points` VALUES (16810070,'Erdgeist','Erdgeist',18,15.818,-0.182,115.858,64);
INSERT INTO `mob_spawn_points` VALUES (16810071,'Erdgeist','Erdgeist',18,-27.171,-1.697,87.602,64);
INSERT INTO `mob_spawn_points` VALUES (16810073,'Gwyn_Ap_Knudd','Gwyn Ap Knudd',15,474.624,3.066,610.567,61);
INSERT INTO `mob_spawn_points` VALUES (16810074,'Cadaver_Warrior','Cadaver Warrior',16,500.521,0.063,615.834,103);
INSERT INTO `mob_spawn_points` VALUES (16810075,'Cadaver_Warrior','Cadaver Warrior',16,499.037,-0.146,611.007,204);
INSERT INTO `mob_spawn_points` VALUES (16810076,'Cadaver_Warrior','Cadaver Warrior',16,477.415,3.135,607.149,64);
INSERT INTO `mob_spawn_points` VALUES (16810077,'Cadaver_Witch','Cadaver Witch',17,468.906,2.236,612.159,31);
INSERT INTO `mob_spawn_points` VALUES (16810078,'Cadaver_Witch','Cadaver Witch',17,459.598,0.565,561.411,64);
INSERT INTO `mob_spawn_points` VALUES (16810079,'Cadaver_Witch','Cadaver Witch',17,496.696,-0.183,596.195,180);
INSERT INTO `mob_spawn_points` VALUES (16810080,'Erdgeist','Erdgeist',18,473.799,2.341,594.560,193);
INSERT INTO `mob_spawn_points` VALUES (16810081,'Erdgeist','Erdgeist',18,494.867,0.025,598.024,52);
INSERT INTO `mob_spawn_points` VALUES (16810082,'Erdgeist','Erdgeist',18,451.878,-1.490,569.768,64);

-- Spell Lists
-- Totentanz Undead
INSERT INTO `mob_spell_lists` VALUES('Totentanz_Undead', 899, 190, 1, 255); -- stonega ii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Totentanz_Undead', 899, 200, 1, 255); -- waterga ii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Totentanz_Undead', 899, 185, 1, 255); -- aeroga ii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Totentanz_Undead', 899, 175, 1, 255); -- firaga ii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Totentanz_Undead', 899, 180, 1, 255); -- blizzaga ii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Totentanz_Undead', 899, 195, 1, 255); -- thundaga ii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Totentanz_Undead', 899, 245, 1, 255); -- drain (1~255)
INSERT INTO `mob_spell_lists` VALUES('Totentanz_Undead', 899, 247, 1, 255); -- aspir (1~255)

-- Gwyn Ap Knudd
INSERT INTO `mob_spell_lists` VALUES('Gwyn_Ap_Knudd', 898, 191, 1, 255); -- stonega iii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Gwyn_Ap_Knudd', 898, 201, 1, 255); -- waterga iii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Gwyn_Ap_Knudd', 898, 186, 1, 255); -- aeroga iii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Gwyn_Ap_Knudd', 898, 176, 1, 255); -- firaga iii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Gwyn_Ap_Knudd', 898, 181, 1, 255); -- blizzaga iii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Gwyn_Ap_Knudd', 898, 196, 1, 255); -- thundaga iii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Gwyn_Ap_Knudd', 898, 245, 1, 255); -- drain (1~255)
INSERT INTO `mob_spell_lists` VALUES('Gwyn_Ap_Knudd', 898, 247, 1, 255); -- aspir (1~255)
