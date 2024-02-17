########################################################################################################################
## SQL script to support 'pirate_attack' module in modules/hokutens/mobs/pirate_attack.lua ##
########################################################################################################################

#######################################
## Prepare database for updated entries
#######################################
DELETE FROM mob_groups WHERE groupid = 10 and name = 'Crossbones_blm';
DELETE FROM mob_groups WHERE groupid = 11 and name = 'Crossbones_war';
DELETE FROM mob_groups WHERE groupid = 12 and name = 'Ship_Wight';
DELETE FROM mob_groups WHERE groupid = 13 and name = 'Blackbeard';
DELETE FROM mob_groups WHERE groupid = 13 and name = 'Silverhook';
DELETE FROM mob_pools WHERE poolid = 428 and name = 'Blackbeard';
DELETE FROM mob_pools WHERE poolid = 3626 and name = 'Silverhook';
DELETE FROM mob_pools WHERE poolid = 5878 and name = 'Crossbones_blm';
DELETE FROM mob_pools WHERE poolid = 844 and name = 'Crossbones_war';
DELETE FROM mob_spawn_points WHERE mobid = 17678342;
DELETE FROM mob_spawn_points WHERE mobid = 17678343;
DELETE FROM mob_spawn_points WHERE mobid = 17678344;
DELETE FROM mob_spawn_points WHERE mobid = 17678345;
DELETE FROM mob_spawn_points WHERE mobid = 17678346;
DELETE FROM mob_spawn_points WHERE mobid = 17678347;
DELETE FROM mob_spawn_points WHERE mobid = 17678348;
DELETE FROM mob_spawn_points WHERE mobid = 17678349;
DELETE FROM mob_spawn_points WHERE mobid = 17678350;
DELETE FROM mob_spawn_points WHERE mobid = 17682438;
DELETE FROM mob_spawn_points WHERE mobid = 17682439;
DELETE FROM mob_spawn_points WHERE mobid = 17707015;
DELETE FROM mob_spawn_points WHERE mobid = 17707017;
DELETE FROM mob_spawn_points WHERE mobid = 17707018;
DELETE FROM mob_spawn_points WHERE mobid = 17707026;
DELETE FROM mob_spawn_points WHERE mobid = 17711110;
DELETE FROM mob_spawn_points WHERE mobid = 17711111;
DELETE FROM mob_spawn_points WHERE mobid = 17711112;
DELETE FROM mob_spawn_points WHERE mobid = 17711113;
DELETE FROM mob_spawn_points WHERE mobid = 17711114;
DELETE FROM mob_spawn_points WHERE mobid = 17711121;

