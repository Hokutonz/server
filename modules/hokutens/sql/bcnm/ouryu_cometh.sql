-- Ouryu Cometh Battlefield Setup

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
DELETE FROM `mob_droplist` WHERE dropId = 1962;
INSERT INTO `mob_droplist` VALUES (1962,1,1,794,1110,190);       -- Beetle Blood
INSERT INTO `mob_droplist` VALUES (1962,1,1,794,655,90);         -- Adaman Ingot
INSERT INTO `mob_droplist` VALUES (1962,1,1,794,860,50);         -- Behemoth Hide
INSERT INTO `mob_droplist` VALUES (1962,1,1,794,836,140);        -- Damascene Cloth
INSERT INTO `mob_droplist` VALUES (1962,1,1,794,658,100);        -- Damascus Ingot
INSERT INTO `mob_droplist` VALUES (1962,1,1,794,722,95);         -- Divine Log
INSERT INTO `mob_droplist` VALUES (1962,1,1,794,837,185);        -- Malboro Fiber
INSERT INTO `mob_droplist` VALUES (1962,1,1,794,1313,150);       -- Siren's Hair
INSERT INTO `mob_droplist` VALUES (1962,1,2,775,1133,250);       -- Dragon Blood
INSERT INTO `mob_droplist` VALUES (1962,1,2,775,4272,600);       -- Dragon Meat
INSERT INTO `mob_droplist` VALUES (1962,1,2,775,903,150);        -- Dragon Talon
INSERT INTO `mob_droplist` VALUES (1962,0,0,1000,1703,@ALWAYS);  -- Kunwu Ore
INSERT INTO `mob_droplist` VALUES (1962,0,0,1000,1703,@ALWAYS);  -- Kunwu Ore
INSERT INTO `mob_droplist` VALUES (1962,0,0,1000,1703,@ALWAYS);  -- Kunwu Ore
INSERT INTO `mob_droplist` VALUES (1962,0,0,1000,2108,@ALWAYS);  -- Monarch's Orb
INSERT INTO `mob_droplist` VALUES (1962,0,0,1000,17658,@ALWAYS); -- Tutelary
INSERT INTO `mob_droplist` VALUES (1962,0,0,1000,1816,@ALWAYS);  -- Wyrm Horn
INSERT INTO `mob_droplist` VALUES (1962,1,3,361,4486,200);       -- Dragon Heart
INSERT INTO `mob_droplist` VALUES (1962,1,3,361,836,200);        -- Damascene Cloth
INSERT INTO `mob_droplist` VALUES (1962,1,3,361,1526,250);       -- Wyrm Beard
INSERT INTO `mob_droplist` VALUES (1962,1,3,361,17799,600);      -- Imanotsurugi
INSERT INTO `mob_droplist` VALUES (1962,1,4,216,1133,400);       -- Dragon Blood
INSERT INTO `mob_droplist` VALUES (1962,1,4,216,903,250);        -- Dragon Talon
INSERT INTO `mob_droplist` VALUES (1962,1,4,216,1311,150);       -- Oxblood
INSERT INTO `mob_droplist` VALUES (1962,1,4,216,27456,250);      -- Criers Gaiters

DELETE FROM `mob_droplist` WHERE dropId = 2804;
INSERT INTO `mob_droplist` VALUES (2804,0,0,1000,1830,@VCOMMON); -- Sack Of Lugworm Sand (Very Common, 24%)
INSERT INTO `mob_droplist` VALUES (2804,0,0,1000,1831,@VCOMMON); -- Worm Mulch (Very Common, 24%)

-- Setup Battlefield Instance
INSERT INTO `bcnm_battlefield` VALUES (928,1,16900312,1); -- ouryu_cometh
INSERT INTO `bcnm_battlefield` VALUES (928,1,16900313,1);
INSERT INTO `bcnm_battlefield` VALUES (928,1,16900314,3);
INSERT INTO `bcnm_battlefield` VALUES (928,1,16900315,1);
INSERT INTO `bcnm_battlefield` VALUES (928,1,16900316,1);
INSERT INTO `bcnm_battlefield` VALUES (928,1,16900317,1);
INSERT INTO `bcnm_battlefield` VALUES (928,1,16900318,1);

DELETE FROM `bcnm_info` WHERE bcnmId = 928;
INSERT INTO `bcnm_info` VALUES (928,30,'ouryu_cometh','nobody',0,3600,3600,0,18,0,7,0);

