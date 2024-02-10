
-- KS99: Horns of War

INSERT INTO `mob_skills` VALUES (634,378,'meteor',1,40.0,2000,0,4,0,0,0,0,0,0); -- Chlevnik's death meteor (not normal meteor animation)
UPDATE mob_pools SET skill_list_id = 5021 WHERE name = "Chlevnik";
INSERT INTO mob_skill_lists VALUES ('Chlevnik',5021,628);
INSERT INTO mob_skill_lists VALUES ('Chlevnik',5021,629);
INSERT INTO mob_skill_lists VALUES ('Chlevnik',5021,630);
INSERT INTO mob_skill_lists VALUES ('Chlevnik',5021,631);
INSERT INTO mob_skill_lists VALUES ('Chlevnik',5021,632);
INSERT INTO mob_skill_lists VALUES ('Chlevnik',5021,633);
INSERT INTO mob_skill_lists VALUES ('Chlevnik',5021,634);


-- KS99: Early Bird Cathes the Wyrm

UPDATE mob_groups SET minLevel = 85, maxLevel = 85 WHERE name = "Wyrm";


-- KSNM30: Operation Desert Swarm

UPDATE mob_groups SET minLevel = 78, maxLevel = 78 WHERE name = "Platoon_Scorpion";


-- KSNM30: Copycat

UPDATE mob_groups SET HP = 20000, minLevel = 84, maxLevel = 84 WHERE name = "Osschaart";
INSERT INTO `bcnm_battlefield` VALUES (80,1,17367248,3); -- Copycat: Osschaart
INSERT INTO `bcnm_battlefield` VALUES (80,1,17367250,2); -- Osschart's Bat
INSERT INTO `bcnm_battlefield` VALUES (80,1,17367251,2); -- Osschart's Wyvern
INSERT INTO `bcnm_battlefield` VALUES (80,1,17367252,2); -- Osschart's Avatar
INSERT INTO `bcnm_battlefield` VALUES (80,1,17367253,2); -- Osschart's Automaton
INSERT INTO `bcnm_battlefield` VALUES (80,2,17367254,3); -- Osschaart
INSERT INTO `bcnm_battlefield` VALUES (80,2,17367256,2); -- Osschart's Bat
INSERT INTO `bcnm_battlefield` VALUES (80,2,17367257,2); -- Osschart's Wyvern
INSERT INTO `bcnm_battlefield` VALUES (80,2,17367258,2); -- Osschart's Avatar
INSERT INTO `bcnm_battlefield` VALUES (80,2,17367259,2); -- Osschart's Automaton
INSERT INTO `bcnm_battlefield` VALUES (80,3,17367260,3); -- Osschaart
INSERT INTO `bcnm_battlefield` VALUES (80,3,17367262,2); -- Osschart's Bat
INSERT INTO `bcnm_battlefield` VALUES (80,3,17367263,2); -- Osschart's Wyvern
INSERT INTO `bcnm_battlefield` VALUES (80,3,17367264,2); -- Osschart's Avatar
INSERT INTO `bcnm_battlefield` VALUES (80,3,17367265,2); -- Osschart's Automaton
REPLACE INTO `mob_spawn_points` (`mobid`, `mobname`, `polutils_name`, `groupid`, `pos_x`, `pos_y`, `pos_z`, `pos_rot`) VALUES
    (17367248, 'Osschaart',                'Osschaart',                36,          -177,      60,  -142,     125),
    (17367250, 'Osschaarts_Bat',           'Osschaart\'s Bat',         37,          -177,      60,  -140,     125),
    (17367251, 'Osschaarts_Wyvern',        'Osschaart\'s Wyvern',      38,          -177,      60,  -140,     125),
    (17367252, 'Osschaarts_Avatar',        'Osschaart\'s Avatar',      39,          -177,      60,  -140,     125),
    (17367253, 'Osschaarts_Automaton',     'Osschaart\'s Automaton',   40,          -177,      60,  -140,     125),
    (17367254, 'Osschaart',                'Osschaart',                36,            23,       0,    18,     125),
    (17367256, 'Osschaarts_Bat',           'Osschaart\'s Bat',         37,            23,       0,    18,     125),
    (17367257, 'Osschaarts_Wyvern',        'Osschaart\'s Wyvern',      38,            23,       0,    18,     125),
    (17367258, 'Osschaarts_Avatar',        'Osschaart\'s Avatar',      39,            23,       0,    18,     125),
    (17367259, 'Osschaarts_Automaton',     'Osschaart\'s Automaton',   40,            23,       0,    18,     125),
    (17367260, 'Osschaart',                'Osschaart',                36,           223,     -60,   138,     125),
    (17367262, 'Osschaarts_Bat',           'Osschaart\'s Bat',         37,           223,     -60,   138,     125),
    (17367263, 'Osschaarts_Wyvern',        'Osschaart\'s Wyvern',      38,           223,     -60,   138,     125),
    (17367264, 'Osschaarts_Avatar',        'Osschaart\'s Avatar',      39,           223,     -60,   138,     125),
    (17367265, 'Osschaarts_Automaton',     'Osschaart\'s Automaton',   40,           223,     -60,   138,     125);


-- BCNM60: Today's Horoscope (Horlais Peak)

