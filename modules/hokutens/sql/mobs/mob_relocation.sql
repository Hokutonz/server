-- ----------------------
-- Mob Relocation Updates
-- ----------------------

-- Valkurm Dunes, Goblin Leecher, Outpost Patrol
UPDATE mob_spawn_points SET pos_x = 210.481, pos_y = -6.946, pos_z = 101.274 WHERE mobid = 17199305;

-- Move very dangerous mobs from Crystal Warriorstarting areas

-- King Ranperre's Tomb
DELETE FROM `mob_spawn_points` WHERE mobid = 17555726;
INSERT INTO `mob_spawn_points` VALUES (17555726,'Plague_Bats','Plague_Bats',20,157.225,0.000,237.981,1);

-- Dangruf Wadi
DELETE FROM `nm_spawn_points` WHERE mobid = 17559558 AND pos = 2;
INSERT INTO `nm_spawn_points` VALUES (17559558,2,-412.532,4.000,42.275); -- Geyser Lizard

-- Toraimarai Canal
DELETE FROM `mob_spawn_points` WHERE mobid = 17469663;
DELETE FROM `mob_spawn_points` WHERE mobid = 17469665;
INSERT INTO `mob_spawn_points` VALUES (17469663,'Impish_Bats','Impish Bats',33,68.530,24.000,-21.890,143);
INSERT INTO `mob_spawn_points` VALUES (17469665,'Impish_Bats','Impish Bats',33,56.739,23.250,-37.431,227);

-- Castle Oztroja
DELETE FROM `mob_spawn_points` WHERE mobid = 17395990; -- Yagudo Zealot
DELETE FROM `mob_spawn_points` WHERE mobid = 17395991; -- Yagudo Lutenist
INSERT INTO `mob_spawn_points` VALUES (17395990,'Yagudo_Zealot','Yagudo Zealot',19,-167.000,-16.256,184.500,32);
INSERT INTO `mob_spawn_points` VALUES (17395991,'Yagudo_Lutenist','Yagudo Lutenist',23,-166.490,-16.176,191.291,96);

-- Relocates dangerous monsters away from outposts
-- Valkurm Dunes
UPDATE mob_spawn_points SET pos_x = 210.481, pos_y = -6.946, pos_z = 101.274 WHERE mobname = 'Goblin_Leecher' AND pos_x = 184.673 AND pos_y = -7.710 AND pos_z = 106.691;

-- Buburimu Peninsula
UPDATE mob_spawn_points SET pos_x = -396.957, pos_y = -32.261, pos_z = 44.893 WHERE mobname = 'Goblin_Shepherd' AND pos_x = -166.429 AND pos_y = 7.910 AND pos_z = -105.478;
UPDATE mob_spawn_points SET pos_x = -411.430, pos_y = -31.429, pos_z =  3.221 WHERE mobname = 'Goblin_Bandit'   AND pos_x = -134.000 AND pos_y = 7.000 AND pos_z = -96;

-- Cape Terrigan
UPDATE mob_spawn_points SET pos_x = -75.189, pos_y = -1.413, pos_z = -130.057 WHERE mobname = 'Goblin_Mercenary' AND pos_x = -139.706 AND pos_y = 7.167 AND pos_z = -61.223;
UPDATE mob_spawn_points SET pos_x =  -7.247, pos_y =  0.161, pos_z =    0.709 WHERE mobname = 'Goblin_Mercenary' AND pos_x = -144.000 AND pos_y = 8.000 AND pos_z = -21.000;
UPDATE mob_spawn_points SET pos_x = -61.728, pos_y = -1.335, pos_z =  -99.354 WHERE mobname = 'Goblin_Bandit'    AND pos_x = -154.915 AND pos_y = 7.554 AND pos_z = -38.958;
UPDATE mob_spawn_points SET pos_x = -37.084, pos_y =  0.000, pos_z =  -37.121 WHERE mobname = 'Goblin_Robber'    AND pos_x = -239.932 AND pos_y = 8.205 AND pos_z = -222.775;
UPDATE mob_spawn_points SET pos_x = -24.580, pos_y =  0.737, pos_z =  -82.615 WHERE mobname = 'Goblin_Robber'    AND pos_x = -232.230 AND pos_y = 7.024 AND pos_z = -273.263;

-- Eastern Altepa Desert
UPDATE mob_spawn_points SET pos_x = -325.870, pos_y = 7.453, pos_z = -196.602 WHERE mobname = 'Goblin_Ambusher' AND pos_x = -521.287 AND pos_y = -32.811 AND pos_z = 85.324;
UPDATE mob_spawn_points SET pos_x = -146.846, pos_y = 8.510, pos_z = -239.809 WHERE mobname = 'Goblin_Butcher'  AND pos_x = -482.059 AND pos_y = -31.970 AND pos_z = 67.880;

-- Yuhtunga Jungle
UPDATE mob_spawn_points SET pos_x = -190.317, pos_y = -0.048, pos_z = -340.674 WHERE mobname = 'Goblin_Furrier' AND pos_x = -224.306 AND pos_y = -1.550 AND pos_z = -358.469;
UPDATE mob_spawn_points SET pos_x = -291.329, pos_y = -0.013, pos_z = -351.107 WHERE mobname = 'Goblin_Furrier' AND pos_x = -238.298 AND pos_y = -0.420 AND pos_z = -366.293;

-- Yhoator Jungle
UPDATE mob_spawn_points SET pos_x = 244.705, pos_y = 0.000, pos_z = -162.007 WHERE mobname = 'Tonberry_Hexer'    AND pos_x = 236.941 AND pos_y = -0.50  AND pos_z = -82.527;
UPDATE mob_spawn_points SET pos_x = 230.252, pos_y = 0.600, pos_z = -190.586 WHERE mobname = 'Tonberry_Creeper'  AND pos_x = 236.445 AND pos_y = 0.017  AND pos_z = -99.661;
UPDATE mob_spawn_points SET pos_x = 207.793, pos_y = 0.594, pos_z = -174.136 WHERE mobname = 'Tonberry_Harasser' AND pos_x = 231.520 AND pos_y = -0.125 AND pos_z = -101.445;

-- North Gustaberg (S)
UPDATE mob_spawn_points SET pos_x =-525.911, pos_y = 39.690, pos_z = 7.759 WHERE mobname = 'Goblin_Skirmisher' AND pos_x = -396.666 AND pos_y = 46.627 AND pos_z = -95.098;