-- Setup Mob Groups & Pools
DELETE FROM `mob_groups` WHERE name = 'Water_Elemental' and `groupid` = 15 and `zoneid` = 30;
DELETE FROM `mob_groups` WHERE name = 'Earth_Elemental' and `groupid` = 16 and `zoneid` = 30;
DELETE FROM `mob_groups` WHERE name = 'Ouryu' and `groupid` = 17 and `zoneid` = 30;
DELETE FROM `mob_groups` WHERE name = 'Ziryu' and `groupid` = 18 and `zoneid` = 30;
INSERT INTO `mob_groups` VALUES (15,4309,30,'Water_Elemental',0,128,0,4000,10000,75,75,0);
INSERT INTO `mob_groups` VALUES (16,1160,30,'Earth_Elemental',0,128,0,4000,10000,75,75,0);
INSERT INTO `mob_groups` VALUES (17,9999,30,'Ouryu',0,128,1962,50000,20000,90,90,0);
INSERT INTO `mob_groups` VALUES (18,4507,30,'Ziryu',0,128,2804,4000,10000,75,75,0);
INSERT INTO `mob_pool_mods` VALUES (4507,64,1,1);
DELETE FROM `mob_pools` WHERE poolid = 3070;
DELETE FROM `mob_pools` WHERE poolid = 4507;
INSERT INTO `mob_pools` VALUES (3070,'Ouryu','Ouryu',259,0x0000620200000000000000000000000000000000,7,4,7,240,125,1040,1,1,0,2,0,32,297,1181,0,0,109,0,0,259,259);
INSERT INTO `mob_pools` VALUES (4507,'Ziryu','Ziryu',258,0x0000A80100000000000000000000000000000000,4,5,7,240,100,0,1,0,1,16,0,0,1466,135,0,0,900,0,64,258,258);
INSERT INTO `mob_pools` VALUES (9999,'Ouryu','Ouryu',259,_binary 0x0000620200000000000000000000000000000000,7,4,7,240,125,1040,1,1,0,18,648,32,297,1183,0,0,109,0,0,259,259);

-- Setup Mob Skills
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 957;  -- absolute_terror
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1282; -- touchdown
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1292; -- touchdown
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1298; -- ochre_blast_alt
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1302; -- touchdown
INSERT INTO `mob_skills` VALUES (957,659,'absolute_terror',1,15.0,4000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (1282,656,'touchdown',1,30.0,2000,0,4,8,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (1292,656,'touchdown',1,30.0,2000,0,4,8,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (1298,966,'ochre_blast_alt',0,18.0,500,0,4,4,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (1302,656,'touchdown',1,30.0,2000,0,4,0,0,0,0,0,0);

-- The changes above affected Fafnir/Nidhogg absolute terror causing it to become AoE, Below is the fix.
UPDATE `mob_skill_lists` SET `mob_skill_id` = 1045 WHERE `skill_list_name` = 'FafnirWyrm' AND `mob_skill_id` = 957;
UPDATE `mob_skill_lists` SET `mob_skill_id` = 1045 WHERE `skill_list_name` = 'NidhoggWyrm' AND `mob_skill_id` = 957;

-- Setup Mob Spawn Points
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16900312;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16900313;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16900314;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16900315;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16900316;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16900317;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16900318;
INSERT INTO `mob_spawn_points` VALUES (16900312,'Water_Elemental','Water Elemental',15,7.802,76.114,-739.050,165);
INSERT INTO `mob_spawn_points` VALUES (16900313,'Earth_Elemental','Earth Elemental',16,-3.884,76.006,-712.758,214);
INSERT INTO `mob_spawn_points` VALUES (16900314,'Ouryu','Ouryu',17,18.443,76.478,-740.331,224);
INSERT INTO `mob_spawn_points` VALUES (16900315,'Ziryu','Ziryu',18,46.836,76.828,-758.276,100);
INSERT INTO `mob_spawn_points` VALUES (16900316,'Ziryu','Ziryu',18,-5.680,76.098,-753.375,143);
INSERT INTO `mob_spawn_points` VALUES (16900317,'Ziryu','Ziryu',18,0.744,76.462,-712.730,229);
INSERT INTO `mob_spawn_points` VALUES (16900318,'Ziryu','Ziryu',18,10.129,76.462,-736.797,109);

-- Spell List (Ouryu)
DELETE FROM `mob_spell_lists` WHERE `spell_list_id` = 109 AND `spell_list_name` = 'Ouryu';
INSERT INTO `mob_spell_lists` VALUES ('Ouryu',109,190,1,80);   -- stonega_ii
INSERT INTO `mob_spell_lists` VALUES ('Ouryu',109,191,80,255); -- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Ouryu',109,255,80,255); -- break
INSERT INTO `mob_spell_lists` VALUES ('Ouryu',109,357,1,80);   -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Ouryu',109,365,80,255); -- breakga

-- Spell List (Ziryu) (900)
INSERT INTO `mob_spell_lists` VALUES ('Ziryu',900,191,1,255);-- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Ziryu',900,210,1,255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Ziryu',900,54,1,255); -- Stoneskin