UPDATE mob_groups SET minLevel = 85, maxLevel = 85, HP = 20000 WHERE name = 'Aries';
INSERT INTO `bcnm_battlefield` VALUES (16,1,17346744,3); -- todays_horoscope
INSERT INTO `bcnm_battlefield` VALUES (16,2,17346746,3);
INSERT INTO `bcnm_battlefield` VALUES (16,3,17346748,3);
INSERT INTO `mob_spell_lists` VALUES('Kurrea', 985, 54, 1, 255);  -- stoneskin (1~255)
INSERT INTO `mob_spell_lists` VALUES('Kurrea', 985, 356, 1, 255); -- paralyga (1~255)
UPDATE mob_pools SET spellList = 985 WHERE name = 'Aries';
REPLACE INTO `mob_spawn_points` (`mobid`, `mobname`, `polutils_name`, `groupid`, `pos_x`, `pos_y`, `pos_z`, `pos_rot`) VALUES
    (17346744,  'Aries',                    'Aries',                    34,    -396.153,    94.703,  -64.349,   46 ),
    (17346746,  'Aries',                    'Aries',                    34,    -156.218,   -25.306,  115.621,   46 ),
    (17346748,  'Aries',                    'Aries',                    34,      83.775,  -145.323,  295.455,   46 );


-- KSNM30: Cactuar Suave

INSERT INTO `bcnm_battlefield` VALUES (197,1,17465381,3); -- Cactuar Suave
INSERT INTO `bcnm_battlefield` VALUES (197,1,17465382,3);
INSERT INTO `bcnm_battlefield` VALUES (197,1,17465383,3);
INSERT INTO `bcnm_battlefield` VALUES (197,2,17465385,3);
INSERT INTO `bcnm_battlefield` VALUES (197,2,17465386,3);
INSERT INTO `bcnm_battlefield` VALUES (197,2,17465387,3);
INSERT INTO `bcnm_battlefield` VALUES (197,3,17465389,3);
INSERT INTO `bcnm_battlefield` VALUES (197,3,17465390,3);
INSERT INTO `bcnm_battlefield` VALUES (197,3,17465391,3);
UPDATE `mob_groups` SET `minLevel` = 82, `maxLevel` = 82 WHERE `name` = 'Sabotender_Campeon';
UPDATE `mob_groups` SET `minLevel` = 82, `maxLevel` = 82 WHERE `name` = 'Sabotender_Amante';
REPLACE INTO `mob_spawn_points` (`mobid`, `mobname`, `polutils_name`, `groupid`, `pos_x`, `pos_y`, `pos_z`, `pos_rot`) VALUES
    (17465381, 'Sabotender_Campeon',       'Sabotender Campeon',       12,   0,         100,      -240,      65 ),
    (17465382, 'Sabotender_Amante',        'Sabotender Amante',        13,  -4,         100,      -240,      65 ),
    (17465383, 'Sabotender_Amante',        'Sabotender Amante',        13,   4,         100,      -240,      65 ),
    (17465385, 'Sabotender_Campeon',       'Sabotender Campeon',       12,   1,           0,         1,      65 ),
    (17465386, 'Sabotender_Amante',        'Sabotender Amante',        13,  -3,           0,         1,      65 ),
    (17465387, 'Sabotender_Amante',        'Sabotender Amante',        13,   5,           0,         1,      65 ),
    (17465389, 'Sabotender_Campeon',       'Sabotender Campeon',       12,   0,        -100,       240,      65 ),
    (17465390, 'Sabotender_Amante',        'Sabotender Amante',        13,  -4,        -100,       240,      65 ),
    (17465391, 'Sabotender_Amante',        'Sabotender Amante',        13,   4,        -100,       240,      65 );


-- KSNM30: The Scarlet King

INSERT INTO `bcnm_battlefield` VALUES (199,1,17465408,3); -- the scarlet king
INSERT INTO `bcnm_battlefield` VALUES (199,2,17465410,3);
INSERT INTO `bcnm_battlefield` VALUES (199,3,17465412,3);
UPDATE `mob_groups` SET `HP` = 30000, `minLevel` = 84, `maxLevel` = 84 WHERE `name` = 'Purson';
REPLACE INTO `mob_spawn_points` (`mobid`, `mobname`, `polutils_name`, `groupid`, `pos_x`, `pos_y`, `pos_z`, `pos_rot`) VALUES
    (17465408, 'Purson',                   'Purson',                   18,  0,       100,   -240,      68 ),
    (17465410, 'Purson',                   'Purson',                   18,  1,         0,      1,      68 ),
    (17465412, 'Purson',                   'Purson',                   18,  0,      -100,    240,      68 );

  
-- ENM: Sheep in Antlion's Clothing

-- This needs additional work, section not complete
-- REPLACE INTO `mob_spawn_points` (`mobid`, `mobname`, `polutils_name`, `groupid`, `pos_x`, `pos_y`, `pos_z`, `pos_rot`) VALUES
--     (16810001, 'Tuchulcha',             'Tuchulcha',                6,  -610.888,   0.546,       -490,      171      ),
--     (16810007, 'Tuchulcha',             'Tuchulcha',                6,   -54.896,   -1.58,     67.273,      175      ),
--     (16810013, 'Tuchulcha',             'Tuchulcha',                6,       430,     0.5,        550,      240      );
