-- Fire in the Sky ENM Battlefield Setup

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
DELETE FROM `bcnm_battlefield` WHERE `bcnmId` = 962;
INSERT INTO `bcnm_battlefield` VALUES (962,1,16904211,3); -- Fire in the Sky
INSERT INTO `bcnm_battlefield` VALUES (962,2,16904213,3);
INSERT INTO `bcnm_battlefield` VALUES (962,3,16904215,3);

-- Setup Mob Groups & Pools
DELETE FROM `mob_pools` WHERE `name` = 'Razon';
INSERT INTO `mob_pools` VALUES (3333,'Razon','Razon',69,0x0000220100000000000000000000000000000000,1,1,5,240,100,0,1,1,0,18,4,0,2802,135,12,0,0,0,0,248,69);

-- Setup Mob Skills
INSERT INTO `mob_skills` VALUES (571,870,'self-destruct_3',1,10.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (572,871,'self-destruct_3death',1,10.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (573,872,'self-destruct_2',1,7.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (574,873,'self-destruct_2death',1,7.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (575,874,'self-destruct_1',1,7.0,2000,1500,4,0,0,0,0,0,0);

DELETE FROM `mob_skill_lists` WHERE `skill_list_id` = 248;
INSERT INTO `mob_skill_lists` VALUES ('Razon',248,567);
INSERT INTO `mob_skill_lists` VALUES ('Razon',248,568);
INSERT INTO `mob_skill_lists` VALUES ('Razon',248,569);
INSERT INTO `mob_skill_lists` VALUES ('Razon',248,570);
INSERT INTO `mob_skill_lists` VALUES ('Razon',248,571);
INSERT INTO `mob_skill_lists` VALUES ('Razon',248,572);
INSERT INTO `mob_skill_lists` VALUES ('Razon',248,573);
INSERT INTO `mob_skill_lists` VALUES ('Razon',248,574);
INSERT INTO `mob_skill_lists` VALUES ('Razon',248,575);

-- Setup Mob Spawn Points
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16904211;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16904213;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16904215;

INSERT INTO `mob_spawn_points` VALUES (16904211,'Razon','Razon',4,-598,82,0,254);
INSERT INTO `mob_spawn_points` VALUES (16904213,'Razon','Razon',4,5,0,0,254);
INSERT INTO `mob_spawn_points` VALUES (16904215,'Razon','Razon',4,602,-78,0,254);

-- Spell Lists
-- Intentionally blank
