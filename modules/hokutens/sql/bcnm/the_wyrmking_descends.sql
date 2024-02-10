-- Wyrmking Descends Battlefield Setup

-- Variables
SET @ALWAYS = 1000;  -- Always, 100%
SET @VCOMMON = 240;  -- Very common, 24%
SET @COMMON = 150;   -- Common, 15%
SET @UNCOMMON = 100; -- Uncommon, 10%
SET @RARE = 50;      -- Rare, 5%
SET @VRARE = 10;     -- Very rare, 1%
SET @SRARE = 5;      -- Super Rare, 0.5%
SET @URARE = 1;      -- Ultra rare, 0.1%

-- Setup Drop Lists (Drop ID: 900)
INSERT INTO `mob_droplist` VALUES (3969,1,1,@ALWAYS,17598,231); -- Bahamut Staff
INSERT INTO `mob_droplist` VALUES (3969,1,1,@ALWAYS,17597,769); -- Dragon Staff
INSERT INTO `mob_droplist` VALUES (3969,1,2,@ALWAYS,15264,318); -- Bahamut Mask
INSERT INTO `mob_droplist` VALUES (3969,1,2,@ALWAYS,18061,268); -- Bahamut Zaghnal
INSERT INTO `mob_droplist` VALUES (3969,1,2,@ALWAYS,15599,414); -- Bahamut Hose
INSERT INTO `mob_droplist` VALUES (3969,1,3,712,1704,1000);     -- Kunwu Iron
INSERT INTO `mob_droplist` VALUES (3969,1,4,678,1703,1000);     -- Kunwu Ore
INSERT INTO `mob_droplist` VALUES (3969,1,5,864,647,1000);      -- Moly Ore
INSERT INTO `mob_droplist` VALUES (3969,1,6,763,647,1000);      -- Moly Ore
INSERT INTO `mob_droplist` VALUES (3969,1,7,576,1714,1000);     -- Cashmere Cloth
INSERT INTO `mob_droplist` VALUES (3969,1,8,593,1713,1000);     -- Cashmere Thread
INSERT INTO `mob_droplist` VALUES (3969,1,9,746,1816,1000);     -- Wyrm Horn
INSERT INTO `mob_droplist` VALUES (3969,1,10,864,10132,200);    -- Cipher: Lhus (Matsui-P)

-- Battlefield Setup
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896157,3);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896158,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896159,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896160,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896161,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896162,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896163,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896164,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896165,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896166,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896167,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896168,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896169,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896170,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896171,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896172,0);
INSERT INTO `bcnm_battlefield` VALUES (897,1,16896173,0);
DELETE FROM `bcnm_info` WHERE `bcnmId` = 897;
INSERT INTO `bcnm_info` VALUES (897,29,'wyrmking_descends','nobody',0,3600,3600,0,18,0,7,0);

-- Setup Mob Groups
DELETE FROM `mob_groups` WHERE name = 'Bahamutv2' AND groupid = 28 AND zoneid = 29;
DELETE FROM `mob_groups` WHERE name = 'Ouryu' AND groupid = 18 AND zoneid = 29;
DELETE FROM `mob_groups` WHERE name = 'Tiamat' AND groupid = 19 AND zoneid = 29;
DELETE FROM `mob_groups` WHERE name = 'Jormungand' AND groupid = 20 AND zoneid = 29;
DELETE FROM `mob_groups` WHERE name = 'Vrtra' AND groupid = 21 AND zoneid = 29;
DELETE FROM `mob_groups` WHERE name = 'Ziryu' AND groupid = 22 AND zoneid = 29;
DELETE FROM `mob_groups` WHERE name = 'Water_Elemental' AND groupid = 23 AND zoneid = 29;
DELETE FROM `mob_groups` WHERE name = 'Earth_Elemental' AND groupid = 24 AND zoneid = 29;
DELETE FROM `mob_groups` WHERE name = 'Pey' AND groupid = 25 AND zoneid = 29;
DELETE FROM `mob_groups` WHERE name = 'Iruci' AND groupid = 26 AND zoneid = 29;
DELETE FROM `mob_groups` WHERE name = 'Airi' AND groupid = 27 AND zoneid = 29;

INSERT INTO `mob_groups` VALUES (28,325,29,'Bahamutv2',0,128,3969,100000,50000,92,92,0);
INSERT INTO `mob_groups` VALUES (18,3070,29,'Ouryu',0,128,3970,20000,15000,88,88,0);
INSERT INTO `mob_groups` VALUES (19,3916,29,'Tiamat',0,128,3970,20000,15000,88,88,0);
INSERT INTO `mob_groups` VALUES (20,2156,29,'Jormungand',0,128,3970,20000,15000,88,88,0);
INSERT INTO `mob_groups` VALUES (21,4261,29,'Vrtra',0,128,3970,20000,15000,88,88,0);
INSERT INTO `mob_groups` VALUES (22,4507,29,'Ziryu',0,128,0,20000,15000,75,75,0);
INSERT INTO `mob_groups` VALUES (23,4309,29,'Water_Elemental',0,128,0,0,15000,75,75,0);
INSERT INTO `mob_groups` VALUES (24,1160,29,'Earth_Elemental',0,128,0,0,15000,75,75,0);
INSERT INTO `mob_groups` VALUES (25,3124,29,'Pey',0,128,0,0,0,78,80,0);
INSERT INTO `mob_groups` VALUES (26,2105,29,'Iruci',0,128,0,0,15000,78,80,0);
INSERT INTO `mob_groups` VALUES (27,70,29,'Airi',0,128,0,0,15000,78,80,0);