######################
## Insert updated rows
######################
INSERT INTO `mob_spawn_points` VALUES (17711110,'Sea_Crab','Sea Crab',6,1.698,-7.268,21.497,139);
INSERT INTO `mob_spawn_points` VALUES (17711111,'Sea_Crab','Sea Crab',6,1.698,-7.268,21.497,139);
INSERT INTO `mob_spawn_points` VALUES (17711112,'Sea_Pugil','Sea Pugil',7,-7.699,-7.663,7.549,0);
INSERT INTO `mob_spawn_points` VALUES (17711113,'Sea_Pugil','Sea Pugil',7,-7.699,-7.663,7.549,0);
INSERT INTO `mob_spawn_points` VALUES (17711114,'Sea_Monk','Sea Monk',8,4.560, -7.160, 17.430, 227);
INSERT INTO `mob_spawn_points` VALUES (17711121,'Silverhook','Silverhook',13,-6.320,-7.160,12.470,0);
INSERT INTO `mob_spawn_points` VALUES (17678342,'Sea_Crab','Sea Crab',6,4.560, -7.160, 17.430, 227);
INSERT INTO `mob_spawn_points` VALUES (17678343,'Sea_Crab','Sea Crab',6,1.698, -7.268, 21.497, 139);
INSERT INTO `mob_spawn_points` VALUES (17678344,'Sea_Pugil','Sea Pugil',7,1.698, -7.268, 21.497, 139);
INSERT INTO `mob_spawn_points` VALUES (17678345,'Sea_Pugil','Sea Pugil',7,-7.699, -7.663, 7.549,0);
INSERT INTO `mob_spawn_points` VALUES (17678346,'Sea_Monk','Sea Monk',8,4.560, -7.160, 17.430,0);
INSERT INTO `mob_spawn_points` VALUES (17678347,'Phantom','Phantom',9,0.0, -7.163, 15.823,0);
INSERT INTO `mob_spawn_points` VALUES (17678348,'Thunder_Elemental','Thunder Elemental',10,-4.560, -7.663, 3.749,0);
INSERT INTO `mob_spawn_points` VALUES (17678349,'Water_Elemental','Water Elemental',11,4.629, -7.663, 13.749,0);
INSERT INTO `mob_spawn_points` VALUES (17678350,'Sea_Horror','Sea Horror',12,3.560, -7.160, 11.430,100);
INSERT INTO `mob_spawn_points` VALUES (17682438,'Sea_Crab','Sea Crab',6,1.698, -7.268, 21.497, 139);
INSERT INTO `mob_spawn_points` VALUES (17682439,'Sea_Crab','Sea Crab',6,1.698, -7.268, 21.497, 139);
INSERT INTO `mob_spawn_points` VALUES (17707015,'Sea_Crab','Sea Crab',6,1.698,-7.268,21.497,139);
INSERT INTO `mob_spawn_points` VALUES (17707017,'Sea_Pugil','Sea Pugil',7,-7.699,-7.663,7.549,0);
INSERT INTO `mob_spawn_points` VALUES (17707018,'Sea_Monk','Sea Monk',8,4.560,-7.160,17.430,227);
INSERT INTO `mob_spawn_points` VALUES (17707026,'Enagakure','Enagakure',14,-6.387,-11.662,-13.986,0);
INSERT INTO `mob_groups` VALUES (10,5878,227,'Crossbones_blm',300,128,537,5000,5000,28,31,0);
INSERT INTO `mob_groups` VALUES (11,844,227,'Crossbones_war',300,128,537,5000,5000,28,31,0);
INSERT INTO `mob_groups` VALUES (12,3605,227,'Ship_Wight',300,128,0,0,0,36,39,0);
INSERT INTO `mob_groups` VALUES (13,428,227,'Blackbeard',0,128,282,9000,4500,67,70,0);
INSERT INTO `mob_groups` VALUES (13,3626,228,'Silverhook',0,128,2249,9000,4500,67,70,0);
INSERT INTO `mob_pools` VALUES (428,'Blackbeard','Blackbeard',227,0x0000390200000000000000000000000000000000,4,4,6,240,100,0,1,1,0,2,0,32,166,159,0,0,983,0,0,227,227);
INSERT INTO `mob_pools` VALUES (3626,'Silverhook','Silverhook',227,0x00003A0200000000000000000000000000000000,4,4,6,240,100,0,1,1,0,2,0,32,238,159,0,0,984,0,0,227,227);
INSERT INTO `mob_pools` VALUES (844,'Crossbones_war','Crossbones',227,0x0000340200000000000000000000000000000000,1,1,5,240,100,0,1,0,0,0,0,0,238,131,0,0,0,0,0,227,227);
INSERT INTO `mob_pools` VALUES (5878,'Crossbones_blm','Crossbones',227,0x00003C0200000000000000000000000000000000,4,4,5,240,100,0,1,0,0,0,0,0,238,131,0,0,28,0,0,227,227);

#########################
## Create new spell lists
## Blackbeard (983)
#########################
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 983, 166, 1, 255); -- thunder iii
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 983, 195, 1, 255); -- thundaga ii
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 983, 201, 1, 255); -- waterga iii
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 983, 206, 1, 255); -- freeze
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 983, 212, 1, 255); -- burst
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 983, 214, 1, 255); -- flood
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 983, 250, 1, 255); -- ice spikes
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 983, 252, 1, 255); -- stun
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 983, 274, 1, 255); -- sleepga ii

###################
## Silverhook (984)
###################
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 984, 151, 1, 255); -- blizzard iii
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 984, 180, 1, 255); -- blizzaga ii
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 984, 201, 1, 255); -- waterga iii
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 984, 206, 1, 255); -- freeze
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 984, 212, 1, 255); -- burst
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 984, 214, 1, 255); -- flood
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 984, 250, 1, 255); -- ice spikes
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 984, 252, 1, 255); -- stun
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 984, 253, 1, 255); -- sleep
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 984, 274, 1, 255); -- sleepga ii

########################
## Create new drop lists
########################
INSERT INTO `mob_droplist` VALUES(3973, 0, 0, 1000, 13095,  500); -- Crossbones, Sand Charm
INSERT INTO `mob_droplist` VALUES(3973, 0, 0, 1000,   880, 1000); -- Crossbones, Bone Chip
INSERT INTO `mob_droplist` VALUES(3972, 0, 0, 1000, 18396,  200); -- Blackbeard, Sea Robber Cudgel
INSERT INTO `mob_droplist` VALUES(3972, 0, 0, 1000,   880, 1000); -- Blackbeard, Bone Chip
INSERT INTO `mob_droplist` VALUES(3971, 0, 0, 1000, 18395,  200); -- Silverhook, Sealwolf Cudgel
INSERT INTO `mob_droplist` VALUES(3971, 0, 0, 1000,   880, 1000); -- Silverhook, Bone Chip