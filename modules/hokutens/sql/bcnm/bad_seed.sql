-- Bad Seed ENM Battlefield Setup

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
DELETE FROM `bcnm_battlefield` WHERE `bcnmId` = 963;
INSERT INTO `bcnm_battlefield` VALUES (963,1,16904205,3); -- Bad Seed
INSERT INTO `bcnm_battlefield` VALUES (963,2,16904207,3);
INSERT INTO `bcnm_battlefield` VALUES (963,3,16904209,3);

-- Setup Mob Groups & Pools
DELETE FROM `mob_pools` WHERE name = 'Hamadryad';
INSERT INTO `mob_pools` VALUES (1885,'Hamadryad','Hamadryad',114,0x0000410500000000000000000000000000000000,5,5,8,200,100,0,1,1,0,18,0,0,5261,1671,0,0,512,0,0,114,114);

-- Setup Mob Skills

-- Setup Mob Spawn Points
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16904205;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16904207;
DELETE FROM `mob_spawn_points` WHERE `mobid` = 16904209;

INSERT INTO `mob_spawn_points` VALUES (16904205,'Hamadryad','Hamadryad',3,-598,82,0,254);
INSERT INTO `mob_spawn_points` VALUES (16904207,'Hamadryad','Hamadryad',3,5,0,0,254);
INSERT INTO `mob_spawn_points` VALUES (16904209,'Hamadryad','Hamadryad',3,602,-78,0,254);

-- Spell Lists
DELETE FROM `mob_spell_lists` WHERE `spell_list_id` = 897;
INSERT INTO `mob_spell_lists` VALUES('Hamadryad',897,145,1,255); -- fire_ii (1~255)