-- Ouryu, Jormungand, Tiamat, Vrtra (The Wymrking Descends)
INSERT INTO `mob_droplist` VALUES (3970,1,1,1000,1312,100);  -- Angel Skin
INSERT INTO `mob_droplist` VALUES (3970,1,1,1000,655,100);   -- Adaman Ingot
INSERT INTO `mob_droplist` VALUES (3970,1,1,1000,658,100);   -- Damascus Ingot
INSERT INTO `mob_droplist` VALUES (3970,1,1,1000,747,100);   -- Orichalcum Ingot
INSERT INTO `mob_droplist` VALUES (3970,1,1,1000,722,100);   -- Divine Log
INSERT INTO `mob_droplist` VALUES (3970,1,1,1000,1313,100);  -- Siren's Hair
INSERT INTO `mob_droplist` VALUES (3970,1,1,1000,1274,100);  -- Southern Pearl
INSERT INTO `mob_droplist` VALUES (3970,1,2,1000,836,330);   -- Damascene Cloth
INSERT INTO `mob_droplist` VALUES (3970,1,2,1000,1769,330);  -- Galateia
INSERT INTO `mob_droplist` VALUES (3970,0,0,1000,1312,100);  -- Angel Skin
INSERT INTO `mob_droplist` VALUES (3970,0,0,1000,655,100);   -- Adaman Ingot
INSERT INTO `mob_droplist` VALUES (3970,0,0,1000,658,100);   -- Damascus Ingot
INSERT INTO `mob_droplist` VALUES (3970,0,0,1000,747,100);   -- Orichalcum Ingot
INSERT INTO `mob_droplist` VALUES (3970,0,0,1000,722,100);   -- Divine Log
INSERT INTO `mob_droplist` VALUES (3970,0,0,1000,1313,100);  -- Siren's Hair
INSERT INTO `mob_droplist` VALUES (3970,0,0,1000,1274,100);  -- Southern Pearl

-- Setup Pets
DELETE FROM `mob_pets` WHERE `mob_mobid` = 16896161;
DELETE FROM `mob_pets` WHERE `mob_mobid` = 17555890;

-- Setup Mob Pools
DELETE FROM `mob_pools` WHERE `poolid` = 325 AND name = 'Bahamut';
INSERT INTO `mob_pools` VALUES (325,'Bahamut','Bahamut',449,0x00001B0500000000000000000000000000000000,4,5,7,240,125,1024,1,1,0,16,55,32,100,157,0,0,144,0,0,726,449);

-- Setup Mob Skills
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1542;
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1543;
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1544;
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1545;
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1546;
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1547;
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1549;
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1550;
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1552;
DELETE FROM `mob_skills` WHERE `mob_skill_id` = 1553;

INSERT INTO `mob_skills` VALUES (1542,1133,'trample',1,8.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (1543,1134,'tempest_wing',4,30.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (1544,1139,'touchdown_bahamut',1,10.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (1545,1140,'sweeping_flail',1,20.0,2000,1500,4,0,0,5,0,0,0);
INSERT INTO `mob_skills` VALUES (1546,1135,'prodigious_spike',0,15.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (1547,1141,'impulsion',1,15.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (1549,1142,'horrible_roar',0,20.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (1550,1144,'summon_wyrm',0,15.0,2000,0,1,0,0,0,0,0,0); -- Animation only, used by Bahamut when summoning Wyrms
INSERT INTO `mob_skills` VALUES (1552,1137,'gigaflare',1,20.0,6000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (1553,1138,'teraflare',1,25.0,2000,1500,4,0,0,0,0,0,0);

-- Setup Mob Spawn Points
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16896156;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16896157;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16896158;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16896159;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16896160;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16896161;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16896163;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16896164;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16896165;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16896166;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16896167;

INSERT INTO `mob_spawn_points` VALUES (16896156,'Bahamut','Bahamut',17,-708.021,0.168,830.955,32);
INSERT INTO `mob_spawn_points` VALUES (16896157,'Bahamutv2','Bahamut',28,-708.021,0.168,830.955,32);
INSERT INTO `mob_spawn_points` VALUES (16896158,'Ouryu','Ouryu',18,-700.789,0.099,825.472,67);
INSERT INTO `mob_spawn_points` VALUES (16896159,'Tiamat','Tiamat',19,-676.976,0.151,821.501,32);
INSERT INTO `mob_spawn_points` VALUES (16896160,'Jormungand','Jormungand',20,-700.433,-1.297,796.733,156);
INSERT INTO `mob_spawn_points` VALUES (16896161,'Vrtra','Vrtra',21,-722.231,-0.479,819.624,23);
INSERT INTO `mob_spawn_points` VALUES (16896163,'Ziryu','Ziryu',22,1.000,1.000,1.000,0);
INSERT INTO `mob_spawn_points` VALUES (16896164,'Ziryu','Ziryu',22,1.000,1.000,1.000,0);
INSERT INTO `mob_spawn_points` VALUES (16896165,'Ziryu','Ziryu',22,1.000,1.000,1.000,0);
INSERT INTO `mob_spawn_points` VALUES (16896166,'Water_Elemental','Water Elemental',23,-698.782,1.983,791.966,0);
INSERT INTO `mob_spawn_points` VALUES (16896167,'Earth_Elemental','Earth Elemental',24,-672.014,0.769,833.819,0);